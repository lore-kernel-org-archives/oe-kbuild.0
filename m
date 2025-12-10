Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E1BF32827E
	for <oe-kbuild@lists.linux.dev>; Wed, 10 Dec 2025 18:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765392773; cv=none; b=njjirKBjZmb05N0+BueLCwg4ZrbvE2pFRu4UQ5ISDcolut+ER/yeQaioRM22SI3gojr0GyNIgcfHItkLGfBhDRNYON4qUCKb5odS9zs0L0YqMyBXjCCdPr/pYrn+XAk9Ade+ytfOjI3Ca2E3pvNqK5Qfz3G3HxiBZnlpxPgOWH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765392773; c=relaxed/simple;
	bh=6nAaQxFhkEBTfgHqiFTmSwFcR4/b9xbirTdiUED1BuI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=s+KkJtamDuGS59wi5ik2RprgRmO3vfA1dg9JOMVGGSrBPLolHUANTdpqP3+7LBdvroNYcpR5x4ajkzCbzFIFRPWmOMJWskilJ2o4YYZWYBqMjHzw5M+iM1oX3PNjpWJv5u7n0za4gjGA3MM0SJLmTjcnfoPO7ZmCcSKHBqh5O8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hpqolU3y; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hpqolU3y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765392771; x=1796928771;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6nAaQxFhkEBTfgHqiFTmSwFcR4/b9xbirTdiUED1BuI=;
  b=hpqolU3yCqyewTx4ttjEcuNEcJW38aM6pDx1vglPS/GTVexu3ZxugyMP
   Fkk3M2sIe85tLujRq9+zhBzXFTZlWZoUQJ7QG8yOqqnNlO32L+gPgm3PC
   p7cnoBosj3PCl+HbK9m/NH/bhwk/FC37N3MZBBJnWE1xhDyW9x3WNTiXJ
   4Y0zib4jPrwbZxH4MjS17Isyw8FqBoRptsNY7N4Pi3avP2u5ZfQXhbatp
   UY5P32XBKy/sQ2JzQNdjKqOft/rJmr4mVLDua/t4GPbVpZjD8C7EpKNYU
   LNdp4bq3C+QIR5Qff9/VjPU4h5oY503VJHxbwwHUpd8QLg9FjcIHwt2mi
   Q==;
X-CSE-ConnectionGUID: S2kPMzKwTdONYXh9uYTkQA==
X-CSE-MsgGUID: 6CP9GXo0RHS3EqHZ0UbeHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="84977456"
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; 
   d="scan'208";a="84977456"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 10:52:48 -0800
X-CSE-ConnectionGUID: W/MaZxDETG255Ax+7syODw==
X-CSE-MsgGUID: t+ZDqzTOT5KMLvxoZlY1Zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; 
   d="scan'208";a="200758750"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 10 Dec 2025 10:52:47 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTPIq-000000003ex-3znC;
	Wed, 10 Dec 2025 18:52:44 +0000
Date: Thu, 11 Dec 2025 02:52:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/exfat/namei.c:880 exfat_mkdir() warn: passing zero to 'ERR_PTR'
Message-ID: <202512110206.Le6Dh87G-lkp@intel.com>
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
TO: NeilBrown <neilb@suse.de>
CC: Christian Brauner <brauner@kernel.org>
CC: Jeff Layton <jlayton@kernel.org>
CC: Jan Kara <jack@suse.cz>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0048fbb4011ec55c32d3148b2cda56433f273375
commit: 88d5baf69082e5b410296435008329676b687549 Change inode_operations.mkdir to return struct dentry *
date:   10 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 10 months ago
config: arm-randconfig-r072-20251210 (https://download.01.org/0day-ci/archive/20251211/202512110206.Le6Dh87G-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512110206.Le6Dh87G-lkp@intel.com/

New smatch warnings:
fs/exfat/namei.c:880 exfat_mkdir() warn: passing zero to 'ERR_PTR'
fs/jfs/namei.c:311 jfs_mkdir() warn: passing zero to 'ERR_PTR'
fs/ocfs2/namei.c:660 ocfs2_mkdir() warn: passing positive error code '(-512),(-122),(-28),(-4),524289' to 'ERR_PTR'
fs/ocfs2/dlmfs/dlmfs.c:451 dlmfs_mkdir() warn: passing zero to 'ERR_PTR'

Old smatch warnings:
fs/exfat/namei.c:374 exfat_find_empty_entry() error: uninitialized symbol 'last_clu'.
fs/ocfs2/namei.c:164 ocfs2_lookup() warn: passing positive error code '(-512),(-122),(-28),(-4),524289' to 'ERR_PTR'

vim +/ERR_PTR +880 fs/exfat/namei.c

5f2aa075070cf5 Namjae Jeon       2020-03-02  837  
88d5baf69082e5 NeilBrown         2025-02-27  838  static struct dentry *exfat_mkdir(struct mnt_idmap *idmap, struct inode *dir,
549c7297717c32 Christian Brauner 2021-01-21  839  				  struct dentry *dentry, umode_t mode)
5f2aa075070cf5 Namjae Jeon       2020-03-02  840  {
5f2aa075070cf5 Namjae Jeon       2020-03-02  841  	struct super_block *sb = dir->i_sb;
5f2aa075070cf5 Namjae Jeon       2020-03-02  842  	struct inode *inode;
5f2aa075070cf5 Namjae Jeon       2020-03-02  843  	struct exfat_dir_entry info;
5f2aa075070cf5 Namjae Jeon       2020-03-02  844  	loff_t i_pos;
5f2aa075070cf5 Namjae Jeon       2020-03-02  845  	int err;
96cf51acccb64d Yuezhang Mo       2022-11-09  846  	loff_t size = i_size_read(dir);
5f2aa075070cf5 Namjae Jeon       2020-03-02  847  
f761fcdd289d07 Dongliang Cui     2024-09-18  848  	if (unlikely(exfat_forced_shutdown(sb)))
88d5baf69082e5 NeilBrown         2025-02-27  849  		return ERR_PTR(-EIO);
f761fcdd289d07 Dongliang Cui     2024-09-18  850  
5f2aa075070cf5 Namjae Jeon       2020-03-02  851  	mutex_lock(&EXFAT_SB(sb)->s_lock);
7018ec68f08249 Tetsuhiro Kohada  2020-07-31  852  	exfat_set_volume_dirty(sb);
33a86666d37ed4 Yuezhang Mo       2024-09-06  853  	err = exfat_add_entry(dir, dentry->d_name.name, TYPE_DIR, &info);
5f2aa075070cf5 Namjae Jeon       2020-03-02  854  	if (err)
5f2aa075070cf5 Namjae Jeon       2020-03-02  855  		goto unlock;
5f2aa075070cf5 Namjae Jeon       2020-03-02  856  
5f2aa075070cf5 Namjae Jeon       2020-03-02  857  	inode_inc_iversion(dir);
4c72a36edd54f5 Jeff Layton       2023-10-04  858  	inode_set_mtime_to_ts(dir, inode_set_ctime_current(dir));
96cf51acccb64d Yuezhang Mo       2022-11-09  859  	if (IS_DIRSYNC(dir) && size != i_size_read(dir))
5f2aa075070cf5 Namjae Jeon       2020-03-02  860  		exfat_sync_inode(dir);
5f2aa075070cf5 Namjae Jeon       2020-03-02  861  	else
5f2aa075070cf5 Namjae Jeon       2020-03-02  862  		mark_inode_dirty(dir);
5f2aa075070cf5 Namjae Jeon       2020-03-02  863  	inc_nlink(dir);
5f2aa075070cf5 Namjae Jeon       2020-03-02  864  
5f2aa075070cf5 Namjae Jeon       2020-03-02  865  	i_pos = exfat_make_i_pos(&info);
5f2aa075070cf5 Namjae Jeon       2020-03-02  866  	inode = exfat_build_inode(sb, &info, i_pos);
d6c9efd92443b2 Tetsuhiro Kohada  2020-08-26  867  	err = PTR_ERR_OR_ZERO(inode);
d6c9efd92443b2 Tetsuhiro Kohada  2020-08-26  868  	if (err)
5f2aa075070cf5 Namjae Jeon       2020-03-02  869  		goto unlock;
5f2aa075070cf5 Namjae Jeon       2020-03-02  870  
5f2aa075070cf5 Namjae Jeon       2020-03-02  871  	inode_inc_iversion(inode);
4c72a36edd54f5 Jeff Layton       2023-10-04  872  	EXFAT_I(inode)->i_crtime = simple_inode_init_ts(inode);
4c72a36edd54f5 Jeff Layton       2023-10-04  873  	exfat_truncate_inode_atime(inode);
5f2aa075070cf5 Namjae Jeon       2020-03-02  874  	/* timestamp is already written, so mark_inode_dirty() is unneeded. */
5f2aa075070cf5 Namjae Jeon       2020-03-02  875  
5f2aa075070cf5 Namjae Jeon       2020-03-02  876  	d_instantiate(dentry, inode);
5f2aa075070cf5 Namjae Jeon       2020-03-02  877  
5f2aa075070cf5 Namjae Jeon       2020-03-02  878  unlock:
5f2aa075070cf5 Namjae Jeon       2020-03-02  879  	mutex_unlock(&EXFAT_SB(sb)->s_lock);
88d5baf69082e5 NeilBrown         2025-02-27 @880  	return ERR_PTR(err);
5f2aa075070cf5 Namjae Jeon       2020-03-02  881  }
5f2aa075070cf5 Namjae Jeon       2020-03-02  882  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
