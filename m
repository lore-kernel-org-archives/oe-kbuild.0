Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBAF4BA25
	for <oe-kbuild@lists.linux.dev>; Sat,  4 Nov 2023 10:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dWi21FKb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699095551; x=1730631551;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0pNgocXEFX3JwsphGkSIdF+9tUUoSGiqD7eWQUGsCas=;
  b=dWi21FKb99aZcI9zKGnrQThhYHdiiPoe50lURKq33MIZrEnWTOtmWhLM
   3YKLVnPOz7HgEvgaIIWRZDEO3J0PZ1EAV4kgsxymRvs4Hc2lZRVJMSGXn
   GTEWefLFtcqwe3WfXhfU+GP/G5ZfndX+U7M9F4aI/OUskloiZoHhcHzqm
   lwzGNkiEfZhx2tpvbhJjtfPHdzFYnUSlTLAVmVur6hJ6cbfJR6TIC1dxP
   GaJI0glK/AST2UbTNlXydEP45h3JAU7STMVjfC+yZp/6SDBmrLhUUumjV
   SarXTdA6yjnMMVOMOKWhWLAw9kWd1sYdSJE89YOA/gX3Lia2HH6WTI+O4
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="388903148"
X-IronPort-AV: E=Sophos;i="6.03,276,1694761200"; 
   d="scan'208";a="388903148"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2023 03:59:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,276,1694761200"; 
   d="scan'208";a="9637976"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 04 Nov 2023 03:59:07 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzEMq-0003sI-2R;
	Sat, 04 Nov 2023 10:59:04 +0000
Date: Sat, 4 Nov 2023 18:58:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/bcachefs/reflink.c:56 bch2_reflink_p_merge() warn: ignoring
 unreachable code.
Message-ID: <202311041843.dCBwsDqC-lkp@intel.com>
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
TO: Kent Overstreet <kmo@daterainc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   90b0c2b2edd1adff742c621e246562fbefa11b70
commit: 59ba21d99fc7a19d32fc4c2cb21509b8876d8e01 bcachefs: Clean up key merging
date:   13 days ago
:::::: branch date: 6 hours ago
:::::: commit date: 13 days ago
config: x86_64-randconfig-161-20231102 (https://download.01.org/0day-ci/archive/20231104/202311041843.dCBwsDqC-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20231104/202311041843.dCBwsDqC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311041843.dCBwsDqC-lkp@intel.com/

smatch warnings:
fs/bcachefs/reflink.c:56 bch2_reflink_p_merge() warn: ignoring unreachable code.

vim +56 fs/bcachefs/reflink.c

76426098e419c17 Kent Overstreet 2019-08-16  44  
59ba21d99fc7a19 Kent Overstreet 2021-04-28  45  bool bch2_reflink_p_merge(struct bch_fs *c, struct bkey_s _l, struct bkey_s_c _r)
76426098e419c17 Kent Overstreet 2019-08-16  46  {
76426098e419c17 Kent Overstreet 2019-08-16  47  	struct bkey_s_reflink_p l = bkey_s_to_reflink_p(_l);
59ba21d99fc7a19 Kent Overstreet 2021-04-28  48  	struct bkey_s_c_reflink_p r = bkey_s_c_to_reflink_p(_r);
76426098e419c17 Kent Overstreet 2019-08-16  49  
59ba21d99fc7a19 Kent Overstreet 2021-04-28  50  	/*
59ba21d99fc7a19 Kent Overstreet 2021-04-28  51  	 * Disabled for now, the triggers code needs to be reworked for merging
59ba21d99fc7a19 Kent Overstreet 2021-04-28  52  	 * of reflink pointers to work:
59ba21d99fc7a19 Kent Overstreet 2021-04-28  53  	 */
59ba21d99fc7a19 Kent Overstreet 2021-04-28  54  	return false;
76426098e419c17 Kent Overstreet 2019-08-16  55  
59ba21d99fc7a19 Kent Overstreet 2021-04-28 @56  	if (le64_to_cpu(l.v->idx) + l.k->size != le64_to_cpu(r.v->idx))
59ba21d99fc7a19 Kent Overstreet 2021-04-28  57  		return false;
76426098e419c17 Kent Overstreet 2019-08-16  58  
76426098e419c17 Kent Overstreet 2019-08-16  59  	bch2_key_resize(l.k, l.k->size + r.k->size);
59ba21d99fc7a19 Kent Overstreet 2021-04-28  60  	return true;
76426098e419c17 Kent Overstreet 2019-08-16  61  }
76426098e419c17 Kent Overstreet 2019-08-16  62  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
