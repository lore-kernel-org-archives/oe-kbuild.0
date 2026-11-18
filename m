Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795016042;
	b=VhLvjYkZ/lag5VK1wjooafgN2xm00/WHPPt5L++Hn0Zdf6FCPC4P3L8UD0XpkQWy+L47
	 wec/umL2bARQooABTIBngR4slwH7SEMmmiOZAoTFI2K3/Qu1I0MWCQgX+gFQqEbiWW6Zv
	 jiJnS2mNaFjo/c7OK6QteGMc1/TsOWyyhi1JvTlXZU8/FxQUT9ikaaCn+Iz2Jyl17M/sK
	 bGwoLRT0Hh3YhN4JaFAMBoOhbz14rn2j/XRmgEbd/B2oMSPp39FJXhTGIfzWh/haZtR67
	 cgV2JAn3S7bosGukMiK6D77r0Q8KAiB+pJ05rF0Ip9oIXy+WCgBCDDju8KGlbtMaMBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795016042;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent:MIME-Version:Content-Type;
	bh=p9Yn5EBwOPAnzKWPtyfIIXrKz+IPSeJM7fRfog1YaRI=;
	b=dk+qbD25sPS8eIn0a9/HKPu8ZIFFH69VpmLx1YZql9SGiLZofjsSHGNkjF1h2CU2qHbY
	 tmDsbnNzWJeJLEARFG5ch6cK4LLPmjOaqi4PFjgbqesWth6bbcUt96xc9C8HNYiIT4OUV
	 lE7xKTGYvdo0ObOr2ThsdII2r6GrOeRZ4YerEQ1PMdZDa6GH8x0l7AwFhxiAMvudrccxw
	 rreziZdJvElA5vLzv5EYZJv2Z1TRBKcGxwT7nJgYEq+dhkLpFj8m3nQx/YUthl8lXSSjg
	 ffoU+w/lnzAnV9K5Gc6u9g1nLMuND4EM92q/HaNN0AplKvUtak20Fjruc+CKJDmS1GA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OxFvB2qM;
	arc=none smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE076606A31C
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Nov 2026 15:34:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE076606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OxFvB2qM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795016041; x=1826552041;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=06i0UkxH2+fQ7ZXIVElKca7/d5/UJInl9g/Xw0T+jGk=;
  b=OxFvB2qMcVW5mNYJjeTzMFcF6vQR2LKKcrTdk6wSW/idE1A3wpDVe/j+
   yc0j+u/b8Ou75Yby/c6q5KSBS81/v+lsT1QUaQZgwtr6PoU74rdJprakD
   l9MBmH9wFUnLHw7EKGZ4W71jNIxpYvoMSWdc9d5Y6UlUaSgjpxWEM8x7x
   PmQ2Nd8g9qyTFA/Xg7LxtlOk6eTeTUVrIOrmTDBqX7c8ydYPuAUdiu6Ks
   siLQqB1yUqC+lzKW0SzQH1eqD0yYFtrqUPqbCW5dW+ZnphFZpIcDgE1y1
   uq12c4xr6GBm0lixRWRpK7BBNRO62EmxOtXm2cO8SYlkrZIve+WORW/va
   w==;
X-CSE-ConnectionGUID: DuIHxefESw6gIkK8xt9oLA==
X-CSE-MsgGUID: /qJl5NwjSEqSUNpZFBRxdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3857182"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3857182"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 07:34:01 -0800
X-CSE-ConnectionGUID: JA0YUlNaRsSP/hLVJ8pVZw==
X-CSE-MsgGUID: D86pP3axQl64cxAGdZFMFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="11906632"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa012.fm.intel.com with ESMTP; 18 Nov 2026 07:34:00 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xThfZ-000000003QA-2dYG;
	Wed, 18 Nov 2026 15:33:57 +0000
Date: Wed, 18 Nov 2026 16:33:51 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [avpatel:riscv_trace_acpi_support_v1 45/110]
 =?us-ascii?Q?tools/testing/selftests/../../../tools/include/asm/../../arc?=
 =?us-ascii?Q?h/riscv/include/asm/barrier.h:13:10:?= fatal error:
 asm/fence.h: No such file or directory
Message-ID: <20261118162517.BxS3xzZu-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Andrew Jones <andrew.jones@oss.qualcomm.com>
CC: Anup Patel <anup@brainfault.org>
CC: Nutty Liu <nutty.liu@hotmail.com>

tree:   https://github.com/avpatel/linux.git riscv_trace_acpi_support_v1
head:   d07ed174c556320cd195cf52564791f94027154c
commit: 70d183bd38cf6b1986837c550c44731c2f716b89 [45/110] selftests/vfio: Allow building on RISC-V
:::::: branch date: 8 hours ago
:::::: commit date: 10 hours ago
config: riscv-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20261118/20261118162517.BxS3xzZu-lkp@intel.com/config)
compiler: riscv64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261118/20261118162517.BxS3xzZu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/20261118162517.BxS3xzZu-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from tools/testing/selftests/../../../tools/include/asm/barrier.h:12,
                    from tools/testing/selftests/../../../tools/include/asm-generic/io.h:5,
                    from tools/testing/selftests/../../../tools/include/asm/io.h:8,
                    from tools/testing/selftests/../../../tools/include/linux/io.h:5,
                    from tools/testing/selftests/vfio/lib/drivers/mlx5/mlx5.c:18:
>> tools/testing/selftests/../../../tools/include/asm/../../arch/riscv/include/asm/barrier.h:13:10: fatal error: asm/fence.h: No such file or directory
      13 | #include <asm/fence.h>
         |          ^~~~~~~~~~~~~
   compilation terminated.


vim +13 tools/testing/selftests/../../../tools/include/asm/../../arch/riscv/include/asm/barrier.h

6d74d178fe6eaf Charlie Jenkins 2024-08-06  12  
6d74d178fe6eaf Charlie Jenkins 2024-08-06 @13  #include <asm/fence.h>
6d74d178fe6eaf Charlie Jenkins 2024-08-06  14  #include <linux/compiler.h>
6d74d178fe6eaf Charlie Jenkins 2024-08-06  15  

:::::: The code at line 13 was first introduced by commit
:::::: 6d74d178fe6eaf61e384f3be6ba64150bddce8a6 tools: Add riscv barrier implementation

:::::: TO: Charlie Jenkins <charlie@rivosinc.com>
:::::: CC: Palmer Dabbelt <palmer@rivosinc.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
