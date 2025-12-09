Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C6F26A1A4
	for <oe-kbuild@lists.linux.dev>; Tue,  9 Dec 2025 01:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765242793; cv=none; b=qTNuReG6Ckl2HOuHh5E/sV/jfs6cwmPXn2kCX0XLs4Mfem1N+pGsM0t7gKQPCGOQ7e4mqo4CszYu8as28fygVSjdmGu6x/OOjwQ+gyA8QgAgBib2wTV6A8XrFSw08ql+po5M/RgxWgQobzYKhuWSoLCy5picTc3b+paHeQA9vW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765242793; c=relaxed/simple;
	bh=XpoV4g0U9pRCDmhE/QW3298MYdk/zdEWacy9n6/amzg=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qFeyNSiw5UWICGzXGwdMASyNkngPppJQIRX2bL32IfTYvWYhlv9JS7p4F0iGvetF7hbQgTYG7ha0jrZvaQ+bPbc3PiouKXsK43tFnWfb2y8bIuq9cwMlLSTQ5ivYruMb9eGO5E0LysNA2T7wD+xqAvJvmsPGENBGx6YjQ1dWH9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NnOFGNiX; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NnOFGNiX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765242791; x=1796778791;
  h=date:from:to:subject:message-id:mime-version;
  bh=XpoV4g0U9pRCDmhE/QW3298MYdk/zdEWacy9n6/amzg=;
  b=NnOFGNiX10E8jH9fq+MaX1186CJ2jW4Vdt2KlIwfRPN+6XX/S2+gclkx
   RWJ8aHEKUdYLFhx52lyEg4nxl4NGzJRyCnKKYqSIDz9l/vVEMhB5V+sSk
   Rcxzb9iOSXx2Dz0mshGBXgpnwZ8gwrkQmkRzeewBvdX1CXamRpsk9Ecmn
   mGpnCnNxXqdVzzFD0bNgBJhrhPbXP8jTvucxuBKPUoAx06dwrn8oEn8eL
   R5s9doHbnmwLCsYPJ7Oxpes5a2VEzwnTuTjgR6Av0UXIBJ4HjWK4Wfn9y
   kYwbSWEK2knHoQOisIWI82scL9G5pxxkKryycPQUsqUQ0fAF2DOL01hY9
   A==;
X-CSE-ConnectionGUID: YeWu0KGeSIGS0xCzDC+CRw==
X-CSE-MsgGUID: kjPTgX3iTW+boCMrj9Pigg==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="71048852"
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; 
   d="scan'208";a="71048852"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2025 17:13:11 -0800
X-CSE-ConnectionGUID: Aa2WLlzaSnSuA1HDTR2ImQ==
X-CSE-MsgGUID: IBKhuE/bT4+MMl2xtGXYAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; 
   d="scan'208";a="200528580"
Received: from igk-lkp-server01.igk.intel.com (HELO a9286e139fc0) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 08 Dec 2025 17:13:10 -0800
Received: from kbuild by a9286e139fc0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vSmHr-000000002MB-3P6Y
	for oe-kbuild@lists.linux.dev;
	Tue, 09 Dec 2025 01:13:07 +0000
Date: Tue, 9 Dec 2025 02:13:04 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [linux-review:Brian-Foster/iomap-replace-folio_batch-allocation-with-stack-allocation/20251208-220813
 1/1] checkpatch: WARNING:REPEATED_WORD: Possible repeated word: 'the'
Message-ID: <202512090239.XcyB7xAr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Brian Foster <bfoster@redhat.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Brian-Foster/iomap-replace-folio_batch-allocation-with-stack-allocation/20251208-220813
head:   469c596d64654df6b3bd0a0de68c8fb34e001caa
commit: 469c596d64654df6b3bd0a0de68c8fb34e001caa [1/1] iomap: replace folio_batch allocation with stack allocation
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251209/202512090239.XcyB7xAr-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'the'
#73: FILE: fs/iomap/buffered-io.c:1555:
+ * the the batch lookup is performed and the expected offset of a subsequent

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
