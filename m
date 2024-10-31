Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 567FC12F38B
	for <oe-kbuild@lists.linux.dev>; Thu, 31 Oct 2024 05:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730353980; cv=none; b=na6DTrxmvRbMC8ai4SJmU6dGpLU1t3Wdx/Hs+7btI0qXk7Lw4qTxVpfurzojyHEhcj2697t+hg6/hKJuGATCPHARBZmz3P2x2UNHahkKi3nX2zn5OvtkNgKq0wvsRy3WG5r/TqyIqTBZUF7U0Jv77MIs8EnFo+aTRl1McHZb3Qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730353980; c=relaxed/simple;
	bh=8JueTIiZghwayroDDekwXEGOjCazKK7hJifpmULteEU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SQyfbdJmVwEhLu0o3o4G2UGBybim/QnjDRG2JU1muy59pUeQgViam3o5NhI/trvmYXL1fC7pZFO2pH0r56eeHqgR5WF3cbInCcD6hJKo4PFfQUGTXkHLMdgEHZtbELxZHDMMTC3OLi+WRFKKJGZy+bsBH+HmnZHv195hmrczcRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D6DLAB/7; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D6DLAB/7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730353978; x=1761889978;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8JueTIiZghwayroDDekwXEGOjCazKK7hJifpmULteEU=;
  b=D6DLAB/7WluN8Mc7deluZeTtBemW5fvc9q+Xrl1UZo52FBrIHNl+CVPQ
   qWwRwKv8ohEkVjszWzsd5OHZf0Hd4SmaP/RMaMpbcf+oITXFb26RHv1H6
   fnEtIjSOQWSO5nTbC7v/QCwvYv+Ya6HEs9AzJ/Wi2tgaAyhUlozgQdlsR
   JRXc00t32kY9v5taHt3DlpY2c7lDSRleAWPtbol0FIVJzaxmKZsU3Hdnr
   6WK/Oi00sdX3g8Lf+sFuzyHrd6vU8u1jRL60y0DGZGC78e2i3IzJKzXAW
   CDnh22DIH6dLWidM0+2PuM+epIGWZahAtBhKH8XciBfgG8sunlfHrm6BB
   w==;
X-CSE-ConnectionGUID: 2IXW+D9GQiuZxQv0xGVNMQ==
X-CSE-MsgGUID: qDcBwIEHTxqxRaKTOxB54A==
X-IronPort-AV: E=McAfee;i="6700,10204,11241"; a="47553978"
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; 
   d="scan'208";a="47553978"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2024 22:52:57 -0700
X-CSE-ConnectionGUID: NvDV6I+0QBGPng8hem+ISQ==
X-CSE-MsgGUID: zYsaFJ0WQ6iIXVTWBeU4Pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; 
   d="scan'208";a="87673266"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 30 Oct 2024 22:52:56 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6O74-000fie-0a;
	Thu, 31 Oct 2024 05:52:54 +0000
Date: Thu, 31 Oct 2024 13:52:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: kernel/bpf/task_iter.c:819:7-15: WARNING use flexible-array member
 instead
 (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
Message-ID: <202410311319.sJYbhKzn-lkp@intel.com>
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
head:   0fc810ae3ae110f9e2fcccce80fc8c8d62f97907
commit: 4ac4546821584736798aaa9e97da9f6eaf689ea3 bpf: Introduce task_vma open-coded iterator kfuncs
date:   1 year, 1 month ago
:::::: branch date: 8 hours ago
:::::: commit date: 1 year, 1 month ago
config: i386-randconfig-051-20241031 (https://download.01.org/0day-ci/archive/20241031/202410311319.sJYbhKzn-lkp@intel.com/config)
compiler: clang version 19.1.2 (https://github.com/llvm/llvm-project 7ba7d8e2f7b6445b60679da826210cdde29eaf8b)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202410311319.sJYbhKzn-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> kernel/bpf/task_iter.c:819:7-15: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)

vim +819 kernel/bpf/task_iter.c

4ac454682158473 Dave Marchevsky 2023-10-13  814  
4ac454682158473 Dave Marchevsky 2023-10-13  815  struct bpf_iter_task_vma {
4ac454682158473 Dave Marchevsky 2023-10-13  816  	/* opaque iterator state; having __u64 here allows to preserve correct
4ac454682158473 Dave Marchevsky 2023-10-13  817  	 * alignment requirements in vmlinux.h, generated from BTF
4ac454682158473 Dave Marchevsky 2023-10-13  818  	 */
4ac454682158473 Dave Marchevsky 2023-10-13 @819  	__u64 __opaque[1];
4ac454682158473 Dave Marchevsky 2023-10-13  820  } __attribute__((aligned(8)));
4ac454682158473 Dave Marchevsky 2023-10-13  821  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
