Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C0BB1A23A4
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Dec 2024 18:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734548061; cv=none; b=CFQ1iV0pHCUnOZCa+oTzxAGGSxZmNVeaesOABHQBpIhkfJv71hWrOAD18y/MCnU+rfHi5ZFpidCuRaxGYskr0IX98HQGmFwSTv85dY+PToqqdIBRp3owReloIQuGPPasrk5aqi6C1WRxyz3tX5qugPWrvqLlMFwrbuvjta0uf+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734548061; c=relaxed/simple;
	bh=wrn1S0Zqj6u3wH+tZHv+PmiK15uHse7Vz/9Kz4HcBsI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Q1AlpqE7He4AuifMMhcgyrvudMzqxyT9tnXVCwdBDFhdT0nhWgPm1rBAKQyp5+WL13zhjZiicviHaNAD/N0u1Si7G+PgrTZ6ldS4CIiQshsEFAoeylJGeZDd/4ei71U0q9ys4LJFZNPSTaWQk/hqC7aKiMaR7pxdKmrIaMOffUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NPiKUzx1; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NPiKUzx1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734548059; x=1766084059;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wrn1S0Zqj6u3wH+tZHv+PmiK15uHse7Vz/9Kz4HcBsI=;
  b=NPiKUzx1oZH6qcWG4Mzx/S2Tnd1y2LQnDIStwBI5K0VErEDzuBshj4aE
   IRIShBdoQ4BcleGe3eZKR2AeRk8pz2YxtzhQiJeQ1Y0psX7Vrk4t+2jn3
   2O8RqVtcRVI9CVaH69++zUT7vwP+p60r8jKpfCHI6It9j08wBuPqj5IHJ
   O3nN+M3Pl2NvuwV88iJ6FcYOyjJSX0xTWpTO/6q7e0KMaW0Quk/hFNMgH
   NumDw0oqKHEX4Prs4FOa8dftOpCcGEP1soBXApelOGD6JspItlzKqY0FC
   vFM7AzjAO/vTthjBX3PiIXA8CHDMcpQ8KjIkBtobWwF6iQFnsfv6D4Hwm
   g==;
X-CSE-ConnectionGUID: NQ8PG63nRamxY5SpMIG/dw==
X-CSE-MsgGUID: NO/aBxXnRvybvbtdS9dfwQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="34762093"
X-IronPort-AV: E=Sophos;i="6.12,245,1728975600"; 
   d="scan'208";a="34762093"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2024 10:54:18 -0800
X-CSE-ConnectionGUID: I5mm3zdtRIW2R17QtFh6tA==
X-CSE-MsgGUID: I90IVurYS5y2Y/i57LIGaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,245,1728975600"; 
   d="scan'208";a="98348101"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 18 Dec 2024 10:54:16 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tNzBW-000GZ0-0F;
	Wed, 18 Dec 2024 18:54:14 +0000
Date: Thu, 19 Dec 2024 02:53:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: kernel/bpf/task_iter.c:819:7-15: WARNING use flexible-array member
 instead
 (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
Message-ID: <202412190225.RFIAITmI-lkp@intel.com>
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
head:   aef25be35d23ec768eed08bfcf7ca3cf9685bc28
commit: 4ac4546821584736798aaa9e97da9f6eaf689ea3 bpf: Introduce task_vma open-coded iterator kfuncs
date:   1 year, 2 months ago
:::::: branch date: 21 hours ago
:::::: commit date: 1 year, 2 months ago
config: hexagon-randconfig-r051-20241218 (https://download.01.org/0day-ci/archive/20241219/202412190225.RFIAITmI-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 2dc22615fd46ab2566d0f26d5ba234ab12dc4bf8)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202412190225.RFIAITmI-lkp@intel.com/

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
