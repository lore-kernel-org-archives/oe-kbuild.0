Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B68A32D739C
	for <oe-kbuild@lists.linux.dev>; Sun, 23 Aug 2026 18:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787511092; cv=none; b=eqb7Gt7z9pZEnIV6kf+PV1bpQJ7XobWSyNgIjFZkXRlLpee2kR4PFcxmvMNGblXMrS36VqocDoauMHRDDYGQArb4ReQFU+G/F5NOVeEeBMa1PTV3Y25XrZrKQ05UTTDoNGwBbStHeLpnjEIHe80oADTLfjnRmQG8S1cxUIn/0tY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787511092; c=relaxed/simple;
	bh=w9z8F0LA55W6kxmdPYP0docV4GORGnsc7lwLhzqbz4c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GUguzMamvDQqlRiZAcyagXIGyLASmMh1yAjqbXRcEcVkgnjcWfTRZEiMaNCiYTuTrYl56jYtf6f7Bw9CH65FNtligDKIEtrcm6P3T70yJBB6bq3mlOsE0+xWUIHJEDcs/jD9bBEOPvUEbecmcYhXFAd9wtuSN1ikNiX8qn7ZFxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T1y6lFZh; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T1y6lFZh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787511091; x=1819047091;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=w9z8F0LA55W6kxmdPYP0docV4GORGnsc7lwLhzqbz4c=;
  b=T1y6lFZhFOXd1XpHY9dVPv+/fyBzJzx4oTFLWMol5Wo+4fdjuP9o1b4D
   p2r6DSP2YICOkgXM/hkYFPUWonZid9E/fJ9VzXDrdGde6n25jKP6093W4
   VAcxFmBa53qXOVRLfxsxPyg870Pc5qV12HyXeVA6hbKTw7Ddy8xM20km0
   Clp2xkZDTRvS84SoFD+DylKOHTT8Ktz3lLj6LztGptNqwvU+l7g+h/wIV
   xi9nHnB0EUDToDw9D/g6AFUgyrJhaqzQdNxJImUGvHxQkuZR9PEtOX/t0
   qR8V2MsbY20BPmFOojOohCDmScUytPTPrOtzywJKpZT2FhaWtZrwQRDbk
   Q==;
X-CSE-ConnectionGUID: MYuyhEiCQp2si0ECL3oT1g==
X-CSE-MsgGUID: ZFCBhYNXTTa6fuwxalcKqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11884"; a="98306761"
X-IronPort-AV: E=Sophos;i="6.25,239,1779174000"; 
   d="scan'208";a="98306761"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 11:51:30 -0700
X-CSE-ConnectionGUID: Z0/RxsZkQKWuvMWmfwTGEg==
X-CSE-MsgGUID: tdW63CBCTA+RgjsCnO0IuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,239,1779174000"; 
   d="scan'208";a="263545191"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 23 Aug 2026 11:51:29 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wyDHs-000000000xX-3Sg8;
	Sun, 23 Aug 2026 18:51:21 +0000
Date: Mon, 24 Aug 2026 02:50:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] vfio: Use file-based reference counting for KVM
Message-ID: <202608240204.0qmo4vRs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "linux-review patch is more than 7 days old, verify it wasn't already superseded"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260812-vfio-v1-1-5cfe0b1fa4e7@linux.ibm.com>
References: <20260812-vfio-v1-1-5cfe0b1fa4e7@linux.ibm.com>
TO: Steffen Eiden <seiden@linux.ibm.com>
TO: Sean Christopherson <seanjc@google.com>
TO: Paolo Bonzini <pbonzini@redhat.com>
TO: Thomas Gleixner <tglx@kernel.org>
TO: Ingo Molnar <mingo@redhat.com>
TO: Borislav Petkov <bp@alien8.de>
TO: Dave Hansen <dave.hansen@linux.intel.com>
TO: x86@kernel.org
TO: "H. Peter Anvin" <hpa@zytor.com>
TO: Tony Krowiak <akrowiak@linux.ibm.com>
TO: Halil Pasic <pasic@linux.ibm.com>
TO: Jason Herne <jjherne@linux.ibm.com>
TO: Harald Freudenberger <freude@linux.ibm.com>
TO: Holger Dengler <dengler@linux.ibm.com>
TO: Heiko Carstens <hca@linux.ibm.com>
TO: Vasily Gorbik <gor@linux.ibm.com>
TO: Alexander Gordeev <agordeev@linux.ibm.com>
TO: Christian Borntraeger <borntraeger@linux.ibm.com>
TO: Sven Schnelle <svens@linux.ibm.com>
TO: Alex Williamson <alex@shazbot.org>
TO: Matthew Rosato <mjrosato@linux.ibm.com>
TO: Farhan Ali <alifm@linux.ibm.com>
TO: Eric Farman <farman@linux.ibm.com>
TO: Claudio Imbrenda <imbrenda@linux.ibm.com>
TO: Janosch Frank <frankja@linux.ibm.com>
CC: kvm@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-s390@vger.kernel.org
CC: Steffen Eiden <seiden@linux.ibm.com>
CC: Jason Gunthorpe <jgg@ziepe.ca>

Hi Steffen,

kernel test robot noticed the following build errors:

[auto build test ERROR on 5e6de6a2b522f659defacb1551d0465ba6ce13cf]

url:    https://github.com/intel-lab-lkp/linux/commits/Steffen-Eiden/vfio-Use-file-based-reference-counting-for-KVM/20260812-205530
base:   5e6de6a2b522f659defacb1551d0465ba6ce13cf
patch link:    https://lore.kernel.org/r/20260812-vfio-v1-1-5cfe0b1fa4e7%40linux.ibm.com
patch subject: [PATCH] vfio: Use file-based reference counting for KVM
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: hexagon-randconfig-001-20260823 (https://download.01.org/0day-ci/archive/20260824/202608240204.0qmo4vRs-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 935bfc708590c60147a79c7df145bb6e68b1d388)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260824/202608240204.0qmo4vRs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608240204.0qmo4vRs-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/vfio/vfio_main.c:1554:29: error: incompatible pointer types passing 'struct file *' to parameter of type 'struct kvm *' [-Wincompatible-pointer-types]
    1554 |                 vfio_group_set_kvm(group, kvm);
         |                                           ^~~
   drivers/vfio/vfio.h:168:77: note: passing argument to parameter 'kvm' here
     168 | static inline void vfio_group_set_kvm(struct vfio_group *group, struct kvm *kvm)
         |                                                                             ^
   1 error generated.


vim +1554 drivers/vfio/vfio_main.c

34aeeecdb3357f9 Yi Liu        2023-07-18  1539  
b1a59be8a2b64d0 Yi Liu        2023-07-18  1540  /**
b1a59be8a2b64d0 Yi Liu        2023-07-18  1541   * vfio_file_set_kvm - Link a kvm with VFIO drivers
2a7387af7a9f2fa Steffen Eiden 2026-08-12  1542   * @vfio_file: VFIO group file or VFIO device file
2a7387af7a9f2fa Steffen Eiden 2026-08-12  1543   * @kvm: KVM file to link
b1a59be8a2b64d0 Yi Liu        2023-07-18  1544   *
b1a59be8a2b64d0 Yi Liu        2023-07-18  1545   * When a VFIO device is first opened the KVM will be available in
b1a59be8a2b64d0 Yi Liu        2023-07-18  1546   * device->kvm if one was associated with the file.
b1a59be8a2b64d0 Yi Liu        2023-07-18  1547   */
2a7387af7a9f2fa Steffen Eiden 2026-08-12  1548  void vfio_file_set_kvm(struct file *vfio_file, struct file *kvm)
b1a59be8a2b64d0 Yi Liu        2023-07-18  1549  {
b1a59be8a2b64d0 Yi Liu        2023-07-18  1550  	struct vfio_group *group;
b1a59be8a2b64d0 Yi Liu        2023-07-18  1551  
2a7387af7a9f2fa Steffen Eiden 2026-08-12  1552  	group = vfio_group_from_file(vfio_file);
b1a59be8a2b64d0 Yi Liu        2023-07-18  1553  	if (group)
b1a59be8a2b64d0 Yi Liu        2023-07-18 @1554  		vfio_group_set_kvm(group, kvm);
34aeeecdb3357f9 Yi Liu        2023-07-18  1555  
2a7387af7a9f2fa Steffen Eiden 2026-08-12  1556  	if (vfio_device_from_file(vfio_file))
2a7387af7a9f2fa Steffen Eiden 2026-08-12  1557  		vfio_device_file_set_kvm(vfio_file, kvm);
b1a59be8a2b64d0 Yi Liu        2023-07-18  1558  }
b1a59be8a2b64d0 Yi Liu        2023-07-18  1559  EXPORT_SYMBOL_GPL(vfio_file_set_kvm);
b1a59be8a2b64d0 Yi Liu        2023-07-18  1560  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
