Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 844FE1C68F
	for <oe-kbuild@lists.linux.dev>; Mon, 15 Apr 2024 06:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713162909; cv=none; b=HzmnUut+LK6MGF7rJqsks+EPYGZ8Fx1lBIoB3hKatRNjvOnUJBS054e++NeT966Z4YsO4BqxC8Gk4CSyMfjUFFNIzpPABZWigJSmxJ6ZVXNw3eIxVxP2+QZJc62juJPxlZFYmQcPH+tTx5/oZ4z+IgOixqfNx9uljLoiEAtUDsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713162909; c=relaxed/simple;
	bh=/xw1Mn5RI68BoEmHfNsEcrWOnZq029LFdtdqLw4q7tM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VgHc7quZ1ymZrKqIoPYjHwlMNhiQm4dQV8dypmkCdnx8QZV1ZxLQVMeFl2lgPS16tcCINqD1ynlE5wxa3A1gu+tTitGiXc/eamMFKN3D4CuEMPmV/4NVFRDCdKJCR94brz5sv7XlX5ScPvm/84YNtwc9SnIicI4IFWATnw6vYNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IiJztEfi; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IiJztEfi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713162907; x=1744698907;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/xw1Mn5RI68BoEmHfNsEcrWOnZq029LFdtdqLw4q7tM=;
  b=IiJztEfiyXwU+aXj4KAoUcGhSvpW0ZHi/Kz4ET7dH5ANRWr71Dz+hT4Q
   aWY7s0RPjSWgXjyzd6b0wp3HTEHdO4Buh7TucRsFNBckumNhSgWlWeuE3
   Jdxf57w0dhZDUk3WEXU0GgwF4rMw/hBjFLQ650SsZVojtAJu+CLI4WnPC
   6MzC+IjEotxsiW0VCkaEE996e14ZIxxefSMCB7PQF+Y/U3od/kAxYPep1
   EtT82bXND3cPW9gWrtOOdKu7X1K7eX7O9kFiL0rtCclHETSc9ELWZCcix
   PgXRGLprjBhkkgSOHHj49easbSraxjKfTJ997xa4QLI/Xt9EEOOMFbakk
   A==;
X-CSE-ConnectionGUID: EsnkKal5QiaWBr9CBqLwiA==
X-CSE-MsgGUID: qCusRrfwTqquWkFaptZmUQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11044"; a="8401960"
X-IronPort-AV: E=Sophos;i="6.07,202,1708416000"; 
   d="scan'208";a="8401960"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2024 23:35:07 -0700
X-CSE-ConnectionGUID: 7Co4Z3pGRJaSEPLgKjSGtA==
X-CSE-MsgGUID: /ENJt1u+RUq5lSoewmCcUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,202,1708416000"; 
   d="scan'208";a="26489990"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 14 Apr 2024 23:35:05 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rwFvj-00041C-1z;
	Mon, 15 Apr 2024 06:35:03 +0000
Date: Mon, 15 Apr 2024 14:34:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android15-6.6 9626/10059]
 drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c: nvhe/iommu.h is included
 more than once.
Message-ID: <202404151401.AlmjILSu-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com

Hi Mostafa,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   9733657132ed06dce3913648f69658b55d11584b
commit: 988736bbd276fe2f5fce9b78c453e2508b4f6150 [9626/10059] ANDROID: iommu/arm-smmu-v3-kvm: Move files out of KVM
:::::: branch date: 3 days ago
:::::: commit date: 5 weeks ago
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202404151401.AlmjILSu-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c: nvhe/iommu.h is included more than once.

vim +11 drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c

     8	
     9	#include <asm/arm-smmu-v3-regs.h>
    10	#include <asm/kvm_hyp.h>
  > 11	#include <nvhe/iommu.h>
    12	#include <nvhe/alloc.h>
  > 13	#include <nvhe/iommu.h>
    14	#include <nvhe/mem_protect.h>
    15	#include <nvhe/mm.h>
    16	#include <nvhe/pkvm.h>
    17	#include <nvhe/trap_handler.h>
    18	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
