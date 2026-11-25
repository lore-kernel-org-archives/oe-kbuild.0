Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795650364;
	b=EL3ADXPY9hCo37ncL1x3Xbcidn2KS/wJsGm0u4i1Us9krYg1ZF42Hs0Tu1Wmd/YuEIso
	 ER0nyw8QMNzrAbZaV6YZ60exasG+BxWntDhkVRCFDUXoBEhrP29kDAQXtcMBdvM/k42h1
	 K80DgJ05JHCDoLpA6ZH7EHfrDk6WRfvLGWoSo++C4jnnnU8ndOswGjP0jmogIcOrot9g5
	 S8Odp4VF/KF6uyS7qeb6eRz12DGsRcvu9KajMDzBu+L0TA8xKr9xJSnUKy/gmDCUQ5lTI
	 O6STVKicrSj9rEdbwb7Cni4Xl36+yx0epZMqPKhqD5fFiYvlishB6Corox+3XFNrXjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795650364;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent:MIME-Version:Content-Type;
	bh=2IGUG6h3tfCJiHciz5/mpeFWw7HVywrHSePL86THHX4=;
	b=Lm7i9uhnbI1EKmLn2IaTuuLyMWCzzQ5rKAorVx9VD/8pYb5wjgOiqchFkcUQINnU0jz2
	 Y9DvIRVv/K9n99heINph9Nfa/rNtc8aphjG/EwQq4kQhFTq5lhlDrpaV2DcuCP9SYDua+
	 +pZ6hQWRDEpsaU9oP14NXD1SrJIW9vrI0wDZdw1ThCk+ozpdgv5HnavmGw9x1ZymKcdec
	 qbzs9qCca3pmbqU1UJWDKSEfMLX4m/VRv31oxu+vcFrfTXLPwS5/5gjxSyNtYzMpKsDc8
	 7NVasnKRxJp9Wvp8R7uYh8EUdrFFxcbElelOxSEqfc0Chn4KNhJhUHTX/qXZsqyupKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="I6jgZT/6";
	arc=none smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24451606A321
	for <oe-kbuild@lists.linux.dev>; Wed, 25 Nov 2026 23:46:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24451606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=I6jgZT/6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795650363; x=1827186363;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Vdx1VqfCkS8mjFB39ObmJHLYoE5N7pJA7eRMr0E7BBs=;
  b=I6jgZT/6D5MZW08G8I4SuNhake60PTgC8AhxQ84J5hVV/NbLk4JS3cEU
   trC9X8nJIflqS0kjvv9hULA7NmJ6kEQ5DUlfYEBmiQgHKYZObsvfYrhFF
   NfMs4aZqgxM59CJmKEhnOOodEfT23KJplIqDYLsTobWxSXE1aChqXm0/Z
   igZiMDb3HrRQl2BNpEYuj36VaU74qF2MaigzMvuwuwK5gHb8nhyPB+Vpb
   jGkp3xQLhKMkePE+nqp9tIyJ/V0RdG+afvydv9gXGUb53EDTzazN3EMFl
   +taaMgWKn/JbcZjV5wBrMQ8zvTUM/Bf1MC4/AMFBuuvKY+cWhiU0qTEOr
   g==;
X-CSE-ConnectionGUID: OeJUHbHsSji3EEwzdO4NsQ==
X-CSE-MsgGUID: ybrUnxdOTz2GnIl5liw4kg==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4611364"
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="4611364"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 15:46:03 -0800
X-CSE-ConnectionGUID: rHJjFLB+T6WycaOQqG65Tw==
X-CSE-MsgGUID: gorzu5u0S3eRNzapLjbl0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="12146485"
Received: from igk-lkp-server01.igk.intel.com (HELO a03d4d989450) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 25 Nov 2026 15:46:02 -0800
Received: from kbuild by a03d4d989450 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xWMgZ-0000000009X-23sl;
	Wed, 25 Nov 2026 23:45:59 +0000
Date: Thu, 26 Nov 2026 00:45:03 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [avpatel:riscv_trace_support_v6 49/115]
 =?us-ascii?Q?tools/testing/selftests/../../../tools/include/asm/../../arc?=
 =?us-ascii?Q?h/riscv/include/asm/barrier.h:13:10:?= fatal error:
 asm/fence.h: No such file or directory
Message-ID: <20261126004426.rvJWeyRj-lkp@intel.com>
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

tree:   https://github.com/avpatel/linux.git riscv_trace_support_v6
head:   d77c0270e18de0b01434fec8027d8a61ae1f7c00
commit: 11a204761f086e2384b6bbd0da75bfe9fbcc8c7e [49/115] selftests/vfio: Allow building on RISC-V
:::::: branch date: 12 hours ago
:::::: commit date: 16 hours ago
config: riscv-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20261126/20261126004426.rvJWeyRj-lkp@intel.com/config)
compiler: riscv64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261126/20261126004426.rvJWeyRj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/20261126004426.rvJWeyRj-lkp@intel.com/

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
