Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0BECA950
	for <oe-kbuild@lists.linux.dev>; Thu, 19 Jan 2023 18:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674152107; x=1705688107;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=quElZdAkPf+cHYXWiHImEsPYh2FhRch9pqdcBJMXgtY=;
  b=mhoP3swUG9VG3+s/Gycphnl1BeUHFX1s85xL+sH46RiPxuYMASykc30Q
   GwEpcn/YuwJxXG46ZT8hUWCe1WOulp32UvuJlgV5XDCp3umaveeaNOtXA
   8YfhUS45XMPILKjLEOuVsKfhendIciFbaBeEXAi9wqe4tKNi7MB3Vbxg9
   bVUYHoTwe3aEWpqVgsIltKx6QxULRnAN+adJ9Er8lhV2RxLFWkA7Q77Hv
   MjTqXeV88U4Ona77Zzp7pFn/YYDTmTLQi8smx+JzsMqZ0bAqSlvxnJCKG
   UrMhmSRHd5q1ef0+QoKrWqUSpx/hp+w7fb3ro4zZQmMsNKZRVLc8gar4e
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="324058278"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; 
   d="scan'208";a="324058278"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2023 10:15:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="834082768"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; 
   d="scan'208";a="834082768"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 19 Jan 2023 10:15:05 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIZRI-0001iO-17;
	Thu, 19 Jan 2023 18:15:04 +0000
Date: Fri, 20 Jan 2023 02:14:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/iommu/intel/iommu.c:230 clear_context_copied() warn:
 clear_bit() takes a bit number
Message-ID: <202301200204.XazpCqBd-lkp@intel.com>
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
TO: Lu Baolu <baolu.lu@linux.intel.com>
CC: Joerg Roedel <jroedel@suse.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7287904c8771b77b9504f53623bb477065c19a58
commit: 0c5f6c0d8201a809a6585b07b6263e9db2c874a3 iommu/vt-d: Fix kdump kernels boot failure with scalable mode
date:   4 months ago
:::::: branch date: 19 hours ago
:::::: commit date: 4 months ago
config: ia64-randconfig-m041-20230118 (https://download.01.org/0day-ci/archive/20230120/202301200204.XazpCqBd-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

New smatch warnings:
drivers/iommu/intel/iommu.c:230 clear_context_copied() warn: clear_bit() takes a bit number
drivers/iommu/intel/iommu.c:224 set_context_copied() warn: set_bit() takes a bit number

Old smatch warnings:
drivers/iommu/intel/iommu.c:731 device_to_iommu() error: we previously assumed 'pdev' could be null (see line 704)
arch/ia64/include/asm/timex.h:39 get_cycles() error: uninitialized symbol 'ia64_intri_res'.
drivers/iommu/intel/iommu.c:3422 intel_iommu_add() warn: missing unwind goto?

vim +230 drivers/iommu/intel/iommu.c

0c5f6c0d8201a8 Lu Baolu 2022-08-23  220  
0c5f6c0d8201a8 Lu Baolu 2022-08-23  221  static inline void
0c5f6c0d8201a8 Lu Baolu 2022-08-23  222  set_context_copied(struct intel_iommu *iommu, u8 bus, u8 devfn)
0c5f6c0d8201a8 Lu Baolu 2022-08-23  223  {
0c5f6c0d8201a8 Lu Baolu 2022-08-23 @224  	set_bit(((long)bus << 8) | devfn, iommu->copied_tables);
0c5f6c0d8201a8 Lu Baolu 2022-08-23  225  }
0c5f6c0d8201a8 Lu Baolu 2022-08-23  226  
0c5f6c0d8201a8 Lu Baolu 2022-08-23  227  static inline void
0c5f6c0d8201a8 Lu Baolu 2022-08-23  228  clear_context_copied(struct intel_iommu *iommu, u8 bus, u8 devfn)
0c5f6c0d8201a8 Lu Baolu 2022-08-23  229  {
0c5f6c0d8201a8 Lu Baolu 2022-08-23 @230  	clear_bit(((long)bus << 8) | devfn, iommu->copied_tables);
0c5f6c0d8201a8 Lu Baolu 2022-08-23  231  }
0c5f6c0d8201a8 Lu Baolu 2022-08-23  232  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
