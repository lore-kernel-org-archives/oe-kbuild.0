Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A08E815625A
	for <oe-kbuild@lists.linux.dev>; Mon,  9 Dec 2024 04:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733717531; cv=none; b=jwIYDZhaU9P34Ie9k6/m/3psAADNdczq5n5n2luUzoAjrHPvYByIwVIYsBwQXsbCeu2tV47yqoQ8s46EXod49zfziI1bTopSL03ZAwXLIThj1RYdtBE4ltToJitMxljlf3ZShBgXCS57wfiy0FtuwPoVYBu0Pq9g4w8HZog0R5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733717531; c=relaxed/simple;
	bh=Lga/ssee0/e2AK2TRY8ybDPfVx7+bunkn648UXNE7po=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VPZPM+ENZIK2rjZh38io8smPwMEgmSAHvuqTZj/lUzg5zEleAUo7VAoZnmK9rRylJ73FJjSsz/jyxM2AG60Jnabi6x7IDerXXVDXogUumPI64aCFiBlCy6oBB8EB82y+P6zcRk7pUxDS4jyVGme/AdpfX136vkCSQsxNHTukMKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KWlfVZ5m; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KWlfVZ5m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733717530; x=1765253530;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Lga/ssee0/e2AK2TRY8ybDPfVx7+bunkn648UXNE7po=;
  b=KWlfVZ5mGW30Ka6yo1+cvLk93P7WlhZP/PWENVgOUhv5q13DrA/c4NSu
   LQO/isXniIP3euH7oVb7MKXWKZeQj2+rjM3Gc1745Rr8ul309Yn8tyesy
   SdkY4LA6kIBptksy/HOVJ1aJB6WLJzlEgcapdZmB35KhN0twgp8/Tv4ol
   53c94BGH0WFLVqm7ocfXulFHqztrUabxkMWy6S0fkUtEKblaEOao/Hg6y
   4Hk8srnLtBpfndVEPsettxCQzzWx6ITqZp9JtYnOadbVTXRfn1yWdLDSt
   cKRe+VfkOoBZ/CnxlDVQjZGbfGCpX2dBbfAk3s91YXUDysmXWp9H4DqAg
   A==;
X-CSE-ConnectionGUID: V96TdD2ZTBi4lGeb2vTNOg==
X-CSE-MsgGUID: jTL52OYvQsC8SBt2oB8A1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="33891389"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="33891389"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 20:12:10 -0800
X-CSE-ConnectionGUID: 7bab7SODRCytzwQoEs07xA==
X-CSE-MsgGUID: ZO3ulOfPRXyhfB6407hlYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="99775554"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 08 Dec 2024 20:12:08 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKV7t-0003oL-2X;
	Mon, 09 Dec 2024 04:12:05 +0000
Date: Mon, 9 Dec 2024 12:11:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/riscv/kernel/sys_hwprobe.c:42 hwprobe_arch_id() error:
 uninitialized symbol 'cpu_id'.
Message-ID: <202412071537.ce5eoTOq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Andrew Jones <ajones@ventanamicro.com>
CC: Palmer Dabbelt <palmer@rivosinc.com>
CC: Conor Dooley <conor.dooley@microchip.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b5f217084ab3ddd4bdd03cd437f8e3b7e2d1f5b6
commit: 53b2b22850e1ff9e2729ce8efe2d846ed7d3bff4 RISC-V: Move the hwprobe syscall to its own file
date:   11 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 11 months ago
config: riscv-randconfig-r073-20241207 (https://download.01.org/0day-ci/archive/20241207/202412071537.ce5eoTOq-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412071537.ce5eoTOq-lkp@intel.com/

smatch warnings:
arch/riscv/kernel/sys_hwprobe.c:42 hwprobe_arch_id() error: uninitialized symbol 'cpu_id'.

vim +/cpu_id +42 arch/riscv/kernel/sys_hwprobe.c

53b2b22850e1ff Andrew Jones 2023-11-22  17  
53b2b22850e1ff Andrew Jones 2023-11-22  18  
53b2b22850e1ff Andrew Jones 2023-11-22  19  static void hwprobe_arch_id(struct riscv_hwprobe *pair,
53b2b22850e1ff Andrew Jones 2023-11-22  20  			    const struct cpumask *cpus)
53b2b22850e1ff Andrew Jones 2023-11-22  21  {
53b2b22850e1ff Andrew Jones 2023-11-22  22  	u64 id = -1ULL;
53b2b22850e1ff Andrew Jones 2023-11-22  23  	bool first = true;
53b2b22850e1ff Andrew Jones 2023-11-22  24  	int cpu;
53b2b22850e1ff Andrew Jones 2023-11-22  25  
53b2b22850e1ff Andrew Jones 2023-11-22  26  	for_each_cpu(cpu, cpus) {
53b2b22850e1ff Andrew Jones 2023-11-22  27  		u64 cpu_id;
53b2b22850e1ff Andrew Jones 2023-11-22  28  
53b2b22850e1ff Andrew Jones 2023-11-22  29  		switch (pair->key) {
53b2b22850e1ff Andrew Jones 2023-11-22  30  		case RISCV_HWPROBE_KEY_MVENDORID:
53b2b22850e1ff Andrew Jones 2023-11-22  31  			cpu_id = riscv_cached_mvendorid(cpu);
53b2b22850e1ff Andrew Jones 2023-11-22  32  			break;
53b2b22850e1ff Andrew Jones 2023-11-22  33  		case RISCV_HWPROBE_KEY_MIMPID:
53b2b22850e1ff Andrew Jones 2023-11-22  34  			cpu_id = riscv_cached_mimpid(cpu);
53b2b22850e1ff Andrew Jones 2023-11-22  35  			break;
53b2b22850e1ff Andrew Jones 2023-11-22  36  		case RISCV_HWPROBE_KEY_MARCHID:
53b2b22850e1ff Andrew Jones 2023-11-22  37  			cpu_id = riscv_cached_marchid(cpu);
53b2b22850e1ff Andrew Jones 2023-11-22  38  			break;
53b2b22850e1ff Andrew Jones 2023-11-22  39  		}
53b2b22850e1ff Andrew Jones 2023-11-22  40  
53b2b22850e1ff Andrew Jones 2023-11-22  41  		if (first) {
53b2b22850e1ff Andrew Jones 2023-11-22 @42  			id = cpu_id;
53b2b22850e1ff Andrew Jones 2023-11-22  43  			first = false;
53b2b22850e1ff Andrew Jones 2023-11-22  44  		}
53b2b22850e1ff Andrew Jones 2023-11-22  45  
53b2b22850e1ff Andrew Jones 2023-11-22  46  		/*
53b2b22850e1ff Andrew Jones 2023-11-22  47  		 * If there's a mismatch for the given set, return -1 in the
53b2b22850e1ff Andrew Jones 2023-11-22  48  		 * value.
53b2b22850e1ff Andrew Jones 2023-11-22  49  		 */
53b2b22850e1ff Andrew Jones 2023-11-22  50  		if (id != cpu_id) {
53b2b22850e1ff Andrew Jones 2023-11-22  51  			id = -1ULL;
53b2b22850e1ff Andrew Jones 2023-11-22  52  			break;
53b2b22850e1ff Andrew Jones 2023-11-22  53  		}
53b2b22850e1ff Andrew Jones 2023-11-22  54  	}
53b2b22850e1ff Andrew Jones 2023-11-22  55  
53b2b22850e1ff Andrew Jones 2023-11-22  56  	pair->value = id;
53b2b22850e1ff Andrew Jones 2023-11-22  57  }
53b2b22850e1ff Andrew Jones 2023-11-22  58  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
