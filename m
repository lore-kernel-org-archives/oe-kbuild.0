Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28686F9C1
	for <oe-kbuild@lists.linux.dev>; Mon, 11 Aug 2025 12:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754914770; cv=none; b=mpYgGfJfEf5snIcD3hiEyx/+S6PhoHGK5N4xRBtklPbPqWPnJjxWGe4dE8hFJyLhOAGmSHUDVAnoDLoXKORhW45YAnyDqMgLvN1cFq+1D0IPwpGj/AHcrAm0Sa7/HURdmgcl1zPDaLvG4/R8ODEYJKp/rnMRt1eoyOxnSdsTo0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754914770; c=relaxed/simple;
	bh=bzfRu4sjrunXipX3pvUi7JzBLj9bGghqWae/KHAKBDI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HaI9d77M2iR5yDxpgbbRuaZCuWN8dQ5lQGulDUpNYTXouVB8CWPJyFF6+6sWNcCjLx4q6ivYylJgQNWm0ivncnH2sixuaRRvNpTrrR4gGo68ap/4uPw9A4sewRQBfg+uYvQxwqmtDq1/XDYolbIVX4kSJn8ebEzG7EiMP8Ib7Po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F2gzVmpH; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F2gzVmpH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754914769; x=1786450769;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bzfRu4sjrunXipX3pvUi7JzBLj9bGghqWae/KHAKBDI=;
  b=F2gzVmpHZwS6EB/sT8rKE/asZ4k5WHvpum0nnjSKhX3Y8A/VkHfnQzy8
   yyIbkueRccKXKPgfyec2ZFrt5vC96LHyNs5lr6J5x18jYBk07q2CRau1q
   xHiwrrc2J+dmJeKEaTwTyC17hUoR9F0CUetAlCgxObQPsolSWguKG/k2K
   AMMIWKBGsjGIYiISUF8/JXZS6qbhYD5I1HPMvRGJ7LwEUlE5mmd16s7iU
   ACfnAbnJPUUPzkl3PJdDcj2trkMJUeOq2gRehpql/sunQHwPdJxYuN9BK
   m6iTSo3fVfrfVsQr/M52fBpnIGu9DF5ONkEJ+VvPF9Xfv//uObi1NDawq
   w==;
X-CSE-ConnectionGUID: d7jJsmpJT/GnTtIRRdG5/Q==
X-CSE-MsgGUID: wwPqPZgkQxuDO8qDWtMjlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="57122662"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="57122662"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2025 05:19:29 -0700
X-CSE-ConnectionGUID: a2fJEb2PS9eDOMCpmB8s3g==
X-CSE-MsgGUID: d1Z/2C8jSBWkb/7itY7w/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="165142250"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 11 Aug 2025 05:19:27 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ulRUq-0005qK-3D;
	Mon, 11 Aug 2025 12:19:24 +0000
Date: Mon, 11 Aug 2025 20:19:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: security/apparmor/label.c:951 aa_label_insert() warn: inconsistent
 returns '&ls->lock'.
Message-ID: <202508112019.Kz6vxQho-lkp@intel.com>
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
TO: Heiko Carstens <hca@linux.ibm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8f5ae30d69d7543eee0d70083daf4de8fe15d585
commit: b5f463486b212c56d837c2592d87de7fb4833662 s390: Support PREEMPT_DYNAMIC
date:   9 months ago
:::::: branch date: 19 hours ago
:::::: commit date: 9 months ago
config: s390-randconfig-r073-20250811 (https://download.01.org/0day-ci/archive/20250811/202508112019.Kz6vxQho-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 3769ce013be2879bf0b329c14a16f5cb766f26ce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202508112019.Kz6vxQho-lkp@intel.com/

smatch warnings:
security/apparmor/label.c:951 aa_label_insert() warn: inconsistent returns '&ls->lock'.

vim +951 security/apparmor/label.c

f1bd904175e819 John Johansen 2017-06-09  918  
f1bd904175e819 John Johansen 2017-06-09  919  
f1bd904175e819 John Johansen 2017-06-09  920  /**
f1bd904175e819 John Johansen 2017-06-09  921   * aa_label_insert - insert label @label into @ls or return existing label
e18573dd2bacea Gaosheng Cui  2023-06-25  922   * @ls: labelset to insert @label into
e18573dd2bacea Gaosheng Cui  2023-06-25  923   * @label: label to insert
f1bd904175e819 John Johansen 2017-06-09  924   *
f1bd904175e819 John Johansen 2017-06-09  925   * Requires: caller to hold a valid ref on @label
f1bd904175e819 John Johansen 2017-06-09  926   *
f1bd904175e819 John Johansen 2017-06-09  927   * Returns: ref counted @label if successful in inserting @label
f1bd904175e819 John Johansen 2017-06-09  928   *     else ref counted equivalent label that is already in the set
f1bd904175e819 John Johansen 2017-06-09  929   */
f1bd904175e819 John Johansen 2017-06-09  930  struct aa_label *aa_label_insert(struct aa_labelset *ls, struct aa_label *label)
f1bd904175e819 John Johansen 2017-06-09  931  {
f1bd904175e819 John Johansen 2017-06-09  932  	struct aa_label *l;
f1bd904175e819 John Johansen 2017-06-09  933  	unsigned long flags;
f1bd904175e819 John Johansen 2017-06-09  934  
f1bd904175e819 John Johansen 2017-06-09  935  	AA_BUG(!ls);
f1bd904175e819 John Johansen 2017-06-09  936  	AA_BUG(!label);
f1bd904175e819 John Johansen 2017-06-09  937  
f1bd904175e819 John Johansen 2017-06-09  938  	/* check if label exists before taking lock */
f1bd904175e819 John Johansen 2017-06-09  939  	if (!label_is_stale(label)) {
f1bd904175e819 John Johansen 2017-06-09  940  		read_lock_irqsave(&ls->lock, flags);
f1bd904175e819 John Johansen 2017-06-09  941  		l = __label_find(label);
f1bd904175e819 John Johansen 2017-06-09  942  		read_unlock_irqrestore(&ls->lock, flags);
f1bd904175e819 John Johansen 2017-06-09  943  		if (l)
f1bd904175e819 John Johansen 2017-06-09  944  			return l;
f1bd904175e819 John Johansen 2017-06-09  945  	}
f1bd904175e819 John Johansen 2017-06-09  946  
f1bd904175e819 John Johansen 2017-06-09  947  	write_lock_irqsave(&ls->lock, flags);
f1bd904175e819 John Johansen 2017-06-09  948  	l = __label_insert(ls, label, false);
f1bd904175e819 John Johansen 2017-06-09  949  	write_unlock_irqrestore(&ls->lock, flags);
f1bd904175e819 John Johansen 2017-06-09  950  
f1bd904175e819 John Johansen 2017-06-09 @951  	return l;
f1bd904175e819 John Johansen 2017-06-09  952  }
f1bd904175e819 John Johansen 2017-06-09  953  

:::::: The code at line 951 was first introduced by commit
:::::: f1bd904175e8190ce14aedee37e207ab51fe3b30 apparmor: add the base fns() for domain labels

:::::: TO: John Johansen <john.johansen@canonical.com>
:::::: CC: John Johansen <john.johansen@canonical.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
