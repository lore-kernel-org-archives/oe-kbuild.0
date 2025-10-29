Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4608A3375B9
	for <oe-kbuild@lists.linux.dev>; Wed, 29 Oct 2025 18:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761762441; cv=none; b=nEEqFqA0SOaRDTqW+9H2adOMzrFgQwuJwySVgQO8z9BPLoJgC+xWcwB7GG2qidojhf3je/J/iylV+chqz+TFfh/v+/C2+oAg+Kx2D7ozWePqUXkI9o2zYNiFhupw3cwPAgmpedhlCJ4NRUkMU8FGS4gD5b1RQIqmAvXWa/ZILNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761762441; c=relaxed/simple;
	bh=OVwlUNN+lqzNmtBPwH5u9eG0FLwc0yUFwl2IGAV0l4Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BXKIkZm0dXwKVBaxcmSZ+92xC1heK5U4LTlAuy22YL9J0fxQCWvzOW8sXIALSjjvK0GysTOZ2TLlb9lIWATT/Jq7dlqbw0V3T3X/LretEPab5sBHFwxfcMC8k9rS1FT77lzCOQnw0HG6Fz/O3mjSD46sP7Wf0c6AOq+sT75nw8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WR3L5QdZ; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WR3L5QdZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761762439; x=1793298439;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OVwlUNN+lqzNmtBPwH5u9eG0FLwc0yUFwl2IGAV0l4Y=;
  b=WR3L5QdZQ3JDvAsGWmANJjQ0fjy1k/mLjvZ5RJ8a5uZ1shEbfDOeSnws
   fsf98Oiz/pCd/47YPp7Mdpd/hrat6PJqE02yLdXBkXsyqEZ7Fou3u968R
   OdQbEfvv9oBwSaxdE4ZHpix1+jp90r1v6M8TqlNYOH+N/KOGfMQ0fFMnM
   PH3u7CDp4B7HP9qSBbtw8A4YqrdvS58Y2IP1DJg9T2iQxg0Vcg2XNg86S
   XN4p6kho75lA5qQ2i1WPZxBm9Aid8KjXrlfeZxM+iZDIIy6ruKgFxnbDQ
   7KFWrtoyxKfURQu0A4dq8dxf+qBIJ5xM+zRZOjBoTsCyzBomOgRQXdTL/
   w==;
X-CSE-ConnectionGUID: 25s8471NTMGHpUgZ4uHeJg==
X-CSE-MsgGUID: e11E+fnhRZW/T/7Mptkaag==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="62918321"
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; 
   d="scan'208";a="62918321"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 11:27:18 -0700
X-CSE-ConnectionGUID: 7Ok5QxBwSDeNBI+U1tKDlg==
X-CSE-MsgGUID: 22Z9STuZQ1WEkIS1nleYOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; 
   d="scan'208";a="216601784"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 29 Oct 2025 11:27:17 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vEAt9-000L1D-0Y;
	Wed, 29 Oct 2025 18:27:15 +0000
Date: Thu, 30 Oct 2025 02:02:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: fs/overlayfs/dir.c:122:4-11: WARNING: Consider using %pe to print
 PTR_ERR()
Message-ID: <202510300110.zNO9YJMV-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Antonio Quartulli <antonio@mandelbit.com>
CC: Christian Brauner <brauner@kernel.org>
CC: NeilBrown <neil@brown.name>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e53642b87a4f4b03a8d7e5f8507fc3cd0c595ea6
commit: 672820a070ea5e6ae114f6109726a4e18313a527 ovl: properly print correct variable
date:   3 months ago
:::::: branch date: 17 hours ago
:::::: commit date: 3 months ago
config: m68k-randconfig-r052-20251030 (https://download.01.org/0day-ci/archive/20251030/202510300110.zNO9YJMV-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202510300110.zNO9YJMV-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/overlayfs/dir.c:122:4-11: WARNING: Consider using %pe to print PTR_ERR()

vim +122 fs/overlayfs/dir.c

e9be9d5e76e3487 Miklos Szeredi    2014-10-24   80  
c21c839b8448dd4 Chengguang Xu     2020-04-24   81  static struct dentry *ovl_whiteout(struct ovl_fs *ofs)
e9be9d5e76e3487 Miklos Szeredi    2014-10-24   82  {
e9be9d5e76e3487 Miklos Szeredi    2014-10-24   83  	int err;
e9be9d5e76e3487 Miklos Szeredi    2014-10-24   84  	struct dentry *whiteout;
c21c839b8448dd4 Chengguang Xu     2020-04-24   85  	struct dentry *workdir = ofs->workdir;
e9be9d5e76e3487 Miklos Szeredi    2014-10-24   86  	struct inode *wdir = workdir->d_inode;
e9be9d5e76e3487 Miklos Szeredi    2014-10-24   87  
8afa0a736713898 NeilBrown         2025-07-16   88  	guard(mutex)(&ofs->whiteout_lock);
8afa0a736713898 NeilBrown         2025-07-16   89  
c21c839b8448dd4 Chengguang Xu     2020-04-24   90  	if (!ofs->whiteout) {
8afa0a736713898 NeilBrown         2025-07-16   91  		inode_lock_nested(wdir, I_MUTEX_PARENT);
576bb263450bbba Christian Brauner 2022-04-04   92  		whiteout = ovl_lookup_temp(ofs, workdir);
8afa0a736713898 NeilBrown         2025-07-16   93  		if (!IS_ERR(whiteout)) {
576bb263450bbba Christian Brauner 2022-04-04   94  			err = ovl_do_whiteout(ofs, wdir, whiteout);
e9be9d5e76e3487 Miklos Szeredi    2014-10-24   95  			if (err) {
e9be9d5e76e3487 Miklos Szeredi    2014-10-24   96  				dput(whiteout);
e9be9d5e76e3487 Miklos Szeredi    2014-10-24   97  				whiteout = ERR_PTR(err);
c21c839b8448dd4 Chengguang Xu     2020-04-24   98  			}
8afa0a736713898 NeilBrown         2025-07-16   99  		}
8afa0a736713898 NeilBrown         2025-07-16  100  		inode_unlock(wdir);
8afa0a736713898 NeilBrown         2025-07-16  101  		if (IS_ERR(whiteout))
8afa0a736713898 NeilBrown         2025-07-16  102  			return whiteout;
c21c839b8448dd4 Chengguang Xu     2020-04-24  103  		ofs->whiteout = whiteout;
e9be9d5e76e3487 Miklos Szeredi    2014-10-24  104  	}
e9be9d5e76e3487 Miklos Szeredi    2014-10-24  105  
e4599d4b1aeff03 Amir Goldstein    2023-06-17  106  	if (!ofs->no_shared_whiteout) {
8afa0a736713898 NeilBrown         2025-07-16  107  		inode_lock_nested(wdir, I_MUTEX_PARENT);
576bb263450bbba Christian Brauner 2022-04-04  108  		whiteout = ovl_lookup_temp(ofs, workdir);
8afa0a736713898 NeilBrown         2025-07-16  109  		if (!IS_ERR(whiteout)) {
576bb263450bbba Christian Brauner 2022-04-04  110  			err = ovl_do_link(ofs, ofs->whiteout, wdir, whiteout);
8afa0a736713898 NeilBrown         2025-07-16  111  			if (err) {
8afa0a736713898 NeilBrown         2025-07-16  112  				dput(whiteout);
8afa0a736713898 NeilBrown         2025-07-16  113  				whiteout = ERR_PTR(err);
8afa0a736713898 NeilBrown         2025-07-16  114  			}
8afa0a736713898 NeilBrown         2025-07-16  115  		}
8afa0a736713898 NeilBrown         2025-07-16  116  		inode_unlock(wdir);
8afa0a736713898 NeilBrown         2025-07-16  117  		if (!IS_ERR(whiteout))
8afa0a736713898 NeilBrown         2025-07-16  118  			return whiteout;
8afa0a736713898 NeilBrown         2025-07-16  119  		if (PTR_ERR(whiteout) != -EMLINK) {
672820a070ea5e6 Antonio Quartulli 2025-07-21  120  			pr_warn("Failed to link whiteout - disabling whiteout inode sharing(nlink=%u, err=%lu)\n",
672820a070ea5e6 Antonio Quartulli 2025-07-21  121  				ofs->whiteout->d_inode->i_nlink,
672820a070ea5e6 Antonio Quartulli 2025-07-21 @122  				PTR_ERR(whiteout));
e4599d4b1aeff03 Amir Goldstein    2023-06-17  123  			ofs->no_shared_whiteout = true;
c21c839b8448dd4 Chengguang Xu     2020-04-24  124  		}
c21c839b8448dd4 Chengguang Xu     2020-04-24  125  	}
c21c839b8448dd4 Chengguang Xu     2020-04-24  126  	whiteout = ofs->whiteout;
c21c839b8448dd4 Chengguang Xu     2020-04-24  127  	ofs->whiteout = NULL;
e9be9d5e76e3487 Miklos Szeredi    2014-10-24  128  	return whiteout;
e9be9d5e76e3487 Miklos Szeredi    2014-10-24  129  }
e9be9d5e76e3487 Miklos Szeredi    2014-10-24  130  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
