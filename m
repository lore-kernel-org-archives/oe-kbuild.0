Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E7243A254D
	for <oe-kbuild@lists.linux.dev>; Thu, 30 Jul 2026 22:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785451086; cv=none; b=ZXJgsp5gsHyFeU5V7EQgQNR1xKfX87rjBaT92XCOuyCP4BbPiX18Ro1jjmQDqc1Gehxrs5Xke4H2RmL13bkwN2XIk1l7zd5ckHUJf4DbWGr1zk3kIA9reggQI2DAwWJFa8Hyk65wbUoeP0eJ8qB33RwRr+V6YqBHokmnqpF/vTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785451086; c=relaxed/simple;
	bh=n2qSnI80+eYy8+dJiyt2nZ+GKXtdIV6HrCYvlR3W01w=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PPkhFlkCVrmvv5yJoE/zxTpAKZIxdz7MDhWgY/gzrsW/XWNappvCHdCxUxXCEIcxcTt6k8W400uS2qnobHJ1SNxnpNDgEz49pF9bTg/riRdk/IpbiJTBu4PeZmF9OS5Gch1VIvjWnT50LqkJQGip6tG9eJRkHw261CI2zUal1JY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dKTXDGOi; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dKTXDGOi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785451084; x=1816987084;
  h=date:from:to:cc:subject:message-id;
  bh=n2qSnI80+eYy8+dJiyt2nZ+GKXtdIV6HrCYvlR3W01w=;
  b=dKTXDGOiX6bdCEMoycWgctH/KXeJiat8ckfvmB79a8/6QoWn1dI/+Y6r
   rIFd703TJpChmpJYw2Uco9ONJbE8xO/FXShQ4DvA/wiNGR8ASU+04GabH
   pRMNG5vARj+KXLP/c04Nrj4OkgWqNS/cnawrP4KmYXBA23EYz3kufFruN
   4aCdrVUJVmeVHysdjgFx4OSQarkyTfTUSxdET0OdOmZW+kXdEAvNCK0hH
   rCe1LIsqFkTMSPJirn0eo/jev5Z+f2l6ngFLGvbfSYQ+i2x/bSkLIWJWX
   VQKuqQW17D/EHTVqhO9lgvj4x8A0pP3M196GJw25FDbPLed0TEHRJ+wgP
   A==;
X-CSE-ConnectionGUID: ylLfN/1fTQeTjzegXxozFg==
X-CSE-MsgGUID: VlEF2u43SZyTsVmDWqMWjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="86196795"
X-IronPort-AV: E=Sophos;i="6.25,195,1779174000"; 
   d="scan'208";a="86196795"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 15:38:03 -0700
X-CSE-ConnectionGUID: qNxWLaz7TdmwNYNPsejwJg==
X-CSE-MsgGUID: WWMQJeBeTCCt1Xom3SEnvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,195,1779174000"; 
   d="scan'208";a="258631779"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 30 Jul 2026 15:38:03 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wpZO4-00000000hfL-2CYh;
	Thu, 30 Jul 2026 22:38:00 +0000
Date: Fri, 31 Jul 2026 06:37:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [mcgrof:blk-iobuf-pool-v5 1/9] block/blk-iobuf.c:243:14-15:
 WARNING opportunity for max()
Message-ID: <202607310636.GltsKrwJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Luis Chamberlain <mcgrof@do-not-panic.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git blk-iobuf-pool-v5
head:   de80bacbf04a137715357b6a2948d9f29a18d990
commit: 418f01253da9a31b8c48acfca9942a812392f1d1 [1/9] block: add a bounded refcounted iobuf folio pool
:::::: branch date: 9 days ago
:::::: commit date: 9 days ago
config: x86_64-randconfig-101-20260731 (https://download.01.org/0day-ci/archive/20260731/202607310636.GltsKrwJ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202607310636.GltsKrwJ-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> block/blk-iobuf.c:243:14-15: WARNING opportunity for max()

vim +243 block/blk-iobuf.c

418f01253da9a31 Luis Chamberlain 2026-07-21  238  
418f01253da9a31 Luis Chamberlain 2026-07-21  239  unsigned int blk_iobuf_pool_available(const struct blk_iobuf_pool *pool)
418f01253da9a31 Luis Chamberlain 2026-07-21  240  {
418f01253da9a31 Luis Chamberlain 2026-07-21  241  	int avail = (int)pool->capacity - atomic_read(&pool->in_use);
418f01253da9a31 Luis Chamberlain 2026-07-21  242  
418f01253da9a31 Luis Chamberlain 2026-07-21 @243  	return avail > 0 ? avail : 0;
418f01253da9a31 Luis Chamberlain 2026-07-21  244  }
418f01253da9a31 Luis Chamberlain 2026-07-21  245  EXPORT_SYMBOL_GPL(blk_iobuf_pool_available);
418f01253da9a31 Luis Chamberlain 2026-07-21  246  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
