Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC88B1804A
	for <oe-kbuild@lists.linux.dev>; Mon,  2 Dec 2024 02:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733105450; cv=none; b=Gep5q/Ln91Mqj0NS8jFPem8RAy+iTsvBMTYzPvI5tNkrCgn1xxHzAckXPwn5e0bFStjLsnYf8qp2/V25HErm1hZqTBEN5PcZZj9s7JSvs5C4uC88d+sz3MRmzM6KRnKzBVPYLX4BKKmpumSNgA7xniy941H0W9uoWT0wlkgUiP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733105450; c=relaxed/simple;
	bh=oY9VCVp3KekHvqT3lJ+6CM0AeLq9Hrlz0zUW1r2UWxw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WJ8Ine8HM+NFpKooEYTLr49gTWFg+Dk4IzcI9Ts61wHSNPysXzyBuirlInwo0CdpiAincAH3j3juc1nXZ4mJA3Ui/Og5SItBmJfvG/EJxAEckdx3HbTWlAv8Vfkvbmd2clg9MF4+5TE7TCLu7TRTfIECURZBb1na/UA12lCu+fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QboDaAu0; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QboDaAu0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733105448; x=1764641448;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=oY9VCVp3KekHvqT3lJ+6CM0AeLq9Hrlz0zUW1r2UWxw=;
  b=QboDaAu0UfHYPmFf+yavCUs/VwVoj/W1Vt9vsiMiVdRFNMRca+YuWnW3
   noSZ77HRwSsGyTy21RlCDErQ97QquFKRPCr1ZI1aZzmbP/b530flMBe+h
   5RNswQWQtlj6KQyVf58QlZssORPr6ZT9hdoJEdnG8XWFhn98Qs6lG0sMY
   pDCj6KD/uh4AeJmZpxefhy7urTnldp99hQCTeh7woBBee2NwwgxO7qvGX
   DyQGNrftR2iit302BDeszhwbplhcy6aNzv7TvfSz01YhJYZXVJeDNQ6BI
   GBxA5i2/gEdgG/DAlN+DzQAWgVXneH0ohXZz3LD8tDZ+VVu5fztgV5qR4
   Q==;
X-CSE-ConnectionGUID: TR7kKebtSrC4LLeJVwhfTg==
X-CSE-MsgGUID: k1YiRD8HSDKVET0lsl7OyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11273"; a="44632075"
X-IronPort-AV: E=Sophos;i="6.12,201,1728975600"; 
   d="scan'208";a="44632075"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2024 18:10:47 -0800
X-CSE-ConnectionGUID: +HMiETLiTqOmXZvOcrVOBA==
X-CSE-MsgGUID: KF24uLVVQ5yPB1x9PDnunQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,201,1728975600"; 
   d="scan'208";a="97045025"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 01 Dec 2024 18:10:46 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHvtb-000219-2D;
	Mon, 02 Dec 2024 02:10:43 +0000
Date: Mon, 2 Dec 2024 10:09:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: mm/shmem.c:4277:6-13: WARNING: Unsigned expression compared with
 zero: version < 0
Message-ID: <202412021003.qAfcDo6I-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=unknown-8bit
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "André Almeida" <andrealmeid@igalia.com>
CC: Christian Brauner <brauner@kernel.org>
CC: Gabriel Krisman Bertazi <gabriel@krisman.be>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   40384c840ea1944d7c5a392e8975ed088ecf0b37
commit: 58e55efd6c72cbc3e76423a1086f7b4d6c2ae9c2 tmpfs: Add casefold lookup support
date:   5 weeks ago
:::::: branch date: 4 hours ago
:::::: commit date: 5 weeks ago
config: arc-randconfig-r052-20241202 (https://download.01.org/0day-ci/archive/20241202/202412021003.qAfcDo6I-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202412021003.qAfcDo6I-lkp@intel.com/

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
