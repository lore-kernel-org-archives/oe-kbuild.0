Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EC8C18C91F
	for <oe-kbuild@lists.linux.dev>; Tue, 25 Feb 2025 07:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740470292; cv=none; b=Q/QMrDX8yjTmV0BXJxPaMv4cDFRt7NgUU5InRsXGd6MkZoRCkLuQmLoLcbgMY9Nvp+umfQi4gwH6Iezh6bUuvW4srJaOpuus8do0wBzAF0t4BAv9eiyJ9eYeS219dBJSH+64tDxVXLezWLj1KRsUqi8E4YtcoeNkJl31tyk/usQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740470292; c=relaxed/simple;
	bh=JkNI+sjRG2cTgeQerU5f1Dg/NqJsLG/xauT3CC5bGx0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=E1UDbiwbozsfy0SsEjm33eaw/vlisMM2WpRbFknH8Iem87eXJ7hFyEBqJuDsZWZxDzD1peqjJGMUBZ0UEIdk9kUWINJbI6O8Oyyy8T4IMotZDYAEEc+QRLl1H27EYnalb2qcOEwqcaKmGa9zJ9qnBPpNlmzhu/lw6elurlUjjr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VVrxZ7Ag; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VVrxZ7Ag"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740470291; x=1772006291;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JkNI+sjRG2cTgeQerU5f1Dg/NqJsLG/xauT3CC5bGx0=;
  b=VVrxZ7AguB78SZgXlaA8QgqoL/F7W2eLRGsIvo8gdmU+IxzufUxx9g5K
   X2lX9kj4xRtd3B5TgY5ETAfZCPwYw1Ccut7+bNx9v8Ib3N0hfIBO2FvTl
   5s6pRotc5MIdHugVnARQg/vE8z6YNYjme00Tiqd1TKKpNtUZ083B1VSqA
   gAmyW3gsdjKb5Mgt6D1fLmXRrr+tvgOsusvbTSpr3Hok1fh4XZrpo60yG
   Ir8A/K3I/AFzx0sDphIBJtHAndhYPOi3MSaCUL1eKm1J5fp47DvGPeJJ2
   xLqn+EdPF0QH/szbDYjMvd6flP0jgUh+UGCd7KdQ3U1l5TtQVrq0+Ao/6
   g==;
X-CSE-ConnectionGUID: +sFdSjfVT2CGhq2FsZDv8A==
X-CSE-MsgGUID: rOxuumSISVGzLvsi6yHJ8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="52664504"
X-IronPort-AV: E=Sophos;i="6.13,313,1732608000"; 
   d="scan'208";a="52664504"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2025 23:58:10 -0800
X-CSE-ConnectionGUID: gVLCvTsxTCuT07fSS2JYbg==
X-CSE-MsgGUID: U4jW9ASPTzuPgSObhO5NTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,313,1732608000"; 
   d="scan'208";a="116112566"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 24 Feb 2025 23:58:08 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tmppO-0009v1-2E;
	Tue, 25 Feb 2025 07:58:06 +0000
Date: Tue, 25 Feb 2025 15:57:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2 1/7] ceph: Do not look at the index of an encrypted
 page
Message-ID: <202502251509.BQWNnbhk-lkp@intel.com>
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
In-Reply-To: <20250214155710.2790505-2-willy@infradead.org>
References: <20250214155710.2790505-2-willy@infradead.org>
TO: "Matthew Wilcox (Oracle)" <willy@infradead.org>

Hi Matthew,

kernel test robot noticed the following build warnings:

[auto build test WARNING on ceph-client/testing]
[also build test WARNING on ceph-client/for-linus linus/master v6.14-rc4 next-20250224]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Matthew-Wilcox-Oracle/ceph-Do-not-look-at-the-index-of-an-encrypted-page/20250215-000300
base:   https://github.com/ceph/ceph-client.git testing
patch link:    https://lore.kernel.org/r/20250214155710.2790505-2-willy%40infradead.org
patch subject: [PATCH v2 1/7] ceph: Do not look at the index of an encrypted page
:::::: branch date: 11 days ago
:::::: commit date: 11 days ago
config: s390-randconfig-r071-20250225 (https://download.01.org/0day-ci/archive/20250225/202502251509.BQWNnbhk-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202502251509.BQWNnbhk-lkp@intel.com/

New smatch warnings:
fs/ceph/crypto.h:287 ceph_fscrypt_pagecache_folio() error: 'page' dereferencing possible ERR_PTR()

Old smatch warnings:
fs/ceph/addr.c:429 ceph_netfs_issue_read() error: uninitialized symbol 'err'.
fs/ceph/addr.c:917 writepages_finish() error: 'page' dereferencing possible ERR_PTR()

vim +/page +287 fs/ceph/crypto.h

2d332d5bc42440 Jeff Layton             2020-07-27  282  
273901109b29d0 Matthew Wilcox (Oracle  2025-02-14  283) static inline struct folio *ceph_fscrypt_pagecache_folio(struct page *page)
273901109b29d0 Matthew Wilcox (Oracle  2025-02-14  284) {
273901109b29d0 Matthew Wilcox (Oracle  2025-02-14  285) 	if (fscrypt_is_bounce_page(page))
273901109b29d0 Matthew Wilcox (Oracle  2025-02-14  286) 		page = fscrypt_pagecache_page(page);
273901109b29d0 Matthew Wilcox (Oracle  2025-02-14 @287) 	return page_folio(page);
273901109b29d0 Matthew Wilcox (Oracle  2025-02-14  288) }
273901109b29d0 Matthew Wilcox (Oracle  2025-02-14  289) 

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
