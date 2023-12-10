Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 664E3522F
	for <oe-kbuild@lists.linux.dev>; Sun, 10 Dec 2023 09:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lcYtSjhP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702199260; x=1733735260;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OxSf7/e6jGERuEEX2eiK2y0W8Qb6Rh8wrpvwsxwQQ+4=;
  b=lcYtSjhP3htxuly0fKoVq8efk6mMW36uXn9XWhRI+kd7Yimc3gYhqDb0
   GG39cgrzAAngUrzw9YoapqVfDfyovaCudXQFDfunOu+vArYvP1mfcLeMd
   d4Iae48MwAbemqr/2Vr5q9koXANI7TlADyIkehkhulnv4V/JR1ja+DL6k
   fjEWd8DajK+ejKXl+Q2bQ3+Plw45yrVJXbs4DkPA1dc4TrjPuhxqnjlop
   SfgjIL0qzJ3vHQaue29JlXPzkdvbOPvW/FHjHmtoeet/ESDg+6Xo2dbUb
   Ndfut5aRRp2P392+NLqa9FIgILXh2rZM8Ij0gC/9bsLKE9XTp3JrVrfVo
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10919"; a="1362238"
X-IronPort-AV: E=Sophos;i="6.04,265,1695711600"; 
   d="scan'208";a="1362238"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2023 01:07:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10919"; a="838632118"
X-IronPort-AV: E=Sophos;i="6.04,265,1695711600"; 
   d="scan'208";a="838632118"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 10 Dec 2023 01:07:37 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rCFmh-000GeE-1v;
	Sun, 10 Dec 2023 09:07:35 +0000
Date: Sun, 10 Dec 2023 17:07:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [kdave-btrfs-devel:misc-next 7/75] fs/btrfs/compression.c:195:12-13:
 WARNING opportunity for max()
Message-ID: <202312101627.7jtxbGy6-lkp@intel.com>
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
TO: David Sterba <dsterba@suse.com>
CC: Josef Bacik <josef@toxicpanda.com>

tree:   https://github.com/kdave/btrfs-devel.git misc-next
head:   14d1d39586246ca9d4ce97049c98be849e3bbcd9
commit: b1c12b1df0a34caa214e9ac11834652234e6fa91 [7/75] btrfs: use shrinker for compression page pool
:::::: branch date: 2 days ago
:::::: commit date: 6 days ago
config: x86_64-randconfig-104-20231210 (https://download.01.org/0day-ci/archive/20231210/202312101627.7jtxbGy6-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20231210/202312101627.7jtxbGy6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202312101627.7jtxbGy6-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/btrfs/compression.c:195:12-13: WARNING opportunity for max()

vim +195 fs/btrfs/compression.c

b1c12b1df0a34c David Sterba 2023-11-15  183  
b1c12b1df0a34c David Sterba 2023-11-15  184  static unsigned long btrfs_compr_pool_count(struct shrinker *sh, struct shrink_control *sc)
b1c12b1df0a34c David Sterba 2023-11-15  185  {
b1c12b1df0a34c David Sterba 2023-11-15  186  	int ret;
b1c12b1df0a34c David Sterba 2023-11-15  187  
b1c12b1df0a34c David Sterba 2023-11-15  188  	/*
b1c12b1df0a34c David Sterba 2023-11-15  189  	 * We must not read the values more than once if 'ret' gets expanded in
b1c12b1df0a34c David Sterba 2023-11-15  190  	 * the return statement so we don't accidentally return a negative
b1c12b1df0a34c David Sterba 2023-11-15  191  	 * number, even if the first condition finds it positive.
b1c12b1df0a34c David Sterba 2023-11-15  192  	 */
b1c12b1df0a34c David Sterba 2023-11-15  193  	ret = READ_ONCE(compr_pool.count) - READ_ONCE(compr_pool.thresh);
b1c12b1df0a34c David Sterba 2023-11-15  194  
b1c12b1df0a34c David Sterba 2023-11-15 @195  	return ret > 0 ? ret : 0;
b1c12b1df0a34c David Sterba 2023-11-15  196  }
b1c12b1df0a34c David Sterba 2023-11-15  197  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
