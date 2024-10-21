Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE4FB1FDD
	for <oe-kbuild@lists.linux.dev>; Mon, 21 Oct 2024 00:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729470221; cv=none; b=Ysg3kIsGMYdkFFoGNk50QRTpUdKxf6nbkEjpdOiqp/AEqNDasA1gH3IP8jBl9I4yEas0VX7vELmRNRGUYko7KphslB+rAkLVachTA1BzKDnIV8FBSPW+l5PTo3hFId4gS3cdBUzQ6AFhhBqpY6xqVEQR/X2VU9VUwcoLi86E+ZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729470221; c=relaxed/simple;
	bh=qjhkWipcxl5eBZyU+RQbtUhguwJxfjMkUcxMdxwFbA8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=plAQMz3wLAb9BIm7+G5f2NBh0RsBti8HtDeNKns0bDQ7e4d5bPiOMJ9UcUgrS/NysoW0T90fvrcG63ee6VDbgZFRpZwS6HcbZgu5W7Emlq2s16UiFVr1ETl7hMBqtuAKy2FeKrYeBgwpZ4ePQ+E9f3pQrFmdfzhNr4bJ6v3d+OA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d1N/aWGM; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d1N/aWGM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729470219; x=1761006219;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qjhkWipcxl5eBZyU+RQbtUhguwJxfjMkUcxMdxwFbA8=;
  b=d1N/aWGM09DrF9J6zio03O7OFriydxBbDtO8peeSaICmxoqiP2ErP+SR
   XQqAsniYFJJgRA97izOddJuis2QpClP9GYuG2gzyfD51ANp4i9E70SSco
   N9BERHUrNfTXQViIueNkvQBGXM5fJY+Slwh7GrU4opP+Pyny4KMLc5b4/
   X6I8W5M3w2DPGtPPfThis/Bv2CQ2o9VxbbjD062CLFX5iNMkeArGkt1J+
   8fPNGTN3sNTVGP60AfJCkzbo/WnieV2WaNLZi1JE6SlT+jW9FMlNVn10e
   /0hRnXQq5/gaphbNqBS9uarYjdzBVGT66010wLjXJn4Q1ENPoHpduMzTV
   A==;
X-CSE-ConnectionGUID: VnJI5t0tRq2nicVHepUFrw==
X-CSE-MsgGUID: GjnkDcvYR1SRBiRK6LnDkQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11231"; a="46433608"
X-IronPort-AV: E=Sophos;i="6.11,219,1725346800"; 
   d="scan'208";a="46433608"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2024 17:23:38 -0700
X-CSE-ConnectionGUID: c+EA3ypATD+JEYvkVXWtaA==
X-CSE-MsgGUID: pvnY6S5aQbCvvCiAawK4tA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,219,1725346800"; 
   d="scan'208";a="79381700"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 20 Oct 2024 17:23:37 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2gCt-000Qvf-0t;
	Mon, 21 Oct 2024 00:23:35 +0000
Date: Mon, 21 Oct 2024 08:23:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/powerpc/kexec/vmcore_info.c:14 arch_crash_save_vmcoreinfo()
 warn: argument 3 to %lx specifier is cast from pointer
Message-ID: <202410210844.7Bsv9sqH-lkp@intel.com>
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
TO: Baoquan He <bhe@redhat.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d7f513ae7b108f953cceec8bc96d2e5e83c3ccd0
commit: 199da8714c8f4c45f46509c5eb188f5551404574 arch, crash: move arch_crash_save_vmcoreinfo() out to file vmcore_info.c
date:   8 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 8 months ago
config: powerpc-randconfig-r072-20241021 (https://download.01.org/0day-ci/archive/20241021/202410210844.7Bsv9sqH-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410210844.7Bsv9sqH-lkp@intel.com/

New smatch warnings:
arch/powerpc/kexec/vmcore_info.c:14 arch_crash_save_vmcoreinfo() warn: argument 3 to %lx specifier is cast from pointer

Old smatch warnings:
arch/powerpc/kexec/vmcore_info.c:27 arch_crash_save_vmcoreinfo() warn: argument 3 to %lx specifier is cast from pointer
arch/powerpc/include/asm/mmu.h:229 early_mmu_has_feature() warn: bitwise AND condition is false here

vim +14 arch/powerpc/kexec/vmcore_info.c

199da8714c8f4c Baoquan He 2024-01-29   8  
199da8714c8f4c Baoquan He 2024-01-29   9  #ifdef CONFIG_NUMA
199da8714c8f4c Baoquan He 2024-01-29  10  	VMCOREINFO_SYMBOL(node_data);
199da8714c8f4c Baoquan He 2024-01-29  11  	VMCOREINFO_LENGTH(node_data, MAX_NUMNODES);
199da8714c8f4c Baoquan He 2024-01-29  12  #endif
199da8714c8f4c Baoquan He 2024-01-29  13  #ifndef CONFIG_NUMA
199da8714c8f4c Baoquan He 2024-01-29 @14  	VMCOREINFO_SYMBOL(contig_page_data);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
