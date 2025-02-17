Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BA5521A953
	for <oe-kbuild@lists.linux.dev>; Mon, 17 Feb 2025 14:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739801628; cv=none; b=IySs0GE733bjVN9HhNZHyo80iJJhGJdZGv6SBlnO+5SMNynv7VOJWEhypT2n7IZeBHcJTiHpp5R3TqOaVq0W/QY8yeQ91wUvbRzTkm9AxfGLW6hh+1JhwCkMX431NCTp3IJWHRBlK9Mapu5Xxp1WjW8VI0em2sFx4PdQOVTTtfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739801628; c=relaxed/simple;
	bh=KRMsQ/o6wUjJimz9NDklrWyYdKuYBcNMEGMfjUI+sz8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=p8VnwdSS/b9TgRlceXTH8IEp5pQXurDP8hfmPXAf3HPegqDkUBdq/qzTRO432VahcJ6n0v7oeRU7I5SRiGMeGasLvIzSNNH6kqilYQzlfpkBXVp+V3X8SaWWdxuuHEky7F6mMhf6N+XhADDYDlRD3PCt6a3TKD9m/nEW63Gvkog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cqcoSthQ; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cqcoSthQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739801627; x=1771337627;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KRMsQ/o6wUjJimz9NDklrWyYdKuYBcNMEGMfjUI+sz8=;
  b=cqcoSthQ+rhqMqyHog/7+z1yvGDnc9K3SB3qQQMAzYcgJ5OI0rHV1T5v
   FL08As39W/uijOsUR3pvDSzH05vQXmpe7mEZ9ADWxoPebAfvjRt0FSmEM
   6JYh1edCBCVw2piOigDPWZXnXH4aH8oOuWeauoPbkiGeH6znUyYRAWFDk
   Z+G1lBS/msEw9ZWT5X3Fd9RXNGVZhcIezTZ8LdkUaSPc/i8IBIlU9Dlbb
   wDv9PSwc5RS6GmCqYf44SVigyNh9xm3qXKJRpmEHCrN456ASDXRCpvg0N
   kZymTROe1u2wZICNLjNFZFuGdV1PzFuxQMjS0fEARS0QRJB1Lgp392UPZ
   A==;
X-CSE-ConnectionGUID: oQeBsm+jQI2JlySkDmOQSg==
X-CSE-MsgGUID: w4Znhn8xSPOPqanHJ57APw==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="62956189"
X-IronPort-AV: E=Sophos;i="6.13,293,1732608000"; 
   d="scan'208";a="62956189"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2025 06:13:46 -0800
X-CSE-ConnectionGUID: eeFsRQl8SrS7vp4R7AAsBQ==
X-CSE-MsgGUID: BWoZYE6dQSeU+7vC1+gOow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="137372336"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 17 Feb 2025 06:13:44 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tk1sU-001DCp-17;
	Mon, 17 Feb 2025 14:13:42 +0000
Date: Mon, 17 Feb 2025 22:13:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [avpatel:riscv_unaligned_test_skip_v1 53/77]
 arch/riscv/kernel/hw_breakpoint.c:53 arch_smp_setup_sbi_shmem() warn:
 unsigned '_x' is never less than zero.
Message-ID: <202502172257.1bTZKubK-lkp@intel.com>
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
TO: Himanshu Chauhan <hchauhan@ventanamicro.com>
CC: Anup Patel <anup@brainfault.org>

tree:   https://github.com/avpatel/linux.git riscv_unaligned_test_skip_v1
head:   172aa65b307ae6ac3855f77b6f28d48bfd9c36e5
commit: d3661e2503082cb4cd407a8a4b85287f9bdc2851 [53/77] riscv: Introduce support for hardware break/watchpoints
:::::: branch date: 3 hours ago
:::::: commit date: 10 days ago
config: riscv-randconfig-r073-20250213 (https://download.01.org/0day-ci/archive/20250217/202502172257.1bTZKubK-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202502172257.1bTZKubK-lkp@intel.com/

smatch warnings:
arch/riscv/kernel/hw_breakpoint.c:53 arch_smp_setup_sbi_shmem() warn: unsigned '_x' is never less than zero.
arch/riscv/kernel/hw_breakpoint.c:94 arch_smp_setup_sbi_shmem() error: uninitialized symbol 'rc'.

vim +/_x +53 arch/riscv/kernel/hw_breakpoint.c

d3661e2503082cb Himanshu Chauhan 2024-02-22  39  
d3661e2503082cb Himanshu Chauhan 2024-02-22  40  static int arch_smp_setup_sbi_shmem(unsigned int cpu)
d3661e2503082cb Himanshu Chauhan 2024-02-22  41  {
d3661e2503082cb Himanshu Chauhan 2024-02-22  42  	struct sbi_dbtr_shmem_entry *dbtr_shmem;
d3661e2503082cb Himanshu Chauhan 2024-02-22  43  	unsigned long shmem_pa;
d3661e2503082cb Himanshu Chauhan 2024-02-22  44  	struct sbiret ret;
d3661e2503082cb Himanshu Chauhan 2024-02-22  45  	int rc;
d3661e2503082cb Himanshu Chauhan 2024-02-22  46  
d3661e2503082cb Himanshu Chauhan 2024-02-22  47  	dbtr_shmem = per_cpu_ptr(sbi_dbtr_shmem, cpu);
d3661e2503082cb Himanshu Chauhan 2024-02-22  48  	if (!dbtr_shmem) {
d3661e2503082cb Himanshu Chauhan 2024-02-22  49  		pr_err("Invalid per-cpu shared memory for debug triggers\n");
d3661e2503082cb Himanshu Chauhan 2024-02-22  50  		return -ENODEV;
d3661e2503082cb Himanshu Chauhan 2024-02-22  51  	}
d3661e2503082cb Himanshu Chauhan 2024-02-22  52  
d3661e2503082cb Himanshu Chauhan 2024-02-22 @53  	shmem_pa = __pa(dbtr_shmem);
d3661e2503082cb Himanshu Chauhan 2024-02-22  54  
d3661e2503082cb Himanshu Chauhan 2024-02-22  55  	ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_SETUP_SHMEM,
d3661e2503082cb Himanshu Chauhan 2024-02-22  56  			MEM_LO(shmem_pa), MEM_HI(shmem_pa), 0, 0, 0, 0);
d3661e2503082cb Himanshu Chauhan 2024-02-22  57  
d3661e2503082cb Himanshu Chauhan 2024-02-22  58  	if (ret.error) {
d3661e2503082cb Himanshu Chauhan 2024-02-22  59  		switch(ret.error) {
d3661e2503082cb Himanshu Chauhan 2024-02-22  60  		case SBI_ERR_DENIED:
d3661e2503082cb Himanshu Chauhan 2024-02-22  61  			pr_warn("%s: Access denied for shared memory at %lx\n",
d3661e2503082cb Himanshu Chauhan 2024-02-22  62  				__func__, shmem_pa);
d3661e2503082cb Himanshu Chauhan 2024-02-22  63  			rc = -EPERM;
d3661e2503082cb Himanshu Chauhan 2024-02-22  64  			break;
d3661e2503082cb Himanshu Chauhan 2024-02-22  65  
d3661e2503082cb Himanshu Chauhan 2024-02-22  66  		case SBI_ERR_INVALID_PARAM:
d3661e2503082cb Himanshu Chauhan 2024-02-22  67  		case SBI_ERR_INVALID_ADDRESS:
d3661e2503082cb Himanshu Chauhan 2024-02-22  68  			pr_warn("%s: Invalid address parameter (%lu)\n",
d3661e2503082cb Himanshu Chauhan 2024-02-22  69  				__func__, ret.error);
d3661e2503082cb Himanshu Chauhan 2024-02-22  70  			rc = -EINVAL;
d3661e2503082cb Himanshu Chauhan 2024-02-22  71  			break;
d3661e2503082cb Himanshu Chauhan 2024-02-22  72  
d3661e2503082cb Himanshu Chauhan 2024-02-22  73  		case SBI_ERR_ALREADY_AVAILABLE:
d3661e2503082cb Himanshu Chauhan 2024-02-22  74  			pr_warn("%s: Shared memory is already set\n",
d3661e2503082cb Himanshu Chauhan 2024-02-22  75  				__func__);
d3661e2503082cb Himanshu Chauhan 2024-02-22  76  			rc = -EADDRINUSE;
d3661e2503082cb Himanshu Chauhan 2024-02-22  77  			break;
d3661e2503082cb Himanshu Chauhan 2024-02-22  78  
d3661e2503082cb Himanshu Chauhan 2024-02-22  79  		case SBI_ERR_FAILURE:
d3661e2503082cb Himanshu Chauhan 2024-02-22  80  			pr_err("%s: Internal sdtrig state error\n",
d3661e2503082cb Himanshu Chauhan 2024-02-22  81  			       __func__);
d3661e2503082cb Himanshu Chauhan 2024-02-22  82  			rc = -ENXIO;
d3661e2503082cb Himanshu Chauhan 2024-02-22  83  			break;
d3661e2503082cb Himanshu Chauhan 2024-02-22  84  
d3661e2503082cb Himanshu Chauhan 2024-02-22  85  		default:
d3661e2503082cb Himanshu Chauhan 2024-02-22  86  			pr_warn("%s: Unknown error %lu\n", __func__, ret.error);
d3661e2503082cb Himanshu Chauhan 2024-02-22  87  			rc = -ENXIO;
d3661e2503082cb Himanshu Chauhan 2024-02-22  88  			break;
d3661e2503082cb Himanshu Chauhan 2024-02-22  89  		}
d3661e2503082cb Himanshu Chauhan 2024-02-22  90  	}
d3661e2503082cb Himanshu Chauhan 2024-02-22  91  
d3661e2503082cb Himanshu Chauhan 2024-02-22  92  	pr_warn("CPU %d: HW Breakpoint shared memory registered.\n", cpu);
d3661e2503082cb Himanshu Chauhan 2024-02-22  93  
d3661e2503082cb Himanshu Chauhan 2024-02-22 @94  	return rc;
d3661e2503082cb Himanshu Chauhan 2024-02-22  95  }
d3661e2503082cb Himanshu Chauhan 2024-02-22  96  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
