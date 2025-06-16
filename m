Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 529C2273D91
	for <oe-kbuild@lists.linux.dev>; Mon, 16 Jun 2025 10:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750070327; cv=none; b=PMp6ZKcDh4cIyVIBSvFKxQqcxQn0dtV6T5nbU7pvCXZ+v187bhj2q9q+mM0X6QocQfuyyqEgqhIZfUe9FdnohF9IDDeDOGsNJJlM7efZ0jzI14MkbLsreSNGPLBs0qe/3Cy4R6w4fOhPD5ySYLb7EQJDIS+CB97BfMKJBUlF5fE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750070327; c=relaxed/simple;
	bh=C8dy4TiDNWQu3VPQCTX+OsJxBfrJawJNrGb0j+DG3HM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BOAKuek5K/UUo3CX0TB0yUxsHG0iyzVR9oDi5//7kezf9ig5yi6mwnj3m0FXd286l82v7AYm28fIHVTv9XuWi44xAFMeicTaO3JBzMbYbNduFOLNAJmUJETvrm9U3XkrI/ebj7cpy+rWQ0P/5M09L3umYEtuUPKmtEjD/KwmQU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gIamhXtX; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gIamhXtX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750070325; x=1781606325;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=C8dy4TiDNWQu3VPQCTX+OsJxBfrJawJNrGb0j+DG3HM=;
  b=gIamhXtXWOFp2HEnT2RtTZgqy7ixhkGh1Z3T6PZpss423Y92IIfPcOi/
   IdjOwxRhGNoM4LJrv7/jsRmlNkPg55bpFmNHPM/Eu9egZYOuoUn0v57su
   yOoIBkXrA1/EKNYNE8y5LFL02XozwsHgV+SablGH/OWjMaJ0rKL3P9/S8
   jC63gfVYiits51TlhGXErfibgn6oRXr2HzFTlckfk7fU0GGh3eNjzHzMT
   woGdyDYTT7jQNU7wBkLt/Dq3F9AxAMnFps+OFITqyEoLxodddSF3194+u
   /TYAy1nsYLPgWLjKrLH1GP4I3Y02dlwrIFAaVCY6rpk2GdR7Vh/Jjl/U/
   g==;
X-CSE-ConnectionGUID: YTHDEWI9TcuWxuPsVIc/6g==
X-CSE-MsgGUID: NG5VYjCLSwW6lNBU9IAi2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="62861114"
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; 
   d="scan'208";a="62861114"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 03:38:45 -0700
X-CSE-ConnectionGUID: JC8Er6HrRGCtP+ncXxXB2A==
X-CSE-MsgGUID: rjHuB6OuQw+KzOb1AKU0BQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; 
   d="scan'208";a="153592358"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 16 Jun 2025 03:38:44 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uR7Ef-000Ewe-2X;
	Mon, 16 Jun 2025 10:38:41 +0000
Date: Mon, 16 Jun 2025 18:38:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: Re: [PATCH v7] crypto: zstd - convert to acomp
Message-ID: <202506161839.VY5X86mQ-lkp@intel.com>
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
In-Reply-To: <20250616031944.761509-1-suman.kumar.chakraborty@intel.com>
References: <20250616031944.761509-1-suman.kumar.chakraborty@intel.com>
TO: Suman Kumar Chakraborty <suman.kumar.chakraborty@intel.com>
TO: herbert@gondor.apana.org.au
CC: linux-crypto@vger.kernel.org
CC: qat-linux@intel.com
CC: dsterba@suse.com
CC: terrelln@fb.com
CC: clabbe.montjoie@gmail.com

Hi Suman,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 1a81ee21c0d32b37b76e754a0a6350b3e5833cd8]

url:    https://github.com/intel-lab-lkp/linux/commits/Suman-Kumar-Chakraborty/crypto-zstd-convert-to-acomp/20250616-112312
base:   1a81ee21c0d32b37b76e754a0a6350b3e5833cd8
patch link:    https://lore.kernel.org/r/20250616031944.761509-1-suman.kumar.chakraborty%40intel.com
patch subject: [PATCH v7] crypto: zstd - convert to acomp
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
config: openrisc-randconfig-r064-20250616 (https://download.01.org/0day-ci/archive/20250616/202506161839.VY5X86mQ-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 11.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202506161839.VY5X86mQ-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> crypto/zstd.c:28:4-8: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)

vim +28 crypto/zstd.c

d28fc3dbe19183 Nick Terrell            2018-03-30  22  
d28fc3dbe19183 Nick Terrell            2018-03-30  23  struct zstd_ctx {
cf30f6a5f0c60e Nick Terrell            2020-09-11  24  	zstd_cctx *cctx;
cf30f6a5f0c60e Nick Terrell            2020-09-11  25  	zstd_dctx *dctx;
aea86dab733ef4 Suman Kumar Chakraborty 2025-06-16  26  	size_t wksp_size;
aea86dab733ef4 Suman Kumar Chakraborty 2025-06-16  27  	zstd_parameters params;
aea86dab733ef4 Suman Kumar Chakraborty 2025-06-16 @28  	u8 wksp[0] __aligned(8);
d28fc3dbe19183 Nick Terrell            2018-03-30  29  };
d28fc3dbe19183 Nick Terrell            2018-03-30  30  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
