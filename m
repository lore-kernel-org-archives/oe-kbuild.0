Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793108054;
	b=gyMQZA2VESynE66LrhX+Favf/N+RlwQh0uYA7Wly1mYiS1qbBuA0wHw/38QsUpbiM9pg
	 HUsmjX+SfofgRkAE88p2bOJnx2FQznLcKrmSsUhYcmu8VXLHfhiD+cmj5Er0zkIZpMcj5
	 MrSUfnJkoD/nNbgGifsJrvE3r3aFUYX/oduWw3JY5m5KKRRP4G7U5bY7WMUYBhOrtejx1
	 2KQn0z8W5MGHdKOAOr4f46vkt7KoKo1IpH991R3pCcEtcXt8G2g1vqWPMgah0icKNyynt
	 PmgRqsEJcJkLWJqOMthfzsDwl3f8OmB7wn91CIjVjVgMC/clv+j7H1tQhzDRoEMs7KQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793108054;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=yAfz3qFXfjcF2R7m+u3Ghy51mmvzFtYk+a16iF9y+xU=;
	b=PKta1rEgnIf4APmXfEI3uMmuu+cFpu0MUxqWJ8l+mnBsq/Ll3PCUt3Hqt9xHcni3qiqz
	 uf3PjaVWs40HwSWK+cFjyASkl7+F21rxGhdDeYPmZqNOF3Eo4tLoSefSRQRmu/n8xhFXJ
	 ZOUFGwRMXFqTvWbfu+Aa7CHvslug/zH2n0gVzui2h81bTtnbuO/Vbx/WHy1VBPxrPk2ay
	 PgzhJFXx+OR/2ntJVjxxMdUFCjX/NYwcfR/ZAp9BVz+sKbndPxrxdeHbqschVpmrurLvC
	 ff43VVLeSeQ58cZ6DWlGGT/JZ/24c0BFzYLVhOAi4PT/j/rK5zFRNi+FDm8yBet19TA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SCiH6gzQ;
	arc=none smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62973606A320
	for <oe-kbuild@lists.linux.dev>; Tue, 27 Oct 2026 13:34:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62973606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SCiH6gzQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793108053; x=1824644053;
  h=date:from:to:cc:subject:message-id;
  bh=MnBscRdhpkGLxQECSQvDElN4+0QrW9D5Om7ASeVRJhA=;
  b=SCiH6gzQJ26oQs1sPC9b6DLzfZ/DQOYZ3qCExkONXJwHHQ/DSOvlobqL
   Si1ASw/yblZTYNydJ5DhA+Au5+i06yO3+oVWyx9SEdwBzBnrNE3fQXV//
   yAAoMzEMTCDQCQtxkSbR7TxGsmYQ2HATXMAPhkd243Q59WT7bsFKtN0HT
   WfAQCIEvT+yZVtekmSYduy9Lz4DQrvih4HihGfsiLbvpo/IrYf+C6IiJ6
   2WkvDoOLuQOD3S/+JG4loeoqhyu/o3HTmvOJB10e4x7QV+uRtR7YfdoWF
   EW29+YeIOj68PyBJ+604yl7iJHBiI9qUIct/Uv4LvF8ngkWMHB783O1YU
   w==;
X-CSE-ConnectionGUID: zszBrO9lTPOei5CtqAQ2Kg==
X-CSE-MsgGUID: ChFqj8xFRyGksPG40RSe/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1688738"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1688738"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 06:34:09 -0700
X-CSE-ConnectionGUID: PZEhfmuhQiOaa/Z4mapIAg==
X-CSE-MsgGUID: rQCF/3v4QneAEMBvkHi4EA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="6306801"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa012.fm.intel.com with ESMTP; 27 Oct 2026 06:34:08 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xLhJV-000000004Wl-30sP;
	Tue, 27 Oct 2026 13:34:05 +0000
Date: Tue, 27 Oct 2026 14:34:03 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [anolis-intel-cloud:devel-6.6 608/608]
 test_cpu_identity.c:943:62: warning: 'snprintf' output may be truncated
 before the last format character
Message-ID: <202610271410.C9nNa1fN-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: aubrey.li@linux.intel.com

Hi Cruz,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   e8129feece4324195ea94555f0d752df963558bf
commit: fdeec2f4f3f7d414eb7b9cf11360e7268bed1615 [608/608] anolis: tools/selftest: add cpu identity coverage
:::::: branch date: 27 hours ago
:::::: commit date: 5 months ago
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20261027/202610271410.C9nNa1fN-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261027/202610271410.C9nNa1fN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610271410.C9nNa1fN-lkp@intel.com/

All warnings (new ones prefixed by >>):

   test_cpu_identity.c: In function 'test_identity_hierarchy_counts':
>> test_cpu_identity.c:943:62: warning: 'snprintf' output may be truncated before the last format character [-Wformat-truncation=]
     943 |         snprintf(expeller_path, sizeof(expeller_path), "%s/%s", parent_path,
         |                                                              ^
   test_cpu_identity.c:943:9: note: 'snprintf' output 2 or more bytes (assuming 4097) into a destination of size 4096
     943 |         snprintf(expeller_path, sizeof(expeller_path), "%s/%s", parent_path,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     944 |                  strrchr(expeller, '/') + 1);
         |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   test_cpu_identity.c:945:62: warning: 'snprintf' output may be truncated before the last format character [-Wformat-truncation=]
     945 |         snprintf(expellee_path, sizeof(expellee_path), "%s/%s", parent_path,
         |                                                              ^
   test_cpu_identity.c:945:9: note: 'snprintf' output 2 or more bytes (assuming 4097) into a destination of size 4096
     945 |         snprintf(expellee_path, sizeof(expellee_path), "%s/%s", parent_path,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     946 |                  strrchr(expellee, '/') + 1);
         |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   test_cpu_identity.c: In function 'run_multi_child_parent_throttle_pressure':
>> test_cpu_identity.c:1555:76: warning: '/' directive output may be truncated writing 1 byte into a region of size between 0 and 4095 [-Wformat-truncation=]
    1555 |         snprintf(throttle_parent_path, sizeof(throttle_parent_path), "%s/%s/%s",
         |                                                                            ^
   test_cpu_identity.c:1555:9: note: 'snprintf' output 3 or more bytes (assuming 4098) into a destination of size 4096
    1555 |         snprintf(throttle_parent_path, sizeof(throttle_parent_path), "%s/%s/%s",
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1556 |                  parent_path, strrchr(normal, '/') + 1, strrchr(throttle_parent, '/') + 1);
         |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   test_cpu_identity.c:1558:72: warning: 'snprintf' output may be truncated before the last format character [-Wformat-truncation=]
    1558 |                 snprintf(child_paths[i], sizeof(child_paths[i]), "%s/%s",
         |                                                                        ^
   test_cpu_identity.c:1558:17: note: 'snprintf' output 2 or more bytes (assuming 4097) into a destination of size 4096
    1558 |                 snprintf(child_paths[i], sizeof(child_paths[i]), "%s/%s",
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1559 |                          throttle_parent_path, strrchr(children[i], '/') + 1);
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
