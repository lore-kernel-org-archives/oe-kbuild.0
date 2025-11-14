Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C6E42F3C09
	for <oe-kbuild@lists.linux.dev>; Fri, 14 Nov 2025 06:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763102823; cv=none; b=W2H5XgfIuqn5s+lnNPaDInbWzr+eqitYI18Eo4bJUlUCqwC2QlEw70Sb1AfkIUY7VJbdV6Vbl1SlS5G1+IM8ET5k5/LUjxld1Y5qE6HlulcJRt4xAtfJUrAkT0iC23GnOb9u/ja6btVKqDVNoipZdfb+UKrinb1oWxelHx8WUls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763102823; c=relaxed/simple;
	bh=9DzxmDEFKNGuQisnp+e2kJOCY9ZH+wMTFTQNwyY0wZA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gcnVCuNkpU7WP7Ldee0/Ye+Z0pSzofqQ8prYEzvjPOYHPkOr9IGwAR4MtRtcuhqQ4Ddu3EJ9vFhq8iA5lwDWGLCcE3jinrIFCohzqLTUI11tonvyLTX31Qwb107eCymFaCMdlMwxcC973uoAnh52xUpAemIbtRsUFsGD+rvsLdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KxHMwTvG; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KxHMwTvG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763102822; x=1794638822;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9DzxmDEFKNGuQisnp+e2kJOCY9ZH+wMTFTQNwyY0wZA=;
  b=KxHMwTvGanhSgTABztgDqJ4/aIn76i9Uybn0CArimeW9X43/K8IvYT9V
   4uFlyBWCrgy+klriodAtncNQ7UxjMrTM3cCPQ4XlUpUjQ5z15qnABQxa0
   kC8a1fNNa7cLC5Ij0kXHa2espLYxy9U4jgKuBhqwIEoLaH4AVI8k0qjNU
   dVhJHpPruh3x+ahNDVWbJb+GwADc2QhSSmBDIQzx7ByJ3u5blCisCZyj8
   TRsAru5Vu2DfdWnhfsNeSWV2dDMc8kCOExJT0TviHYN5yVW5vaHDPjJfO
   Og1M/DOCwsVOcu7yvapnmKAnRzNMpyJk35Gqwt1xPSA4mfHBp18m7ZbiV
   A==;
X-CSE-ConnectionGUID: 6qklo+keRvKJsDCdkeT1Xg==
X-CSE-MsgGUID: ykIfDQgTSMan09vfGdCEEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="64400129"
X-IronPort-AV: E=Sophos;i="6.19,304,1754982000"; 
   d="scan'208";a="64400129"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 22:47:01 -0800
X-CSE-ConnectionGUID: SXm/2bEIQEy+6jLk8BipOw==
X-CSE-MsgGUID: rm+Mmp+PRaillLaiwW/hZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,304,1754982000"; 
   d="scan'208";a="220359554"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 13 Nov 2025 22:46:59 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJnaD-0006FF-0q;
	Fri, 14 Nov 2025 06:46:57 +0000
Date: Fri, 14 Nov 2025 14:46:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [brauner-github:work.ovl.cred.guard 11/46] fs/overlayfs/file.c:61
 ovl_open_realfile() error: uninitialized symbol 'realfile'.
Message-ID: <202511141006.rqcXpADx-lkp@intel.com>
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
CC: Christian Brauner <christianvanbrauner@gmail.com>
TO: Christian Brauner <brauner@kernel.org>

tree:   https://github.com/brauner/linux.git work.ovl.cred.guard
head:   74fa97e66e24a79a77ee469a7e8305f2013edd1f
commit: c5321acecb44ce9fec6dc9d4eb92d431064a4bb8 [11/46] ovl: port ovl_open_realfile() to cred guard
:::::: branch date: 6 hours ago
:::::: commit date: 15 hours ago
config: parisc-randconfig-r072-20251114 (https://download.01.org/0day-ci/archive/20251114/202511141006.rqcXpADx-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 11.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511141006.rqcXpADx-lkp@intel.com/

smatch warnings:
fs/overlayfs/file.c:61 ovl_open_realfile() error: uninitialized symbol 'realfile'.

vim +/realfile +61 fs/overlayfs/file.c

8c444d2a971fdcc Vivek Goyal       2018-05-11  26  
8c444d2a971fdcc Vivek Goyal       2018-05-11  27  static struct file *ovl_open_realfile(const struct file *file,
2d3430875a3a976 Al Viro           2022-08-04  28  				      const struct path *realpath)
d1d04ef8572bc8c Miklos Szeredi    2018-07-18  29  {
1248ea4b91bcdaf Amir Goldstein    2022-04-04  30  	struct inode *realinode = d_inode(realpath->dentry);
d1d04ef8572bc8c Miklos Szeredi    2018-07-18  31  	struct inode *inode = file_inode(file);
4609e1f18e19c3b Christian Brauner 2023-01-13  32  	struct mnt_idmap *real_idmap;
d1d04ef8572bc8c Miklos Szeredi    2018-07-18  33  	struct file *realfile;
81a33c1ee941c3b Amir Goldstein    2020-06-18  34  	int flags = file->f_flags | OVL_OPEN_FLAGS;
05acefb4872dae8 Miklos Szeredi    2020-06-02  35  	int acc_mode = ACC_MODE(flags);
05acefb4872dae8 Miklos Szeredi    2020-06-02  36  	int err;
05acefb4872dae8 Miklos Szeredi    2020-06-02  37  
05acefb4872dae8 Miklos Szeredi    2020-06-02  38  	if (flags & O_APPEND)
05acefb4872dae8 Miklos Szeredi    2020-06-02  39  		acc_mode |= MAY_APPEND;
d1d04ef8572bc8c Miklos Szeredi    2018-07-18  40  
c5321acecb44ce9 Christian Brauner 2025-11-12  41  	with_ovl_creds(inode->i_sb) {
4609e1f18e19c3b Christian Brauner 2023-01-13  42  		real_idmap = mnt_idmap(realpath->mnt);
c5321acecb44ce9 Christian Brauner 2025-11-12  43  		err = inode_permission(real_idmap, realinode,
c5321acecb44ce9 Christian Brauner 2025-11-12  44  				       MAY_OPEN | acc_mode);
05acefb4872dae8 Miklos Szeredi    2020-06-02  45  		if (err) {
05acefb4872dae8 Miklos Szeredi    2020-06-02  46  			realfile = ERR_PTR(err);
05acefb4872dae8 Miklos Szeredi    2020-06-02  47  		} else {
01beba7957a26f9 Christian Brauner 2023-01-13  48  			if (!inode_owner_or_capable(real_idmap, realinode))
b6650dab404c701 Miklos Szeredi    2020-12-14  49  				flags &= ~O_NOATIME;
b6650dab404c701 Miklos Szeredi    2020-12-14  50  
3ec2529eca6f175 Amir Goldstein    2025-06-07  51  			realfile = backing_file_open(file_user_path(file),
c5321acecb44ce9 Christian Brauner 2025-11-12  52  						     flags, realpath,
c5321acecb44ce9 Christian Brauner 2025-11-12  53  						     current_cred());
c5321acecb44ce9 Christian Brauner 2025-11-12  54  		}
05acefb4872dae8 Miklos Szeredi    2020-06-02  55  	}
d1d04ef8572bc8c Miklos Szeredi    2018-07-18  56  
d1d04ef8572bc8c Miklos Szeredi    2018-07-18  57  	pr_debug("open(%p[%pD2/%c], 0%o) -> (%p, 0%o)\n",
8c444d2a971fdcc Vivek Goyal       2018-05-11  58  		 file, file, ovl_whatisit(inode, realinode), file->f_flags,
d1d04ef8572bc8c Miklos Szeredi    2018-07-18  59  		 realfile, IS_ERR(realfile) ? 0 : realfile->f_flags);
d1d04ef8572bc8c Miklos Szeredi    2018-07-18  60  
d1d04ef8572bc8c Miklos Szeredi    2018-07-18 @61  	return realfile;
d1d04ef8572bc8c Miklos Szeredi    2018-07-18  62  }
d1d04ef8572bc8c Miklos Szeredi    2018-07-18  63  

:::::: The code at line 61 was first introduced by commit
:::::: d1d04ef8572bc8c22265057bd3d5a79f223f8f52 ovl: stack file ops

:::::: TO: Miklos Szeredi <mszeredi@redhat.com>
:::::: CC: Miklos Szeredi <mszeredi@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
