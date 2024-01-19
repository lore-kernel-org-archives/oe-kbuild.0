Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 116445381
	for <oe-kbuild@lists.linux.dev>; Fri, 19 Jan 2024 06:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705644350; cv=none; b=ZSAwmr5bpKTXz1aGuTdqIglaHNShM7ZTr7EOZOaQgMMPxr9mdJrHDf3vV6Wrl7R9EuYBYEc5/ichU3n/zgLc7j2dk0gKtkdNDHUifsV4FCZjcQ3gRA4XnDdP3VS7CIBv2WsgepwSfAibHzo0ByY6AuGjH8bn9pcOKrNJtjuLrDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705644350; c=relaxed/simple;
	bh=7bIg6m2fMAmMYCgwLc79n3TERFHvWynARiczGv9gJDk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NNNg3N5/BKIAwBop7zOZ5C1vVvbOSmuWWHWpXwn6iuXehaMhPayB7alI7NBBy7/MRcqsUReFgzv7xA0G53naYFQ+oX79QQ3G+XkRzyawWofbostPctwAVqZ09tI9U3mkYijGTcpfBmTtMcL4A/jBfYaMkL0G1V+bWLYCAC65Voc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PYcnXs3C; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PYcnXs3C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705644348; x=1737180348;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7bIg6m2fMAmMYCgwLc79n3TERFHvWynARiczGv9gJDk=;
  b=PYcnXs3CzKYi/gc0D4ulzTFmD0A+Gx0OUXlG/fFUTd2ECo4fwj4RdPmA
   lE4Z7yD5iJnYfirIiettvIsjVT+Qo5hfGPYrRBVCanvLJsUGBHnpx7KEC
   YZJwx2FoRPDWRj5tJab7pHk9q6qId2OxxoOVcid9oRBj0bdpXyPBABcGZ
   JL5PzjHNzxnKryI4/wlgTxp/GPpdcaD2Kh9+O9WqO+/JTaismJ4+0k24m
   Op7Kif6Sthu8wMEfaz1O0gk4K7gjeLPMCgTR1zuouVGbdzfpSPmKJUdnN
   DgY/vM542GqKMWwZEliRdKw3vMdpQZ86DDsF58cgDNhiDQByMbtKHtep1
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="7430668"
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; 
   d="scan'208";a="7430668"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2024 22:05:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="788281363"
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; 
   d="scan'208";a="788281363"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 18 Jan 2024 22:05:46 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rQi0d-0003gm-2A;
	Fri, 19 Jan 2024 06:05:43 +0000
Date: Fri, 19 Jan 2024 14:04:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/riscv/kernel/sys_hwprobe.c:42 hwprobe_arch_id() error:
 uninitialized symbol 'cpu_id'.
Message-ID: <202401191353.uLJKwehv-lkp@intel.com>
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
head:   9d1694dc91ce7b80bc96d6d8eaf1a1eca668d847
commit: 53b2b22850e1ff9e2729ce8efe2d846ed7d3bff4 RISC-V: Move the hwprobe syscall to its own file
date:   2 weeks ago
:::::: branch date: 4 hours ago
:::::: commit date: 2 weeks ago
config: riscv-randconfig-r081-20240119 (https://download.01.org/0day-ci/archive/20240119/202401191353.uLJKwehv-lkp@intel.com/config)
compiler: clang version 18.0.0git (https://github.com/llvm/llvm-project d92ce344bf641e6bb025b41b3f1a77dd25e2b3e9)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202401191353.uLJKwehv-lkp@intel.com/

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
