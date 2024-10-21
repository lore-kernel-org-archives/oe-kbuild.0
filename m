Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80E491F9A85
	for <oe-kbuild@lists.linux.dev>; Mon, 21 Oct 2024 14:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729522293; cv=none; b=mC10dDSp0cIO1LGHQEFUPAqcAIYYxw6CzT6+WKa333ffSqdMmnDhCeZUPV+4Pq7cv4MDdUgovZnryLYIFSfLGNOvcaX652l4G1q4j2T65nzyeVeYrmK5GbqN6E0XN9W96ia688beKxTyqll021nVJUc+6VZI4Z54EMZR9jbJnXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729522293; c=relaxed/simple;
	bh=GoYgr8fZN6NLLwHKwByxVsFn1twMaUJhzO7T12aRHMQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jZOnutEL7cJZvm25fI/eJ22V8LYKHhBLxP987zXenN+MaheRITHaHE9hPJczUbQX63i9tVkiEVe9jdJ9z711w0ExA0wyShBvLBi5aBfExcvKm/bAxR176O6fCqk6z5Gxg8X2LJGJg+M2MIwSffBmyoRAUPMZ3xfLO3wtGw7FdXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ya8ftj4R; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ya8ftj4R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729522292; x=1761058292;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GoYgr8fZN6NLLwHKwByxVsFn1twMaUJhzO7T12aRHMQ=;
  b=Ya8ftj4RfObNMt6W+eNlc1Tc6MmVniAiAQuzTnqWBScS4Trqg1d4NAGr
   2LKyJjsTaUNJO+hEjKHZ2Ebf+39vaF1vDS6m/sRJ+b8o7m6JCEQnQbJvd
   sbMz55kJ2by1vE0o2bxan3FPGbxiARa3ji5q0rvthGlpd6wIPZ4AMpJUK
   MXZkyHCQqgX2BMbABdWytfE4WNBDmN+viL0sDRqnTCUI/pEHY0pQIkFCQ
   T1tyA4f/LonmVJQc1DfzJ2EmRDdofniAiU1MM1aqMva6vn2r4BmmUJV45
   VZdZdviIKtA7aZTEpFwSzRR5t72o5RumE0mjXCchKnu99ngvXYwpTjR5T
   g==;
X-CSE-ConnectionGUID: oL8GysdbQpW3NviDpg3XHw==
X-CSE-MsgGUID: g1gCEVLETL62ypjpC1WV/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="32693746"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="32693746"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2024 07:51:32 -0700
X-CSE-ConnectionGUID: S6p3C8wcRmGHhq8+7qIB4w==
X-CSE-MsgGUID: Ak/UEenMSoyRAGWTul15VA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,221,1725346800"; 
   d="scan'208";a="84162480"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 21 Oct 2024 07:51:29 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2tkl-000SIm-22;
	Mon, 21 Oct 2024 14:51:27 +0000
Date: Mon, 21 Oct 2024 22:50:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/firmware/efi/libstub/smbios.c:45 efi_get_smbios_record()
 error: uninitialized symbol 'smbios'.
Message-ID: <202410212210.JvLBzzEG-lkp@intel.com>
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
TO: Ard Biesheuvel <ardb@kernel.org>
CC: Lukas Wunner <lukas@wunner.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   42f7652d3eb527d03665b09edac47f85fb600924
commit: cd6193877c603f4b0c3c7e5607ffa3d52815403f x86/efistub: Enable SMBIOS protocol handling for x86
date:   4 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 4 months ago
config: x86_64-randconfig-r072-20241021 (https://download.01.org/0day-ci/archive/20241021/202410212210.JvLBzzEG-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410212210.JvLBzzEG-lkp@intel.com/

smatch warnings:
drivers/firmware/efi/libstub/smbios.c:45 efi_get_smbios_record() error: uninitialized symbol 'smbios'.
drivers/firmware/efi/libstub/smbios.c:48 efi_get_smbios_record() error: uninitialized symbol 'record'.

vim +/smbios +45 drivers/firmware/efi/libstub/smbios.c

550b33cfd44529 Ard Biesheuvel 2022-11-10  35  
eb684408f3ea48 Ard Biesheuvel 2023-02-28  36  const struct efi_smbios_record *efi_get_smbios_record(u8 type)
550b33cfd44529 Ard Biesheuvel 2022-11-10  37  {
550b33cfd44529 Ard Biesheuvel 2022-11-10  38  	struct efi_smbios_record *record;
550b33cfd44529 Ard Biesheuvel 2022-11-10  39  	efi_smbios_protocol_t *smbios;
550b33cfd44529 Ard Biesheuvel 2022-11-10  40  	efi_status_t status;
550b33cfd44529 Ard Biesheuvel 2022-11-10  41  	u16 handle = 0xfffe;
550b33cfd44529 Ard Biesheuvel 2022-11-10  42  
550b33cfd44529 Ard Biesheuvel 2022-11-10  43  	status = efi_bs_call(locate_protocol, &EFI_SMBIOS_PROTOCOL_GUID, NULL,
550b33cfd44529 Ard Biesheuvel 2022-11-10  44  			     (void **)&smbios) ?:
550b33cfd44529 Ard Biesheuvel 2022-11-10 @45  		 efi_call_proto(smbios, get_next, &handle, &type, &record, NULL);
550b33cfd44529 Ard Biesheuvel 2022-11-10  46  	if (status != EFI_SUCCESS)
550b33cfd44529 Ard Biesheuvel 2022-11-10  47  		return NULL;
eb684408f3ea48 Ard Biesheuvel 2023-02-28 @48  	return record;
eb684408f3ea48 Ard Biesheuvel 2023-02-28  49  }
eb684408f3ea48 Ard Biesheuvel 2023-02-28  50  

:::::: The code at line 45 was first introduced by commit
:::::: 550b33cfd445296868a478e8413ffb2e963eed32 arm64: efi: Force the use of SetVirtualAddressMap() on Altra machines

:::::: TO: Ard Biesheuvel <ardb@kernel.org>
:::::: CC: Ard Biesheuvel <ardb@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
