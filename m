Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F03464014BB
	for <oe-kbuild@lists.linux.dev>; Wed, 25 Mar 2026 17:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774458564; cv=none; b=IJIh8/942FpdP9bCIwFNk1YdqmkgkV8Z1Iuyi6Z424ilrTT9wAiY8/ZEIC22351+7PgeYS2813qD3G5gFdjs5cFxQxmNeG03Wlxi2HOrQTPbFhtLBvDdIyq8Lpo6vC0dAe/wcdrKRlaGVVAs6O3vyG5rI47adBNJRIGMYUwkZCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774458564; c=relaxed/simple;
	bh=oPWoJQGrKC9432QkUzNOET0l7R6fWaoi9RPiriqBPhs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XzZ1ahpC8nY7XkKmzfTC7zWQRTt6ay3EJASjvGRKV+RhLSEGa+pmH1jS9XxO/IZtkEj6kC1H9AVn9ZN3xBWjYnyk2ria9ft4wfgl6S4zteJ5Em23pAKaCAvzho6gcnsqdwiXSNc6ia5sKwQSiPCNkGYTQlsTgsRty4gKgGAD/XM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OKVJM322; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OKVJM322"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774458556; x=1805994556;
  h=date:from:to:cc:subject:message-id;
  bh=oPWoJQGrKC9432QkUzNOET0l7R6fWaoi9RPiriqBPhs=;
  b=OKVJM322rfYcKIMgp6CJfoWKr6tHuGjdavOBDk20VCki93qpVeNxk1tK
   DP+4fzJrWOPDRInNsTQo7uulMmZsR4Nd3UtTUaSMWDYnAOWsdxGr4ZqLm
   gbK0vr20GiC0dMwbl7/fgefDdx6OMek04QD/KC2IefwWtxlIbl1DbmonJ
   QcM8LZLMuDXQriwKhvpKdoXc16hBvZHRqoIT7Bs9dvlmlRx448GxPCNGR
   gebhWSbFjuQWJpYSl5xIgSlcvV1W5TIAfSjRl+rInWDySLgc2E8gvPda7
   HSmJ4FYm8LG14+u1gbxnfqx/+Zus38pegluQ4hT2cz5pp7arVv7Hxrzi2
   w==;
X-CSE-ConnectionGUID: PoS510wCTs6wlsb2t5th4w==
X-CSE-MsgGUID: Hh5ulT68SDeu4Mgw60rZFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="75219346"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="75219346"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 10:09:14 -0700
X-CSE-ConnectionGUID: Exm13xE3SJ2UAiKaPp9nWA==
X-CSE-MsgGUID: zhu3RXgER62yfV3H10qdmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="228811663"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 25 Mar 2026 10:09:13 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5RjC-000000007Kv-1q6X;
	Wed, 25 Mar 2026 17:09:10 +0000
Date: Thu, 26 Mar 2026 01:08:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/clk/renesas/clk-rz.o: error: objtool:
 __rz_cpg_clks_of_clk_init_declare+0x290: can't find jump dest instruction at
 .init.text+0x524
Message-ID: <202603260147.FOYtWJsh-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Josh Poimboeuf <jpoimboe@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   bbeb83d3182abe0d245318e274e8531e5dd7a948
commit: 1fd1dc41724319406b0aff221a352a400b0ddfc5 objtool: Fix ERROR_INSN() error message
date:   3 weeks ago
:::::: branch date: 17 hours ago
:::::: commit date: 3 weeks ago
config: powerpc-randconfig-r072-20260325 (https://download.01.org/0day-ci/archive/20260326/202603260147.FOYtWJsh-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9004-gb810ac53
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260326/202603260147.FOYtWJsh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603260147.FOYtWJsh-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/clk/renesas/clk-rz.o: error: objtool: __rz_cpg_clks_of_clk_init_declare+0x290: can't find jump dest instruction at .init.text+0x524

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
