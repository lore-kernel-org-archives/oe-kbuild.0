Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61BD01AA78D
	for <oe-kbuild@lists.linux.dev>; Mon, 14 Oct 2024 16:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728921656; cv=none; b=TXR6h8tNfmuoGY/2qCO3poWkXYaqXx3olJrzVjrV3YUkIYMUxy2N5JjWSraNC2IbMQSJaKKKaUHG+WFfK5QprF/GGfTiAU4j0ttAhM+sqAgy1G/yDEoi5enif65Z7+bhKq4n36FmYcv/LwF88OqYKwDQ+oY4VTmZw8LK+9S0F/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728921656; c=relaxed/simple;
	bh=Hr6dbpn7IzmHUlhPww8T3rfUiRA9Njs3P+7FNV01al4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IstDffOT6Vc++2K1yJz5NopfdTiwKY7rvtU1+rzl3GfB1fbNaiZS3ye0Qn9zjgsDxwU9HDBXARRa9qDJoJXgZouRIrN3PxSoUiqzMMxWoAqc26ikVPC2fFnrg73acvEBAfZfHmoih5p/jcd/DQW+IXSbsFU0ZIVoLGLlJehNL6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YZgGO72q; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YZgGO72q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728921654; x=1760457654;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Hr6dbpn7IzmHUlhPww8T3rfUiRA9Njs3P+7FNV01al4=;
  b=YZgGO72qiqCj27EJAf/SkO3/cZqJ8xuHANunlofmQ2IIHWS2wYom4tIK
   ZtClaszxHUv0w5+f75Pf8YYKig1Waeb1pzCyrXWs8pF+2PPFzjPIQfIC8
   20+9Jgwgri7Lqmza7NfPnlrnQTongQ4T9bcuJOQjPgqxtZ6tkqAeYkkV7
   c4VT+kgdlB6oifyi+wzVFiaqrkyY5YnZvgrKvlqWORmxmJmNMVAIGJukw
   0GilSRTdYJ4d21UKryYEMBYWGUTtUvi6XnZ+5c5JpHbsKY4NeScJEJBbU
   /GoJTsIeGI2bCtsXqLxcPxTxeJlbdHnR4++zssgLdJutbM1YRFIvopjJN
   A==;
X-CSE-ConnectionGUID: 2wpf/ZSxS0Kz4pockru2OA==
X-CSE-MsgGUID: FnXlIGKkRKKm8bMX8l0xxw==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="45787218"
X-IronPort-AV: E=Sophos;i="6.11,203,1725346800"; 
   d="scan'208";a="45787218"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 09:00:54 -0700
X-CSE-ConnectionGUID: JIeFRRCRRVKz4vH/HCGiWg==
X-CSE-MsgGUID: kdTG627EQY2id53h1MvX8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,203,1725346800"; 
   d="scan'208";a="77236157"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 14 Oct 2024 09:00:52 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t0NV4-000Grf-1L;
	Mon, 14 Oct 2024 16:00:50 +0000
Date: Tue, 15 Oct 2024 00:00:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 20/28] x86: vdso: Split virtual clock pages into
 dedicated mapping
Message-ID: <202410142358.La4ar8Lr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20241010-vdso-generic-base-v1-20-b64f0842d512@linutronix.de>
References: <20241010-vdso-generic-base-v1-20-b64f0842d512@linutronix.de>
TO: "Thomas Weiﬂschuh" <thomas.weissschuh@linutronix.de>

Hi Thomas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 8cf0b93919e13d1e8d4466eb4080a4c4d9d66d7b]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Wei-schuh/csky-vdso-Remove-gettimeofday-and-friends-from-VDSO/20241010-150622
base:   8cf0b93919e13d1e8d4466eb4080a4c4d9d66d7b
patch link:    https://lore.kernel.org/r/20241010-vdso-generic-base-v1-20-b64f0842d512%40linutronix.de
patch subject: [PATCH 20/28] x86: vdso: Split virtual clock pages into dedicated mapping
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: i386-randconfig-141-20241014 (https://download.01.org/0day-ci/archive/20241014/202410142358.La4ar8Lr-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410142358.La4ar8Lr-lkp@intel.com/

smatch warnings:
arch/x86/entry/vdso/vma.c:199 vvar_vclock_fault() warn: statement has no effect 3

vim +199 arch/x86/entry/vdso/vma.c

a48a7042613eb1 Andy Lutomirski  2015-12-29  192  
f7261994be964c Thomas Weiﬂschuh 2024-10-10  193  static vm_fault_t vvar_vclock_fault(const struct vm_special_mapping *sm,
f7261994be964c Thomas Weiﬂschuh 2024-10-10  194  				    struct vm_area_struct *vma, struct vm_fault *vmf)
f7261994be964c Thomas Weiﬂschuh 2024-10-10  195  {
f7261994be964c Thomas Weiﬂschuh 2024-10-10  196  	switch (vmf->pgoff) {
f7261994be964c Thomas Weiﬂschuh 2024-10-10  197  #ifdef CONFIG_PARAVIRT_CLOCK
f7261994be964c Thomas Weiﬂschuh 2024-10-10  198  	case VDSO_PAGE_PVCLOCK_OFFSET:
f7261994be964c Thomas Weiﬂschuh 2024-10-10 @199  		struct pvclock_vsyscall_time_info *pvti =
f7261994be964c Thomas Weiﬂschuh 2024-10-10  200  			pvclock_get_pvti_cpu0_va();
f7261994be964c Thomas Weiﬂschuh 2024-10-10  201  		if (pvti && vclock_was_used(VDSO_CLOCKMODE_PVCLOCK))
f7261994be964c Thomas Weiﬂschuh 2024-10-10  202  			return vmf_insert_pfn_prot(vma, vmf->address,
f7261994be964c Thomas Weiﬂschuh 2024-10-10  203  					__pa(pvti) >> PAGE_SHIFT,
f7261994be964c Thomas Weiﬂschuh 2024-10-10  204  					pgprot_decrypted(vma->vm_page_prot));
f7261994be964c Thomas Weiﬂschuh 2024-10-10  205  		break;
f7261994be964c Thomas Weiﬂschuh 2024-10-10  206  #endif /* CONFIG_PARAVIRT_CLOCK */
f7261994be964c Thomas Weiﬂschuh 2024-10-10  207  #ifdef CONFIG_HYPERV_TIMER
f7261994be964c Thomas Weiﬂschuh 2024-10-10  208  	case VDSO_PAGE_HVCLOCK_OFFSET:
f7261994be964c Thomas Weiﬂschuh 2024-10-10  209  		unsigned long pfn = hv_get_tsc_pfn();
f7261994be964c Thomas Weiﬂschuh 2024-10-10  210  
f7261994be964c Thomas Weiﬂschuh 2024-10-10  211  		if (pfn && vclock_was_used(VDSO_CLOCKMODE_HVCLOCK))
f7261994be964c Thomas Weiﬂschuh 2024-10-10  212  			return vmf_insert_pfn(vma, vmf->address, pfn);
f7261994be964c Thomas Weiﬂschuh 2024-10-10  213  		break;
f7261994be964c Thomas Weiﬂschuh 2024-10-10  214  #endif /* CONFIG_HYPERV_TIMER */
f7261994be964c Thomas Weiﬂschuh 2024-10-10  215  	}
f7261994be964c Thomas Weiﬂschuh 2024-10-10  216  
f7261994be964c Thomas Weiﬂschuh 2024-10-10  217  	return VM_FAULT_SIGBUS;
f7261994be964c Thomas Weiﬂschuh 2024-10-10  218  }
f7261994be964c Thomas Weiﬂschuh 2024-10-10  219  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
