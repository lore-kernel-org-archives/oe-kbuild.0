Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F21EA3CB2E5
	for <oe-kbuild@lists.linux.dev>; Mon, 18 May 2026 06:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779085387; cv=none; b=FMDc+irjS8+O0OrPsoILt3ZSyWSJnjmVtn6FlKlLxa1ZBumfOlb37/0+bWQqJdSWj35y5h/a/RRafQ/E457uo4q/WsY/pKI3zcmHbsPXrNjoP/IJNonMjpGhB6hXyu9RpRmjQHFWO0oP92jMWOdt4owQOBwgcpWqJLpUk+eIx1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779085387; c=relaxed/simple;
	bh=ld3Mir59V8pSjhyIrQhcXCF3dvg6KoefO61tJKuY4z8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jkdpQMxGXUC1Go2jfEWI8WEf0yk5kL2wi/hnowMrpYEKQaCc8xWEfJzSQkVJG+XMQc8KUUBAcBbSMsQETV9sjbchU/7iCycJ043oxSLO8T8S5U2SzHHuhaa5G5U+9T9m59DfRIr2FpV8GQRjDhiGAA8yWP1tWqVNzFoYmqd9qE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BYvB1dsy; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BYvB1dsy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779085383; x=1810621383;
  h=date:from:to:cc:subject:message-id;
  bh=ld3Mir59V8pSjhyIrQhcXCF3dvg6KoefO61tJKuY4z8=;
  b=BYvB1dsyGGv4HQLnvrhjBewVYF9zZzLfJW7n4r8SKDODH4sCIk3ahet4
   9vpjSl0tqaWfaTaXjVtPDycHIS24AK5m8B1z4V/Hp9REDT9bQFAa1STdh
   E2GPncQBl90iQuNmhhVT9JdEsbZCNj9lBNVEMbI7murk5xVfZ7oVHACmx
   UBe6L67IfCb8IwXW236ecYfoMznYxzObmQB29hA5oPLTH86T1zkeQjtZ2
   uRKYX2ftoylVil4ggDuQCsRJDy/4eqa9MR23589UGRJQhfydNslsxSfjP
   aHrKHbgpLTqh9IZaP1LijHVElLMydhj0MY3qYFfKU/6nBwUi4QgTPDVWl
   g==;
X-CSE-ConnectionGUID: 6OFwkZxwQ3iuRPBLdUVKbg==
X-CSE-MsgGUID: GBPJz6lwSWqc0VNphZ+S+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11789"; a="83784479"
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; 
   d="scan'208";a="83784479"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2026 23:23:01 -0700
X-CSE-ConnectionGUID: x0bWuREGQPKCfo0Tyl5pvw==
X-CSE-MsgGUID: CGIi0mPVSzaYk3Hl6RhGTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; 
   d="scan'208";a="243618239"
Received: from lkp-server01.sh.intel.com (HELO d94e5e629b2d) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 17 May 2026 23:23:00 -0700
Received: from kbuild by d94e5e629b2d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wOrNR-000000002QA-30qD;
	Mon, 18 May 2026 06:22:57 +0000
Date: Mon, 18 May 2026 14:22:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/x86/events/intel/uncore.c:895:52: warning: '%s'
 directive writing between 1 and 2147483645 bytes into a region of size 25
Message-ID: <202605181437.anqc5ask-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/Nathan-Chancellor/kbuild-Bump-minimum-version-of-LLVM-for-building-the-kernel-to-17-0-1/20260518-071448, commit: efe6a2a0073c5db6aaa2d79dd68bde98dc335112"
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Nathan Chancellor <nathan@kernel.org>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Nathan-Chancellor/kbuild-Bump-minimum-version-of-LLVM-for-building-the-kernel-to-17-0-1/20260518-071448
head:   5b11b4afdc532a7c1d022b5f572c17428b613f0f
commit: efe6a2a0073c5db6aaa2d79dd68bde98dc335112 x86/build: Drop unnecessary '-ffreestanding' addition to KBUILD_CFLAGS
date:   7 hours ago
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
config: i386-randconfig-141 (https://download.01.org/0day-ci/archive/20260518/202605181437.anqc5ask-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9185-gbcc58b9c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260518/202605181437.anqc5ask-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605181437.anqc5ask-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/events/intel/uncore.c: In function 'uncore_get_pmu_name':
>> arch/x86/events/intel/uncore.c:895:52: warning: '%s' directive writing between 1 and 2147483645 bytes into a region of size 25 [-Wformat-overflow=]
     895 |                         sprintf(pmu->name, "uncore_%s", type->name);
         |                                                    ^~
   arch/x86/events/intel/uncore.c:895:25: note: 'sprintf' output between 9 and 2147483653 bytes into a destination of size 32
     895 |                         sprintf(pmu->name, "uncore_%s", type->name);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +895 arch/x86/events/intel/uncore.c

8053f2d752e293 Kan Liang 2021-06-30  879  
d6c754130435ab Kan Liang 2021-03-17  880  static void uncore_get_pmu_name(struct intel_uncore_pmu *pmu)
d6c754130435ab Kan Liang 2021-03-17  881  {
d6c754130435ab Kan Liang 2021-03-17  882  	struct intel_uncore_type *type = pmu->type;
d6c754130435ab Kan Liang 2021-03-17  883  
d6c754130435ab Kan Liang 2021-03-17  884  	/*
d6c754130435ab Kan Liang 2021-03-17  885  	 * No uncore block name in discovery table.
d6c754130435ab Kan Liang 2021-03-17  886  	 * Use uncore_type_&typeid_&boxid as name.
d6c754130435ab Kan Liang 2021-03-17  887  	 */
d6c754130435ab Kan Liang 2021-03-17  888  	if (!type->name) {
8053f2d752e293 Kan Liang 2021-06-30  889  		uncore_get_alias_name(pmu->name, pmu);
d6c754130435ab Kan Liang 2021-03-17  890  		return;
d6c754130435ab Kan Liang 2021-03-17  891  	}
d6c754130435ab Kan Liang 2021-03-17  892  
d6c754130435ab Kan Liang 2021-03-17  893  	if (type->num_boxes == 1) {
d6c754130435ab Kan Liang 2021-03-17  894  		if (strlen(type->name) > 0)
d6c754130435ab Kan Liang 2021-03-17 @895  			sprintf(pmu->name, "uncore_%s", type->name);
d6c754130435ab Kan Liang 2021-03-17  896  		else
d6c754130435ab Kan Liang 2021-03-17  897  			sprintf(pmu->name, "uncore");
c54c53d9921ade Kan Liang 2021-06-30  898  	} else {
c54c53d9921ade Kan Liang 2021-06-30  899  		/*
c54c53d9921ade Kan Liang 2021-06-30  900  		 * Use the box ID from the discovery table if applicable.
c54c53d9921ade Kan Liang 2021-06-30  901  		 */
c54c53d9921ade Kan Liang 2021-06-30  902  		sprintf(pmu->name, "uncore_%s_%d", type->name,
3af548f2361077 Kan Liang 2023-01-12  903  			uncore_get_box_id(type, pmu));
c54c53d9921ade Kan Liang 2021-06-30  904  	}
d6c754130435ab Kan Liang 2021-03-17  905  }
d6c754130435ab Kan Liang 2021-03-17  906  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
