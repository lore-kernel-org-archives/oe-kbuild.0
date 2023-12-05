Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 202946A01A
	for <oe-kbuild@lists.linux.dev>; Tue,  5 Dec 2023 20:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V9elEZ0V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701809633; x=1733345633;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zblSzYqn0W+vAZ2m5GXL32iKTI2Is8fr2uzRE757xNE=;
  b=V9elEZ0V9Vlle+lC1k53HvdW8ygTj4MgwtRIXsECklJVvBWA2GR1gdSV
   a76PBQXb+3Em9E64hGhvg9WMT7fFK6nrhk08tZHIQ65CvBX/Rnd1JXSkD
   /a+ZwisqA5bQO/wRKG/ZCAzsw/BNMtNBJi7VaYD/4GYAP1FjrIIsrBIgg
   uHfwKz9Wqed5vOayz4Bt45//yo+3CNjflU+yNKtYJxMb2GlUUNWj+I5lt
   2+yqy/LKjKghwUNHbPOQ7rBFNp3dAXpc1kBwkCytjiyd6HHL2wC3aiRFB
   88yZea+r88mtfwbtG1hzZM0bhWrRzdOy2JcUGeHZUgFwnziJt1AqvR+px
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="797924"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; 
   d="scan'208";a="797924"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 12:53:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="1102580921"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; 
   d="scan'208";a="1102580921"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 05 Dec 2023 12:53:51 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAcQP-0009iH-0P;
	Tue, 05 Dec 2023 20:53:49 +0000
Date: Wed, 6 Dec 2023 04:53:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: kernel/bpf/task_iter.c:819:7-15: WARNING use flexible-array member
 instead
 (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
Message-ID: <202312060415.D5Jbdf0R-lkp@intel.com>
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
TO: Dave Marchevsky <davemarchevsky@fb.com>
CC: Andrii Nakryiko <andrii@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   bee0e7762ad2c6025b9f5245c040fcc36ef2bde8
commit: 4ac4546821584736798aaa9e97da9f6eaf689ea3 bpf: Introduce task_vma open-coded iterator kfuncs
date:   8 weeks ago
:::::: branch date: 23 hours ago
:::::: commit date: 8 weeks ago
config: x86_64-randconfig-103-20231203 (https://download.01.org/0day-ci/archive/20231206/202312060415.D5Jbdf0R-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce: (https://download.01.org/0day-ci/archive/20231206/202312060415.D5Jbdf0R-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202312060415.D5Jbdf0R-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> kernel/bpf/task_iter.c:819:7-15: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)

vim +819 kernel/bpf/task_iter.c

4ac45468215847 Dave Marchevsky 2023-10-13  814  
4ac45468215847 Dave Marchevsky 2023-10-13  815  struct bpf_iter_task_vma {
4ac45468215847 Dave Marchevsky 2023-10-13  816  	/* opaque iterator state; having __u64 here allows to preserve correct
4ac45468215847 Dave Marchevsky 2023-10-13  817  	 * alignment requirements in vmlinux.h, generated from BTF
4ac45468215847 Dave Marchevsky 2023-10-13  818  	 */
4ac45468215847 Dave Marchevsky 2023-10-13 @819  	__u64 __opaque[1];
4ac45468215847 Dave Marchevsky 2023-10-13  820  } __attribute__((aligned(8)));
4ac45468215847 Dave Marchevsky 2023-10-13  821  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
