Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E80233594A
	for <oe-kbuild@lists.linux.dev>; Thu, 28 Aug 2025 02:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756349045; cv=none; b=TqWkgey5GEeMUrf20fFxNnJ3nmb8uCZbnywoHIVwgePNnvlireHF6DGTAl08KQs3wTTTqZ4hxOvi8BEax8QX9rbr+m1I7R6CEYMy+BUbT1XdCZlKPIT6Eg67tqj8n6+HCzMUzt091/Nc3p4exl40UUPM6diY+2zjHgklG8k2GP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756349045; c=relaxed/simple;
	bh=gBG9/pUUxQnE7vD2g1o5N9LMng2pQN6ReXIRUiWPx78=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KwTlW1jFKIFTJnJYC6Ni5XklOTGCUMs/YeheUemrRMdmZGencViZijHXr9Y6bsvJv7EH312UdCx2AxKU9j5HxIuV6V3XtS9IOjsxi8n5bppwU75KvAjkTWnY8mUvVd2g3Y5zrYoNFFGkfyfGhOT4N6b1ULdBosfJ6EFg+ywQwhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kBGLNgiz; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kBGLNgiz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756349043; x=1787885043;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gBG9/pUUxQnE7vD2g1o5N9LMng2pQN6ReXIRUiWPx78=;
  b=kBGLNgizsIpQmM7nJeBJ3OMC8e+06vIOqet9hZubgU3Ur+7AjAH0mBBa
   Au/F+r6WUdknZHTcZI244cNeFJdeOjQboih5TSxJuOlvpbYrQM8sccbMe
   yeLLJrdXYFCCTxbGrYqqUXrcpMD74CnTyfh8/WzOGAUXFx9kbfASoKaTo
   olcsXozyWhw0EhaJulfB1MbDDFnxpYjUN0N8tey7DHpk8ikv6NX1qdGjB
   L8FByieMKDgftuUgCYD8VuH+8G4ZoACmde/7P/2bBsZBCgYF0QF3NJCeV
   3nKnILzgZfJFPIQVVvLgBjPidNK+nvqsvl5IRYNrFUbMPr5VhtgKXd7iz
   Q==;
X-CSE-ConnectionGUID: i2MmOJKaQvSL7SJDzli6Tw==
X-CSE-MsgGUID: sw/gAxYDRY2hl214euAuTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11535"; a="61244620"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; 
   d="scan'208";a="61244620"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2025 19:44:01 -0700
X-CSE-ConnectionGUID: WNHv1jK3RTSKUxmCj1E+fQ==
X-CSE-MsgGUID: DAWh8LDpTMqI1P44a5CoQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; 
   d="scan'208";a="170804859"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 27 Aug 2025 19:44:00 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1urScH-000TNj-21;
	Thu, 28 Aug 2025 02:43:57 +0000
Date: Thu, 28 Aug 2025 10:41:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2 4/5] LoongArch/kexec_file: Add crash dump support
Message-ID: <202508281014.9xPatJD8-lkp@intel.com>
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
In-Reply-To: <20250820055700.24344-5-youling.tang@linux.dev>
References: <20250820055700.24344-5-youling.tang@linux.dev>
TO: Youling Tang <youling.tang@linux.dev>
TO: Huacai Chen <chenhuacai@kernel.org>
CC: WANG Xuerui <kernel@xen0n.name>
CC: Baoquan He <bhe@redhat.com>
CC: Yao Zi <ziyao@disroot.org>
CC: kexec@lists.infradead.org
CC: loongarch@lists.linux.dev
CC: linux-kernel@vger.kernel.org
CC: youling.tang@linux.dev
CC: Youling Tang <tangyouling@kylinos.cn>

Hi Youling,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.17-rc3 next-20250827]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Youling-Tang/LoongArch-Add-struct-loongarch_image_header-for-kernel-image/20250820-140025
base:   linus/master
patch link:    https://lore.kernel.org/r/20250820055700.24344-5-youling.tang%40linux.dev
patch subject: [PATCH v2 4/5] LoongArch/kexec_file: Add crash dump support
:::::: branch date: 8 days ago
:::::: commit date: 8 days ago
config: loongarch-randconfig-r072-20250825 (https://download.01.org/0day-ci/archive/20250828/202508281014.9xPatJD8-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202508281014.9xPatJD8-lkp@intel.com/

smatch warnings:
arch/loongarch/kernel/machine_kexec_file.c:58 prepare_elf_headers() warn: iterator 'i' not incremented

vim +/i +58 arch/loongarch/kernel/machine_kexec_file.c

11aec169182e3a Youling Tang 2025-08-20  39  
11aec169182e3a Youling Tang 2025-08-20  40  static int prepare_elf_headers(void **addr, unsigned long *sz)
11aec169182e3a Youling Tang 2025-08-20  41  {
11aec169182e3a Youling Tang 2025-08-20  42  	struct crash_mem *cmem;
11aec169182e3a Youling Tang 2025-08-20  43  	unsigned int nr_ranges;
11aec169182e3a Youling Tang 2025-08-20  44  	int ret;
11aec169182e3a Youling Tang 2025-08-20  45  	u64 i;
11aec169182e3a Youling Tang 2025-08-20  46  	phys_addr_t start, end;
11aec169182e3a Youling Tang 2025-08-20  47  
11aec169182e3a Youling Tang 2025-08-20  48  	nr_ranges = 2; /* for exclusion of crashkernel region */
11aec169182e3a Youling Tang 2025-08-20  49  	for_each_mem_range(i, &start, &end)
11aec169182e3a Youling Tang 2025-08-20  50  		nr_ranges++;
11aec169182e3a Youling Tang 2025-08-20  51  
11aec169182e3a Youling Tang 2025-08-20  52  	cmem = kmalloc(struct_size(cmem, ranges, nr_ranges), GFP_KERNEL);
11aec169182e3a Youling Tang 2025-08-20  53  	if (!cmem)
11aec169182e3a Youling Tang 2025-08-20  54  		return -ENOMEM;
11aec169182e3a Youling Tang 2025-08-20  55  
11aec169182e3a Youling Tang 2025-08-20  56  	cmem->max_nr_ranges = nr_ranges;
11aec169182e3a Youling Tang 2025-08-20  57  	cmem->nr_ranges = 0;
11aec169182e3a Youling Tang 2025-08-20 @58  	for_each_mem_range(i, &start, &end) {
11aec169182e3a Youling Tang 2025-08-20  59  		cmem->ranges[cmem->nr_ranges].start = start;
11aec169182e3a Youling Tang 2025-08-20  60  		cmem->ranges[cmem->nr_ranges].end = end - 1;
11aec169182e3a Youling Tang 2025-08-20  61  		cmem->nr_ranges++;
11aec169182e3a Youling Tang 2025-08-20  62  	}
11aec169182e3a Youling Tang 2025-08-20  63  
11aec169182e3a Youling Tang 2025-08-20  64  	/* Exclude crashkernel region */
11aec169182e3a Youling Tang 2025-08-20  65  	ret = crash_exclude_mem_range(cmem, crashk_res.start, crashk_res.end);
11aec169182e3a Youling Tang 2025-08-20  66  	if (ret)
11aec169182e3a Youling Tang 2025-08-20  67  		goto out;
11aec169182e3a Youling Tang 2025-08-20  68  
11aec169182e3a Youling Tang 2025-08-20  69  	if (crashk_low_res.end) {
11aec169182e3a Youling Tang 2025-08-20  70  		ret = crash_exclude_mem_range(cmem, crashk_low_res.start, crashk_low_res.end);
11aec169182e3a Youling Tang 2025-08-20  71  		if (ret)
11aec169182e3a Youling Tang 2025-08-20  72  			goto out;
11aec169182e3a Youling Tang 2025-08-20  73  	}
11aec169182e3a Youling Tang 2025-08-20  74  
11aec169182e3a Youling Tang 2025-08-20  75  	ret = crash_prepare_elf64_headers(cmem, true, addr, sz);
11aec169182e3a Youling Tang 2025-08-20  76  
11aec169182e3a Youling Tang 2025-08-20  77  out:
11aec169182e3a Youling Tang 2025-08-20  78  	kfree(cmem);
11aec169182e3a Youling Tang 2025-08-20  79  	return ret;
11aec169182e3a Youling Tang 2025-08-20  80  }
11aec169182e3a Youling Tang 2025-08-20  81  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
