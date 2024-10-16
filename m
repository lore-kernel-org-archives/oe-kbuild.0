Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 265CF2076B9
	for <oe-kbuild@lists.linux.dev>; Wed, 16 Oct 2024 10:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729074551; cv=none; b=q3ExKN/5UGRs+dKDQIAfYVFVMximwS6XsTErFHOZbZFx6FVGWeTOXFN0whIE/JJnypJ6UjScQCtgeKroFsnHUZITV1G9b/165REmzYzbldydJc6wv068jOdK6Q57d2bxmhEUlI3jwL8RKyPkYuLw3mXA20xvW6ENST/4Dvfq1lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729074551; c=relaxed/simple;
	bh=huSIn4yAbJTj5Rut9nxtlWmoipnydnf4Nfd2NUulDZo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XnzRZe1/pCExtGQV21TfS6/JO+T3xbBf+dmIVKEIz7YNrJQzwbq/ZeZRiw/PWQSu7vDMoLKnGqn9ZIb8Crg/ntkHOmSAhWZ5s3grROtLSSyXHSx9HWIZE61NeCFpr35kFj/gkGj2ROSHo5igiiiI+2OnM8La1WVBcjNNNfZ0lrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Du4MONIZ; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Du4MONIZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729074549; x=1760610549;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=huSIn4yAbJTj5Rut9nxtlWmoipnydnf4Nfd2NUulDZo=;
  b=Du4MONIZc58N5He17DU/u+MCAGBEMKwulkBzGnY0jqQMu2tSDhSh05pD
   8EpIhVvD+62W1Q6T3HaCH+yg7LNCweqoUDSZyW7HJsqaU/7uwhyzau1h5
   lqLhAkTXI4rn7xfEjGs0qfrWwAOxNv0KwM9D4o9tlwo3iEt0LEq0GYb+f
   4zrWr3YttaTZnhzetbVEPhyqwensXqtBrGktMbtArlDPzhV4YzL11vIba
   CfQ4XE4MHmGmHSFi7ReocJi8jharKJ4E21lC1Tbyx3jN9S0Md5hT3APmy
   yoKr6bbG4qNWS/i6MoJ7J3kHmaCH01Aal0/nzMfW93B1MlXh0OFiWaYFh
   g==;
X-CSE-ConnectionGUID: CuQ9VW/IRXueyof6O2rv1w==
X-CSE-MsgGUID: LjwL6H8bSCyLzJ5oZHAIbA==
X-IronPort-AV: E=McAfee;i="6700,10204,11226"; a="46008971"
X-IronPort-AV: E=Sophos;i="6.11,207,1725346800"; 
   d="scan'208";a="46008971"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2024 03:29:08 -0700
X-CSE-ConnectionGUID: FzXBEoQtRkeEj44NWCTmIQ==
X-CSE-MsgGUID: g2grRYaqRGaDT3OrZKVTNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,207,1725346800"; 
   d="scan'208";a="78633966"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 16 Oct 2024 03:29:07 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t11H6-000Km2-31;
	Wed, 16 Oct 2024 10:29:04 +0000
Date: Wed, 16 Oct 2024 18:28:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] misc: misc_minor_alloc to allocate ids for all
 dynamic/misc dynamic minors
Message-ID: <202410161811.aIPEJHOt-lkp@intel.com>
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
In-Reply-To: <20241014131416.27324-1-vimal.agrawal@sophos.com>
References: <20241014131416.27324-1-vimal.agrawal@sophos.com>
TO: Vimal Agrawal <avimalin@gmail.com>
TO: linux-kernel@vger.kernel.org
TO: gregkh@linuxfoundation.org
TO: arnd@arndb.de
CC: avimalin@gmail.com
CC: vimal.agrawal@sophos.com

Hi Vimal,

kernel test robot noticed the following build warnings:

[auto build test WARNING on char-misc/char-misc-testing]
[also build test WARNING on char-misc/char-misc-next char-misc/char-misc-linus soc/for-next linus/master v6.12-rc3 next-20241016]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Vimal-Agrawal/misc-misc_minor_alloc-to-allocate-ids-for-all-dynamic-misc-dynamic-minors/20241014-211915
base:   char-misc/char-misc-testing
patch link:    https://lore.kernel.org/r/20241014131416.27324-1-vimal.agrawal%40sophos.com
patch subject: [PATCH] misc: misc_minor_alloc to allocate ids for all dynamic/misc dynamic minors
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: sparc64-randconfig-r072-20241015 (https://download.01.org/0day-ci/archive/20241016/202410161811.aIPEJHOt-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410161811.aIPEJHOt-lkp@intel.com/

smatch warnings:
drivers/char/misc.c:89 misc_minor_alloc() error: uninitialized symbol 'ret'.

vim +/ret +89 drivers/char/misc.c

ab760791c0cfbb D Scott Phillips 2022-11-14  65  
d52c84545e305b Vimal Agrawal    2024-10-14  66  static int misc_minor_alloc(int minor)
ab760791c0cfbb D Scott Phillips 2022-11-14  67  {
ab760791c0cfbb D Scott Phillips 2022-11-14  68  	int ret;
ab760791c0cfbb D Scott Phillips 2022-11-14  69  
d52c84545e305b Vimal Agrawal    2024-10-14  70  	if (minor == MISC_DYNAMIC_MINOR) {
d52c84545e305b Vimal Agrawal    2024-10-14  71  		/* allocate free id */
ab760791c0cfbb D Scott Phillips 2022-11-14  72  		ret = ida_alloc_max(&misc_minors_ida, DYNAMIC_MINORS - 1, GFP_KERNEL);
ab760791c0cfbb D Scott Phillips 2022-11-14  73  		if (ret >= 0) {
ab760791c0cfbb D Scott Phillips 2022-11-14  74  			ret = DYNAMIC_MINORS - ret - 1;
ab760791c0cfbb D Scott Phillips 2022-11-14  75  		} else {
ab760791c0cfbb D Scott Phillips 2022-11-14  76  			ret = ida_alloc_range(&misc_minors_ida, MISC_DYNAMIC_MINOR + 1,
ab760791c0cfbb D Scott Phillips 2022-11-14  77  				      MINORMASK, GFP_KERNEL);
ab760791c0cfbb D Scott Phillips 2022-11-14  78  		}
d52c84545e305b Vimal Agrawal    2024-10-14  79  	} else {
d52c84545e305b Vimal Agrawal    2024-10-14  80  		/* specific minor, check if it is in dynamic or misc dynamic range  */
d52c84545e305b Vimal Agrawal    2024-10-14  81  		if (minor < DYNAMIC_MINORS) {
d52c84545e305b Vimal Agrawal    2024-10-14  82  			minor = DYNAMIC_MINORS - minor - 1;
d52c84545e305b Vimal Agrawal    2024-10-14  83  			ret = ida_alloc_range(&misc_minors_ida, minor, minor, GFP_KERNEL);
d52c84545e305b Vimal Agrawal    2024-10-14  84  		}
d52c84545e305b Vimal Agrawal    2024-10-14  85  
d52c84545e305b Vimal Agrawal    2024-10-14  86  		if (minor > MISC_DYNAMIC_MINOR)
d52c84545e305b Vimal Agrawal    2024-10-14  87  			ret = ida_alloc_range(&misc_minors_ida, minor, minor, GFP_KERNEL);
d52c84545e305b Vimal Agrawal    2024-10-14  88  	}
ab760791c0cfbb D Scott Phillips 2022-11-14 @89  	return ret;
ab760791c0cfbb D Scott Phillips 2022-11-14  90  }
ab760791c0cfbb D Scott Phillips 2022-11-14  91  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
