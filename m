Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DE1B10E5
	for <oe-kbuild@lists.linux.dev>; Tue, 21 Mar 2023 01:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679363829; x=1710899829;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pj4+V5BfFj8mUYP0jA0rdFExO+zioG/pCh75E89zbT4=;
  b=lxK+reHDFwEwy0p/5WSpj4kziBQJk9pGZEpWZTD3MEKC2NHE6PjxIq2i
   3aFO/xpbzbhwTA/gQHFZ0FtxPrWMlwf8CIowsdSsIvciNbk04QS8gDUAT
   CmP+8noQf7zhIevFHdccGquXYSKx/3EFt9HPiX3Oe0J//mhmTJglKXDyE
   We0PP/5LajWZUcxJ4+oPwj0tNtY0CfWlpDVSWxmgFDrnhWvZH+saJQ3UM
   eA5jFuUE1vABXSxm5yO4Zh87j2U6v8h5kGXj1Rq+GBV7SdOzM/KQs4DMY
   a5ZiX3I0f4t8xzgDXVzfmOWTkUB39H8WGyCy5foqhN/ZG27kQn3YR1bLj
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="319222424"
X-IronPort-AV: E=Sophos;i="5.98,277,1673942400"; 
   d="scan'208";a="319222424"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2023 18:57:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="674646570"
X-IronPort-AV: E=Sophos;i="5.98,277,1673942400"; 
   d="scan'208";a="674646570"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 20 Mar 2023 18:57:07 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1peRFK-000BUA-0U;
	Tue, 21 Mar 2023 01:57:06 +0000
Date: Tue, 21 Mar 2023 09:56:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/riscv/kvm/vcpu_pmu.c:40 kvm_riscv_vcpu_pmu_ctr_info() error:
 buffer overflow 'kvpmu->pmc' 64 <= 64
Message-ID: <202303210940.XYeKyGru-lkp@intel.com>
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
TO: Atish Patra <atishp@rivosinc.com>
CC: Anup Patel <anup@brainfault.org>
CC: Andrew Jones <ajones@ventanamicro.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   17214b70a159c6547df9ae204a6275d983146f6b
commit: 8f0153ecd3bf184bc06afca25b737c707fa4d765 RISC-V: KVM: Add skeleton support for perf
date:   6 weeks ago
:::::: branch date: 4 hours ago
:::::: commit date: 6 weeks ago
config: riscv-randconfig-m031-20230319 (https://download.01.org/0day-ci/archive/20230321/202303210940.XYeKyGru-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303210940.XYeKyGru-lkp@intel.com/

smatch warnings:
arch/riscv/kvm/vcpu_pmu.c:40 kvm_riscv_vcpu_pmu_ctr_info() error: buffer overflow 'kvpmu->pmc' 64 <= 64

vim +40 arch/riscv/kvm/vcpu_pmu.c

8f0153ecd3bf184 Atish Patra 2023-02-07  29  
8f0153ecd3bf184 Atish Patra 2023-02-07  30  int kvm_riscv_vcpu_pmu_ctr_info(struct kvm_vcpu *vcpu, unsigned long cidx,
8f0153ecd3bf184 Atish Patra 2023-02-07  31  				struct kvm_vcpu_sbi_return *retdata)
8f0153ecd3bf184 Atish Patra 2023-02-07  32  {
8f0153ecd3bf184 Atish Patra 2023-02-07  33  	struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
8f0153ecd3bf184 Atish Patra 2023-02-07  34  
8f0153ecd3bf184 Atish Patra 2023-02-07  35  	if (cidx > RISCV_KVM_MAX_COUNTERS || cidx == 1) {
8f0153ecd3bf184 Atish Patra 2023-02-07  36  		retdata->err_val = SBI_ERR_INVALID_PARAM;
8f0153ecd3bf184 Atish Patra 2023-02-07  37  		return 0;
8f0153ecd3bf184 Atish Patra 2023-02-07  38  	}
8f0153ecd3bf184 Atish Patra 2023-02-07  39  
8f0153ecd3bf184 Atish Patra 2023-02-07 @40  	retdata->out_val = kvpmu->pmc[cidx].cinfo.value;
8f0153ecd3bf184 Atish Patra 2023-02-07  41  
8f0153ecd3bf184 Atish Patra 2023-02-07  42  	return 0;
8f0153ecd3bf184 Atish Patra 2023-02-07  43  }
8f0153ecd3bf184 Atish Patra 2023-02-07  44  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
