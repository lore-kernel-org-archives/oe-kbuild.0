Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ACFB33C0
	for <oe-kbuild@lists.linux.dev>; Sun, 16 Jun 2024 22:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718575489; cv=none; b=c6DYULL7wajOnlgBBSBZqWypHHRAuvpPvTZhOs6qc/vf5x2Xx0Ln7OWkI37mUxZxxPvvWM4JPFHeosKdMyr4Xm0VLHfFCiz43f1TeB8KoFTKx9PrHTGqbLY/bPcvRl33RE0HP/6nalLg5rVYSSU50x1ApZI44IiUpd2QW+I2uGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718575489; c=relaxed/simple;
	bh=FzK7X5//d+tiRXwX/ldYSbICPfudPHuvT3ACIJRkRAU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QIFLNpObEUO8kcLiiH9TQVG2AoyGflSRWOU1jVPyWHBqg7G6ozQVPsZx1W+sOpsVfvdl5txoGNNVn67cux4s4Iwzk5MbW6CHehpxkOHdXdMZvlmhMS1EBkw/tGPFQkKcOqKR0ctxzR0LDfJ9R4SVbzIHAKmpG40oJ/Ba8c5oxPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lV+iUCpd; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lV+iUCpd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718575487; x=1750111487;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=FzK7X5//d+tiRXwX/ldYSbICPfudPHuvT3ACIJRkRAU=;
  b=lV+iUCpdryMV8mvr60OkcohKHslLyE8jhjiTcz5z81jRIr5Ldc8E276b
   KwSfJlw1cx8VQUAJahJ66b95Tep/ECmW3QaX+bqtQ0HappG1vA5Aam4IJ
   BQ0qnCYPA2PmxpjoKj6KQO7MEM62iRjwqWN3Wcp3kTQijY1ZepzeYOPPw
   5OD/ICL7pGy43qfClNNjd6/QgzXEEe+uq71mg1txTUWrz5eNIuk6wIpoe
   eVpUnzJ6/3267hrFFZyBOOk/uA5ATyPf7i2NLOLInLtuXp+FU/IoQZi3e
   OYXHPuxxJLNI8Vf1h8S8erBauw04FBW+17ZNpldYK1TkK0VFxuBfXFwQR
   w==;
X-CSE-ConnectionGUID: ci/PiGfxRsSXlZVdoqNahg==
X-CSE-MsgGUID: hy94zLWZSqCiK+QGHYXGIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11105"; a="32870501"
X-IronPort-AV: E=Sophos;i="6.08,243,1712646000"; 
   d="scan'208";a="32870501"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2024 15:04:47 -0700
X-CSE-ConnectionGUID: v0TT5kwXTjqlFXLVSXX1Gw==
X-CSE-MsgGUID: UuskjCCRSe6fE1GIbr02gA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,243,1712646000"; 
   d="scan'208";a="45563273"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 16 Jun 2024 15:04:45 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sIxzP-0003No-1m;
	Sun, 16 Jun 2024 22:04:43 +0000
Date: Mon, 17 Jun 2024 06:04:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v4 08/12] drm/ttm: Add a virtual base class for graphics
 memory backup
Message-ID: <202406170559.WdDkFEiU-lkp@intel.com>
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
In-Reply-To: <20240614102548.4364-9-thomas.hellstrom@linux.intel.com>
References: <20240614102548.4364-9-thomas.hellstrom@linux.intel.com>
TO: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
TO: intel-xe@lists.freedesktop.org
CC: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
CC: "Christian König" <christian.koenig@amd.com>
CC: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
CC: Matthew Brost <matthew.brost@intel.com>
CC: dri-devel@lists.freedesktop.org

Hi Thomas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-xe/drm-xe-next]
[also build test WARNING on next-20240613]
[cannot apply to linus/master v6.10-rc3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Hellstr-m/drm-ttm-Allow-TTM-LRU-list-nodes-of-different-types/20240614-182911
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20240614102548.4364-9-thomas.hellstrom%40linux.intel.com
patch subject: [PATCH v4 08/12] drm/ttm: Add a virtual base class for graphics memory backup
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-161-20240617 (https://download.01.org/0day-ci/archive/20240617/202406170559.WdDkFEiU-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202406170559.WdDkFEiU-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/ttm/ttm_backup_shmem.c:130 ttm_backup_shmem_create() error: dereferencing freed memory 'sbackup'

vim +/sbackup +130 drivers/gpu/drm/ttm/ttm_backup_shmem.c

827540d42dec01 Thomas Hellström 2024-06-14  109  
827540d42dec01 Thomas Hellström 2024-06-14  110  /**
827540d42dec01 Thomas Hellström 2024-06-14  111   * ttm_backup_shmem_create() - Create a shmem-based struct backup.
827540d42dec01 Thomas Hellström 2024-06-14  112   * @size: The maximum size (in bytes) to back up.
827540d42dec01 Thomas Hellström 2024-06-14  113   *
827540d42dec01 Thomas Hellström 2024-06-14  114   * Create a backup utilizing shmem objects.
827540d42dec01 Thomas Hellström 2024-06-14  115   *
827540d42dec01 Thomas Hellström 2024-06-14  116   * Return: A pointer to a struct ttm_backup on success,
827540d42dec01 Thomas Hellström 2024-06-14  117   * an error pointer on error.
827540d42dec01 Thomas Hellström 2024-06-14  118   */
827540d42dec01 Thomas Hellström 2024-06-14  119  struct ttm_backup *ttm_backup_shmem_create(loff_t size)
827540d42dec01 Thomas Hellström 2024-06-14  120  {
827540d42dec01 Thomas Hellström 2024-06-14  121  	struct ttm_backup_shmem *sbackup =
827540d42dec01 Thomas Hellström 2024-06-14  122  		kzalloc(sizeof(*sbackup), GFP_KERNEL | __GFP_ACCOUNT);
827540d42dec01 Thomas Hellström 2024-06-14  123  
827540d42dec01 Thomas Hellström 2024-06-14  124  	if (!sbackup)
827540d42dec01 Thomas Hellström 2024-06-14  125  		return ERR_PTR(-ENOMEM);
827540d42dec01 Thomas Hellström 2024-06-14  126  
827540d42dec01 Thomas Hellström 2024-06-14  127  	sbackup->filp = shmem_file_setup("ttm shmem backup", size, 0);
827540d42dec01 Thomas Hellström 2024-06-14  128  	if (IS_ERR(sbackup->filp)) {
827540d42dec01 Thomas Hellström 2024-06-14  129  		kfree(sbackup);
827540d42dec01 Thomas Hellström 2024-06-14 @130  		return ERR_CAST(sbackup->filp);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
