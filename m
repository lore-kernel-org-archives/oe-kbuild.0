Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795204720;
	b=srTHyFYtlXdktYsR3NUq7l668C3va8sD/actEhMwEHcg79ep+Gy2s9AcUUjO9bLSmcGr
	 fmvF7dzRGshhu+alAM4XYuB2HyNKEEndyVsTugrktV6Gti7+p25tkZ6qz0F+gjWVQYb0Q
	 +wWqqIO+7eg5GMGvV1RJKBZe6k/eg6vw9qJUp8/podq8IE2zixtb1wj63PMwWqBOUagZv
	 DoKe97lO72Onz/8ua7EgG+pJnH/fntx28zjWB5q/ow4aJaq8HZrYw/9/be72kyH7+EbeQ
	 49hayUFUoxHSCqFqtEBdPTo+2zBbJQj7kg27LkOlLZMKGEPqBAsKfcVRxhTmwqKbAGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795204720;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=/5CKuK6m2YUokj9HvmpyLi2YuDq38tsEyE836scuEq0=;
	b=U5xyf716bbcRwzQkgRwplLkoTYNYooWTvpaQWkH/3x2/iedWcPlF4Cn4hvuUmysRZaEX
	 61hs3MaRqiCkaNAQ7zqdyHi4wqnWjb0SI+/uB86aoyLwGvU19/81MqHs5UMYevUkFEAo4
	 GjJjthupPKQtQ15FoepYyQinkyvs16lQP10f1X34uvVTVfDT09QInoarwZQyK02tQGcMk
	 dQtv20ymrWNO3PwaCR+GzQPPGslbFOsjzQhSDegVKEXfGRL7WHmgXqvtq8Q7upVGZD5bw
	 fjd2BZapc1i2Dd8pZj+hWrJ3m9Jp5IH3hhmTip+XgoT3RdsqFj034tV8svCwIp9kpNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=flNeBAfI;
	arc=none smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CAB2606A6D9
	for <oe-kbuild@lists.linux.dev>; Fri, 20 Nov 2026 19:58:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5CAB2606A6D9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=flNeBAfI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795204710; x=1826740710;
  h=date:from:to:cc:subject:message-id;
  bh=NTIlR8r+sxE+VYzsoVvIYVYi0xJwCUsGhj4BJ2avGCU=;
  b=flNeBAfIMFmgHrGbpLGML5pIuRUkw/oDbc4zcyqXn9is1m3ZkbxRNeo4
   U6arYG1/lUX1G8VKtMQiobgr4BImDFhoMGEXnV5PuHw0Yu2o3jdqHn+tV
   /S1xYtb3gzh17gXzM9/IP3G8/ViPZ2L/+X7tUjJePXVQeEz7tA5LQ35FJ
   2tBn40PZ+dpznbGKBy/MQbTWu1Dmc44JisGdsU/tx1cnBb4X3pwjN7uI0
   39jXsFgPfovlLzsZ5veus7a2Iq255cTrfbxn2Kn2tdNU9xBUgNoVIv2H4
   7ZkYLjnyFP9McZgtORFCJhCAT1IP85oSD6mR5uPvCriv3mLl6e/9Ghbbw
   A==;
X-CSE-ConnectionGUID: qkBlL79bRWGefedJvZjYyQ==
X-CSE-MsgGUID: CA023grvQQi4MLupx+M3tQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4001047"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="4001047"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 11:58:29 -0800
X-CSE-ConnectionGUID: ooUOBoN3Q3iGne+ftpANBA==
X-CSE-MsgGUID: bacqjitISlyTFUdFSc2dYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="12480531"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa012.fm.intel.com with ESMTP; 20 Nov 2026 11:58:28 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUUkb-0000000047V-334n;
	Fri, 20 Nov 2026 19:58:25 +0000
Date: Fri, 20 Nov 2026 20:57:39 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 7153/10560] arch/riscv/kvm/main.c:37
 kvm_riscv_setup_vendor_features() warn: impossible condition
 '(riscv_cached_marchid(0) == 9223372036854775816) => (0-u32max ==
 9223372036854775816)'
Message-ID: <20261120205750.YcnKhuSh-lkp@intel.com>
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
TO: Davidlohr Bueso <dave@stgolabs.net>
CC: Anup Patel <anup@brainfault.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   909ef7a9a30fa139e69e555e3606680f5cca7726
commit: 403daa3414a6ad1378082f97b3a8bec08a50c641 [7153/10560] RISC-V: KVM: Do not touch the envcfg CSRs on the SiFive P550
:::::: branch date: 3 hours ago
:::::: commit date: 4 days ago
config: riscv-randconfig-2200-20261118 (https://download.01.org/0day-ci/archive/20261120/20261120205750.YcnKhuSh-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 51d7f08b16b68285b1a400f413215b69f07a65e3)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/20261120205750.YcnKhuSh-lkp@intel.com/

smatch warnings:
arch/riscv/kvm/main.c:37 kvm_riscv_setup_vendor_features() warn: impossible condition '(riscv_cached_marchid(0) == 9223372036854775816) => (0-u32max == 9223372036854775816)'

vim +37 arch/riscv/kvm/main.c

3239c52fd21257 Hui Min Mina Chou 2025-11-17  25  
3239c52fd21257 Hui Min Mina Chou 2025-11-17  26  static void kvm_riscv_setup_vendor_features(void)
3239c52fd21257 Hui Min Mina Chou 2025-11-17  27  {
3239c52fd21257 Hui Min Mina Chou 2025-11-17  28  	/* Andes AX66: split two-stage TLBs */
3239c52fd21257 Hui Min Mina Chou 2025-11-17  29  	if (riscv_cached_mvendorid(0) == ANDES_VENDOR_ID &&
3239c52fd21257 Hui Min Mina Chou 2025-11-17  30  	    (riscv_cached_marchid(0) & 0xFFFF) == 0x8A66) {
3239c52fd21257 Hui Min Mina Chou 2025-11-17  31  		static_branch_enable(&kvm_riscv_vsstage_tlb_no_gpa);
3239c52fd21257 Hui Min Mina Chou 2025-11-17  32  		kvm_info("VS-stage TLB does not cache guest physical address and VMID\n");
3239c52fd21257 Hui Min Mina Chou 2025-11-17  33  	}
403daa3414a6ad Davidlohr Bueso   2026-10-23  34  
403daa3414a6ad Davidlohr Bueso   2026-10-23  35  	/* SiFive P550 (ESWIN EIC7700X): H on a 1.11 base, no henvcfg/senvcfg */
403daa3414a6ad Davidlohr Bueso   2026-10-23  36  	if (riscv_cached_mvendorid(0) == SIFIVE_VENDOR_ID &&
403daa3414a6ad Davidlohr Bueso   2026-10-23 @37  	    riscv_cached_marchid(0) == 0x8000000000000008ULL) {
403daa3414a6ad Davidlohr Bueso   2026-10-23  38  		static_branch_enable(&kvm_riscv_no_xenvcfg);
403daa3414a6ad Davidlohr Bueso   2026-10-23  39  		kvm_info("henvcfg and senvcfg CSRs not implemented\n");
403daa3414a6ad Davidlohr Bueso   2026-10-23  40  	}
3239c52fd21257 Hui Min Mina Chou 2025-11-17  41  }
3239c52fd21257 Hui Min Mina Chou 2025-11-17  42  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
