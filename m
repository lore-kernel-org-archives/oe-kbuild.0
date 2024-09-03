Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF74F1CDA34
	for <oe-kbuild@lists.linux.dev>; Tue,  3 Sep 2024 05:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725340125; cv=none; b=bEQ3dPsz/6hl8lOKPZvvx9AIBZH7wcwyiCSY8a5J4j52MmlSKOj7HcE87jyLj/oOvmQWGw3Vim8WJ/XY6Z4MTrLYUykkh3cIXXx/YQ/O+Ok2IZP5QNlPKtNjogw6U+FYRmEA6HYMxvx8fsgJ8i2zIyp/WiVu2hu1RZsxhwgizP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725340125; c=relaxed/simple;
	bh=/1ZUfocSuODpPjvuKmd6aY1COpR8lA8ryS4m0PKE+5A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u316Z/FzW4LYqodZP1f8gLxdwCB8b197/D1MvlLnx31Jk5oNfuEblONwHYnsAaTRae1aEpXjz33X8jRscZahIzBlJFtWINMHdcz3kPXH/hB6cPGKoPNofZBDwQm2svqdwkbs67BjrME4LogLDokV2jgsppV9fTqe03RswfhFJ2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MP6MNq7W; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MP6MNq7W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725340123; x=1756876123;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/1ZUfocSuODpPjvuKmd6aY1COpR8lA8ryS4m0PKE+5A=;
  b=MP6MNq7Wr4A1Kd2crQM3DXdITCdp8mNb1Yb/4v/9r96KAt0SJwl4H5nw
   DfbWb+igOmvzvH0m9R72ot1NLvrXfvtFn0ISN9lRmzaAVI/+vpymC0Ztp
   1eUkbRxbJz//Du60rwpP/Be4F0DfbiQZwIoa9mVA+B3YNn7BDWZ7lJnQI
   MVkGbrLBH8trZsXM9zITnMwHB6FlkU8TMgl+b06TunlccY7avisr5PXDN
   4CsbLB2HXen/6WobrwIDa0oAXdhpA44CMr9VR8599lw2HlPUCzCTb7Dq3
   OqJKof9/TwRBOvOddNnzNV8vvU7FnVOBL7DX4Zhu0DcxE07vw3H/eNLpq
   Q==;
X-CSE-ConnectionGUID: PXAiIlGQRnig6t39HUEsFw==
X-CSE-MsgGUID: qHAPVfwJSbCw8j8BFtabSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="23724396"
X-IronPort-AV: E=Sophos;i="6.10,197,1719903600"; 
   d="scan'208";a="23724396"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2024 22:08:43 -0700
X-CSE-ConnectionGUID: shNZMnIqTg+BIuluzUtsjg==
X-CSE-MsgGUID: m4SbFW36RTSO3ctapS3uLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,197,1719903600"; 
   d="scan'208";a="65140110"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 02 Sep 2024 22:08:41 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1slLmQ-0006EZ-2o;
	Tue, 03 Sep 2024 05:08:38 +0000
Date: Tue, 3 Sep 2024 13:08:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:fs-next 470/639] fs/bcachefs/sb-members.c:503
 bch2_sb_member_alloc() warn: statement has no effect 3
Message-ID: <202409031301.epjgo23V-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Kent Overstreet <kent.overstreet@linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git fs-next
head:   b4abbc7800c807e48690abdba898e9b2e61cf58f
commit: 4e7795eda4459bf3e69c87c793bc34f610f9d981 [470/639] bcachefs: bch2_sb_member_alloc()
:::::: branch date: 6 hours ago
:::::: commit date: 26 hours ago
config: i386-randconfig-141-20240903 (https://download.01.org/0day-ci/archive/20240903/202409031301.epjgo23V-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409031301.epjgo23V-lkp@intel.com/

smatch warnings:
fs/bcachefs/sb-members.c:503 bch2_sb_member_alloc() warn: statement has no effect 3

vim +503 fs/bcachefs/sb-members.c

4e7795eda4459b Kent Overstreet 2024-09-01  476  
4e7795eda4459b Kent Overstreet 2024-09-01  477  int bch2_sb_member_alloc(struct bch_fs *c)
4e7795eda4459b Kent Overstreet 2024-09-01  478  {
4e7795eda4459b Kent Overstreet 2024-09-01  479  	unsigned dev_idx = c->sb.nr_devices;
4e7795eda4459b Kent Overstreet 2024-09-01  480  	if (dev_idx < BCH_SB_MEMBERS_MAX)
4e7795eda4459b Kent Overstreet 2024-09-01  481  		goto have_slot;
4e7795eda4459b Kent Overstreet 2024-09-01  482  
4e7795eda4459b Kent Overstreet 2024-09-01  483  	int best = -1;
4e7795eda4459b Kent Overstreet 2024-09-01  484  	u64 best_last_mount = 0;
4e7795eda4459b Kent Overstreet 2024-09-01  485  	for (dev_idx = 0; dev_idx < BCH_SB_MEMBERS_MAX; dev_idx++) {
4e7795eda4459b Kent Overstreet 2024-09-01  486  		struct bch_member m = bch2_sb_member_get(c->disk_sb.sb, dev_idx);
4e7795eda4459b Kent Overstreet 2024-09-01  487  		if (bch2_member_alive(&m))
4e7795eda4459b Kent Overstreet 2024-09-01  488  			continue;
4e7795eda4459b Kent Overstreet 2024-09-01  489  
4e7795eda4459b Kent Overstreet 2024-09-01  490  		u64 last_mount = le64_to_cpu(m.last_mount);
4e7795eda4459b Kent Overstreet 2024-09-01  491  		if (best < 0 || last_mount < best_last_mount) {
4e7795eda4459b Kent Overstreet 2024-09-01  492  			best = dev_idx;
4e7795eda4459b Kent Overstreet 2024-09-01  493  			best_last_mount = last_mount;
4e7795eda4459b Kent Overstreet 2024-09-01  494  		}
4e7795eda4459b Kent Overstreet 2024-09-01  495  	}
4e7795eda4459b Kent Overstreet 2024-09-01  496  	if (best >= 0) {
4e7795eda4459b Kent Overstreet 2024-09-01  497  		dev_idx = best;
4e7795eda4459b Kent Overstreet 2024-09-01  498  		goto have_slot;
4e7795eda4459b Kent Overstreet 2024-09-01  499  	}
4e7795eda4459b Kent Overstreet 2024-09-01  500  
4e7795eda4459b Kent Overstreet 2024-09-01  501  	return -BCH_ERR_ENOSPC_sb_members;
4e7795eda4459b Kent Overstreet 2024-09-01  502  have_slot:
4e7795eda4459b Kent Overstreet 2024-09-01 @503  	unsigned nr_devices = max_t(unsigned, dev_idx + 1, c->sb.nr_devices);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
