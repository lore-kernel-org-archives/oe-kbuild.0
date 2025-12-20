Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F838BA45
	for <oe-kbuild@lists.linux.dev>; Sat, 20 Dec 2025 15:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766243475; cv=none; b=NCPimNyih5crUOkrj7Ln6rHYjPNOTy4w+pwIK917uRTd3/mqao9MKg65I8ziK0yaCxALpGqMmIc7ECT2cRaqsLeA9qPM97KePWG+0DeeA8jjfsR7Z1Fl8IqjvKu/8BZZGYiG/GJAXesCL/KahQlIrVgcUEqE4bBL9BpQU28Hcuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766243475; c=relaxed/simple;
	bh=hUAYMwOgePju9Z3mrG5h9BivSq7tspHZG3jGh9SAWfU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SM+J4y2KOOfWH2vxPtMoYlzlHWxvMimBqwz0AjtZ9/16B6zSYRv0wTwftCOxO+n3ndaHseemYDn45yjcjqZaOCMSLOXMxGx9AqN0d2Qxmev7oayrdUAOcs9DMHiwPa6eyIKAVzK4nuKWb4Yf3fWAQ1lK4AyNRDlh+UNKF3MkKmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cMktpcy3; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cMktpcy3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766243474; x=1797779474;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hUAYMwOgePju9Z3mrG5h9BivSq7tspHZG3jGh9SAWfU=;
  b=cMktpcy3mIN7+KzTNvj7wSUXE4E8aABwSMEKq9OLABRLGxdC1QBbbCcv
   pKRvRCLNujmpimA8TOpLQpu2MI72mh0jHMaLDoMv2bso9psWbzkI3DgMm
   3P8OW9An3RQKw2kBNK+ReoSMDhm9nxqg4PpkU2VqZEvwjCoZqASqky0zZ
   PGFcIviAl1vSlOlURWU+82loDF87I110Pa3oqLNp4KAScllrnwJvd93eQ
   OIPMFKCBeCKrZasCRvI0KyB5R/gdBoXk5Vv3RjcNgKpThz+AFxBV5mTOT
   +0ilpyioyLZVS9ZEhqWkE3uyEXjRJ8WOL/2jy8hc/lPm0Rf9jlO5JPbkV
   Q==;
X-CSE-ConnectionGUID: uzfgUJl3QMmJUreCrQBVFw==
X-CSE-MsgGUID: olKhj1wKRn6qhXR5Zgtemw==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="85592497"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="85592497"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 07:11:13 -0800
X-CSE-ConnectionGUID: SbOQrhsrQ3K3HxoSr+SURQ==
X-CSE-MsgGUID: xz8jemmNSwSQIWTIwOy+sA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="229788605"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 20 Dec 2025 07:11:12 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWybu-000000004ij-0i67;
	Sat, 20 Dec 2025 15:11:10 +0000
Date: Sat, 20 Dec 2025 23:10:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 2/2] mm/damon/modules: introduce prdm module for DAMON
Message-ID: <202512202347.kADDHPlk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: mm/damon/modules/prdm.c:50:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20251215142057.588500-3-lienze@kylinos.cn>
References: <20251215142057.588500-3-lienze@kylinos.cn>
TO: Enze Li <lienze@kylinos.cn>
TO: sj@kernel.org
TO: akpm@linux-foundation.org
CC: damon@lists.linux.dev
CC: linux-mm@kvack.org
CC: enze.li@gmx.com
CC: Enze Li <lienze@kylinos.cn>

Hi Enze,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 8f0b4cce4481fb22653697cced8d0d04027cb1e8]

url:    https://github.com/intel-lab-lkp/linux/commits/Enze-Li/mm-damon-core-export-necessary-symbols/20251215-222347
base:   8f0b4cce4481fb22653697cced8d0d04027cb1e8
patch link:    https://lore.kernel.org/r/20251215142057.588500-3-lienze%40kylinos.cn
patch subject: [PATCH 2/2] mm/damon/modules: introduce prdm module for DAMON
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: m68k-randconfig-r132-20251218 (https://download.01.org/0day-ci/archive/20251220/202512202347.kADDHPlk-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251220/202512202347.kADDHPlk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512202347.kADDHPlk-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/damon/modules/prdm.c:50:1: sparse: sparse: bad integer constant expression
   mm/damon/modules/prdm.c:50:1: sparse: sparse: static assertion failed: "MODULE_INFO(parm, ...) contains embedded NUL byte"
   mm/damon/modules/prdm.c:62:1: sparse: sparse: bad integer constant expression
   mm/damon/modules/prdm.c:62:1: sparse: sparse: static assertion failed: "MODULE_INFO(parm, ...) contains embedded NUL byte"
   mm/damon/modules/prdm.c:252:1: sparse: sparse: bad integer constant expression
   mm/damon/modules/prdm.c:252:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
   mm/damon/modules/prdm.c:253:1: sparse: sparse: bad integer constant expression
   mm/damon/modules/prdm.c:253:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   mm/damon/modules/prdm.c:254:1: sparse: sparse: bad integer constant expression
   mm/damon/modules/prdm.c:254:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"

vim +50 mm/damon/modules/prdm.c

f5335de4846eb4 Enze Li 2025-12-15  47  
f5335de4846eb4 Enze Li 2025-12-15  48  static int target_pid __read_mostly;
f5335de4846eb4 Enze Li 2025-12-15  49  module_param_cb(target_pid, &target_pid_param_ops, &target_pid, 0600);
f5335de4846eb4 Enze Li 2025-12-15 @50  MODULE_PARM_DESC(target_pid, "Specifies the pids of the target processes to be monitored");
f5335de4846eb4 Enze Li 2025-12-15  51  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
