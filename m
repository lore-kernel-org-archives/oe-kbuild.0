Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 519A113FEE
	for <oe-kbuild@lists.linux.dev>; Wed, 30 Oct 2024 19:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730315495; cv=none; b=rVSVMNUg4tg7b6dSPTdzs3wUJLOqCk1QLdtcGtX9neek5wHOCUu8YUqtyOXSDDzbsDios3AuINlCsm3n43c1jqDsQ1dngGLHYlBKWjhbTqxjDc+n/D8+90rjSaoPq8KaQCv4C0RSx5/8EsKPlHFCCDSqHhlDAyNp3mjlT1ZcVOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730315495; c=relaxed/simple;
	bh=wYjDZjXMx4uq3C1pgmWnQzqHf6MedaNVxXx3cVk+si4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Hi9pg6RTMSXC83BnUiLuVqCzBBPXhpX9OjW/1yf5eto/PV0FRg0YdeP2vs9ic/W5a3E8Vf3/qZR940chF5Ix8XoM3Fe/tX1kPQh5tbl8d6PbOSxj/Lj7b0cnuJfjU2X/m90jT/HLKAcj0OSGkTm7wMO6z5YkyG6u25twjS7+wOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PetM51oV; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PetM51oV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730315493; x=1761851493;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wYjDZjXMx4uq3C1pgmWnQzqHf6MedaNVxXx3cVk+si4=;
  b=PetM51oVWx8GPzlb2LjTwg3i7ftTNTD2avn0TmwiImqLlKMSY8X+z0QZ
   5Ci9+v4kntNFapRkKB5oQj38XBVOc8MyhFf2uFm7WBTauVag28ZC4Gor9
   8BzlFK+aNt/11fBhxB7hzT/omErfHOjWTiANQB69m7fpcvfpi1RjTtUgv
   /HTHjbO92QgTdxSLf57ryg73r3xdCz0MEfyKDlsZA3z8W2csGScOf7ER+
   ApgZZMzz8mG/B11TWt7uN95QVghQn86rmF8xauVbOOIIOyW/JhY5o/Dac
   Lfg4DCdz97JaEQd9X95w4PWz8w6cS+7REhiU2CZ61QuQ4+xYSfSS+yRak
   A==;
X-CSE-ConnectionGUID: 7XUQENwvSb60qJDBC07UMg==
X-CSE-MsgGUID: OiTW6dMnRjeQ3TM5sdUQ9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11241"; a="17679972"
X-IronPort-AV: E=Sophos;i="6.11,245,1725346800"; 
   d="scan'208";a="17679972"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2024 12:11:32 -0700
X-CSE-ConnectionGUID: 9DpwvLeuSNKATisHqzrnVA==
X-CSE-MsgGUID: AuNBPQ/qSLmidC5iSYAcpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,245,1725346800"; 
   d="scan'208";a="82501761"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 30 Oct 2024 12:11:30 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6E6K-000fEE-1H;
	Wed, 30 Oct 2024 19:11:28 +0000
Date: Thu, 31 Oct 2024 03:11:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/riscv/kernel/sys_hwprobe.c:42 hwprobe_arch_id() error:
 uninitialized symbol 'cpu_id'.
Message-ID: <202410310318.7azAzKkJ-lkp@intel.com>
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
head:   c1e939a21eb111a6d6067b38e8e04b8809b64c4e
commit: 53b2b22850e1ff9e2729ce8efe2d846ed7d3bff4 RISC-V: Move the hwprobe syscall to its own file
date:   10 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 10 months ago
config: riscv-randconfig-r071-20241030 (https://download.01.org/0day-ci/archive/20241031/202410310318.7azAzKkJ-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410310318.7azAzKkJ-lkp@intel.com/

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
