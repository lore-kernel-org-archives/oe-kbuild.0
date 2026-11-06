Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793924136;
	b=Rt38RKMrbegVrhpJ9KganLX2dMH2St3yol5Zzuj9ljVBCA1uPoS4oxiXg87dd823kVbg
	 7TJ3lD44OFYSlCRQUplHTbb5+TqcnYh4NU143ZrmhL3OXdJUuN5nYIhKMcZ9MhMqbBahb
	 VTPcALOQTwH6qLOUnySLjbvdyLjQsun4G86jUw6v4D/rb+d0GLGb9SmzVW1UqP7cGqKj2
	 5oivX6z0hBdb7Dt9hRrytivNG/tKgSKXn/IjF5dnMDQfaXqa2mrXS4HA4w9XMbBtr5V2S
	 oRtM8pKBQ/RKMTlupU55ArZ0AxlKPxB98ZGW1PBYJVXHiX0XlrlN8C671FZSogwazbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793924136;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=RqkRMg84tCOAxWgRIiyr/yvRNLxmKypM9SVMCRSUrXo=;
	b=2xFSpk5bfrrdg6WjFyRtspoC/sN4ENe+huOQaQJcLwWvE+nK+mg7nuk2iW8blMzxZYbo
	 2WjQltYlen0RrQIfr1+qzm4PAD1/Ha2YAphpvZasUyKKc0G0W/JotKPHTHy15R1bTN8VY
	 FYQoXpf+VOgbLCCY+2TQDsXv/W44u5e4Vm1iSr9ZGvwNX72h8tCWVU8UDB2ak3NJ9RZHF
	 CD/EsuFdJVzVEz5puP/CBpSDuML2CF7CufpURIiIi3SvdT2ruTLYt6kqDYmA+/b1B4ixK
	 0N1ESaLxhnctg0epECSi3aFR4FZ9faqfTepWqMCC3Icptm+r23xfcUHXwsJkG1ObnwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ge24tQD6;
	arc=none smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97F7D606A31B
	for <oe-kbuild@lists.linux.dev>; Fri,  6 Nov 2026 00:15:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97F7D606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ge24tQD6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793924134; x=1825460134;
  h=date:from:to:cc:subject:message-id;
  bh=WJtNQe7QtrTYaqcbJhNtVrvEw5vRcNAM7x1e1XUfqWE=;
  b=Ge24tQD6F9Of5vqDNhpiXtenDdlMSSfz+Rwd9ELoIRN/WIxT+lIW9UMH
   P47L387PRkxiuQLUvpKpHgQYa2dpWOsRrgjA62rtCB+fLl5pAsqDNeEms
   244mFn27xvBHSpQ0ZUbqafpse6wySkA0TBouIL3DFYoa3IGF8cnKhOSc/
   CJSCkc5j4tSyDoQZpbILJ9ycPywtFnZszJpSazNMsskhPI1O6RF3iWIVr
   P3ItUNl9N94SfKXP4Ng7YdhAgcYbZCiycLwHQjTYpwkVpLTbWbaEfgKL3
   CnuXS4irdCW0yO6C7h9gFWr5U/OntEISqTc00sEsto7JTR34jObC6Qli/
   Q==;
X-CSE-ConnectionGUID: 2WZ47zV4SpGjC1jDOqsS4g==
X-CSE-MsgGUID: VG2VUVpXTbSjfm6pur92Fg==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2618935"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2618935"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 16:15:33 -0800
X-CSE-ConnectionGUID: FOwd0E+aSFW5aOU6lh4urg==
X-CSE-MsgGUID: MMX5E+gvRC+h6zkaBQGBHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7131488"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 05 Nov 2026 16:15:32 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xP7cA-000000009ut-0R6D;
	Fri, 06 Nov 2026 00:15:30 +0000
Date: Fri, 06 Nov 2026 01:15:14 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [avpatel:riscv_acpi_apei_v5 51/55]
 drivers/firmware/riscv/riscv_sbi_sse.c:1253 sse_ghes_handler() error: we
 previously assumed 'cb' could be null (see line 1254)
Message-ID: <202611060143.FmE9sikJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
CC: Anup Patel <anup@brainfault.org>

tree:   https://github.com/avpatel/linux.git riscv_acpi_apei_v5
head:   14cf6b25f78f759a54f0f4b4c2a62b8de4d67549
commit: 08384c64ea14c3dc8f269ae07c9ac14f339b5d7c [51/55] riscv: Add functions to register ghes having SSE notification
:::::: branch date: 20 hours ago
:::::: commit date: 20 hours ago
config: riscv-randconfig-2200-20261105 (https://download.01.org/0day-ci/archive/20261106/202611060143.FmE9sikJ-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project d7303edbc6496e00558bf44850d63a99fc376c92)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202611060143.FmE9sikJ-lkp@intel.com/

smatch warnings:
drivers/firmware/riscv/riscv_sbi_sse.c:1253 sse_ghes_handler() error: we previously assumed 'cb' could be null (see line 1254)

vim +/cb +1253 drivers/firmware/riscv/riscv_sbi_sse.c

08384c64ea14c3 Himanshu Chauhan 2026-09-24  1247  
08384c64ea14c3 Himanshu Chauhan 2026-09-24  1248  static int sse_ghes_handler(u32 event_num, void *arg, struct pt_regs *regs)
08384c64ea14c3 Himanshu Chauhan 2026-09-24  1249  {
08384c64ea14c3 Himanshu Chauhan 2026-09-24  1250  	struct sse_ghes_event_data *ev_data = arg;
08384c64ea14c3 Himanshu Chauhan 2026-09-24  1251  	struct sse_ghes_callback *cb = NULL;
08384c64ea14c3 Himanshu Chauhan 2026-09-24  1252  
08384c64ea14c3 Himanshu Chauhan 2026-09-24 @1253  	list_for_each_entry(cb, &ev_data->callback_list, head) {
08384c64ea14c3 Himanshu Chauhan 2026-09-24 @1254  		if (cb && cb->ghes && cb->callback)
08384c64ea14c3 Himanshu Chauhan 2026-09-24  1255  			cb->callback(ev_data->event_num, cb->ghes, regs);
08384c64ea14c3 Himanshu Chauhan 2026-09-24  1256  	}
08384c64ea14c3 Himanshu Chauhan 2026-09-24  1257  
08384c64ea14c3 Himanshu Chauhan 2026-09-24  1258  	return 0;
08384c64ea14c3 Himanshu Chauhan 2026-09-24  1259  }
08384c64ea14c3 Himanshu Chauhan 2026-09-24  1260  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
