Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 042A1308F3E
	for <oe-kbuild@lists.linux.dev>; Fri, 16 Jan 2026 04:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768536640; cv=none; b=kNEz3q5ttqvUp5XvpjB65gEX8I6OUii81HREKZZV/Y1nBm9jxEXS6ZTrWM2Q8d42192eIXBZZ+eeQirNfhNZu3l3qI1vY4MejR+0wKrKtd9qjk2wkJIBjMNmf2reR9iPsh/ejKQ5raFUW462KMdpTg3V+nSWvUslt/BwkkSDiB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768536640; c=relaxed/simple;
	bh=mUkPJp/FdWabGU7EX/9rL2qWGCOQ4NQDygds8OBEk8Q=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HCnJJi8PvXquwmFr0HmEz079Rykp4vR83zRiO8Jks2sUmnJoiWPuTUzwLhmU2rweJsNUdXxGeqdSMt31VYDiM8AXMsjfBVhoMAncZXigcKXN8yQ55iWdNDXMimiKDPFvCGnJqbD5LO7NTNVidtpDb6vGWlew5yBzNDRDyT8r/w8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hzxj0Zi3; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hzxj0Zi3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768536638; x=1800072638;
  h=date:from:to:cc:subject:message-id;
  bh=mUkPJp/FdWabGU7EX/9rL2qWGCOQ4NQDygds8OBEk8Q=;
  b=Hzxj0Zi3q2Gj+zqQwIdXbaIbu5LJIuokgulJvEab3rGdXeYXsaWCdpdI
   hB5ec3VAzY6Gxok0BjjA9bqV1gXZTwgh6VNResoZlXq5acwyr7wFEt6N3
   k31v3LLsGxoMeXzmsQT84h1zfkJ9gpiFWgGquLp3OpQmnXT3gtps4ijMu
   BXejR+tg2QKGHyGCHMuDtowEYpIWfqBxzS6E2cAXitT0+Usud2x5fm0AK
   0dO+gHZHYvu7SWdD+d5ZAyETl7H+p03iBhpPTHKmQluQcNkrxPJuANEtH
   DTKtWZZiyY5Jl3Xh/Lv8ConjlZte8mr3GaBQmlDIiEyl/vfBoNG3Ne6JB
   g==;
X-CSE-ConnectionGUID: ERzHRpcYTGu889ocYrwavQ==
X-CSE-MsgGUID: 8syjuqeKRlivFNMoOsIOdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="69901970"
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; 
   d="scan'208";a="69901970"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 20:10:37 -0800
X-CSE-ConnectionGUID: mi649Nf5Tee6LChCuCLiJg==
X-CSE-MsgGUID: 0TgYZi57TiWuwyv/h73Kng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; 
   d="scan'208";a="236387858"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 15 Jan 2026 20:10:36 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgbAQ-00000000KMG-00q9;
	Fri, 16 Jan 2026 04:10:34 +0000
Date: Fri, 16 Jan 2026 12:10:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android15-6.6 4/4] fs/exfat/file.c:513
 exfat_file_zeroed_range() error: uninitialized symbol 'err'.
Message-ID: <202601161212.dinnPUzf-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   a58a97026588e9128868c7778ca1ffacbb53c931
commit: 83600dccb85d0f34a7737be22b8d457fa3dc4c05 [4/4] UPSTREAM: exfat: change to get file size from DataLength
:::::: branch date: 5 hours ago
:::::: commit date: 1 year, 5 months ago
config: i386-randconfig-141-20260116 (https://download.01.org/0day-ci/archive/20260116/202601161212.dinnPUzf-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601161212.dinnPUzf-lkp@intel.com/

smatch warnings:
fs/exfat/file.c:513 exfat_file_zeroed_range() error: uninitialized symbol 'err'.

vim +/err +513 fs/exfat/file.c

5267456e953fd8 Sungjong Seo  2020-06-18  480  
83600dccb85d0f dongliang.cui 2024-08-26  481  static int exfat_file_zeroed_range(struct file *file, loff_t start, loff_t end)
83600dccb85d0f dongliang.cui 2024-08-26  482  {
83600dccb85d0f dongliang.cui 2024-08-26  483  	int err;
83600dccb85d0f dongliang.cui 2024-08-26  484  	struct inode *inode = file_inode(file);
83600dccb85d0f dongliang.cui 2024-08-26  485  	struct address_space *mapping = inode->i_mapping;
83600dccb85d0f dongliang.cui 2024-08-26  486  	const struct address_space_operations *ops = mapping->a_ops;
83600dccb85d0f dongliang.cui 2024-08-26  487  
83600dccb85d0f dongliang.cui 2024-08-26  488  	while (start < end) {
83600dccb85d0f dongliang.cui 2024-08-26  489  		u32 zerofrom, len;
83600dccb85d0f dongliang.cui 2024-08-26  490  		struct page *page = NULL;
83600dccb85d0f dongliang.cui 2024-08-26  491  
83600dccb85d0f dongliang.cui 2024-08-26  492  		zerofrom = start & (PAGE_SIZE - 1);
83600dccb85d0f dongliang.cui 2024-08-26  493  		len = PAGE_SIZE - zerofrom;
83600dccb85d0f dongliang.cui 2024-08-26  494  		if (start + len > end)
83600dccb85d0f dongliang.cui 2024-08-26  495  			len = end - start;
83600dccb85d0f dongliang.cui 2024-08-26  496  
83600dccb85d0f dongliang.cui 2024-08-26  497  		err = ops->write_begin(file, mapping, start, len, &page, NULL);
83600dccb85d0f dongliang.cui 2024-08-26  498  		if (err)
83600dccb85d0f dongliang.cui 2024-08-26  499  			goto out;
83600dccb85d0f dongliang.cui 2024-08-26  500  
83600dccb85d0f dongliang.cui 2024-08-26  501  		zero_user_segment(page, zerofrom, zerofrom + len);
83600dccb85d0f dongliang.cui 2024-08-26  502  
83600dccb85d0f dongliang.cui 2024-08-26  503  		err = ops->write_end(file, mapping, start, len, len, page, NULL);
83600dccb85d0f dongliang.cui 2024-08-26  504  		if (err < 0)
83600dccb85d0f dongliang.cui 2024-08-26  505  			goto out;
83600dccb85d0f dongliang.cui 2024-08-26  506  		start += len;
83600dccb85d0f dongliang.cui 2024-08-26  507  
83600dccb85d0f dongliang.cui 2024-08-26  508  		balance_dirty_pages_ratelimited(mapping);
83600dccb85d0f dongliang.cui 2024-08-26  509  		cond_resched();
83600dccb85d0f dongliang.cui 2024-08-26  510  	}
83600dccb85d0f dongliang.cui 2024-08-26  511  
83600dccb85d0f dongliang.cui 2024-08-26  512  out:
83600dccb85d0f dongliang.cui 2024-08-26 @513  	return err;
83600dccb85d0f dongliang.cui 2024-08-26  514  }
83600dccb85d0f dongliang.cui 2024-08-26  515  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
