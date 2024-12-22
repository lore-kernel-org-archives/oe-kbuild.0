Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FBBE64D
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Dec 2024 05:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734845550; cv=none; b=IF+YRd+99vuJYNj+SnOIVyESnxQzn2uUm0B8699NDgb64jpUcu+pQkcjcsA3Js+1hp4rQHYm8Hvkyr19bxM/wOcpGhh15XBtE65Dc4lHSlWTskRQ+NiZ+L36K6n48xJKSGhbvGhpRk3kualSEqBLxuke3rDb9osP6Du5eSnx1IQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734845550; c=relaxed/simple;
	bh=Lq+wSIAuNIS5XIXxkE9nrvfA3oLq1DEDKlg2Of/1n/g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=D3Tc2KUToDtN0e/vxohN9j3Kc2MVArAp5r5Tix2/+M6seSwQqb4CEuMfn9hBM4TlXv3miIb48QV4fvRZj87rw5SaAbr3tRjuEWefVZuXud9dB6QkUuhW6oSNwlM/aK5O8X650RDTFW3vNFCBzKz6v/s0bsIEDLp1kxwfloCpDW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qao5ImTp; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qao5ImTp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734845548; x=1766381548;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Lq+wSIAuNIS5XIXxkE9nrvfA3oLq1DEDKlg2Of/1n/g=;
  b=Qao5ImTp9eh/4khbMDhSR8udBR3bvGfqCguLTGH9rxxhsoQ1cQLhAdwG
   Rrg2EHtmLZO9hYJR48i/Y8FxJLmGeWmwbsskUSxKySozNfUSujnYZh2ol
   2GipFIDtQaeYcg77cSOJp0zKqCC/RjMYo6Ju7+5aCmoUtiEfsEuZ/0MTE
   RrTvFT5K4bVhRQ8waYeEXEoYMbScaytUbY7d4Ety89zV4SIYSQmAgEDXH
   Lpv2uP3BL1sa5m3u6FWHuiZea3uwKiLRWJQTL+tFCuP7wM0qJCDPW2ksB
   9feFVeNIUs4PlMqwYwgHssYzj3T3FdWcY24MVoei5Vz+CGdq1VDjnoAlc
   g==;
X-CSE-ConnectionGUID: Hro2IDAoRmOYzDg4yZb6Bw==
X-CSE-MsgGUID: E58xHtUsQKKXWZsDbHWWDQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11293"; a="39283568"
X-IronPort-AV: E=Sophos;i="6.12,254,1728975600"; 
   d="scan'208";a="39283568"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2024 21:32:27 -0800
X-CSE-ConnectionGUID: +o/C+88QQD+UeJ+9UOcP7A==
X-CSE-MsgGUID: Js1JlEBfSmC4OsNTJGEEmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,254,1728975600"; 
   d="scan'208";a="98777522"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 21 Dec 2024 21:32:27 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tPEZk-0002kX-2B;
	Sun, 22 Dec 2024 05:32:24 +0000
Date: Sun, 22 Dec 2024 13:32:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [soc:stm32/dt 22/23] arch/arm64/boot/dts/st/stm32mp257f-ev1.dtb:
 /soc@0/bus@42080000/dcmipp@48030000: failed to match any schema with
 compatible: ['st,stm32mp25-dcmipp']
Message-ID: <202412221333.PpHIgD7q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-arm-kernel@lists.infradead.org
CC: arm@kernel.org
TO: Alain Volmat <alain.volmat@foss.st.com>
CC: Alexandre Torgue <alexandre.torgue@foss.st.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git stm32/dt
head:   8df9bff2788973e16263ca86df7574d527c84405
commit: d67635e62d8078eb5602246c81d991d3f6eb034d [22/23] arm64: dts: st: add csi & dcmipp node in stm32mp25
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-052-20241221 (https://download.01.org/0day-ci/archive/20241222/202412221333.PpHIgD7q-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 9daf10ff8f29ba3a88a105aaa9d2379c21b77d35)
dtschema version: 2024.12.dev5+gea243eb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241222/202412221333.PpHIgD7q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202412221333.PpHIgD7q-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/st/stm32mp257f-ev1.dtb: /soc@0/bus@42080000/csi@48020000: failed to match any schema with compatible: ['st,stm32mp25-csi']
>> arch/arm64/boot/dts/st/stm32mp257f-ev1.dtb: /soc@0/bus@42080000/dcmipp@48030000: failed to match any schema with compatible: ['st,stm32mp25-dcmipp']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
