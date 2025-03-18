Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E08C31B6D18
	for <oe-kbuild@lists.linux.dev>; Tue, 18 Mar 2025 20:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742328263; cv=none; b=FyxEevwXqZnLwIiP4EqwmMN9P9MAEgtfMu6zlyllvKkcwTJ4kkAF6fkZ2iB+4nArpkb6RutUt++KhCiwJXM2pu08l9vEoxtsXoOnq7yRHGZ7zBvtM4cAGBmTxWeqFrmYAYafINgPoFlpozaSxKHU3LuNprp9BuvpgbNHGTiTl/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742328263; c=relaxed/simple;
	bh=E7+jEsWqfUTp0iLbrJVLziMwWbnhqefcPEp/zykMMkU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dpjdtoBXSZifK0xnPxwfy8pOMsT1LGlhb+BBgVBBzBBFleZQvq9dMi2Fvns8fxyokJD5cZf05JxSUS84HROk5/zij72A43pPDO6WI/dAUKJgFZvq1Q9UiIKERQmX94IyE6cXVqw0cgp9JqXly4UO9JwkSbC3FRXLPjCSxv9zToY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MGsknZWF; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MGsknZWF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742328261; x=1773864261;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=E7+jEsWqfUTp0iLbrJVLziMwWbnhqefcPEp/zykMMkU=;
  b=MGsknZWFrm97NG43qUjt8Wp8uf7d3J096qUK3AfCMjFqQukOUYZ4dM4J
   JLl5RbJFhgEsVuDD7ec3+dukbigUfMa3z49W1jiT9yCzntSXxcQXPKjGK
   uQc2ATrzMimPjq05YaFx3tnD9o+3B5vx6eJx8JpElMyy1nWbbDVBa7iaF
   UuohUq4lIFD1RhgwmSYncG+kFH4PJxdmN0FfiR2M787bYIjxsVCJ10S8L
   SgKe36It4TXWu15rBNe2gffWw3pK1bKxmM/RUtjlXhBC8IH0/J97zv15g
   VR54ndW5tmIstRGiMHLvlp6cBCW2/LZTESQXS+j27WxTk9bkTV2uGAbCR
   w==;
X-CSE-ConnectionGUID: pZEzz1+nQC6SKYKudMFRUg==
X-CSE-MsgGUID: YcW675AaR42d5+ZigPwZCA==
X-IronPort-AV: E=McAfee;i="6700,10204,11377"; a="68841986"
X-IronPort-AV: E=Sophos;i="6.14,257,1736841600"; 
   d="scan'208";a="68841986"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2025 13:04:20 -0700
X-CSE-ConnectionGUID: WlN+08kjRH6pJHvtGEftSg==
X-CSE-MsgGUID: cwAbuCjoSX62hFjh3vy4sA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,257,1736841600"; 
   d="scan'208";a="126567142"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 18 Mar 2025 13:04:19 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tudAf-000E92-0W;
	Tue, 18 Mar 2025 20:04:17 +0000
Date: Wed, 19 Mar 2025 04:03:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [linux-next:master 5794/12094]
 drivers/base/regmap/regcache.c:44:8-9: WARNING opportunity for swap()
Message-ID: <202503190443.lymTwt6E-lkp@intel.com>
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
TO: Charles Keepax <ckeepax@opensource.cirrus.com>
CC: Mark Brown <broonie@kernel.org>
CC: "Pierre-Louis Bossart" <pierre-louis.bossart@linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   c4d4884b67802c41fd67399747165d65c770621a
commit: fd80df352ba1884ce2b62dd8d9495582308101b7 [5794/12094] regcache: Add support for sorting defaults arrays
:::::: branch date: 9 hours ago
:::::: commit date: 3 weeks ago
config: csky-randconfig-r063-20250318 (https://download.01.org/0day-ci/archive/20250319/202503190443.lymTwt6E-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 10.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202503190443.lymTwt6E-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/base/regmap/regcache.c:44:8-9: WARNING opportunity for swap()

vim +44 drivers/base/regmap/regcache.c

fd80df352ba188 Charles Keepax 2025-02-17  36  
fd80df352ba188 Charles Keepax 2025-02-17  37  static void regcache_defaults_swap(void *a, void *b, int size)
fd80df352ba188 Charles Keepax 2025-02-17  38  {
fd80df352ba188 Charles Keepax 2025-02-17  39  	struct reg_default *x = a;
fd80df352ba188 Charles Keepax 2025-02-17  40  	struct reg_default *y = b;
fd80df352ba188 Charles Keepax 2025-02-17  41  	struct reg_default tmp;
fd80df352ba188 Charles Keepax 2025-02-17  42  
fd80df352ba188 Charles Keepax 2025-02-17  43  	tmp = *x;
fd80df352ba188 Charles Keepax 2025-02-17 @44  	*x = *y;
fd80df352ba188 Charles Keepax 2025-02-17  45  	*y = tmp;
fd80df352ba188 Charles Keepax 2025-02-17  46  }
fd80df352ba188 Charles Keepax 2025-02-17  47  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
