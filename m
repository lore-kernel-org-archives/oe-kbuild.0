Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C1383C04
	for <oe-kbuild@lists.linux.dev>; Sat, 25 Nov 2023 06:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TVJu14wH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700893275; x=1732429275;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=xuSLBCiM9V8q04eMIjGs1JSnTpsH0aFKV8VO5l/Tut8=;
  b=TVJu14wHLmBoiHdH0veMrN3kQuhIKgeiPNW4hsOTtiElLmWW4bh3MGer
   /Qu7lu6FMbgcbMzaNstHV4z0zPJg5VmOJE9D5PcV4ibIjlSL2vzRuRn3x
   bVlSST4Hzvm6vJGDAUGRxsJgOe5n/RfcDvsjObNp88PgF8+QeAW1PJ0yR
   GeLHabnTYaIjuM7ptM9oTWsiylg5uHsO095SXzsPmgclnAJk7O2xhsBJI
   xCMuSu1CsgUGEQL8MAOkQar70NBrakah+jtQobpi4woIthDIqOiuSj+hY
   xXuTOzwLDVTAZ/MuDR3iqMHWj3nFt/IDpIfdbVVmuA6WVT5VMd2sUDLiB
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="382900929"
X-IronPort-AV: E=Sophos;i="6.04,225,1695711600"; 
   d="scan'208";a="382900929"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 22:21:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="717542739"
X-IronPort-AV: E=Sophos;i="6.04,225,1695711600"; 
   d="scan'208";a="717542739"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 24 Nov 2023 22:21:09 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r6m2N-0003hB-2F;
	Sat, 25 Nov 2023 06:21:07 +0000
Date: Sat, 25 Nov 2023 14:20:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v6 4/9] landlock: Add IOCTL access right
Message-ID: <202311251210.nZC1cSN9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "low confidence static check warning: security/landlock/fs.c:195:9: sparse: sparse: bad constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20231124173026.3257122-5-gnoack@google.com>
References: <20231124173026.3257122-5-gnoack@google.com>
TO: "Günther Noack" <gnoack@google.com>

Hi Günther,

kernel test robot noticed the following build warnings:

[auto build test WARNING on shuah-kselftest/next]
[also build test WARNING on shuah-kselftest/fixes linus/master v6.7-rc2]
[cannot apply to next-20231124]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/G-nther-Noack/selftests-landlock-Rename-permitted-to-allowed-in-ftruncate-tests/20231125-023121
base:   https://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git next
patch link:    https://lore.kernel.org/r/20231124173026.3257122-5-gnoack%40google.com
patch subject: [PATCH v6 4/9] landlock: Add IOCTL access right
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
config: i386-randconfig-062-20231125 (https://download.01.org/0day-ci/archive/20231125/202311251210.nZC1cSN9-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231125/202311251210.nZC1cSN9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311251210.nZC1cSN9-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> security/landlock/fs.c:195:9: sparse: sparse: bad constant expression

vim +195 security/landlock/fs.c

64a4a71c8e60b9 Günther Noack 2023-11-24  181  
64a4a71c8e60b9 Günther Noack 2023-11-24  182  /**
64a4a71c8e60b9 Günther Noack 2023-11-24  183   * landlock_expand_access_fs() - Returns @access with the synthetic IOCTL group
64a4a71c8e60b9 Günther Noack 2023-11-24  184   * flags enabled if necessary.
64a4a71c8e60b9 Günther Noack 2023-11-24  185   *
64a4a71c8e60b9 Günther Noack 2023-11-24  186   * @handled: Handled FS access rights.
64a4a71c8e60b9 Günther Noack 2023-11-24  187   * @access: FS access rights to expand.
64a4a71c8e60b9 Günther Noack 2023-11-24  188   *
64a4a71c8e60b9 Günther Noack 2023-11-24  189   * Returns: @access expanded by the necessary flags for the synthetic IOCTL
64a4a71c8e60b9 Günther Noack 2023-11-24  190   * access rights.
64a4a71c8e60b9 Günther Noack 2023-11-24  191   */
64a4a71c8e60b9 Günther Noack 2023-11-24  192  static access_mask_t landlock_expand_access_fs(const access_mask_t handled,
64a4a71c8e60b9 Günther Noack 2023-11-24  193  					       const access_mask_t access)
64a4a71c8e60b9 Günther Noack 2023-11-24  194  {
64a4a71c8e60b9 Günther Noack 2023-11-24 @195  	static_assert((ioctl_groups & LANDLOCK_MASK_ACCESS_FS) == ioctl_groups);
64a4a71c8e60b9 Günther Noack 2023-11-24  196  
64a4a71c8e60b9 Günther Noack 2023-11-24  197  	return access |
64a4a71c8e60b9 Günther Noack 2023-11-24  198  	       expand_ioctl(handled, access, LANDLOCK_ACCESS_FS_WRITE_FILE,
64a4a71c8e60b9 Günther Noack 2023-11-24  199  			    LANDLOCK_ACCESS_FS_IOCTL_GROUP1 |
64a4a71c8e60b9 Günther Noack 2023-11-24  200  				    LANDLOCK_ACCESS_FS_IOCTL_GROUP2 |
64a4a71c8e60b9 Günther Noack 2023-11-24  201  				    LANDLOCK_ACCESS_FS_IOCTL_GROUP4) |
64a4a71c8e60b9 Günther Noack 2023-11-24  202  	       expand_ioctl(handled, access, LANDLOCK_ACCESS_FS_READ_FILE,
64a4a71c8e60b9 Günther Noack 2023-11-24  203  			    LANDLOCK_ACCESS_FS_IOCTL_GROUP1 |
64a4a71c8e60b9 Günther Noack 2023-11-24  204  				    LANDLOCK_ACCESS_FS_IOCTL_GROUP2 |
64a4a71c8e60b9 Günther Noack 2023-11-24  205  				    LANDLOCK_ACCESS_FS_IOCTL_GROUP3) |
64a4a71c8e60b9 Günther Noack 2023-11-24  206  	       expand_ioctl(handled, access, LANDLOCK_ACCESS_FS_READ_DIR,
64a4a71c8e60b9 Günther Noack 2023-11-24  207  			    LANDLOCK_ACCESS_FS_IOCTL_GROUP1);
64a4a71c8e60b9 Günther Noack 2023-11-24  208  }
64a4a71c8e60b9 Günther Noack 2023-11-24  209  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
