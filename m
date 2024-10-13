Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 347821DA32
	for <oe-kbuild@lists.linux.dev>; Sun, 13 Oct 2024 04:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728795340; cv=none; b=ifzCGuk7v+cxgQI8HdBX7IAgCst8fTKJqCZl8gVP9EiN9cMSfQnWv+hMREs1IeHj3V5kPhzRpuKPJh4l4qYqdGBHEZViy+tE+cTqKiVW9JO2hzGNaj2CNdusFpXcAR7ULSn17SAn/+YOAphIe+pJmjzlLPUlfpF7UpQfTB064C4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728795340; c=relaxed/simple;
	bh=0gn/Z9FjHTtrkIwAojMW2YDwFNhUT0CQnH2Szi6cqiM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RLT6CeoxyMAfRRZ5SqTTfswVelKKQgDZLw8uWZQpoDRwQhIHCDGcLMxENnA2G+2oUO4rJ62tTcQzOhzl/TF5HOJ/JI3nNv5cZNgNAEpUR3bifayMwYjnIsRt87CY1et/HWfBYcdWIo+Ap7Rca5Y8ze/rWM50kJSntXhpUbo3rlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LjbEn3oO; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LjbEn3oO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728795338; x=1760331338;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0gn/Z9FjHTtrkIwAojMW2YDwFNhUT0CQnH2Szi6cqiM=;
  b=LjbEn3oObQ4CvLcaHyGWaeioW/Y8+V06liIoRgCZnUe91WBMoMwyQH0P
   44BqPRZXDEfSS3ukr5tvhmAY/gV8TF9NfdvuPNF5WmfHY1/UfEmpjjLWq
   2hcbfpx2ffNcD+/YuodeFHexfTTgt39B5yvLsUGTUVzdoxiMBNqhRwygd
   PzBCpCiMBFPjMXwhGlrtRYzn4eoM0zo8VeovXtacF7nirE7k9AneEFcuH
   9dZOL6gxjyYtOcfvuFvrFH34dSe08oGxnKZ4D9V7vwoE9I+MyeM9GaoJP
   2HE2JUxRF732bW7qrSOuEc1a66s4Pm3xdyWBVfdZAbTfJ6wEObkyqhTzv
   A==;
X-CSE-ConnectionGUID: k+4q1ztlTMqIr+4v7hceWQ==
X-CSE-MsgGUID: eC/GUwUjSkWdhVF+FdJzLg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="39281116"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="39281116"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2024 21:55:37 -0700
X-CSE-ConnectionGUID: N7LLpiNfRxGcJh6hagdJ0w==
X-CSE-MsgGUID: RhE7ocrvRHe0DpBIziOxGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="77581679"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 12 Oct 2024 21:55:36 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1szqdi-000E6Z-1J;
	Sun, 13 Oct 2024 04:55:34 +0000
Date: Sun, 13 Oct 2024 12:55:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: kernel/bpf/task_iter.c:819:7-15: WARNING use flexible-array member
 instead
 (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
Message-ID: <202410131204.gZ860pFN-lkp@intel.com>
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
head:   36c254515dc6592c44db77b84908358979dd6b50
commit: 4ac4546821584736798aaa9e97da9f6eaf689ea3 bpf: Introduce task_vma open-coded iterator kfuncs
date:   1 year ago
:::::: branch date: 5 hours ago
:::::: commit date: 1 year ago
config: alpha-randconfig-r054-20241012 (https://download.01.org/0day-ci/archive/20241013/202410131204.gZ860pFN-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202410131204.gZ860pFN-lkp@intel.com/

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
