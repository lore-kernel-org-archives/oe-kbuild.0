Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC3BE8F6B
	for <oe-kbuild@lists.linux.dev>; Tue,  7 Jan 2025 20:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736280687; cv=none; b=qK7Y27Ms3BNbqtxI/YmsE1SP5cwhoH6eEm57JKDTjgtZOVBthzdVJHOb6Ea30kjJnefDtFKMhk9Maq4NF4mkxJR3cCj0TrLnPDhlLM5cjYwiHSXj09+Yb0f2igeVqkuoixxrjv3OUZ2jGX1HBonO+p+oc+cKA0OI52KxFdAa3a0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736280687; c=relaxed/simple;
	bh=5uNmJDjLbimpxZAA6CYWli73mu+eQeCeV9SiJipI5zM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=I7+8gsVvFiOjSkbhWM7eV4038N8sR8kfbAcMOba1yVudoXbVkD60gvJGG6DTupVh9Wm+SuBW4+4uWK54qBarlMnc6WqG3UfelIvdP+CsqQj/sAGUf9QiLD4i/5zOu8YSo930lldGfX4ZvY/dBVrfDzHNSji0n6s/TDU5Cp6h38s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=STNFuq8x; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="STNFuq8x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736280684; x=1767816684;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5uNmJDjLbimpxZAA6CYWli73mu+eQeCeV9SiJipI5zM=;
  b=STNFuq8xD3jK9onDHIlV4DT/NdQaiptROD1RHOyYy8TXgX8+DtIAj0BG
   cTYyqAyO8NtrfRNEYIXIroshQq6Sq+KBvq3ZgNk3WPn/7MITYZcMNkX5V
   eeL7+BqSSgrNfiwanbhe6vThKcqApjlvbifJsSh2axF/DSvTa3KGHlycz
   iBkx0YFNey8zIUXB6h6rn1xfFr9yTntm17Zr3AASgd5AMn0sLMMCJDdto
   72oT+CQ4hgowfkT1drU1fCiUx2tRMOTGszght/ERSwyUX2lHnl10e3H4E
   xOyx8BUsc8X+njFEUbL4qcJjt/KCHC9XzH0seuCJmCk/NLZrzy2tXxBnY
   g==;
X-CSE-ConnectionGUID: W+z7GGFrR+GKHRIP+IrldQ==
X-CSE-MsgGUID: a5Ck4OhVTn+lP1FM84Yliw==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="36181820"
X-IronPort-AV: E=Sophos;i="6.12,296,1728975600"; 
   d="scan'208";a="36181820"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 12:11:24 -0800
X-CSE-ConnectionGUID: FMvT6DZ/RBGBXfTgwxiupQ==
X-CSE-MsgGUID: 3XHaaz4PRwWz3f8/hcEtdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="106886189"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 07 Jan 2025 12:11:22 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVFv6-000FAV-0D;
	Tue, 07 Jan 2025 20:11:20 +0000
Date: Wed, 8 Jan 2025 04:10:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [staging:staging-linus 11/11]
 drivers/staging/gpib/tnt4882/tnt4882_gpib.c:1507:35: warning:
 'tnt4882_pnp_table' defined but not used
Message-ID: <202501080445.mJXxwEt2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: devel@driverdev.osuosl.org
TO: Lukas Bulwahn <lukas.bulwahn@redhat.com>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git staging-linus
head:   84b172cea4a23016dc80a44eaa7ff8b7c97b04b3
commit: 84b172cea4a23016dc80a44eaa7ff8b7c97b04b3 [11/11] staging: gpib: refer to correct config symbol in tnt4882 Makefile
:::::: branch date: 5 hours ago
:::::: commit date: 5 hours ago
config: sparc-randconfig-001-20250108 (https://download.01.org/0day-ci/archive/20250108/202501080445.mJXxwEt2-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250108/202501080445.mJXxwEt2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501080445.mJXxwEt2-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/staging/gpib/tnt4882/tnt4882_gpib.c: In function 'tnt4882_update_status':
   drivers/staging/gpib/tnt4882/tnt4882_gpib.c:762:22: warning: variable 'retval' set but not used [-Wunused-but-set-variable]
     762 |         unsigned int retval;
         |                      ^~~~~~
   drivers/staging/gpib/tnt4882/tnt4882_gpib.c: At top level:
>> drivers/staging/gpib/tnt4882/tnt4882_gpib.c:1507:35: warning: 'tnt4882_pnp_table' defined but not used [-Wunused-const-variable=]
    1507 | static const struct pnp_device_id tnt4882_pnp_table[] = {
         |                                   ^~~~~~~~~~~~~~~~~


vim +/tnt4882_pnp_table +1507 drivers/staging/gpib/tnt4882/tnt4882_gpib.c

0cd5b05551e022 Dave Penkler 2024-09-18  1506  
0cd5b05551e022 Dave Penkler 2024-09-18 @1507  static const struct pnp_device_id tnt4882_pnp_table[] = {
0cd5b05551e022 Dave Penkler 2024-09-18  1508  	{.id = "NICC601"},
0cd5b05551e022 Dave Penkler 2024-09-18  1509  	{.id = ""}
0cd5b05551e022 Dave Penkler 2024-09-18  1510  };
0cd5b05551e022 Dave Penkler 2024-09-18  1511  MODULE_DEVICE_TABLE(pnp, tnt4882_pnp_table);
0cd5b05551e022 Dave Penkler 2024-09-18  1512  

:::::: The code at line 1507 was first introduced by commit
:::::: 0cd5b05551e02242f9fa15f1e87cefff9efa3080 staging: gpib: Add TNT4882 chip based GPIB driver

:::::: TO: Dave Penkler <dpenkler@gmail.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
