Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8201A1684B4
	for <oe-kbuild@lists.linux.dev>; Sun, 23 Mar 2025 01:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742692173; cv=none; b=Rg50rnLJkPRCIaedFgjlds/wd+NbPqAqATeCf5X/R2FERkm7PxbNstw9igExUv2qC98gvkIa9C9H8yJ0YNMm+vzMcdL/lAFJvUwa4XGwvS0Y+i6pDAdHCXDsB6yQJ64D3tUc9M88zO//F2rObW/3by2c4auZ29mcMROHmKIH/eQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742692173; c=relaxed/simple;
	bh=b6sB9BCxfkNzSlFKpRiZ9nGs1frdk4DTQp9ami4ijVs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Tzt6TCDQZ6NUM9z40mr/ZfnLQHK1i2RiBEqEcVHCKsl4+lSV5u9aBHFkxr2vm3cbJ9osp5cv1Nh4Vg528im5zc8JtkShpY+xOJEI2ELFEBR6Iun2LXuUFbp4AV33DdqVNZRRrWtXeABCBqnGWdwqutQfUyK4Il3+4J19oAVFlwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QudbWI3u; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QudbWI3u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742692171; x=1774228171;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=b6sB9BCxfkNzSlFKpRiZ9nGs1frdk4DTQp9ami4ijVs=;
  b=QudbWI3ueEFwdPcaOWKLVaOkGqGZQR9j8KQSezTMbyJgCu9mcBmKJsJG
   QHt0B1ZQb8COXjitateWI1LrnFv6OvtrpJCsPSXi56z8gwwl0aXkxAikW
   wkNIF9iDnfu1rS+KzdyGQrn3Nrtt0QmcIsS+DkT53x8tyQNmQay/xuUAP
   lJrVVLrRlzr1PVGdgzLMAl5MNfN0dWDlGqRJsmhEBQWnD4h9FnVAZ+Np0
   MTXtWOLAvDgZw09TzNziDAxmbt1Oh/lJeoIjD6V2zSB5p8jqeIKFkGJxM
   QoAqXuKbE2KFdD90csMD5uknWrfeRaINj5QiFXbnDUm92zPbJV2RFKfkX
   g==;
X-CSE-ConnectionGUID: lyJqjG5PT4WmK02ySdRHxg==
X-CSE-MsgGUID: h5EmK2dwT4+Cx1RFlOhy6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11381"; a="43855981"
X-IronPort-AV: E=Sophos;i="6.14,268,1736841600"; 
   d="scan'208";a="43855981"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2025 18:09:30 -0700
X-CSE-ConnectionGUID: DNf2SBnTTz6ndfERzV/ZAA==
X-CSE-MsgGUID: Ob1rc6D9T8qF02uLfKgQaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,268,1736841600"; 
   d="scan'208";a="128539689"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 22 Mar 2025 18:09:29 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tw9q8-0002VJ-1k;
	Sun, 23 Mar 2025 01:09:25 +0000
Date: Sun, 23 Mar 2025 09:08:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [android-common:android-mainline-rust 2/2] mm/shmem.c:4277:6-13:
 WARNING: Unsigned expression compared with zero: version < 0
Message-ID: <202503230810.79D4qmtG-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android-mainline-rust
head:   69e641afed13f4ee53e66be0464646d326f9b5b1
commit: 58e55efd6c72cbc3e76423a1086f7b4d6c2ae9c2 [2/2] tmpfs: Add casefold lookup support
:::::: branch date: 2 days ago
:::::: commit date: 5 months ago
config: x86_64-randconfig-103-20250322 (https://download.01.org/0day-ci/archive/20250323/202503230810.79D4qmtG-lkp@intel.com/config)
compiler: clang version 20.1.1 (https://github.com/llvm/llvm-project 424c2d9b7e4de40d0804dd374721e6411c27d1d1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202503230810.79D4qmtG-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> mm/shmem.c:4277:6-13: WARNING: Unsigned expression compared with zero: version < 0

vim +4277 mm/shmem.c

626c3920aeb457 Al Viro       2019-09-08  4261  
58e55efd6c72cb André Almeida 2024-10-21  4262  #if IS_ENABLED(CONFIG_UNICODE)
58e55efd6c72cb André Almeida 2024-10-21  4263  static int shmem_parse_opt_casefold(struct fs_context *fc, struct fs_parameter *param,
58e55efd6c72cb André Almeida 2024-10-21  4264  				    bool latest_version)
58e55efd6c72cb André Almeida 2024-10-21  4265  {
58e55efd6c72cb André Almeida 2024-10-21  4266  	struct shmem_options *ctx = fc->fs_private;
58e55efd6c72cb André Almeida 2024-10-21  4267  	unsigned int version = UTF8_LATEST;
58e55efd6c72cb André Almeida 2024-10-21  4268  	struct unicode_map *encoding;
58e55efd6c72cb André Almeida 2024-10-21  4269  	char *version_str = param->string + 5;
58e55efd6c72cb André Almeida 2024-10-21  4270  
58e55efd6c72cb André Almeida 2024-10-21  4271  	if (!latest_version) {
58e55efd6c72cb André Almeida 2024-10-21  4272  		if (strncmp(param->string, "utf8-", 5))
58e55efd6c72cb André Almeida 2024-10-21  4273  			return invalfc(fc, "Only UTF-8 encodings are supported "
58e55efd6c72cb André Almeida 2024-10-21  4274  				       "in the format: utf8-<version number>");
58e55efd6c72cb André Almeida 2024-10-21  4275  
58e55efd6c72cb André Almeida 2024-10-21  4276  		version = utf8_parse_version(version_str);
58e55efd6c72cb André Almeida 2024-10-21 @4277  		if (version < 0)
58e55efd6c72cb André Almeida 2024-10-21  4278  			return invalfc(fc, "Invalid UTF-8 version: %s", version_str);
58e55efd6c72cb André Almeida 2024-10-21  4279  	}
58e55efd6c72cb André Almeida 2024-10-21  4280  
58e55efd6c72cb André Almeida 2024-10-21  4281  	encoding = utf8_load(version);
58e55efd6c72cb André Almeida 2024-10-21  4282  
58e55efd6c72cb André Almeida 2024-10-21  4283  	if (IS_ERR(encoding)) {
58e55efd6c72cb André Almeida 2024-10-21  4284  		return invalfc(fc, "Failed loading UTF-8 version: utf8-%u.%u.%u\n",
58e55efd6c72cb André Almeida 2024-10-21  4285  			       unicode_major(version), unicode_minor(version),
58e55efd6c72cb André Almeida 2024-10-21  4286  			       unicode_rev(version));
58e55efd6c72cb André Almeida 2024-10-21  4287  	}
58e55efd6c72cb André Almeida 2024-10-21  4288  
58e55efd6c72cb André Almeida 2024-10-21  4289  	pr_info("tmpfs: Using encoding : utf8-%u.%u.%u\n",
58e55efd6c72cb André Almeida 2024-10-21  4290  		unicode_major(version), unicode_minor(version), unicode_rev(version));
58e55efd6c72cb André Almeida 2024-10-21  4291  
58e55efd6c72cb André Almeida 2024-10-21  4292  	ctx->encoding = encoding;
58e55efd6c72cb André Almeida 2024-10-21  4293  
58e55efd6c72cb André Almeida 2024-10-21  4294  	return 0;
58e55efd6c72cb André Almeida 2024-10-21  4295  }
58e55efd6c72cb André Almeida 2024-10-21  4296  #else
58e55efd6c72cb André Almeida 2024-10-21  4297  static int shmem_parse_opt_casefold(struct fs_context *fc, struct fs_parameter *param,
58e55efd6c72cb André Almeida 2024-10-21  4298  				    bool latest_version)
58e55efd6c72cb André Almeida 2024-10-21  4299  {
58e55efd6c72cb André Almeida 2024-10-21  4300  	return invalfc(fc, "tmpfs: Kernel not built with CONFIG_UNICODE\n");
58e55efd6c72cb André Almeida 2024-10-21  4301  }
58e55efd6c72cb André Almeida 2024-10-21  4302  #endif
58e55efd6c72cb André Almeida 2024-10-21  4303  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
