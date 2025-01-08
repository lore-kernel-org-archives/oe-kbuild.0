Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D6D21F37D9
	for <oe-kbuild@lists.linux.dev>; Wed,  8 Jan 2025 09:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736329314; cv=none; b=WC9m9bh2gnFxW5UOTTTJpslESXDjodSwhQPb0tgVff5x1dF5kEM4wYQUaN6Ui+eFxM51kZkMKOpz704Yh9S8S09uqz4FK7HRFdmgEXz7RJlrZk2XFtKOBxjctHS9kiPR0eUqOZK0S6VyXqfG/iud1Dyj71sryTnHYUqekB2TEP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736329314; c=relaxed/simple;
	bh=Rn5XmaEWqZiQNv+Xfh35V4o31COUBnVPBxFjrX77Skk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lxyCdxwhbo4pRCaB1+ra03vuaB3l/DjlZpoDLEUQ3+EUGt40jxbSW7cZNrMeaJQ141f32ho/4/Bc7gb4Mzfh8D5PjvWYAA2uPsgFbZPZ3mZlogQSpxhR9CVUAXsr3GwpVSXoZdooZJswWLYzMphKojs6N3AgbLFZnxb1nVOypxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eIM1QUAA; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eIM1QUAA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736329312; x=1767865312;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Rn5XmaEWqZiQNv+Xfh35V4o31COUBnVPBxFjrX77Skk=;
  b=eIM1QUAAzohcMdnnmWBszD7YnpM6f0DEzqKjSmc0K0q/Y/ih+DxXqtsf
   IpkuFCNIpObpBK/xa5T24ly6Cqb5NHidrQZtE5y4j+fY7ZoAIPxupA+iI
   Tus8sGs0kNMUDAqkeO0gMraY7FOThiLG8OdT+/JIsNUAGWrESqkutLT01
   Y7OXi1mnEz0b6AVnF6OrRNMmDk+F13XYLBsEhDUfUQ9COvwXcu3j4xzsD
   lREUx7Yp6SVQJ+N8trLyGvfGlHj6jgWNV1Hj6wy5eE3pHXo+YemZS+0Nm
   q/VWoQB2kG0cF7VyXW7FyHnizmKZ+pLk6e5j+VtNA2Bss10dQMyaHvjMh
   A==;
X-CSE-ConnectionGUID: THMBWYp5QZSE8Q9G2+G0WA==
X-CSE-MsgGUID: oLWUU83DTaOhhdt1CEozrw==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="47902855"
X-IronPort-AV: E=Sophos;i="6.12,297,1728975600"; 
   d="scan'208";a="47902855"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2025 01:41:52 -0800
X-CSE-ConnectionGUID: Dkv92JdiTQ+YZixc92fslw==
X-CSE-MsgGUID: ZXQm65HvSrqBa3j/OwiLSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="107071593"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 08 Jan 2025 01:41:49 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVSZP-000Ft5-1M;
	Wed, 08 Jan 2025 09:41:47 +0000
Date: Wed, 8 Jan 2025 17:41:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 6419/6768] drivers/firmware/efi/libstub/gop.c:297
 match_list() error: uninitialized symbol 'depth'.
Message-ID: <202501081723.rUu7Rs85-lkp@intel.com>
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
TO: Ard Biesheuvel <ardb@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   7b4b9bf203da94fbeac75ed3116c84aa03e74578
commit: 5169cdfff5af8a40f4152d19d7fd70320567f2e6 [6419/6768] efi/libstub: Refactor and clean up GOP resolution picker code
:::::: branch date: 28 hours ago
:::::: commit date: 2 days ago
config: i386-randconfig-141-20250108 (https://download.01.org/0day-ci/archive/20250108/202501081723.rUu7Rs85-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202501081723.rUu7Rs85-lkp@intel.com/

smatch warnings:
drivers/firmware/efi/libstub/gop.c:297 match_list() error: uninitialized symbol 'depth'.

vim +/depth +297 drivers/firmware/efi/libstub/gop.c

45d97a749e9fec6 Arvind Sankar  2020-03-28  260  
5169cdfff5af8a4 Ard Biesheuvel 2024-12-20  261  static bool match_list(const efi_graphics_output_mode_info_t *info, u32 mode, void *ctx)
14c574f35cfbc92 Arvind Sankar  2020-05-18  262  {
5169cdfff5af8a4 Ard Biesheuvel 2024-12-20  263  	efi_pixel_bitmask_t pi = info->pixel_information;
5169cdfff5af8a4 Ard Biesheuvel 2024-12-20  264  	u32 cur_mode = (unsigned long)ctx;
5169cdfff5af8a4 Ard Biesheuvel 2024-12-20  265  	int pf = info->pixel_format;
14c574f35cfbc92 Arvind Sankar  2020-05-18  266  	const char *dstr;
14c574f35cfbc92 Arvind Sankar  2020-05-18  267  	bool valid;
5169cdfff5af8a4 Ard Biesheuvel 2024-12-20  268  	u8 depth;
14c574f35cfbc92 Arvind Sankar  2020-05-18  269  
14c574f35cfbc92 Arvind Sankar  2020-05-18  270  	valid = !(pf == PIXEL_BLT_ONLY || pf >= PIXEL_FORMAT_MAX);
5169cdfff5af8a4 Ard Biesheuvel 2024-12-20  271  
14c574f35cfbc92 Arvind Sankar  2020-05-18  272  	switch (pf) {
14c574f35cfbc92 Arvind Sankar  2020-05-18  273  	case PIXEL_RGB_RESERVED_8BIT_PER_COLOR:
14c574f35cfbc92 Arvind Sankar  2020-05-18  274  		dstr = "rgb";
14c574f35cfbc92 Arvind Sankar  2020-05-18  275  		break;
14c574f35cfbc92 Arvind Sankar  2020-05-18  276  	case PIXEL_BGR_RESERVED_8BIT_PER_COLOR:
14c574f35cfbc92 Arvind Sankar  2020-05-18  277  		dstr = "bgr";
14c574f35cfbc92 Arvind Sankar  2020-05-18  278  		break;
14c574f35cfbc92 Arvind Sankar  2020-05-18  279  	case PIXEL_BIT_MASK:
14c574f35cfbc92 Arvind Sankar  2020-05-18  280  		dstr = "";
5169cdfff5af8a4 Ard Biesheuvel 2024-12-20  281  		depth = pixel_bpp(pf, pi);
14c574f35cfbc92 Arvind Sankar  2020-05-18  282  		break;
14c574f35cfbc92 Arvind Sankar  2020-05-18  283  	case PIXEL_BLT_ONLY:
14c574f35cfbc92 Arvind Sankar  2020-05-18  284  		dstr = "blt";
14c574f35cfbc92 Arvind Sankar  2020-05-18  285  		break;
14c574f35cfbc92 Arvind Sankar  2020-05-18  286  	default:
14c574f35cfbc92 Arvind Sankar  2020-05-18  287  		dstr = "xxx";
14c574f35cfbc92 Arvind Sankar  2020-05-18  288  		break;
14c574f35cfbc92 Arvind Sankar  2020-05-18  289  	}
14c574f35cfbc92 Arvind Sankar  2020-05-18  290  
14c574f35cfbc92 Arvind Sankar  2020-05-18  291  	efi_printk("Mode %3u %c%c: Resolution %ux%u-%s%.0hhu\n",
5169cdfff5af8a4 Ard Biesheuvel 2024-12-20  292  		    mode,
5169cdfff5af8a4 Ard Biesheuvel 2024-12-20  293  		    (mode == cur_mode) ? '*' : ' ',
14c574f35cfbc92 Arvind Sankar  2020-05-18  294  		    !valid ? '-' : ' ',
5169cdfff5af8a4 Ard Biesheuvel 2024-12-20  295  		    info->horizontal_resolution,
5169cdfff5af8a4 Ard Biesheuvel 2024-12-20  296  		    info->vertical_resolution,
5169cdfff5af8a4 Ard Biesheuvel 2024-12-20 @297  		    dstr, depth);
5169cdfff5af8a4 Ard Biesheuvel 2024-12-20  298  
5169cdfff5af8a4 Ard Biesheuvel 2024-12-20  299  	return false;
14c574f35cfbc92 Arvind Sankar  2020-05-18  300  }
14c574f35cfbc92 Arvind Sankar  2020-05-18  301  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
