Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795638692;
	b=l91nOXAgVsfN6DIuo0Q1yJRXUCDX4eaKFot3XU0tmNUF8tbLx5YPsBa9VgQMNR6Noii9
	 IHe27kqI/DdhM7kDufoopAtouWb4wNDQnIN+M9RqUrSrZtSgkNfINoy5zFqEwHJf1NphO
	 tpSDTp0MMCan9HeXOkZIq07JvHiSiYSZL7o3/Q2PJzzfkS2SRZnkrPKTatUlbCGA2aTUn
	 TwHQ4dHGjaQFqtqg7GgwHc+c/I8Wd3e0Te7ZYHsf63p+wYeXyX9TAI5ygCIPugC6772Qh
	 fiuhQ252YUpGKmImlgO9ciD5Xb9h5ZoZO9Zf18r5vFpWEVhAAOrOT1XqAs76GRMvWbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795638692;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=JM5zY/JQBrZ1NwB16rdX/9hh4D/RrXLq0fLOZgk3Skg=;
	b=FISec0egpX7wv/zkgnPPi1EogkNFMHZ+EBKAyxaxWjFUUZwLnFC1IERRYRvsIOJXOBhs
	 MN9QoK7GOoFupF7e30gn7j2UF7D8iHZwlRLuBoSZYrOhju+IFtW7jcEy0R3ZdiQMqxsO5
	 9SWuUBD3sJxA5/ZndK4Se6zqMLXfHNOBY7vUrF1gsnZ+vlTMkeid1Xj57ledxJ84eGwyE
	 tKtGVe9r9k8UXcLuivHBBhocW2GDnQDbP0wLIfVgXEhdVIHkjXwN4lfCrJPYvtbHN4I3F
	 jJPHGdPiQlq+qzf4fBdAcQTh8yA5ELkvJFhzXAK9+eUJSb6LOn5j5g8uS1QbeNEgGXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WYNCxDpv;
	arc=none smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 679E6606A31E
	for <oe-kbuild@lists.linux.dev>; Wed, 25 Nov 2026 20:31:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 679E6606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WYNCxDpv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795638691; x=1827174691;
  h=date:from:to:cc:subject:message-id;
  bh=k2G9RYfquK9buTsHKpyQc2PIWCpLVo4OKfk5yt135D8=;
  b=WYNCxDpvXoYJnoNH4V4AyhcxNpRa4mu/ETz0uQZqQHFiQ1R8y+4me9Ij
   oyCCxJ6U0yA8vnxBkJcICX/WFyicc76ZnQ7plQwDahJ6Sa4vED4xPaoXV
   QznMTxos37FW5ZC5uHjJc2KA1ygm23v1nOlVQgMttmvsXUX9wxguPPGCO
   g4s8P7cE0qUaDFry2pPArT/6HBFBvKz9lbaPY/ZCMlz7H8CEKIluWnpTh
   iPbI7KwOE0BwjSgoi4ybi1uFXEE79l1kiXKveLGB9PHhHfThKoJm+u8dQ
   Tp6x43888AV1fC551+4lEimypl79oNEYk4lXTryOSfG+iM2RwZ8dKzXJi
   g==;
X-CSE-ConnectionGUID: y7/1z7rIScK2Y8d/U7NX0g==
X-CSE-MsgGUID: jJbcF3BqTJG2weoJfAJriQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4420380"
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="4420380"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 11:51:10 -0800
X-CSE-ConnectionGUID: rywOKHQiTFyau66aaVf/NQ==
X-CSE-MsgGUID: SISxZG/oSdW4OGxLVMwl+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="11741318"
Received: from igk-lkp-server01.igk.intel.com (HELO a03d4d989450) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 25 Nov 2026 11:51:04 -0800
Received: from kbuild by a03d4d989450 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xWJ1A-0000000004t-1JRD;
	Wed, 25 Nov 2026 19:51:00 +0000
Date: Wed, 25 Nov 2026 20:50:05 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [avpatel:riscv_trace_support_v6 86/115]
 drivers/firmware/riscv/riscv_sbi_sse.c:1254:6-8: ERROR: iterator variable
 bound on line 1253 cannot be NULL
Message-ID: <20261125204116.mb3P0YhW-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
CC: Anup Patel <anup@brainfault.org>

tree:   https://github.com/avpatel/linux.git riscv_trace_support_v6
head:   d77c0270e18de0b01434fec8027d8a61ae1f7c00
commit: 29ed8d1ae00a23790c311d96dc01fd8f2128cecc [86/115] riscv: Add functions to register ghes having SSE notification
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
config: riscv-randconfig-r2104-20261125 (https://download.01.org/0day-ci/archive/20261125/20261125204116.mb3P0YhW-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project a2bea097c8bf336f31f45e88e96f20d88e37ff5a)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/20261125204116.mb3P0YhW-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/firmware/riscv/riscv_sbi_sse.c:1254:6-8: ERROR: iterator variable bound on line 1253 cannot be NULL

vim +1254 drivers/firmware/riscv/riscv_sbi_sse.c

29ed8d1ae00a23 Himanshu Chauhan 2026-09-24  1247  
29ed8d1ae00a23 Himanshu Chauhan 2026-09-24  1248  static int sse_ghes_handler(u32 event_num, void *arg, struct pt_regs *regs)
29ed8d1ae00a23 Himanshu Chauhan 2026-09-24  1249  {
29ed8d1ae00a23 Himanshu Chauhan 2026-09-24  1250  	struct sse_ghes_event_data *ev_data = arg;
29ed8d1ae00a23 Himanshu Chauhan 2026-09-24  1251  	struct sse_ghes_callback *cb = NULL;
29ed8d1ae00a23 Himanshu Chauhan 2026-09-24  1252  
29ed8d1ae00a23 Himanshu Chauhan 2026-09-24 @1253  	list_for_each_entry(cb, &ev_data->callback_list, head) {
29ed8d1ae00a23 Himanshu Chauhan 2026-09-24 @1254  		if (cb && cb->ghes && cb->callback)
29ed8d1ae00a23 Himanshu Chauhan 2026-09-24  1255  			cb->callback(ev_data->event_num, cb->ghes, regs);
29ed8d1ae00a23 Himanshu Chauhan 2026-09-24  1256  	}
29ed8d1ae00a23 Himanshu Chauhan 2026-09-24  1257  
29ed8d1ae00a23 Himanshu Chauhan 2026-09-24  1258  	return 0;
29ed8d1ae00a23 Himanshu Chauhan 2026-09-24  1259  }
29ed8d1ae00a23 Himanshu Chauhan 2026-09-24  1260  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
