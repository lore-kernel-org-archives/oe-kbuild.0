Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8447823815D
	for <oe-kbuild@lists.linux.dev>; Mon,  8 Dec 2025 10:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765191298; cv=none; b=WZdo+iCT9esIAJL2ccG5hPOnUr/l0QOLdTNGLJrEOLMBzTSsz7J+KBT3IfeSofTjSdEFP1yivcxw7bF1Viy7a2YQeeU15bKhLW4+4OoJo9L+AxOa1PvyoImUqr3xFr9N5UKSK2Yz8o4CIV7/cnTWtPnv9fnIIPhPTSmEWVyKb+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765191298; c=relaxed/simple;
	bh=0N4DliacGRG6g2rtxj7p1Xcz27Y+UC5jkv9vzI7hDvM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Kzz+qRgkmLaftkBY9jJp7LWQCbVG3qMS0UgEDLKZrLbLml48gOFDoco2FS/hx4y5gHqQLyya1kexcf8VuaLysA/LE07fNgD4bGBQwJJD7MULlR3bAMnhEwq1rQbanDhN2aEgY3it8jB7rOeIJ2MyDDrbzUEWScE52tNlbIXjlWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fWciBS60; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fWciBS60"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765191296; x=1796727296;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0N4DliacGRG6g2rtxj7p1Xcz27Y+UC5jkv9vzI7hDvM=;
  b=fWciBS60mA/iTtMXyGiXhCpKz8GZnjgnPRoHUdjPy4VJ2OR+nIpg4yij
   jcUKjlCRlrfYkxqPQYEloaBXcHLQ96dicIeU9H+c6AuoTDoOSLkhPURfu
   hunjHFrycC6EWKv1sR0HrBBppLsyUZTs/jdYDw+euHIgWM2C0meUqdXSe
   hEruSJy2s2YQqh05QiGTAFrQRCLhDniY86argmNO+eXgn0MhltAAdjRqv
   FEWjjLDsdSRm8NpfVvyStnyfJi+w8xGlhlxUPwfgrIWwx1YA+Fy1XHJ7x
   57ADwdxdbcsxf2L+JT/nrKdNCNF9hIQdWu8uJF1wvyF5/cUUj37/pwINm
   g==;
X-CSE-ConnectionGUID: 4sXI2fL0Rf6fNi9mQH7qNQ==
X-CSE-MsgGUID: YJbna61qROuiVajSGz+SiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="67166907"
X-IronPort-AV: E=Sophos;i="6.20,258,1758610800"; 
   d="scan'208";a="67166907"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2025 02:54:56 -0800
X-CSE-ConnectionGUID: Zb1Ac4dQSjuOdsTQUTFUGA==
X-CSE-MsgGUID: z+SRckVWTIGaTXL0b/Odzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,258,1758610800"; 
   d="scan'208";a="219250090"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 08 Dec 2025 02:54:54 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vSYtI-0000000009R-2p7u;
	Mon, 08 Dec 2025 10:54:52 +0000
Date: Mon, 8 Dec 2025 18:54:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 13543/13567]
 drivers/ufs/host/ufs-amd-versal2.c:562:1: sparse: sparse: bad integer
 constant expression
Message-ID: <202512081802.UrdFdJdY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/ufs/host/ufs-amd-versal2.c:562:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: James Bottomley <James.Bottomley@HansenPartnership.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   82bcd04d124a4d84580ea4a8ba6b120db5f512e7
commit: 7fb99b824cc8b3a4b521f7935256d90e7ab14687 [13543/13567] Merge branch 'for-next' of https://git.kernel.org/pub/scm/linux/kernel/git/jejb/scsi.git
:::::: branch date: 9 hours ago
:::::: commit date: 3 days ago
config: arc-randconfig-r132-20251208 (https://download.01.org/0day-ci/archive/20251208/202512081802.UrdFdJdY-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251208/202512081802.UrdFdJdY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512081802.UrdFdJdY-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/ufs/host/ufs-amd-versal2.c:562:1: sparse: sparse: bad integer constant expression
>> drivers/ufs/host/ufs-amd-versal2.c:562:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/ufs/host/ufs-amd-versal2.c:563:1: sparse: sparse: bad integer constant expression
>> drivers/ufs/host/ufs-amd-versal2.c:563:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/ufs/host/ufs-amd-versal2.c:564:1: sparse: sparse: bad integer constant expression
>> drivers/ufs/host/ufs-amd-versal2.c:564:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/ufs/host/ufs-amd-versal2.c:564:1: sparse: sparse: bad integer constant expression
>> drivers/ufs/host/ufs-amd-versal2.c:564:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +562 drivers/ufs/host/ufs-amd-versal2.c

769b8b2ffded4c Sai Krishna Potthuri 2025-10-21  561  
769b8b2ffded4c Sai Krishna Potthuri 2025-10-21 @562  MODULE_AUTHOR("Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>");
769b8b2ffded4c Sai Krishna Potthuri 2025-10-21 @563  MODULE_DESCRIPTION("AMD Versal Gen 2 UFS Host Controller driver");
769b8b2ffded4c Sai Krishna Potthuri 2025-10-21 @564  MODULE_LICENSE("GPL");

:::::: The code at line 562 was first introduced by commit
:::::: 769b8b2ffded4cd880669edd83e2952efeeb27f7 scsi: ufs: amd-versal2: Add UFS support for AMD Versal Gen 2 SoC

:::::: TO: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
:::::: CC: Martin K. Petersen <martin.petersen@oracle.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
