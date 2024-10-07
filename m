Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FAA6188703
	for <oe-kbuild@lists.linux.dev>; Mon,  7 Oct 2024 08:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728289241; cv=none; b=o4tOBtA3/P/TDUi6BTP2pStH4V0BT3EViYkk9wOGtGD+SgsMnQU5m+L0lVqYZt11757+atrS9KGHe8SR4M4vtlFOBKg807TBpRx6YBPOFBW1e3UnuAMppu3R5MX1zNGaQ3/SHHpQ9VsbI0yJw9A3NR/0+9kIkcpN28Ru5YuhfCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728289241; c=relaxed/simple;
	bh=FkbkPsyBni39H0c0AhUqIDD+mXzK9/+838F3mKmyudA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=E96aaiS+ZcA6FJLrP3vpnHEcqohS3cDzib26Ibz1DGNd5VJUPIi0dVcyvNJksQzwYVzgPnpbvH6y/n2iQrPu0dLL7vPeBNvJdF7Ha/6i0+i2205ZxBinpfiWDJAHmGoFoPpdJOLtF5Gr03+5Yc9R+i/l6kLaCL/xRY9ueg1PWRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=afhgorLB; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="afhgorLB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728289239; x=1759825239;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FkbkPsyBni39H0c0AhUqIDD+mXzK9/+838F3mKmyudA=;
  b=afhgorLBhC1T4xH3LMiXBhkoA3sGNltDIfEv8DsHW/5aA2RIZmFY9fvA
   SDnCpvG3hW5kZFEJgPkNfkPsVH+GUVjXO5sWsMz+OQylCWPZwfn7uXGSX
   PW/PDmgZSfibhCw6gKvv2ZT41E7a/OC0G+EwgOchTe7zLQ9L7DZ/hA/Qt
   D0KGH4ijHiP9yGZUbbi5cT4twOTeIh97vehGifEm+EPLjpWWRDHICcRH5
   ifUjbBEoHKLgK14KJMQFzwGJlNOxG+EE+d9+WSD7LnNhm5IO7DaBiG/j3
   uRauxmMNhV6yzWTalQ9TdANp1R8/mknMyr1aFtRrFtTA5v24eMopJIg2x
   g==;
X-CSE-ConnectionGUID: VPDz9ov4QNanom/hj2V4zg==
X-CSE-MsgGUID: u+GWkuwyTg28alBYspwQ8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11217"; a="27564621"
X-IronPort-AV: E=Sophos;i="6.11,183,1725346800"; 
   d="scan'208";a="27564621"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2024 01:20:38 -0700
X-CSE-ConnectionGUID: g9yrcQpZS76KPT4FQMEckA==
X-CSE-MsgGUID: Jp3rN/jLRAKq2od7Dri7Nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,183,1725346800"; 
   d="scan'208";a="75371850"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 07 Oct 2024 01:20:38 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sxiyp-0004l6-0t;
	Mon, 07 Oct 2024 08:20:35 +0000
Date: Mon, 7 Oct 2024 16:20:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: kernel/irq/matrix.o: warning: objtool:
 irq_matrix_assign_system+0x6c: unreachable instruction
Message-ID: <202410071619.u4UhGhMd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "loongarch: unreachable instruction"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Tianyang Zhang <zhangtianyang@loongson.cn>
CC: Thomas Gleixner <tglx@linutronix.de>
CC: Jianmin Lv <lvjianmin@loongson.cn>
CC: Liupu Wang <wangliupu@loongson.cn>
CC: Huacai Chen <chenhuacai@loongson.cn>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8cf0b93919e13d1e8d4466eb4080a4c4d9d66d7b
commit: ae16f05c928a1336d5d9d19fd805d7bf29c3f0c8 irqchip/loongarch-avec: Add AVEC irqchip support
date:   6 weeks ago
:::::: branch date: 10 hours ago
:::::: commit date: 6 weeks ago
config: loongarch-randconfig-001-20240804 (https://download.01.org/0day-ci/archive/20241007/202410071619.u4UhGhMd-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241007/202410071619.u4UhGhMd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202410071619.u4UhGhMd-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/irq/matrix.o: warning: objtool: irq_matrix_assign_system+0x6c: unreachable instruction


objdump-func vmlinux.o irq_matrix_assign_system:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
