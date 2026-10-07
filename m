Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B09D73B9618
	for <oe-kbuild@lists.linux.dev>; Wed,  7 Oct 2026 16:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791389916; cv=none; b=TDjIcJPvYg5xnaIPWLD14PAG0FwBZydYXhOUf6USGxJx+zEOgEh8NlOnYwCizL4yCByOqleC+A4BTSXyX9IyUTZ1BrxddxAD7Pu9MNppPHlMa6GW+9dye0KdS/I2jHQD4cnxqQcclIav0F9gvgJfl2DRjFajR90o5TbPbyf31+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791389916; c=relaxed/simple;
	bh=JeonHb56K0NqXgVMigOUSjHhj/tokLx1WKNyyTXsmy0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ouNNPBKdjitKo8zjXQZ7f5caop8/4UugGKivAy6E3lMTva8a+Q2a8gq/8xjxeCSr2t0KMoKR8T2XCe0En69My2E36hOkiLq804687eI11oJksAeVrg5DA1yh9JLKcWA190Vj2CiZBdnT0dfOIWr78emHQgiC6gqvXe4J5hykUj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HghZHQt8; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HghZHQt8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791389914; x=1822925914;
  h=date:from:to:cc:subject:message-id;
  bh=JeonHb56K0NqXgVMigOUSjHhj/tokLx1WKNyyTXsmy0=;
  b=HghZHQt8mlD0Je3/OVxsEI0jivzzzNIM5jDLwBCHKjPnlXkMh1zuVNre
   07F/0Iy0diA75VNJStnQlB7mZ/zq7Ah4kt+6xDfqG9z5kfqXh6vDrIYNX
   g79ildNoqA26HwLDcw0cF86wHpxgnFNy3Psq5reHm58XEyXtUmLRTPQEB
   gV9C5/cV+K1i7RaCujfAHPuMjpq2gLZSjERnLlmoLOYAVZw8FSL1IDM2B
   eiRNCtUpNLt9O9sy6kp5NPkvx077CiK4bW6sUXTVghkKA7HYrqb8PpK/X
   GV5MyPqFMWV3Gwf7+K2cNMiaxqy8A4qupgHkDxQ38HxqaicZD1sAoJiGb
   Q==;
X-CSE-ConnectionGUID: OfrsvWWxTX6PRK2ySqEcTw==
X-CSE-MsgGUID: t4YiTBwqSi+Qf+ii6aPnpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="161936"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="161936"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 09:18:34 -0700
X-CSE-ConnectionGUID: sKPlVAuVSNa76edC4yw32w==
X-CSE-MsgGUID: w7uznulURAmuqEItQ7ckEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="285575747"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 07 Oct 2026 09:18:33 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xEULf-000000003bj-28r3;
	Wed, 07 Oct 2026 16:18:31 +0000
Date: Wed, 07 Oct 2026 18:18:01 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Error: failed to load BTF from vmlinux.unstripped: No data
 available
Message-ID: <202610071800.1GjXnbR9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Jay Wang <wanjay@amazon.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Jay-Wang/bpf-pass-the-vmlinux-BTF-to-btf_parse_module-and-let-it-adopt-the-data/20261001-225203
head:   cd8e398af7bb2a5c3d30c3409db280b73d23047d
commit: 974f6536dd081d120bd276dcd1ff24e304cc9d32 tools, samples: take the vmlinux BTF from vmlinux.unstripped first
date:   6 days ago
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: s390-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20261007/202610071800.1GjXnbR9-lkp@intel.com/config)
compiler: s390x-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261007/202610071800.1GjXnbR9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610071800.1GjXnbR9-lkp@intel.com/

All errors (new ones prefixed by >>):

   libbpf: failed to find '.BTF' ELF section in vmlinux.unstripped
>> Error: failed to load BTF from vmlinux.unstripped: No data available

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
