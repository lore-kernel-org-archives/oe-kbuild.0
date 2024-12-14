Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D4DD19993D
	for <oe-kbuild@lists.linux.dev>; Sat, 14 Dec 2024 22:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734215794; cv=none; b=npApdPeajQey1leZ4lfLUsaOXcq0q+RKiXVJ1KSiONeHHXz2kg+hpytKU24qKh/wHQVkPjgTbIKKTjGiZByv6CLEaruAc/sOb7YPYyv230yCX/DHXFyheBbeZPBbr0Q57zZGam17qyuV+XyXNI2t86MJOmrwnG1VdNeOya9Y3uE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734215794; c=relaxed/simple;
	bh=MlXCIyrm+82Na9yQP/5Ubyy+DbD6S6peZzMnDPT0hWk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Aq2PGbeZ0jcXQeANAffid4CqMqjAH9IhNL5zt/Bx4FyCRkj3EojKhMAngA+Vgio11abcz7XNLBYHEwBVH1rBNCh9BeIlytWKOlMnR+HbR73Uvs07VNRECgSbtSouazWaBh4Ggl26Is1R6S93lwmSreDBH2ib6+umauqfsV6soxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a+v1aF5Z; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a+v1aF5Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734215792; x=1765751792;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MlXCIyrm+82Na9yQP/5Ubyy+DbD6S6peZzMnDPT0hWk=;
  b=a+v1aF5ZZIjBHolj7RYJ1hM6GVgRmYoZXEDvYDL8QLm6qSiC8XXCti91
   KrFMc4M6ROYJPg/3l8Jz5jGC+g6QEXsVV9nWS4n5zkrZX7AzF2qujyFC6
   q1N0/ohd2nvwJOuMpeIXMtHXp/gGRL+00a4sDx5/BmVopKKzQHGu1A4xM
   6TChIgrixEliw2DSS4vEBgnfcm74hOQnRQWwlFFRYVfl1zfPoqK5iTBq1
   a9Fti7yijaJto7pgrPBCTeC0jivDtqbJfPRPtPbDsIsmpS7KxkuBJi8pl
   UYXN/IdvaZyHdKreu08QjCEIaNS7aiwou5e1db5+HLODwBMbTj8xsufNf
   A==;
X-CSE-ConnectionGUID: qZ+duzIeS2iXEtxjx35iBQ==
X-CSE-MsgGUID: 07WR1gF9TRqR5x909ILTcw==
X-IronPort-AV: E=McAfee;i="6700,10204,11286"; a="60032702"
X-IronPort-AV: E=Sophos;i="6.12,235,1728975600"; 
   d="scan'208";a="60032702"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2024 14:36:31 -0800
X-CSE-ConnectionGUID: ZMOFhJyCQAi8GqTrBjutWw==
X-CSE-MsgGUID: MBxROUboRuO7MzwWr0O3eQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,235,1728975600"; 
   d="scan'208";a="97259443"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 14 Dec 2024 14:36:30 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tMakO-000DIE-24;
	Sat, 14 Dec 2024 22:36:28 +0000
Date: Sun, 15 Dec 2024 06:36:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/firmware/efi/libstub/smbios.c:45 efi_get_smbios_record()
 error: uninitialized symbol 'smbios'.
Message-ID: <202412150631.rJgZiqBC-lkp@intel.com>
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
head:   a0e3919a2df29b373b19a8fbd6e4c4c38fc10d87
commit: cd6193877c603f4b0c3c7e5607ffa3d52815403f x86/efistub: Enable SMBIOS protocol handling for x86
date:   5 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 5 months ago
config: x86_64-randconfig-r073-20241208 (https://download.01.org/0day-ci/archive/20241215/202412150631.rJgZiqBC-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412150631.rJgZiqBC-lkp@intel.com/

smatch warnings:
drivers/firmware/efi/libstub/smbios.c:45 efi_get_smbios_record() error: uninitialized symbol 'smbios'.
drivers/firmware/efi/libstub/smbios.c:48 efi_get_smbios_record() error: uninitialized symbol 'record'.

vim +/smbios +45 drivers/firmware/efi/libstub/smbios.c

550b33cfd445296 Ard Biesheuvel 2022-11-10  35  
eb684408f3ea485 Ard Biesheuvel 2023-02-28  36  const struct efi_smbios_record *efi_get_smbios_record(u8 type)
550b33cfd445296 Ard Biesheuvel 2022-11-10  37  {
550b33cfd445296 Ard Biesheuvel 2022-11-10  38  	struct efi_smbios_record *record;
550b33cfd445296 Ard Biesheuvel 2022-11-10  39  	efi_smbios_protocol_t *smbios;
550b33cfd445296 Ard Biesheuvel 2022-11-10  40  	efi_status_t status;
550b33cfd445296 Ard Biesheuvel 2022-11-10  41  	u16 handle = 0xfffe;
550b33cfd445296 Ard Biesheuvel 2022-11-10  42  
550b33cfd445296 Ard Biesheuvel 2022-11-10  43  	status = efi_bs_call(locate_protocol, &EFI_SMBIOS_PROTOCOL_GUID, NULL,
550b33cfd445296 Ard Biesheuvel 2022-11-10  44  			     (void **)&smbios) ?:
550b33cfd445296 Ard Biesheuvel 2022-11-10 @45  		 efi_call_proto(smbios, get_next, &handle, &type, &record, NULL);
550b33cfd445296 Ard Biesheuvel 2022-11-10  46  	if (status != EFI_SUCCESS)
550b33cfd445296 Ard Biesheuvel 2022-11-10  47  		return NULL;
eb684408f3ea485 Ard Biesheuvel 2023-02-28 @48  	return record;
eb684408f3ea485 Ard Biesheuvel 2023-02-28  49  }
eb684408f3ea485 Ard Biesheuvel 2023-02-28  50  

:::::: The code at line 45 was first introduced by commit
:::::: 550b33cfd445296868a478e8413ffb2e963eed32 arm64: efi: Force the use of SetVirtualAddressMap() on Altra machines

:::::: TO: Ard Biesheuvel <ardb@kernel.org>
:::::: CC: Ard Biesheuvel <ardb@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
