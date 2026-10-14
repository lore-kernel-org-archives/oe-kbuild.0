Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3211E3597B
	for <oe-kbuild@lists.linux.dev>; Wed, 14 Oct 2026 09:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791970554; cv=none; b=qIkPtySnwWqSbFC0DzkfJiH8Whl0N/amCgO8PNY6yf9yZqAmoDTEDWwUkItRJ2Y1jsUzZ5rlKynyCn8rGtFx3sNDrnx43p+ZxQdciCHHnz5EmtvCMs1OEVQCg0gzuGm1VlN745aOuzHPDXpUFUisQ9TEmh7PvCGoQ17d1uaR4OE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791970554; c=relaxed/simple;
	bh=/h/f0cIRvs0ErLlFyGGbczceLF2hQ+cKeUz38raZ07U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ew5Kr95dk2JRzqx6O6GUo6KZ2tj5f86S4oq5VXf5DhpDndakBy99aSf0QVMLRIz01h9aKTUhl1wD2Kt82MXd4lt2ZXlmip4XHOFS17zuu9J2JcJohUJ1U8ERLFkVgEPQqbo6w/Q3unmDNtHwDvSslJaeT1WsK/hGmWWMfKDa0kI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XfuPTtcc; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XfuPTtcc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791970552; x=1823506552;
  h=date:from:to:cc:subject:message-id;
  bh=/h/f0cIRvs0ErLlFyGGbczceLF2hQ+cKeUz38raZ07U=;
  b=XfuPTtccrHr06n05eih0ccCXGpXxmus1cCIZ+ME7WXePiuTZy5ez52YN
   9tuqV9r1oagRPkLoH4s+pA+QgZ7MfDWUKhJQUWc7QJJfI2JnZVzYHje8Q
   8VtepH0lEFoNFDWX3QYHIM634oHpZkWsfy8gz1GpDKUrwses6ON7IkkCk
   ja4iSKz7GBbKoFOSjEsZmDIP+Uvt1rfCjeF1IitCt0zEh0uD14OZFkAkT
   SBJQk0Zs2mcPOdrj/XHN5/klLnZwnHCLW/AWhw2MtIC1fHCZSdVJ5IvOp
   cMREXrtDy9rr4KUlVnnW5vqHyhDYONxlLqLkNmcb18N/QlQRRC0Rz/0Qm
   g==;
X-CSE-ConnectionGUID: ft2SrbAhQACucI8g8JI7Sw==
X-CSE-MsgGUID: PNC7RRnMRludb9aPakMHBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="817388"
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="817388"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 02:35:52 -0700
X-CSE-ConnectionGUID: FbgqlwaBQ5yaN1FMYgN6gQ==
X-CSE-MsgGUID: bTmrVGwYTCqleXukuzSbkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="1464964"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 14 Oct 2026 02:35:50 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xGvOm-00000000AzL-44wx;
	Wed, 14 Oct 2026 09:35:48 +0000
Date: Wed, 14 Oct 2026 11:35:42 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/md/dm-pcache/backing_dev.o: warning: objtool:
 backing_dev_req_init+0x78: unreachable instruction
Message-ID: <202610141138.kI9IecJN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "loongarch: unreachable instruction"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Li Chen <chenl311@chinatelecom.cn>
CC: Mikulas Patocka <mpatocka@redhat.com>

Hi Li,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4056b3c9d3c92ea45955641dbafeb9b960e146ef
commit: 341d14bd69d05b1c30bd83c5056730ba6d78b83d dm-pcache: allow built-in build and rename flush helper
date:   11 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 11 months ago
config: loongarch-randconfig-2001-20261014 (https://download.01.org/0day-ci/archive/20261014/202610141138.kI9IecJN-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261014/202610141138.kI9IecJN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 341d14bd69d0 ("dm-pcache: allow built-in build and rename flush helper")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610141138.kI9IecJN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/md/dm-pcache/backing_dev.o: warning: objtool: backing_dev_req_init+0x78: unreachable instruction
--
>> drivers/md/dm-pcache/cache_writeback.o: warning: objtool: cache_wb_tree_writeback+0x174: unreachable instruction

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
