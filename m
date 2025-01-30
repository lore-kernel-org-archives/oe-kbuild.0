Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B37A1E2853
	for <oe-kbuild@lists.linux.dev>; Thu, 30 Jan 2025 15:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738249634; cv=none; b=K3MqXBZ5jukXli86dg2YhUakuI+r3OKAH8uOR/vNLKJ3CwwLP0Pp+64OHFg7PE3s1re8iOW+yTR4LajePxYnbD8+n1uittBSGXrGi/NZoJR4i0lLMOdbZe6qUvy3aHwRbZdRijvWXcESSsbYbZR3JJu1lfl8MnFALSaSFhTiBd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738249634; c=relaxed/simple;
	bh=vA3wwu+icviCkffcmfjP6tKQa66lMFK9MVWy+RkKh2k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cEmyN3DdQoyAauUAnp3Q4BVpuBlKo9t419WxVhH2tfIfPOv89fduSHAaFyRXKpQvlsfpEnKSt8iAIGpUrL90ICBvvqx8/C8lH2fi9InymsX79PYTwDUUDC9+S8Su4TaFij3tQ9BqBXKU/CBab9rgCoP3LcRFaiY85qMjpebaOZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZO0tc9nG; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZO0tc9nG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738249632; x=1769785632;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vA3wwu+icviCkffcmfjP6tKQa66lMFK9MVWy+RkKh2k=;
  b=ZO0tc9nGPnTG5pMPsV6D657L9TPmpJcNyb8BhpLVcKOg7bh3LyCIlBk1
   HOFpXyWiki2EkB1NWrF5ldQOklRG2LyXWDKSpy905loJJZyKAKtJp71BA
   39D23WB/AWR2gnpBgM7fTCwW4iWht1js2ARe7qK6H3LC3O0DPVtxsfQ6s
   oUfbyMI+WeK1Hbunr4Vx3UaAyol2a1fZb5Ix9D8ClMwfI6VPAhb77/oRY
   DX9iN2YjXcaVaTWELohJQkFUkBkP+kvhJ3Ey26uK6Ts80iazwIyDZ06y6
   c1c4qZkIfgKjkSGp2/lagGsRSpxNomUGorErz0LVFd03j9khUWIUxGFDW
   Q==;
X-CSE-ConnectionGUID: P7sVln8IQsauHexIcGW9nw==
X-CSE-MsgGUID: AuYeduRZT/C5ZFp7LYlDjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="42720749"
X-IronPort-AV: E=Sophos;i="6.13,245,1732608000"; 
   d="scan'208";a="42720749"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2025 07:07:01 -0800
X-CSE-ConnectionGUID: HKMhfZmXSf+W5bS3wg2QTA==
X-CSE-MsgGUID: 0vxc+7BNSsaegxhFPHzFyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="109202270"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 30 Jan 2025 07:06:58 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tdW87-000kaf-33;
	Thu, 30 Jan 2025 15:06:55 +0000
Date: Thu, 30 Jan 2025 23:06:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [jpoimboe:sframe-v4 26/39] kernel/unwind/sframe.c:186 __read_fre()
 warn: missing unwind goto?
Message-ID: <202501302321.34yRQ2TA-lkp@intel.com>
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
TO: Josh Poimboeuf <jpoimboe@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git sframe-v4
head:   c2278b51a03bf15c71a4af359e1f65606692f033
commit: 990b28ae7855b67c5e6d6385b9de78ffa336dd73 [26/39] unwind_user/sframe: Enable debugging in uaccess regions
:::::: branch date: 9 days ago
:::::: commit date: 9 days ago
config: x86_64-randconfig-r071-20250126 (https://download.01.org/0day-ci/archive/20250130/202501302321.34yRQ2TA-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202501302321.34yRQ2TA-lkp@intel.com/

smatch warnings:
kernel/unwind/sframe.c:186 __read_fre() warn: missing unwind goto?

vim +186 kernel/unwind/sframe.c

77c0d1ec143bf2 Josh Poimboeuf 2024-12-23  157  
77c0d1ec143bf2 Josh Poimboeuf 2024-12-23  158  static __always_inline int __read_fre(struct sframe_section *sec,
77c0d1ec143bf2 Josh Poimboeuf 2024-12-23  159  				      struct sframe_fde *fde,
77c0d1ec143bf2 Josh Poimboeuf 2024-12-23  160  				      unsigned long fre_addr,
77c0d1ec143bf2 Josh Poimboeuf 2024-12-23  161  				      struct sframe_fre *fre)
77c0d1ec143bf2 Josh Poimboeuf 2024-12-23  162  {
77c0d1ec143bf2 Josh Poimboeuf 2024-12-23  163  	unsigned char fde_type = SFRAME_FUNC_FDE_TYPE(fde->info);
77c0d1ec143bf2 Josh Poimboeuf 2024-12-23  164  	unsigned char fre_type = SFRAME_FUNC_FRE_TYPE(fde->info);
77c0d1ec143bf2 Josh Poimboeuf 2024-12-23  165  	unsigned char offset_count, offset_size;
77c0d1ec143bf2 Josh Poimboeuf 2024-12-23  166  	s32 ip_off, cfa_off, ra_off, fp_off;
77c0d1ec143bf2 Josh Poimboeuf 2024-12-23  167  	unsigned long cur = fre_addr;
77c0d1ec143bf2 Josh Poimboeuf 2024-12-23  168  	unsigned char addr_size;
77c0d1ec143bf2 Josh Poimboeuf 2024-12-23  169  	u8 info;
77c0d1ec143bf2 Josh Poimboeuf 2024-12-23  170  
77c0d1ec143bf2 Josh Poimboeuf 2024-12-23  171  	addr_size = fre_type_to_size(fre_type);
990b28ae7855b6 Josh Poimboeuf 2025-01-16  172  	if (!addr_size) {
990b28ae7855b6 Josh Poimboeuf 2025-01-16  173  		dbg_sec_uaccess("bad addr_size in fde info %u\n", fde->info);
77c0d1ec143bf2 Josh Poimboeuf 2024-12-23  174  		return -EFAULT;
990b28ae7855b6 Josh Poimboeuf 2025-01-16  175  	}
77c0d1ec143bf2 Josh Poimboeuf 2024-12-23  176  
990b28ae7855b6 Josh Poimboeuf 2025-01-16  177  	if (fre_addr + addr_size + 1 > sec->fres_end) {
990b28ae7855b6 Josh Poimboeuf 2025-01-16  178  		dbg_sec_uaccess("fre addr+info goes past end of subsection\n");
77c0d1ec143bf2 Josh Poimboeuf 2024-12-23  179  		return -EFAULT;
990b28ae7855b6 Josh Poimboeuf 2025-01-16  180  	}
77c0d1ec143bf2 Josh Poimboeuf 2024-12-23  181  
77c0d1ec143bf2 Josh Poimboeuf 2024-12-23  182  	UNSAFE_GET_USER_INC(ip_off, cur, addr_size, Efault);
990b28ae7855b6 Josh Poimboeuf 2025-01-16  183  	if (fde_type == SFRAME_FDE_TYPE_PCINC && ip_off > fde->func_size) {
990b28ae7855b6 Josh Poimboeuf 2025-01-16  184  		dbg_sec_uaccess("fre starts past end of function: ip_off=0x%x, func_size=0x%x\n",
990b28ae7855b6 Josh Poimboeuf 2025-01-16  185  				ip_off, fde->func_size);
77c0d1ec143bf2 Josh Poimboeuf 2024-12-23 @186  		return -EFAULT;
990b28ae7855b6 Josh Poimboeuf 2025-01-16  187  	}
77c0d1ec143bf2 Josh Poimboeuf 2024-12-23  188  
77c0d1ec143bf2 Josh Poimboeuf 2024-12-23  189  	UNSAFE_GET_USER_INC(info, cur, 1, Efault);
77c0d1ec143bf2 Josh Poimboeuf 2024-12-23  190  	offset_count = SFRAME_FRE_OFFSET_COUNT(info);
77c0d1ec143bf2 Josh Poimboeuf 2024-12-23  191  	offset_size  = offset_size_enum_to_size(SFRAME_FRE_OFFSET_SIZE(info));
990b28ae7855b6 Josh Poimboeuf 2025-01-16  192  	if (!offset_count || !offset_size) {
990b28ae7855b6 Josh Poimboeuf 2025-01-16  193  		dbg_sec_uaccess("zero offset_count or size in fre info %u\n",info);
77c0d1ec143bf2 Josh Poimboeuf 2024-12-23  194  		return -EFAULT;
990b28ae7855b6 Josh Poimboeuf 2025-01-16  195  	}
990b28ae7855b6 Josh Poimboeuf 2025-01-16  196  	if (cur + (offset_count * offset_size) > sec->fres_end) {
990b28ae7855b6 Josh Poimboeuf 2025-01-16  197  		dbg_sec_uaccess("fre goes past end of subsection\n");
77c0d1ec143bf2 Josh Poimboeuf 2024-12-23  198  		return -EFAULT;
990b28ae7855b6 Josh Poimboeuf 2025-01-16  199  	}
77c0d1ec143bf2 Josh Poimboeuf 2024-12-23  200  
77c0d1ec143bf2 Josh Poimboeuf 2024-12-23  201  	fre->size = addr_size + 1 + (offset_count * offset_size);
77c0d1ec143bf2 Josh Poimboeuf 2024-12-23  202  
77c0d1ec143bf2 Josh Poimboeuf 2024-12-23  203  	UNSAFE_GET_USER_INC(cfa_off, cur, offset_size, Efault);
77c0d1ec143bf2 Josh Poimboeuf 2024-12-23  204  	offset_count--;
77c0d1ec143bf2 Josh Poimboeuf 2024-12-23  205  
77c0d1ec143bf2 Josh Poimboeuf 2024-12-23  206  	ra_off = sec->ra_off;
77c0d1ec143bf2 Josh Poimboeuf 2024-12-23  207  	if (!ra_off) {
990b28ae7855b6 Josh Poimboeuf 2025-01-16  208  		if (!offset_count--) {
990b28ae7855b6 Josh Poimboeuf 2025-01-16  209  			dbg_sec_uaccess("zero offset_count, can't find ra_off\n");
77c0d1ec143bf2 Josh Poimboeuf 2024-12-23  210  			return -EFAULT;
990b28ae7855b6 Josh Poimboeuf 2025-01-16  211  		}
77c0d1ec143bf2 Josh Poimboeuf 2024-12-23  212  
77c0d1ec143bf2 Josh Poimboeuf 2024-12-23  213  		UNSAFE_GET_USER_INC(ra_off, cur, offset_size, Efault);
77c0d1ec143bf2 Josh Poimboeuf 2024-12-23  214  	}
77c0d1ec143bf2 Josh Poimboeuf 2024-12-23  215  
77c0d1ec143bf2 Josh Poimboeuf 2024-12-23  216  	fp_off = sec->fp_off;
77c0d1ec143bf2 Josh Poimboeuf 2024-12-23  217  	if (!fp_off && offset_count) {
77c0d1ec143bf2 Josh Poimboeuf 2024-12-23  218  		offset_count--;
77c0d1ec143bf2 Josh Poimboeuf 2024-12-23  219  		UNSAFE_GET_USER_INC(fp_off, cur, offset_size, Efault);
77c0d1ec143bf2 Josh Poimboeuf 2024-12-23  220  	}
77c0d1ec143bf2 Josh Poimboeuf 2024-12-23  221  
990b28ae7855b6 Josh Poimboeuf 2025-01-16  222  	if (offset_count) {
990b28ae7855b6 Josh Poimboeuf 2025-01-16  223  		dbg_sec_uaccess("non-zero offset_count after reading fre\n");
77c0d1ec143bf2 Josh Poimboeuf 2024-12-23  224  		return -EFAULT;
990b28ae7855b6 Josh Poimboeuf 2025-01-16  225  	}
77c0d1ec143bf2 Josh Poimboeuf 2024-12-23  226  
77c0d1ec143bf2 Josh Poimboeuf 2024-12-23  227  	fre->ip_off		= ip_off;
77c0d1ec143bf2 Josh Poimboeuf 2024-12-23  228  	fre->cfa_off		= cfa_off;
77c0d1ec143bf2 Josh Poimboeuf 2024-12-23  229  	fre->ra_off		= ra_off;
77c0d1ec143bf2 Josh Poimboeuf 2024-12-23  230  	fre->fp_off		= fp_off;
77c0d1ec143bf2 Josh Poimboeuf 2024-12-23  231  	fre->info		= info;
77c0d1ec143bf2 Josh Poimboeuf 2024-12-23  232  
77c0d1ec143bf2 Josh Poimboeuf 2024-12-23  233  	return 0;
77c0d1ec143bf2 Josh Poimboeuf 2024-12-23  234  
77c0d1ec143bf2 Josh Poimboeuf 2024-12-23  235  Efault:
990b28ae7855b6 Josh Poimboeuf 2025-01-16  236  	dbg_sec_uaccess("fre usercopy failed\n");
77c0d1ec143bf2 Josh Poimboeuf 2024-12-23  237  	return -EFAULT;
77c0d1ec143bf2 Josh Poimboeuf 2024-12-23  238  }
77c0d1ec143bf2 Josh Poimboeuf 2024-12-23  239  

:::::: The code at line 186 was first introduced by commit
:::::: 77c0d1ec143bf2a53d66c4ecb190e7e0a576fbfd unwind_user/sframe: Add support for reading .sframe contents

:::::: TO: Josh Poimboeuf <jpoimboe@kernel.org>
:::::: CC: Josh Poimboeuf <jpoimboe@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
