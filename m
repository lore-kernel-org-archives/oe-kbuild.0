Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5303112C475
	for <oe-kbuild@lists.linux.dev>; Fri, 27 Dec 2024 20:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735332765; cv=none; b=htpD9V02VgEUf7NRiEOzf4eZ6VDX52XAkdRX7IoBRF1QE7DmhbEvn2tg/onKgWySiCLcZII7OfhJeuCOY34PnhEN3TY6CI5iZ0PjH4qt5OcUe+/6EeVDHm+Q0xhRp+GW3ZZm+F6Z/uJd2XUBEZ4jzMiR91HCYMy+AFELbW0Kf24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735332765; c=relaxed/simple;
	bh=+PU+Whnb1ODiVJysALPLI2Vp+TBnLmlI62ATTK5Rc9s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hsJzIR72lGNDYSaQciEJ1AbSM1g9tsIlPh8zpd45qCRSgoxLpTFvYpsmI98mvoF5oVfEV4x9GbErAwwgGitRgSJ3Vd8dlq3/+AjSbgCIwW+mlvoFvj89V1KGNgvui0SSuDqhZSCGLigQ69A2l27lkTpI/DovUcurtdM1nvADOys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g+k82Atx; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g+k82Atx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735332763; x=1766868763;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+PU+Whnb1ODiVJysALPLI2Vp+TBnLmlI62ATTK5Rc9s=;
  b=g+k82Atx47AN9G8aR2GvIjeQadhdH4emUILPKoJDfSHRrHC93b7qjwUb
   6zcznakPHzoRzUH3TOvPxoSI11CP/r3cFEigTKe6UVNjWjDo5NjJlb2r8
   S1wq1atQY++8/270UoiXcnp+ZjtBMfXUexn5mMGVkPvS/2dK4ZZRa1FQt
   vg9f8KZZlzhZs1yWLHF5FEcuEwumvuzsCtD9+5LL87w7pCAllRo/yIPg8
   fzRNbWoxEIvuupNL5KdEC+Mn4rA4b7S3104hWMcuXcnpnhBPvFSkfvrl8
   mCea4xJyQ9NCs05uwBkRo5OoT9pNdSy5IrRKPvbQJ6paSWkOmK8nfCP78
   Q==;
X-CSE-ConnectionGUID: LrYIzf8LRxmTKbhy1UltVQ==
X-CSE-MsgGUID: /D9mU0a8Tj2RzWE+ipU0Fw==
X-IronPort-AV: E=McAfee;i="6700,10204,11298"; a="53260899"
X-IronPort-AV: E=Sophos;i="6.12,269,1728975600"; 
   d="scan'208";a="53260899"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2024 12:52:42 -0800
X-CSE-ConnectionGUID: BfSDw9fvQiuuo2f+B/0XRA==
X-CSE-MsgGUID: fLdxGUhVQDm1twdnkiBLyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="104299420"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 27 Dec 2024 12:52:41 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRHK2-0003au-36;
	Fri, 27 Dec 2024 20:52:38 +0000
Date: Sat, 28 Dec 2024 04:51:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [openeuler:OLK-5.10 2601/2601] kernel/stackleak.c:42:5-10:
 opportunity for str_enabled_disabled(state)
Message-ID: <202412280419.SeKIgBFA-lkp@intel.com>
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
TO: kernel@openeuler.org
TO: Zheng Zengkai <zhengzengkai@huawei.com>

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   053a6b6f8e4c86200cdb20bc80c063c3bb119859
commit: 9d423ac5414e69a36e95dc0b77392429c507cbe1 [2601/2601] gcc-plugins: simplify GCC plugin-dev capability test
:::::: branch date: 15 hours ago
:::::: commit date: 2 years, 11 months ago
config: x86_64-randconfig-101-20241228 (https://download.01.org/0day-ci/archive/20241228/202412280419.SeKIgBFA-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202412280419.SeKIgBFA-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> kernel/stackleak.c:42:5-10: opportunity for str_enabled_disabled(state)

vim +42 kernel/stackleak.c

964c9dff009189 Alexander Popov 2018-08-17  21  
964c9dff009189 Alexander Popov 2018-08-17  22  int stack_erasing_sysctl(struct ctl_table *table, int write,
4773ef33fc6e59 Tobias Klauser  2020-09-18  23  			void *buffer, size_t *lenp, loff_t *ppos)
964c9dff009189 Alexander Popov 2018-08-17  24  {
964c9dff009189 Alexander Popov 2018-08-17  25  	int ret = 0;
964c9dff009189 Alexander Popov 2018-08-17  26  	int state = !static_branch_unlikely(&stack_erasing_bypass);
964c9dff009189 Alexander Popov 2018-08-17  27  	int prev_state = state;
964c9dff009189 Alexander Popov 2018-08-17  28  
964c9dff009189 Alexander Popov 2018-08-17  29  	table->data = &state;
964c9dff009189 Alexander Popov 2018-08-17  30  	table->maxlen = sizeof(int);
964c9dff009189 Alexander Popov 2018-08-17  31  	ret = proc_dointvec_minmax(table, write, buffer, lenp, ppos);
964c9dff009189 Alexander Popov 2018-08-17  32  	state = !!state;
964c9dff009189 Alexander Popov 2018-08-17  33  	if (ret || !write || state == prev_state)
964c9dff009189 Alexander Popov 2018-08-17  34  		return ret;
964c9dff009189 Alexander Popov 2018-08-17  35  
964c9dff009189 Alexander Popov 2018-08-17  36  	if (state)
964c9dff009189 Alexander Popov 2018-08-17  37  		static_branch_disable(&stack_erasing_bypass);
964c9dff009189 Alexander Popov 2018-08-17  38  	else
964c9dff009189 Alexander Popov 2018-08-17  39  		static_branch_enable(&stack_erasing_bypass);
964c9dff009189 Alexander Popov 2018-08-17  40  
964c9dff009189 Alexander Popov 2018-08-17  41  	pr_warn("stackleak: kernel stack erasing is %s\n",
964c9dff009189 Alexander Popov 2018-08-17 @42  					state ? "enabled" : "disabled");
964c9dff009189 Alexander Popov 2018-08-17  43  	return ret;
964c9dff009189 Alexander Popov 2018-08-17  44  }
964c9dff009189 Alexander Popov 2018-08-17  45  

:::::: The code at line 42 was first introduced by commit
:::::: 964c9dff0091893a9a74a88edf984c6da0b779f7 stackleak: Allow runtime disabling of kernel stack erasing

:::::: TO: Alexander Popov <alex.popov@linux.com>
:::::: CC: Kees Cook <keescook@chromium.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
