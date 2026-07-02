Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68396431E7F
	for <oe-kbuild@lists.linux.dev>; Thu,  2 Jul 2026 00:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782953834; cv=none; b=bNmWMGI0PcKOpV2qOjazDQ4JYXZPcyRkypfNXV1Qx/UAshpKuKHR7WPFuQOASGv8g1+neK9saq6uKe5kTtK6EIHoUFPUTY58wRqMU57s7gFf10uPLGjh6/OLhWbuznKi5eNlooKbk6nrnwfxRsGJIP9Y5Vb9PKst82S4bYeMkys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782953834; c=relaxed/simple;
	bh=yUctPhPB4lmVdcFj3Dl9MnhTGw8qYsrPeUkYWdnRHTY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nRxjY1ssGD0FDXxmfOOHrSLdkEC7uZ4aq3jUBEO+PJMpRGRJtvFKPx2/gsJ5ZXqwOprXNYrWCAAPI6sNbNYXMvH2+Q+ISGH+n04nptsJ9IfAh/eCYb3BWVph3eWpykcC3w42gFXtU2p9ldF6y0S3gt9dUet57ELFPIB1ndMtiJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f13eIUin; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f13eIUin"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782953832; x=1814489832;
  h=date:from:to:cc:subject:message-id;
  bh=yUctPhPB4lmVdcFj3Dl9MnhTGw8qYsrPeUkYWdnRHTY=;
  b=f13eIUinyaSVLn89Ft8F0XmQB7ApLGWv219mWob4svD4DITa/0SNAG/q
   wwZzUsE6i/Hb53sNYfoE+CJQaUzcLNgDCzOzt/J54CBumn5xt4oluC/Dy
   amV0VRpOcsBPe1EIBulWub6hgZmEj+t4sd7LKE9Oltfi3fXmRMGSn+fs3
   wNN01w/DT36N2up+pxsBh1uVvE728hPRa2QDey+LZ/PUyJLRnce6kIzMq
   1mkV2UzMgG4w0sHCk/1+ePCXfNx57J+70eCjxzSHzbUL0UrPdY6yNWzuG
   fQh2+znt6/7zPMv9UOPwSvNdQDHA4u1eTgseaDfz71bDsgMSqilmD7mS/
   A==;
X-CSE-ConnectionGUID: 2md54Rx4StCzSsfLV5qt7w==
X-CSE-MsgGUID: 6hXImbJ6T7GZHXjuC/pNpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="83828531"
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; 
   d="scan'208";a="83828531"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 17:57:11 -0700
X-CSE-ConnectionGUID: pgwwdn7RRjC3LD5uuOYlRA==
X-CSE-MsgGUID: kFXfy+mxSnq+J+zAOLoslw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; 
   d="scan'208";a="254643803"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 01 Jul 2026 17:57:10 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wf5jo-000000009o7-0vXx;
	Thu, 02 Jul 2026 00:57:08 +0000
Date: Thu, 02 Jul 2026 08:56:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: ld.lld: error: vmlinux.a(fs/file_table.o):(function
 alloc_empty_file: .text+0x172): relocation R_RISCV_HI20 out of range: 563901
 is not in [-524288, 524287]; references ''
Message-ID: <202607020848.NQffc4fZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/UPDATE-20260702-004403/K-Prateek-Nayak/x86-runtime-const-Introduce-runtime_const_mask_32/20260630-130124, commit: b6ee5e237229afc9e6a50838b4fd952398b24c14"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: llvm@lists.linux.dev
BCC: lkp@intel.com

TO: K Prateek Nayak <kprateek.nayak@amd.com>
CC: 0day robot <lkp@intel.com>
CC: Charlie Jenkins <thecharlesjenkins@gmail.com>

Hi Prateek,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/intel-lab-lkp/linux/commits/UPDATE-20260702-004403/K-Prateek-Nayak/x86-runtime-const-Introduce-runtime_const_mask_32/20260630-130124
head:   c5019a5edc81040af1fdd5cb6685672b7d09cf6e
commit: b6ee5e237229afc9e6a50838b4fd952398b24c14 riscv/runtime-const: Replace open-coded placeholder with RUNTIME_MAGIC
date:   8 hours ago
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20260702/202607020848.NQffc4fZ-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 6cc609bb250b21b47fc7d394b4019101e9983597)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260702/202607020848.NQffc4fZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607020848.NQffc4fZ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: vmlinux.a(fs/file_table.o):(function alloc_empty_file: .text+0x172): relocation R_RISCV_HI20 out of range: 563901 is not in [-524288, 524287]; references ''
   >>> referenced by file_table.c
   >>> defined in vmlinux.a(fs/file_table.o)
--
>> ld.lld: error: vmlinux.a(fs/file_table.o):(function file_free: .text+0x1118): relocation R_RISCV_HI20 out of range: 563901 is not in [-524288, 524287]; references ''
   >>> referenced by file_table.c
   >>> defined in vmlinux.a(fs/file_table.o)
--
>> ld.lld: error: vmlinux.a(fs/file_table.o):(function backing_file_free: .text+0x11dc): relocation R_RISCV_HI20 out of range: 563901 is not in [-524288, 524287]; references ''
   >>> referenced by file_table.c
   >>> defined in vmlinux.a(fs/file_table.o)
--
>> ld.lld: error: vmlinux.a(fs/namei.o):(function do_getname: .text+0x5a): relocation R_RISCV_HI20 out of range: 563901 is not in [-524288, 524287]; references ''
   >>> referenced by namei.c
   >>> defined in vmlinux.a(fs/namei.o)
--
>> ld.lld: error: vmlinux.a(fs/file_table.o):(function alloc_empty_file_noaccount: .text+0x354): relocation R_RISCV_HI20 out of range: 563901 is not in [-524288, 524287]; references ''
   >>> referenced by file_table.c
   >>> defined in vmlinux.a(fs/file_table.o)
--
>> ld.lld: error: vmlinux.a(fs/file_table.o):(function alloc_empty_backing_file: .text+0x3d8): relocation R_RISCV_HI20 out of range: 563901 is not in [-524288, 524287]; references ''
   >>> referenced by file_table.c
   >>> defined in vmlinux.a(fs/file_table.o)
--
>> ld.lld: error: vmlinux.a(fs/file_table.o):(function alloc_file_pseudo_noaccount: .text+0x66c): relocation R_RISCV_HI20 out of range: 563901 is not in [-524288, 524287]; references ''
   >>> referenced by file_table.c
   >>> defined in vmlinux.a(fs/file_table.o)
--
>> ld.lld: error: vmlinux.a(fs/file_table.o):(function __fput: .text+0xc5e): relocation R_RISCV_HI20 out of range: 563901 is not in [-524288, 524287]; references ''
   >>> referenced by file_table.c
   >>> defined in vmlinux.a(fs/file_table.o)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
