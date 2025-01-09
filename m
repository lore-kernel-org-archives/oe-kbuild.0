Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FED5215F71
	for <oe-kbuild@lists.linux.dev>; Thu,  9 Jan 2025 10:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736418613; cv=none; b=UPTHTpOu67WyupYaFE35ztEd/r7aGmNFCE8epl7apQHBqjPgifeKcfHGGA4VyK8eeeGKf4iZeTo7ry4ayyhTyvUdNCAe9Rynz13qf0magnvrKfjgXkd+oeQ4kFV2jV7hHAC7J5xe/LjTgoZD0B2Awujx5gk9L/Znci9S7dEpuMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736418613; c=relaxed/simple;
	bh=63tHFZMIKGBXasO+LYUlrUs9lWtARYPczHQ4xd5ewAQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eCELcn5k862jEgSM7RVuzhmXNelHQxYqVolHIr1obXDtFIWUFywXZuzG8ysHNRZGJMQ1H3LCF+LvJ4/V6w70I5yT4obc1OC5hb560GIDaSS1z2wJQp8TNyGTTgqhpesr7d/+CIQ9/c7rf/PHM+Uet5drPFpzGW6K3R9e5ZNDuTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dRAyseiw; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dRAyseiw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736418611; x=1767954611;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=63tHFZMIKGBXasO+LYUlrUs9lWtARYPczHQ4xd5ewAQ=;
  b=dRAyseiwp+YF9R3fvG0oBuOOI9hYezEFvVDhZHaWj04mDL5B5AD3/iZg
   watk/gONclXgps84HfQvvKhn3oF2GTOLn/IrVxa/efE4hz2waKfU2/Z/6
   +h2+4ids/mv6UJgN3mAfhSejoNIUJez9PgX3fYF3Dg8XzyHa/FyA4B183
   pZP7C3/sXNj9wvLRa0ydpPL1ForE7AMV/FhXVGLheRJUREKNHeu1hRhsM
   Nuiql+XywFjbOLd06pzdvSiV88rZhuP+iBLNjJ07IwAdnw4lwPvprTzQP
   jxfFlIaJztEXIHRBc6tYoz6tVBBl6nBjYhGTGbu/q3LyntkvvpWAkZEbd
   w==;
X-CSE-ConnectionGUID: 2JuGvSaBQsmPReqfw465DQ==
X-CSE-MsgGUID: QqsZxMUaSjCf0in2Fwakzw==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="36835156"
X-IronPort-AV: E=Sophos;i="6.12,301,1728975600"; 
   d="scan'208";a="36835156"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 02:30:10 -0800
X-CSE-ConnectionGUID: aPREyWyATYGwFRdqUbJhJA==
X-CSE-MsgGUID: cZSGJrKXQgyKFDjHl34wLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="104245077"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 09 Jan 2025 02:30:10 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVpni-000HNv-1t;
	Thu, 09 Jan 2025 10:30:06 +0000
Date: Thu, 9 Jan 2025 18:29:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 5884/7509] drivers/firmware/efi/libstub/gop.c:529
 efi_setup_gop() error: uninitialized symbol 'num'.
Message-ID: <202501091819.a77qQQAl-lkp@intel.com>
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
head:   6ecd20965bdc21b265a0671ccf36d9ad8043f5ab
commit: 9e45f9e16bc4d8fa963399808463d0f478e01911 [5884/7509] efi/libstub: Simplify GOP handling code
:::::: branch date: 5 hours ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-161-20250109 (https://download.01.org/0day-ci/archive/20250109/202501091819.a77qQQAl-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202501091819.a77qQQAl-lkp@intel.com/

New smatch warnings:
drivers/firmware/efi/libstub/gop.c:529 efi_setup_gop() error: uninitialized symbol 'num'.

Old smatch warnings:
drivers/firmware/efi/libstub/gop.c:164 choose_mode_modenum() error: uninitialized symbol 'info'.
drivers/firmware/efi/libstub/gop.c:340 choose_mode_list() error: uninitialized symbol 'info'.
drivers/firmware/efi/libstub/gop.c:486 find_gop() error: uninitialized symbol 'gop'.
drivers/firmware/efi/libstub/gop.c:486 find_gop() error: uninitialized symbol 'gop'.

vim +/num +529 drivers/firmware/efi/libstub/gop.c

ecf53091f34af7 Arvind Sankar  2020-03-19  513  
9e45f9e16bc4d8 Ard Biesheuvel 2024-12-19  514  efi_status_t efi_setup_gop(struct screen_info *si)
ecf53091f34af7 Arvind Sankar  2020-03-19  515  {
9e45f9e16bc4d8 Ard Biesheuvel 2024-12-19  516  	efi_handle_t *handles __free(efi_pool) = NULL;
ecf53091f34af7 Arvind Sankar  2020-03-19  517  	efi_graphics_output_protocol_mode_t *mode;
e484c594ba0e34 Arvind Sankar  2020-03-19  518  	efi_graphics_output_mode_info_t *info;
9e45f9e16bc4d8 Ard Biesheuvel 2024-12-19  519  	efi_graphics_output_protocol_t *gop;
9e45f9e16bc4d8 Ard Biesheuvel 2024-12-19  520  	efi_status_t status;
9e45f9e16bc4d8 Ard Biesheuvel 2024-12-19  521  	unsigned long num;
ecf53091f34af7 Arvind Sankar  2020-03-19  522  
9e45f9e16bc4d8 Ard Biesheuvel 2024-12-19  523  	status = efi_bs_call(locate_handle_buffer, EFI_LOCATE_BY_PROTOCOL,
9e45f9e16bc4d8 Ard Biesheuvel 2024-12-19  524  			      &EFI_GRAPHICS_OUTPUT_PROTOCOL_GUID, NULL, &num,
9e45f9e16bc4d8 Ard Biesheuvel 2024-12-19  525  			      &handles);
9e45f9e16bc4d8 Ard Biesheuvel 2024-12-19  526  	if (status != EFI_SUCCESS)
9e45f9e16bc4d8 Ard Biesheuvel 2024-12-19  527  		return status;
ecf53091f34af7 Arvind Sankar  2020-03-19  528  
9e45f9e16bc4d8 Ard Biesheuvel 2024-12-19 @529  	gop = find_gop(num, handles);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
