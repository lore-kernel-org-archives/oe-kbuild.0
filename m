Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B0ADBE68
	for <oe-kbuild@lists.linux.dev>; Sat, 18 May 2024 07:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716017406; cv=none; b=ds9+eI6Fd/QdTX0axVfBW9dX91maAczHohwBQs25VSGQQsurZy10f39z+qH6HbnCSxUQUXpD3iD7bqQxnnDAMe5aZ4NE8dNa6qRJQOWrQYnMNDvDBjUYE54uWRVhZH5KMpXbaIqFNW2jUvYFDEearXttigf2h8pnKMVQRouhwNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716017406; c=relaxed/simple;
	bh=+4zpGIiDPFSL9KV67jL+/tuuhrzXEoIRibSkPC/2yso=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=StkcltqUnrBFm84F3Dpq+j02UnLcp+saaNfQS3riJj44HMHJ63IqlFB1B3Y7gQ6pn+ml+zGTJBhzuwsrzOLVEEbznEvvVRXdVhJSn29wETT3disN654zccIAwoEWkvisY9a58rWESG2rfg0GkP41+TYSfTkUttn3cqtYQrQrWYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nsJSk804; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nsJSk804"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716017404; x=1747553404;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+4zpGIiDPFSL9KV67jL+/tuuhrzXEoIRibSkPC/2yso=;
  b=nsJSk804R1g2T8yKxa1NLUZEbXvu2FRqdwpcoBBDfAMSn3HZ5aeN9jns
   nZzoFOflwrWNloq2lncJ+x9mAqK3i8SRnuzvchcTuXJ7afIznYaCtZlZd
   RzQxznZ6zVYYiMeAqIDxhCo1lJQIfVEGqnPjfmxPOtV+vV0qxK11+wt9a
   54lQHB0XN9lP9W/4W0QpvapsEP/gdCtKh12k5F345ahn2NpBIiOovu4kX
   /5V5rfOLDXeF3UhMmMw2RlPY1UfjpVyv8wWetlb7XoAaneC7tbVtAdtOW
   DfEaXUf35FwWrWEcyY6JS/tLilqLjJ/csp6FR3vKd4jl0DjLg364AC+PA
   A==;
X-CSE-ConnectionGUID: HglI4/E4QMmi7kJeHC9wyw==
X-CSE-MsgGUID: jjb/V/hRSyyf+hvCyiBbcQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11075"; a="22880866"
X-IronPort-AV: E=Sophos;i="6.08,170,1712646000"; 
   d="scan'208";a="22880866"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2024 00:30:04 -0700
X-CSE-ConnectionGUID: lmW+ph9ST7KhQPJfueZJYg==
X-CSE-MsgGUID: mkm7vH+PTMOqSvEKUyA7sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,170,1712646000"; 
   d="scan'208";a="31865236"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 18 May 2024 00:30:02 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s8EW0-0001jo-19;
	Sat, 18 May 2024 07:30:00 +0000
Date: Sat, 18 May 2024 15:29:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [intel-tdx:tdx_kvm_dev-2024-05-14-mmu-prep-1 22/115]
 x86_64/apic_bus_clock_test.c:23:9: warning: '_GNU_SOURCE' macro redefined
Message-ID: <202405181535.WFKy4EwQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Isaku Yamahata <isaku.yamahata@intel.com>
CC: Rick Edgecombe <rick.p.edgecombe@intel.com>
CC: Maxim Levitsky <mlevitsk@redhat.com>
CC: Reinette Chatre <reinette.chatre@intel.com>

tree:   https://github.com/intel/tdx.git tdx_kvm_dev-2024-05-14-mmu-prep-1
head:   076b4da9ea74a0b778ae01a05c3a36b8d8e1fda3
commit: 6ca346be0a271c01e0b0847cb9ed4ca90aecffac [22/115] KVM: selftests: Add test for configure of x86 APIC bus frequency
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240518/202405181535.WFKy4EwQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202405181535.WFKy4EwQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> x86_64/apic_bus_clock_test.c:23:9: warning: '_GNU_SOURCE' macro redefined [-Wmacro-redefined]
      23 | #define _GNU_SOURCE /* for program_invocation_short_name */
         |         ^
   <command line>:2:9: note: previous definition is here
       2 | #define _GNU_SOURCE 1
         |         ^
   1 warning generated.


vim +/_GNU_SOURCE +23 tools/testing/selftests/kvm/x86_64/apic_bus_clock_test.c

6ca346be0a271c Isaku Yamahata 2024-05-06 @23  #define _GNU_SOURCE /* for program_invocation_short_name */
6ca346be0a271c Isaku Yamahata 2024-05-06  24  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
