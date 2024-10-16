Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D855290F
	for <oe-kbuild@lists.linux.dev>; Wed, 16 Oct 2024 17:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729100741; cv=none; b=Se1Jw4klv40gzLMq4AxA2Zh6KYWVvHrzrbDhn0O30da2DeUAeDMN9mXrqLIm6Q5YtEVkLd6atJ8sh6fHnmJwuSFoqpnMQd2utGXaz9TIbtC5b1rIMLTk+aK52U70CBHF8QUx32dhnzzsQwHKtQ1zBCAUmerQhR9KLT7mIlsl9dY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729100741; c=relaxed/simple;
	bh=bIMLaMM8L3ujRThzJXN231JerdPjVDa7dA3+c+2pnnc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IyeDATE83KIuOafbnWAUIzO3Nd6YW9p0vFYwp8gHPIpdkWZORJiXe6TMRCxYo4HBtZQEzGytc0dnUURdZa5GKMrwS0l8ZEtTvHg3qxJhvDnsNW5NtNuciXAqatoZSLU9qVnJK/BLE0iVktdvJE4BNlnsGnFjpyS41o2HwMKdw6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MssRq0eN; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MssRq0eN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729100740; x=1760636740;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=bIMLaMM8L3ujRThzJXN231JerdPjVDa7dA3+c+2pnnc=;
  b=MssRq0eNeQpSY0z78RMTgJmikizHh2TMlgbMPnFTRfax8tmHJb0VNNSd
   /86A3t3E2Gm2CqCDtwU86ysPennAqapyXVyS+/aVGAmPDJ2xOFSjOjCFw
   w4EJXdAwgwmfeFgNHQlWLKbkSMfOmOQXjESw5S0NtEs7DQHSCe1D4Xyyx
   GebRVQbwExhKDc3K8YAMYnc6mhWpujcjl9vL0LdHH8mOHNTXAtzrJBiC8
   pdBBXahuiJl67NvnWiBEQ/XfmKvoIQnFrplp9ABvj6vo8DRby6FzhjNuH
   w6nLMPuFu/D+KFcyjUZrQUsZoYyIOSPbTlGnlLKT2CWLTeuiwpRN028ib
   Q==;
X-CSE-ConnectionGUID: 6Bjd1YKXSpevQFrmIHrC4A==
X-CSE-MsgGUID: yzs/kRRYSvuVJraifmY/iQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28515857"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="28515857"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2024 10:45:36 -0700
X-CSE-ConnectionGUID: v7nmtUs5RdqXSOJ/FmGsoQ==
X-CSE-MsgGUID: UT+8oW+iSqKkApbyg5fBPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,208,1725346800"; 
   d="scan'208";a="78334056"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 16 Oct 2024 10:45:35 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t185V-000LD1-06;
	Wed, 16 Oct 2024 17:45:33 +0000
Date: Thu, 17 Oct 2024 01:44:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: Re: [PATCH v6 07/10] tmpfs: Add casefold lookup support
Message-ID: <202410170146.zxzPVcDw-lkp@intel.com>
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
In-Reply-To: <20241010-tonyk-tmpfs-v6-7-79f0ae02e4c8@igalia.com>
References: <20241010-tonyk-tmpfs-v6-7-79f0ae02e4c8@igalia.com>
TO: "André Almeida" <andrealmeid@igalia.com>
TO: Gabriel Krisman Bertazi <krisman@kernel.org>
TO: Alexander Viro <viro@zeniv.linux.org.uk>
TO: Christian Brauner <brauner@kernel.org>
TO: Jan Kara <jack@suse.cz>
TO: "Theodore Ts'o" <tytso@mit.edu>
TO: Andreas Dilger <adilger.kernel@dilger.ca>
TO: Hugh Dickins <hughd@google.com>
TO: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Jonathan Corbet <corbet@lwn.net>
TO: smcv@collabora.com
CC: kernel-dev@igalia.com
CC: linux-fsdevel@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-ext4@vger.kernel.org
CC: linux-doc@vger.kernel.org
CC: "André Almeida" <andrealmeid@igalia.com>

Hi André,

kernel test robot noticed the following build warnings:

[auto build test WARNING on eb952c47d154ba2aac794b99c66c3c45eb4cc4ec]

url:    https://github.com/intel-lab-lkp/linux/commits/Andr-Almeida/libfs-Create-the-helper-function-generic_ci_validate_strict_name/20241011-034342
base:   eb952c47d154ba2aac794b99c66c3c45eb4cc4ec
patch link:    https://lore.kernel.org/r/20241010-tonyk-tmpfs-v6-7-79f0ae02e4c8%40igalia.com
patch subject: [PATCH v6 07/10] tmpfs: Add casefold lookup support
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: arc-randconfig-r063-20241016 (https://download.01.org/0day-ci/archive/20241017/202410170146.zxzPVcDw-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202410170146.zxzPVcDw-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> mm/shmem.c:4280:6-13: WARNING: Unsigned expression compared with zero: version < 0

vim +4280 mm/shmem.c

626c3920aeb457 Al Viro       2019-09-08  4264  
283152f99feff1 André Almeida 2024-10-10  4265  #if IS_ENABLED(CONFIG_UNICODE)
283152f99feff1 André Almeida 2024-10-10  4266  static int shmem_parse_opt_casefold(struct fs_context *fc, struct fs_parameter *param,
283152f99feff1 André Almeida 2024-10-10  4267  				    bool latest_version)
283152f99feff1 André Almeida 2024-10-10  4268  {
283152f99feff1 André Almeida 2024-10-10  4269  	struct shmem_options *ctx = fc->fs_private;
283152f99feff1 André Almeida 2024-10-10  4270  	unsigned int version = UTF8_LATEST;
283152f99feff1 André Almeida 2024-10-10  4271  	struct unicode_map *encoding;
283152f99feff1 André Almeida 2024-10-10  4272  	char *version_str = param->string + 5;
283152f99feff1 André Almeida 2024-10-10  4273  
283152f99feff1 André Almeida 2024-10-10  4274  	if (!latest_version) {
283152f99feff1 André Almeida 2024-10-10  4275  		if (strncmp(param->string, "utf8-", 5))
283152f99feff1 André Almeida 2024-10-10  4276  			return invalfc(fc, "Only UTF-8 encodings are supported "
283152f99feff1 André Almeida 2024-10-10  4277  				       "in the format: utf8-<version number>");
283152f99feff1 André Almeida 2024-10-10  4278  
283152f99feff1 André Almeida 2024-10-10  4279  		version = utf8_parse_version(version_str);
283152f99feff1 André Almeida 2024-10-10 @4280  		if (version < 0)
283152f99feff1 André Almeida 2024-10-10  4281  			return invalfc(fc, "Invalid UTF-8 version: %s", version_str);
283152f99feff1 André Almeida 2024-10-10  4282  	}
283152f99feff1 André Almeida 2024-10-10  4283  
283152f99feff1 André Almeida 2024-10-10  4284  	encoding = utf8_load(version);
283152f99feff1 André Almeida 2024-10-10  4285  
283152f99feff1 André Almeida 2024-10-10  4286  	if (IS_ERR(encoding)) {
283152f99feff1 André Almeida 2024-10-10  4287  		return invalfc(fc, "Failed loading UTF-8 version: utf8-%u.%u.%u\n",
283152f99feff1 André Almeida 2024-10-10  4288  			       unicode_major(version), unicode_minor(version),
283152f99feff1 André Almeida 2024-10-10  4289  			       unicode_rev(version));
283152f99feff1 André Almeida 2024-10-10  4290  	}
283152f99feff1 André Almeida 2024-10-10  4291  
283152f99feff1 André Almeida 2024-10-10  4292  	pr_info("tmpfs: Using encoding : utf8-%u.%u.%u\n",
283152f99feff1 André Almeida 2024-10-10  4293  		unicode_major(version), unicode_minor(version), unicode_rev(version));
283152f99feff1 André Almeida 2024-10-10  4294  
283152f99feff1 André Almeida 2024-10-10  4295  	ctx->encoding = encoding;
283152f99feff1 André Almeida 2024-10-10  4296  
283152f99feff1 André Almeida 2024-10-10  4297  	return 0;
283152f99feff1 André Almeida 2024-10-10  4298  }
283152f99feff1 André Almeida 2024-10-10  4299  #else
283152f99feff1 André Almeida 2024-10-10  4300  static int shmem_parse_opt_casefold(struct fs_context *fc, struct fs_parameter *param,
283152f99feff1 André Almeida 2024-10-10  4301  				    bool latest_version)
283152f99feff1 André Almeida 2024-10-10  4302  {
283152f99feff1 André Almeida 2024-10-10  4303  	return invalfc(fc, "tmpfs: Kernel not built with CONFIG_UNICODE\n");
283152f99feff1 André Almeida 2024-10-10  4304  }
283152f99feff1 André Almeida 2024-10-10  4305  #endif
283152f99feff1 André Almeida 2024-10-10  4306  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
