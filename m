Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B03E3A8CB
	for <oe-kbuild@lists.linux.dev>; Mon,  1 Apr 2024 12:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711975526; cv=none; b=WfBAKsV/VdhT/i2nqFW3HU9vSoIxO+qUjIApiCDmp6EcGhcajw6jwDFHZCLDF2dsto73BFMvQ32cenn5tVI4gBY8mkF+RdEOFRi6126LMugpcyTX0ptYukxiUCbIIei4+74GbYfMfQ7EckPucvOf05Qz9t0tNgawPRHo/Da0KJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711975526; c=relaxed/simple;
	bh=QwtsP3UkQjTAWPcBbs1S5O1fwoiQlFcJ9iVex5LdmFs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QHdZr/+QmPo3+POaViomtEJ4FXozTbZkdyM+D6tmIr+EIzYJoMUkPF2gOEj+iP6Ef9U8UGAp5ebKdL/fDUKXTmdSCiGBy2Y3jobwd81LQjgy499+oMgBIBF1S2gWnuqRj+nsdJlkwRwemr/2NdkXARvPeaLcnwV6F1/tP78+Kv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dv9BwKGy; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dv9BwKGy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711975524; x=1743511524;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=QwtsP3UkQjTAWPcBbs1S5O1fwoiQlFcJ9iVex5LdmFs=;
  b=Dv9BwKGyquOWEtxNJc2AIzyXdG3rBpSNjaJ9Z8Lfir78wWhHScirho7F
   vue6/z54shenEVHhgUW+ixdQaK3m1QN/PJv8VhEPMvIxGNsqVNn4EeuJk
   0ygIU7XQQ+B/qRlTbHiltqJBo/XfBQgMXLyeRY3mdaUJw2ODO7z4wlBL9
   zsKzDh/AuZNyRznZowKXJsiD0prsMYkBDrACg168aDIq4Pz3voUaeKuFl
   FzpgMzA3m6yCPeJ0mSTztWVh9iDkhhIt3ay5n3zQDAm6vNt2AlJ7py+1L
   127IiSJTWsqz2epZFLiFj8Yj4CmVgK0Gx+Atx17K4mTlUguPLBu07qslq
   Q==;
X-CSE-ConnectionGUID: nG2CKccxSTixHrAEoZ/jYg==
X-CSE-MsgGUID: ESIlXzSJSSukl3BKQFG9PQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11030"; a="18249606"
X-IronPort-AV: E=Sophos;i="6.07,172,1708416000"; 
   d="scan'208";a="18249606"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2024 05:45:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,172,1708416000"; 
   d="scan'208";a="22449453"
Received: from lkp-server02.sh.intel.com (HELO 90ee3aa53dbd) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 01 Apr 2024 05:45:22 -0700
Received: from kbuild by 90ee3aa53dbd with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rrH2N-0000Ir-0g;
	Mon, 01 Apr 2024 12:45:19 +0000
Date: Mon, 1 Apr 2024 20:44:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: Re: [RFC PATCH 5/8] drm/ttm: Add a virtual base class for graphics
 memory backup
Message-ID: <202404012026.OqsAS9KJ-lkp@intel.com>
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
In-Reply-To: <20240329145707.3087-6-thomas.hellstrom@linux.intel.com>
References: <20240329145707.3087-6-thomas.hellstrom@linux.intel.com>
TO: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>

Hi Thomas,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-tip/drm-tip]
[cannot apply to drm-misc/drm-misc-next drm-xe/drm-xe-next drm/drm-next drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes linus/master v6.9-rc2 next-20240328]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Hellstr-m/drm-ttm-Allow-TTM-LRU-list-nodes-of-different-types/20240329-230014
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
patch link:    https://lore.kernel.org/r/20240329145707.3087-6-thomas.hellstrom%40linux.intel.com
patch subject: [RFC PATCH 5/8] drm/ttm: Add a virtual base class for graphics memory backup
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-103-20240401 (https://download.01.org/0day-ci/archive/20240401/202404012026.OqsAS9KJ-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202404012026.OqsAS9KJ-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/ttm/ttm_backup_shmem.c:130:18-25: ERROR: reference preceded by free on line 129

vim +130 drivers/gpu/drm/ttm/ttm_backup_shmem.c

73db80e5206ba1 Thomas Hellström 2024-03-29  109  
73db80e5206ba1 Thomas Hellström 2024-03-29  110  /**
73db80e5206ba1 Thomas Hellström 2024-03-29  111   * ttm_backup_shmem_create() - Create a shmem-based struct backup.
73db80e5206ba1 Thomas Hellström 2024-03-29  112   * @size: The maximum size (in bytes) to back up.
73db80e5206ba1 Thomas Hellström 2024-03-29  113   *
73db80e5206ba1 Thomas Hellström 2024-03-29  114   * Create a backup utilizing shmem objects.
73db80e5206ba1 Thomas Hellström 2024-03-29  115   *
73db80e5206ba1 Thomas Hellström 2024-03-29  116   * Return: A pointer to a struct ttm_backup on success,
73db80e5206ba1 Thomas Hellström 2024-03-29  117   * an error pointer on error.
73db80e5206ba1 Thomas Hellström 2024-03-29  118   */
73db80e5206ba1 Thomas Hellström 2024-03-29  119  struct ttm_backup *ttm_backup_shmem_create(loff_t size)
73db80e5206ba1 Thomas Hellström 2024-03-29  120  {
73db80e5206ba1 Thomas Hellström 2024-03-29  121  	struct ttm_backup_shmem *sbackup =
73db80e5206ba1 Thomas Hellström 2024-03-29  122  		kzalloc(sizeof(*sbackup), GFP_KERNEL | __GFP_ACCOUNT);
73db80e5206ba1 Thomas Hellström 2024-03-29  123  
73db80e5206ba1 Thomas Hellström 2024-03-29  124  	if (!sbackup)
73db80e5206ba1 Thomas Hellström 2024-03-29  125  		return ERR_PTR(-ENOMEM);
73db80e5206ba1 Thomas Hellström 2024-03-29  126  
73db80e5206ba1 Thomas Hellström 2024-03-29  127  	sbackup->filp = shmem_file_setup("ttm shmem backup", size, 0);
73db80e5206ba1 Thomas Hellström 2024-03-29  128  	if (IS_ERR(sbackup->filp)) {
73db80e5206ba1 Thomas Hellström 2024-03-29 @129  		kfree(sbackup);
73db80e5206ba1 Thomas Hellström 2024-03-29 @130  		return ERR_CAST(sbackup->filp);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
