Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 498781DE2DF
	for <oe-kbuild@lists.linux.dev>; Sat,  1 Mar 2025 11:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740828191; cv=none; b=GNcm0Qtxbwa0G7F0/3XG8cKclyPxHpPbTib+l+Yu2HcUyCD4aHzeFW07ufnuwrsF4TbRmCZtCQenRP2rH9Lj6ODaz2beDr49IQ/M7dipjtau5DjDqO/4ET1hueT9FW+Ro4gpDezQcpL27Sqq7mMvIWOFYI9yj9YMZ2wxULwUg9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740828191; c=relaxed/simple;
	bh=S3daWjIJ4ytwWs0MlRpfnRxUmKb7bUFS+v+YtsKdnM8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NN2XXz2A9gWuUfPYX5tN0VHfMueqcqQSQH8pacjkg1Ar3TbFMCZxk5mu6kuRvHSlHD8ai73vVG6ioj3dCzeio4+oqgJDovl2Q2fxF9i5MzUJ6LfeV0/sEbr/6I1e1KhyHopOl3xKApYa1UmEvGOCXLeY7ZTYwZfhwQ+jHz6hzrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ph1ijHY/; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ph1ijHY/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740828189; x=1772364189;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=S3daWjIJ4ytwWs0MlRpfnRxUmKb7bUFS+v+YtsKdnM8=;
  b=Ph1ijHY/GoCvkdNIxpTgE3xFGAs/vna0/6BZ9TZJ0kAIzqRckNeJcQmK
   eIbx6IPeSpzVTEj22Kq5MmeIe33OcFXOJ5zDVUrKc7f4G+vLNYn8ha9YW
   WhFXp+/i1zN1eRg09GjO/nq73MVfDHJrY9BzfS/0S+4ydySlFr1hkQPRJ
   R391l+W66GRrIpySdR6KjYtRTtFkWyopQztf+yvunAnZLa6/Zgv0cSaJ8
   00U9ZTD4g6I9kpMEYKCOpPc2drRr4vIv2CGsvFEwN+3HLTVmkYAASLtQH
   xiU9F08GKwXPTwP2Jvi9NfxDa0OPbjhU9Ab58P/Ai9pSQB8Sh4FHuoPYU
   A==;
X-CSE-ConnectionGUID: HX6G8gwITfaAbFXfY9VBAQ==
X-CSE-MsgGUID: yZ77ft2oTrukUWv8NUPbRA==
X-IronPort-AV: E=McAfee;i="6700,10204,11359"; a="45670895"
X-IronPort-AV: E=Sophos;i="6.13,325,1732608000"; 
   d="scan'208";a="45670895"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2025 03:23:08 -0800
X-CSE-ConnectionGUID: jCxuPYuvQ/iCixQgSrUxlw==
X-CSE-MsgGUID: 7PCpHXA+SAGuqp1e1spwnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="118465807"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 01 Mar 2025 03:23:07 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1toKvw-000GBe-1q;
	Sat, 01 Mar 2025 11:23:04 +0000
Date: Sat, 1 Mar 2025 19:22:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [brauner-vfs:vfs-6.15.async.dir 7/11] fs/fuse/dir.c:1146 fuse_link()
 warn: passing zero to 'PTR_ERR'
Message-ID: <202503011903.7xOtigjD-lkp@intel.com>
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
TO: NeilBrown <neilb@suse.de>
CC: Christian Brauner <brauner@kernel.org>
CC: Jeff Layton <jlayton@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs-6.15.async.dir
head:   ddf2b1bdf725c7b06d42133519c360e3afc2f3d4
commit: bac12649d4e59929dd13e07492899ccd98458210 [7/11] fuse: return correct dentry for ->mkdir
:::::: branch date: 25 hours ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-161-20250301 (https://download.01.org/0day-ci/archive/20250301/202503011903.7xOtigjD-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202503011903.7xOtigjD-lkp@intel.com/

smatch warnings:
fs/fuse/dir.c:1146 fuse_link() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +1146 fs/fuse/dir.c

1560c974dcd40a Miklos Szeredi 2014-04-28  1122  
9e6268db496a25 Miklos Szeredi 2005-09-09  1123  static int fuse_link(struct dentry *entry, struct inode *newdir,
9e6268db496a25 Miklos Szeredi 2005-09-09  1124  		     struct dentry *newent)
9e6268db496a25 Miklos Szeredi 2005-09-09  1125  {
bac12649d4e599 NeilBrown      2025-02-27  1126  	struct dentry *de;
9e6268db496a25 Miklos Szeredi 2005-09-09  1127  	struct fuse_link_in inarg;
2b0143b5c986be David Howells  2015-03-17  1128  	struct inode *inode = d_inode(entry);
fcee216beb9c15 Max Reitz      2020-05-06  1129  	struct fuse_mount *fm = get_fuse_mount(inode);
7078187a795f86 Miklos Szeredi 2014-12-12  1130  	FUSE_ARGS(args);
9e6268db496a25 Miklos Szeredi 2005-09-09  1131  
9e6268db496a25 Miklos Szeredi 2005-09-09  1132  	memset(&inarg, 0, sizeof(inarg));
9e6268db496a25 Miklos Szeredi 2005-09-09  1133  	inarg.oldnodeid = get_node_id(inode);
d5b4854357f478 Miklos Szeredi 2019-09-10  1134  	args.opcode = FUSE_LINK;
d5b4854357f478 Miklos Szeredi 2019-09-10  1135  	args.in_numargs = 2;
d5b4854357f478 Miklos Szeredi 2019-09-10  1136  	args.in_args[0].size = sizeof(inarg);
d5b4854357f478 Miklos Szeredi 2019-09-10  1137  	args.in_args[0].value = &inarg;
d5b4854357f478 Miklos Szeredi 2019-09-10  1138  	args.in_args[1].size = newent->d_name.len + 1;
d5b4854357f478 Miklos Szeredi 2019-09-10  1139  	args.in_args[1].value = newent->d_name.name;
bac12649d4e599 NeilBrown      2025-02-27  1140  	de = create_new_entry(&invalid_mnt_idmap, fm, &args, newdir, newent, inode->i_mode);
bac12649d4e599 NeilBrown      2025-02-27  1141  	if (!IS_ERR(de))
97f044f690bac2 Miklos Szeredi 2021-10-22  1142  		fuse_update_ctime_in_cache(inode);
bac12649d4e599 NeilBrown      2025-02-27  1143  	else if (PTR_ERR(de) == -EINTR)
ac45d61357e86b Miklos Szeredi 2012-03-05  1144  		fuse_invalidate_attr(inode);
97f044f690bac2 Miklos Szeredi 2021-10-22  1145  
bac12649d4e599 NeilBrown      2025-02-27 @1146  	return PTR_ERR(de);
9e6268db496a25 Miklos Szeredi 2005-09-09  1147  }
9e6268db496a25 Miklos Szeredi 2005-09-09  1148  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
