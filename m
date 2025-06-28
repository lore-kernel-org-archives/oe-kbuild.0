Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CF1F12E7E
	for <oe-kbuild@lists.linux.dev>; Sat, 28 Jun 2025 04:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751086045; cv=none; b=K7DSj9RJ9AVzaX/fruhkeKWzJ9yMiMvmIeZH6HWPiPYuHzgKvCb4c3/p7Q3+Kcj0C+4u41OD3ERnz4PqvGpat0vy24fq6pQ609ZlrHYZbpJKppqABH5Yxubm1EXNMMIM+SfZ0fHcij74gYwRPgWgzVuWFr43WGX83hcUnIhwQG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751086045; c=relaxed/simple;
	bh=DZqsCFWju5f1qtU5+SfcWkKlF96d+ZBrRXz4ZMYAZ9A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oLlxoH9FsJjiR9QBZXGgsHYJP60fk5ZfOlkvHQonXkgx1pCvPk1NcnQX56dhF0vNLm6z+UQPccwMCOiCrE8NbdRjMqgT7Sud+m2cjPaC1I8aHjZ+yHtbuss6UXr1IQN2wTZivv42gOBJiA2yNX433TTeVLcsXT0d0Y3c4lE+yMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Anqp4A5U; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Anqp4A5U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751086043; x=1782622043;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DZqsCFWju5f1qtU5+SfcWkKlF96d+ZBrRXz4ZMYAZ9A=;
  b=Anqp4A5UdnJ0+Qy3naTqBWU3j9eEo/mzJA2lyN0sRIvxb4rIlLqSeuvo
   6VsBtosbWf/0VQhwvGf6lGRkPhSnQOGK1HUXqb+XyVivN2UKSNm4qhbb0
   2Rj+8MdBfqeAXpa+hSfr1izmYchv6h3NJ1EyCpKrBIrdg022zaoOQ3RZv
   S/UjpD2A+GfwRaf6a3ZtZgk3nYLOr140spIpie0q/GJtb0vWvag4uNuOM
   3Kcq9ATOauODq2eJJMVit9ecIDi0chgS85gvYOMFHdYila3MgotA73M33
   BrFsgaF4nw6Hn1a/YbpI26YRqw5BVT+AF7OpGvDY3G6w/Qes4P3MH0/t8
   Q==;
X-CSE-ConnectionGUID: HFxZFpIMQOqnlsQecmrOPA==
X-CSE-MsgGUID: GDCAQ8qGSDSalM3y936eeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="53550278"
X-IronPort-AV: E=Sophos;i="6.16,272,1744095600"; 
   d="scan'208";a="53550278"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 21:47:22 -0700
X-CSE-ConnectionGUID: A3r6bKOAQTWIaFMXqlx87Q==
X-CSE-MsgGUID: msfbluVMRqKo6q9BVJjRBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,272,1744095600"; 
   d="scan'208";a="183892191"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 27 Jun 2025 21:47:21 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uVNTD-000WnG-1O;
	Sat, 28 Jun 2025 04:47:19 +0000
Date: Sat, 28 Jun 2025 12:47:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 09/12] ovl: whiteout locking changes
Message-ID: <202506281246.X6htntN7-lkp@intel.com>
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
In-Reply-To: <20250624230636.3233059-10-neil@brown.name>
References: <20250624230636.3233059-10-neil@brown.name>
TO: NeilBrown <neil@brown.name>
TO: Miklos Szeredi <miklos@szeredi.hu>
TO: Amir Goldstein <amir73il@gmail.com>
CC: linux-unionfs@vger.kernel.org
CC: Alexander Viro <viro@zeniv.linux.org.uk>
CC: Christian Brauner <brauner@kernel.org>
CC: Jan Kara <jack@suse.cz>
CC: linux-fsdevel@vger.kernel.org

Hi NeilBrown,

kernel test robot noticed the following build warnings:

[auto build test WARNING on brauner-vfs/vfs.all]
[also build test WARNING on next-20250627]
[cannot apply to mszeredi-vfs/overlayfs-next mszeredi-vfs/next linus/master v6.16-rc3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/NeilBrown/ovl-use-is_subdir-for-testing-if-one-thing-is-a-subdir-of-another/20250625-070919
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.all
patch link:    https://lore.kernel.org/r/20250624230636.3233059-10-neil%40brown.name
patch subject: [PATCH 09/12] ovl: whiteout locking changes
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-161-20250627 (https://download.01.org/0day-ci/archive/20250628/202506281246.X6htntN7-lkp@intel.com/config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202506281246.X6htntN7-lkp@intel.com/

New smatch warnings:
fs/overlayfs/dir.c:118 ovl_whiteout() error: uninitialized symbol 'err'.

Old smatch warnings:
fs/overlayfs/dir.c:58 ovl_cleanup_unlocked() error: uninitialized symbol 'err'.
fs/overlayfs/dir.c:437 ovl_clear_empty() warn: passing zero to 'ERR_PTR'

vim +/err +118 fs/overlayfs/dir.c

e9be9d5e76e348 Miklos Szeredi    2014-10-24   79  
c21c839b8448dd Chengguang Xu     2020-04-24   80  static struct dentry *ovl_whiteout(struct ovl_fs *ofs)
e9be9d5e76e348 Miklos Szeredi    2014-10-24   81  {
e9be9d5e76e348 Miklos Szeredi    2014-10-24   82  	int err;
e9be9d5e76e348 Miklos Szeredi    2014-10-24   83  	struct dentry *whiteout;
c21c839b8448dd Chengguang Xu     2020-04-24   84  	struct dentry *workdir = ofs->workdir;
e9be9d5e76e348 Miklos Szeredi    2014-10-24   85  	struct inode *wdir = workdir->d_inode;
e9be9d5e76e348 Miklos Szeredi    2014-10-24   86  
a33c6f65a2ab05 NeilBrown         2025-06-25   87  	mutex_lock(&ofs->whiteout_lock);
c21c839b8448dd Chengguang Xu     2020-04-24   88  	if (!ofs->whiteout) {
a33c6f65a2ab05 NeilBrown         2025-06-25   89  		inode_lock(wdir);
576bb263450bbb Christian Brauner 2022-04-04   90  		whiteout = ovl_lookup_temp(ofs, workdir);
a33c6f65a2ab05 NeilBrown         2025-06-25   91  		if (!IS_ERR(whiteout)) {
576bb263450bbb Christian Brauner 2022-04-04   92  			err = ovl_do_whiteout(ofs, wdir, whiteout);
e9be9d5e76e348 Miklos Szeredi    2014-10-24   93  			if (err) {
e9be9d5e76e348 Miklos Szeredi    2014-10-24   94  				dput(whiteout);
e9be9d5e76e348 Miklos Szeredi    2014-10-24   95  				whiteout = ERR_PTR(err);
c21c839b8448dd Chengguang Xu     2020-04-24   96  			}
a33c6f65a2ab05 NeilBrown         2025-06-25   97  		}
a33c6f65a2ab05 NeilBrown         2025-06-25   98  		inode_unlock(wdir);
a33c6f65a2ab05 NeilBrown         2025-06-25   99  		if (IS_ERR(whiteout))
a33c6f65a2ab05 NeilBrown         2025-06-25  100  			goto out;
c21c839b8448dd Chengguang Xu     2020-04-24  101  		ofs->whiteout = whiteout;
e9be9d5e76e348 Miklos Szeredi    2014-10-24  102  	}
e9be9d5e76e348 Miklos Szeredi    2014-10-24  103  
e4599d4b1aeff0 Amir Goldstein    2023-06-17  104  	if (!ofs->no_shared_whiteout) {
a33c6f65a2ab05 NeilBrown         2025-06-25  105  		inode_lock(wdir);
576bb263450bbb Christian Brauner 2022-04-04  106  		whiteout = ovl_lookup_temp(ofs, workdir);
a33c6f65a2ab05 NeilBrown         2025-06-25  107  		if (!IS_ERR(whiteout)) {
576bb263450bbb Christian Brauner 2022-04-04  108  			err = ovl_do_link(ofs, ofs->whiteout, wdir, whiteout);
a33c6f65a2ab05 NeilBrown         2025-06-25  109  			if (err) {
a33c6f65a2ab05 NeilBrown         2025-06-25  110  				dput(whiteout);
a33c6f65a2ab05 NeilBrown         2025-06-25  111  				whiteout = ERR_PTR(err);
a33c6f65a2ab05 NeilBrown         2025-06-25  112  			}
a33c6f65a2ab05 NeilBrown         2025-06-25  113  		}
a33c6f65a2ab05 NeilBrown         2025-06-25  114  		inode_unlock(wdir);
a33c6f65a2ab05 NeilBrown         2025-06-25  115  		if (!IS_ERR(whiteout) || PTR_ERR(whiteout) != -EMLINK)
c21c839b8448dd Chengguang Xu     2020-04-24  116  			goto out;
c21c839b8448dd Chengguang Xu     2020-04-24  117  
c21c839b8448dd Chengguang Xu     2020-04-24 @118  		pr_warn("Failed to link whiteout - disabling whiteout inode sharing(nlink=%u, err=%i)\n",
c21c839b8448dd Chengguang Xu     2020-04-24  119  			ofs->whiteout->d_inode->i_nlink, err);
e4599d4b1aeff0 Amir Goldstein    2023-06-17  120  		ofs->no_shared_whiteout = true;
c21c839b8448dd Chengguang Xu     2020-04-24  121  	}
c21c839b8448dd Chengguang Xu     2020-04-24  122  	whiteout = ofs->whiteout;
c21c839b8448dd Chengguang Xu     2020-04-24  123  	ofs->whiteout = NULL;
c21c839b8448dd Chengguang Xu     2020-04-24  124  out:
a33c6f65a2ab05 NeilBrown         2025-06-25  125  	mutex_unlock(&ofs->whiteout_lock);
e9be9d5e76e348 Miklos Szeredi    2014-10-24  126  	return whiteout;
e9be9d5e76e348 Miklos Szeredi    2014-10-24  127  }
e9be9d5e76e348 Miklos Szeredi    2014-10-24  128  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
