Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 038621F5825
	for <oe-kbuild@lists.linux.dev>; Sat, 18 Jul 2026 13:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784380833; cv=none; b=TpyXn6UUs55ZihKeb9zsE9m4kMD9p14sq8vJGSTn/F16ZK7FUa0czGhoZ7ZRvDno4eO/xI024/GOOd+V9ugDMoWusJFJ3x6CjblMAfC4/97g1gQr+Gf38Weao3JO8LwNKS3SzmS4K8XnpT3C2bIoheEkqI1HotLDbF14f4es2oU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784380833; c=relaxed/simple;
	bh=1kwnv7jiBy/YipcSAaCP1L5+AZrzSBvAWc666wsLPyo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=N+V704PZyEtmCnGW9F1aMl/ALofA21KMtyCpSkkc0rel8VCRwBleIHOZm8iqqU+EneuAh6yzU04Iy3qWY33HXbcQOirgVsJmIBz4E2wRG+cIiZC4lPv/12iUSoBP5TEt4sKX2dSbmxKMKhSkA7VGYQmDDi9XDza+dzSnVeCvTD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nk3COvwn; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nk3COvwn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784380831; x=1815916831;
  h=date:from:to:cc:subject:message-id;
  bh=1kwnv7jiBy/YipcSAaCP1L5+AZrzSBvAWc666wsLPyo=;
  b=Nk3COvwnXzquAzB0pdTfJZlHtUrZAUYyD6N8Us8cE8//5DW3+v7EQ0te
   2vJCoi50eh2wAo2tmG7RcoAcuQZA1wkD0WAvc/sXgJgizM0iH2ErEsE0l
   hMLgQGADNhEJ+79staNY010GhInr0qhV0yMYmzlGq+wKM43hS4q6Q4Isd
   5+cbhEQuIzhLbe1IXwMvMYVkWm0SkmwkIiN4ODE7U5RS6ELeG1XqHlIH+
   YUBicN//pbW1E6a5c65vinh6mFXV6Sk0NhThy2Spf7sIlq/t1A/J+5i25
   gdWs39S79ArpLlCKjmtA/JefRdAKTHaQ680BuuqUY/7W1a5kvEiNM3GW2
   A==;
X-CSE-ConnectionGUID: DhRZLuNkQ2OPmkjA4zl3MA==
X-CSE-MsgGUID: S7NgLl1hQ+ycJIiwcu/NIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11849"; a="84153871"
X-IronPort-AV: E=Sophos;i="6.25,171,1779174000"; 
   d="scan'208";a="84153871"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2026 06:20:31 -0700
X-CSE-ConnectionGUID: tW3ZsHmCSLmOfKMz4qKO0g==
X-CSE-MsgGUID: aYOIov3FQOy9cdUO4kXiGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,171,1779174000"; 
   d="scan'208";a="295215952"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 18 Jul 2026 06:20:29 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wl4xu-00000000UnM-2h3k;
	Sat, 18 Jul 2026 13:20:26 +0000
Date: Sat, 18 Jul 2026 21:19:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/firmware/efi/ovmf-debug-log.c:94 ovmf_log_probe()
 warn: missing unwind goto?
Message-ID: <202607182141.dg5gaTTR-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Gerd Hoffmann <kraxel@redhat.com>
CC: Ard Biesheuvel <ardb@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   94515f3a7d4256a5062176b7d6ed0471938cd51a
commit: f393a761763c542761abcf978252d431269366d6 efi: add ovmf debug log driver
date:   1 year ago
:::::: branch date: 17 hours ago
:::::: commit date: 1 year ago
config: x86_64-randconfig-161-20260716 (https://download.01.org/0day-ci/archive/20260718/202607182141.dg5gaTTR-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: f393a761763c ("efi: add ovmf debug log driver")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202607182141.dg5gaTTR-lkp@intel.com/

smatch warnings:
drivers/firmware/efi/ovmf-debug-log.c:94 ovmf_log_probe() warn: missing unwind goto?

vim +94 drivers/firmware/efi/ovmf-debug-log.c

f393a761763c54 Gerd Hoffmann 2025-07-08  66  
f393a761763c54 Gerd Hoffmann 2025-07-08  67  int __init ovmf_log_probe(unsigned long ovmf_debug_log_table)
f393a761763c54 Gerd Hoffmann 2025-07-08  68  {
f393a761763c54 Gerd Hoffmann 2025-07-08  69  	int ret = -EINVAL;
f393a761763c54 Gerd Hoffmann 2025-07-08  70  	u64 size;
f393a761763c54 Gerd Hoffmann 2025-07-08  71  
f393a761763c54 Gerd Hoffmann 2025-07-08  72  	/* map + verify header */
f393a761763c54 Gerd Hoffmann 2025-07-08  73  	hdr = memremap(ovmf_debug_log_table, sizeof(*hdr), MEMREMAP_WB);
f393a761763c54 Gerd Hoffmann 2025-07-08  74  	if (!hdr) {
f393a761763c54 Gerd Hoffmann 2025-07-08  75  		pr_err("OVMF debug log: header map failed\n");
f393a761763c54 Gerd Hoffmann 2025-07-08  76  		return -EINVAL;
f393a761763c54 Gerd Hoffmann 2025-07-08  77  	}
f393a761763c54 Gerd Hoffmann 2025-07-08  78  
f393a761763c54 Gerd Hoffmann 2025-07-08  79  	if (hdr->magic1 != OVMF_DEBUG_LOG_MAGIC1 ||
f393a761763c54 Gerd Hoffmann 2025-07-08  80  	    hdr->magic2 != OVMF_DEBUG_LOG_MAGIC2) {
f393a761763c54 Gerd Hoffmann 2025-07-08  81  		printk(KERN_ERR "OVMF debug log: magic mismatch\n");
f393a761763c54 Gerd Hoffmann 2025-07-08  82  		goto err_unmap;
f393a761763c54 Gerd Hoffmann 2025-07-08  83  	}
f393a761763c54 Gerd Hoffmann 2025-07-08  84  
f393a761763c54 Gerd Hoffmann 2025-07-08  85  	size = hdr->hdr_size + hdr->log_size;
f393a761763c54 Gerd Hoffmann 2025-07-08  86  	pr_info("OVMF debug log: firmware version: \"%s\"\n", hdr->fw_version);
f393a761763c54 Gerd Hoffmann 2025-07-08  87  	pr_info("OVMF debug log: buffer size: %lluk\n", size / 1024);
f393a761763c54 Gerd Hoffmann 2025-07-08  88  
f393a761763c54 Gerd Hoffmann 2025-07-08  89  	/* map complete log buffer */
f393a761763c54 Gerd Hoffmann 2025-07-08  90  	memunmap(hdr);
f393a761763c54 Gerd Hoffmann 2025-07-08  91  	hdr = memremap(ovmf_debug_log_table, size, MEMREMAP_WB);
f393a761763c54 Gerd Hoffmann 2025-07-08  92  	if (!hdr) {
f393a761763c54 Gerd Hoffmann 2025-07-08  93  		pr_err("OVMF debug log: buffer map failed\n");
f393a761763c54 Gerd Hoffmann 2025-07-08 @94  		return -EINVAL;

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
