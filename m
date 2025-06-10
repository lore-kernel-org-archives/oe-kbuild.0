Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E878329291C
	for <oe-kbuild@lists.linux.dev>; Tue, 10 Jun 2025 13:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749562879; cv=none; b=V5dsPkFSCOAjsLYI1bpqcOd5VeEe8raQhdKWBDHnu2KH/4Z7gHarAdDoVZ/9bYT8NusFi210TnBsdom/gCmejKnO9HWj8UDyM510SPb1jOJdebfdThSL3qJo1V9ZpjbpGXjGJZxb8CCsw0qbxrzyb3YFEtNGJdjwll2R+SAAMo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749562879; c=relaxed/simple;
	bh=sZQqZSXgUX71P3AJjqXTrS4+Fw6l+MP/dnsPjwaA72Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=p3gKsdLiNmVL6DuT35+hl7Mn+eRViejY/5UZ81UE5VtF5mzcsy8LMXrnw7HeEnDws0/yGS/Ra/pkvpaqwVrfzyDgSgxOOiPK12ep6sjdYbq83yUzYJztGO9rXiSDCiRlh1oDFmlm0I1I6KhZ5R39v3DK2ymJPMIOc0vkYCvhGeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OxOLpJ+p; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OxOLpJ+p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749562878; x=1781098878;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sZQqZSXgUX71P3AJjqXTrS4+Fw6l+MP/dnsPjwaA72Y=;
  b=OxOLpJ+p5mPkRxaxm1bHOKNSprWFtDcjmEpDlF2PTftfYk0t4Ch6UyoI
   DRB24CyZIlxm3W71ib+UMfnoztc64x+BrZPif5sZQ/0yA8tHrL4A0rif1
   KO7R15XLA0L+frVSZvFAPhNLdZNcvLR1db7QFCk3ogxhg1UOgd3iU3gMF
   hJbI48D2rm/KjXQD0vFODd3btjt36XQOaR7vexBFh0LRjJeitODnXD9Wl
   XbqM733NrKh9inc9XTmr5+a1Wa5oso+BLgygKFDqv/yUPeJYDzPqnUbkv
   M8tDIMDnU8cE7nTpgRQLpahA2rFU+Vo42rH+4P0F9tPei+zTo67uFnADv
   g==;
X-CSE-ConnectionGUID: SML7koiXRGyVY1avVAvNbA==
X-CSE-MsgGUID: gBsovYJDRpSQjQa0+CEctA==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="62328459"
X-IronPort-AV: E=Sophos;i="6.16,225,1744095600"; 
   d="scan'208";a="62328459"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 06:41:15 -0700
X-CSE-ConnectionGUID: Qha87MOXQ9S4y4iknF3BMQ==
X-CSE-MsgGUID: ddJ0NcLbSwehpqafkm9oFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,225,1744095600"; 
   d="scan'208";a="152089436"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 10 Jun 2025 06:41:14 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uOzDy-0008HV-2X;
	Tue, 10 Jun 2025 13:41:10 +0000
Date: Tue, 10 Jun 2025 21:40:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 5/5] Change vfs_mkdir() to unlock on failure.
Message-ID: <202506102159.UekeQASb-lkp@intel.com>
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
In-Reply-To: <20250608230952.20539-6-neil@brown.name>
References: <20250608230952.20539-6-neil@brown.name>
TO: NeilBrown <neil@brown.name>
TO: Alexander Viro <viro@zeniv.linux.org.uk>
TO: Christian Brauner <brauner@kernel.org>
TO: Jan Kara <jack@suse.cz>
TO: Chuck Lever <chuck.lever@oracle.com>
TO: Jeff Layton <jlayton@kernel.org>
TO: Amir Goldstein <amir73il@gmail.com>
TO: Jan Harkes <jaharkes@cs.cmu.edu>
TO: David Howells <dhowells@redhat.com>
TO: Tyler Hicks <code@tyhicks.com>
TO: Miklos Szeredi <miklos@szeredi.hu>
TO: Carlos Maiolino <cem@kernel.org>
CC: linux-fsdevel@vger.kernel.org
CC: coda@cs.cmu.edu
CC: codalist@coda.cs.cmu.edu
CC: linux-nfs@vger.kernel.org
CC: netfs@lists.linux.dev
CC: ecryptfs@vger.kernel.org
CC: linux-unionfs@vger.kernel.org
CC: linux-xfs@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Hi NeilBrown,

kernel test robot noticed the following build warnings:

[auto build test WARNING on brauner-vfs/vfs.all]
[also build test WARNING on linus/master v6.16-rc1 next-20250610]
[cannot apply to viro-vfs/for-next xfs-linux/for-next tyhicks-ecryptfs/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/NeilBrown/VFS-merge-lookup_one_qstr_excl_raw-back-into-lookup_one_qstr_excl/20250609-071214
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.all
patch link:    https://lore.kernel.org/r/20250608230952.20539-6-neil%40brown.name
patch subject: [PATCH 5/5] Change vfs_mkdir() to unlock on failure.
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-141-20250610 (https://download.01.org/0day-ci/archive/20250610/202506102159.UekeQASb-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202506102159.UekeQASb-lkp@intel.com/

New smatch warnings:
fs/overlayfs/super.c:384 ovl_workdir_create() warn: inconsistent returns '&dir->i_rwsem'.
fs/overlayfs/super.c:614 ovl_check_rename_whiteout() warn: inconsistent returns '&dir->i_rwsem'.

Old smatch warnings:
fs/overlayfs/super.c:373 ovl_workdir_create() warn: 'work' is an error pointer or valid

vim +384 fs/overlayfs/super.c

e9be9d5e76e348 Miklos Szeredi    2014-10-24  292  
ad204488d3046b Miklos Szeredi    2017-11-10  293  static struct dentry *ovl_workdir_create(struct ovl_fs *ofs,
6b8aa129dcbe0e Amir Goldstein    2017-06-21  294  					 const char *name, bool persist)
e9be9d5e76e348 Miklos Szeredi    2014-10-24  295  {
ad204488d3046b Miklos Szeredi    2017-11-10  296  	struct inode *dir =  ofs->workbasedir->d_inode;
08f4c7c86d4cf1 Miklos Szeredi    2020-06-04  297  	struct vfsmount *mnt = ovl_upper_mnt(ofs);
e9be9d5e76e348 Miklos Szeredi    2014-10-24  298  	struct dentry *work;
e9be9d5e76e348 Miklos Szeredi    2014-10-24  299  	int err;
e9be9d5e76e348 Miklos Szeredi    2014-10-24  300  	bool retried = false;
e9be9d5e76e348 Miklos Szeredi    2014-10-24  301  
5955102c9984fa Al Viro           2016-01-22  302  	inode_lock_nested(dir, I_MUTEX_PARENT);
e9be9d5e76e348 Miklos Szeredi    2014-10-24  303  retry:
22f289ce1f8b10 Christian Brauner 2022-04-04  304  	work = ovl_lookup_upper(ofs, name, ofs->workbasedir, strlen(name));
e9be9d5e76e348 Miklos Szeredi    2014-10-24  305  
e9be9d5e76e348 Miklos Szeredi    2014-10-24  306  	if (!IS_ERR(work)) {
c11b9fdd6a612f Miklos Szeredi    2016-09-01  307  		struct iattr attr = {
c11b9fdd6a612f Miklos Szeredi    2016-09-01  308  			.ia_valid = ATTR_MODE,
32a3d848eb91a2 Al Viro           2016-12-04  309  			.ia_mode = S_IFDIR | 0,
c11b9fdd6a612f Miklos Szeredi    2016-09-01  310  		};
e9be9d5e76e348 Miklos Szeredi    2014-10-24  311  
e9be9d5e76e348 Miklos Szeredi    2014-10-24  312  		if (work->d_inode) {
e9be9d5e76e348 Miklos Szeredi    2014-10-24  313  			err = -EEXIST;
e9be9d5e76e348 Miklos Szeredi    2014-10-24  314  			if (retried)
e9be9d5e76e348 Miklos Szeredi    2014-10-24  315  				goto out_dput;
e9be9d5e76e348 Miklos Szeredi    2014-10-24  316  
6b8aa129dcbe0e Amir Goldstein    2017-06-21  317  			if (persist)
6b8aa129dcbe0e Amir Goldstein    2017-06-21  318  				goto out_unlock;
6b8aa129dcbe0e Amir Goldstein    2017-06-21  319  
e9be9d5e76e348 Miklos Szeredi    2014-10-24  320  			retried = true;
576bb263450bbb Christian Brauner 2022-04-04  321  			err = ovl_workdir_cleanup(ofs, dir, mnt, work, 0);
e9be9d5e76e348 Miklos Szeredi    2014-10-24  322  			dput(work);
235ce9ed96bc62 Amir Goldstein    2020-08-30  323  			if (err == -EINVAL) {
235ce9ed96bc62 Amir Goldstein    2020-08-30  324  				work = ERR_PTR(err);
235ce9ed96bc62 Amir Goldstein    2020-08-30  325  				goto out_unlock;
235ce9ed96bc62 Amir Goldstein    2020-08-30  326  			}
e9be9d5e76e348 Miklos Szeredi    2014-10-24  327  			goto retry;
e9be9d5e76e348 Miklos Szeredi    2014-10-24  328  		}
e9be9d5e76e348 Miklos Szeredi    2014-10-24  329  
c54b386969a581 NeilBrown         2025-02-27  330  		work = ovl_do_mkdir(ofs, dir, work, attr.ia_mode);
c54b386969a581 NeilBrown         2025-02-27  331  		err = PTR_ERR(work);
c54b386969a581 NeilBrown         2025-02-27  332  		if (IS_ERR(work))
c54b386969a581 NeilBrown         2025-02-27  333  			goto out_err;
1f5573cfe7a705 Miklos Szeredi    2021-11-04  334  
1f5573cfe7a705 Miklos Szeredi    2021-11-04  335  		/* Weird filesystem returning with hashed negative (kernfs)? */
1f5573cfe7a705 Miklos Szeredi    2021-11-04  336  		err = -EINVAL;
1f5573cfe7a705 Miklos Szeredi    2021-11-04  337  		if (d_really_is_negative(work))
1f5573cfe7a705 Miklos Szeredi    2021-11-04  338  			goto out_dput;
c11b9fdd6a612f Miklos Szeredi    2016-09-01  339  
cb348edb6bef72 Miklos Szeredi    2016-10-04  340  		/*
cb348edb6bef72 Miklos Szeredi    2016-10-04  341  		 * Try to remove POSIX ACL xattrs from workdir.  We are good if:
cb348edb6bef72 Miklos Szeredi    2016-10-04  342  		 *
cb348edb6bef72 Miklos Szeredi    2016-10-04  343  		 * a) success (there was a POSIX ACL xattr and was removed)
cb348edb6bef72 Miklos Szeredi    2016-10-04  344  		 * b) -ENODATA (there was no POSIX ACL xattr)
cb348edb6bef72 Miklos Szeredi    2016-10-04  345  		 * c) -EOPNOTSUPP (POSIX ACL xattrs are not supported)
cb348edb6bef72 Miklos Szeredi    2016-10-04  346  		 *
cb348edb6bef72 Miklos Szeredi    2016-10-04  347  		 * There are various other error values that could effectively
cb348edb6bef72 Miklos Szeredi    2016-10-04  348  		 * mean that the xattr doesn't exist (e.g. -ERANGE is returned
cb348edb6bef72 Miklos Szeredi    2016-10-04  349  		 * if the xattr name is too long), but the set of filesystems
cb348edb6bef72 Miklos Szeredi    2016-10-04  350  		 * allowed as upper are limited to "normal" ones, where checking
cb348edb6bef72 Miklos Szeredi    2016-10-04  351  		 * for the above two errors is sufficient.
cb348edb6bef72 Miklos Szeredi    2016-10-04  352  		 */
31acceb97500dd Christian Brauner 2022-09-22  353  		err = ovl_do_remove_acl(ofs, work, XATTR_NAME_POSIX_ACL_DEFAULT);
e1ff3dd1ae52ce Miklos Szeredi    2016-09-05  354  		if (err && err != -ENODATA && err != -EOPNOTSUPP)
c11b9fdd6a612f Miklos Szeredi    2016-09-01  355  			goto out_dput;
c11b9fdd6a612f Miklos Szeredi    2016-09-01  356  
31acceb97500dd Christian Brauner 2022-09-22  357  		err = ovl_do_remove_acl(ofs, work, XATTR_NAME_POSIX_ACL_ACCESS);
e1ff3dd1ae52ce Miklos Szeredi    2016-09-05  358  		if (err && err != -ENODATA && err != -EOPNOTSUPP)
c11b9fdd6a612f Miklos Szeredi    2016-09-01  359  			goto out_dput;
c11b9fdd6a612f Miklos Szeredi    2016-09-01  360  
c11b9fdd6a612f Miklos Szeredi    2016-09-01  361  		/* Clear any inherited mode bits */
c11b9fdd6a612f Miklos Szeredi    2016-09-01  362  		inode_lock(work->d_inode);
a15506eac96fdb Christian Brauner 2022-04-04  363  		err = ovl_do_notify_change(ofs, work, &attr);
c11b9fdd6a612f Miklos Szeredi    2016-09-01  364  		inode_unlock(work->d_inode);
c11b9fdd6a612f Miklos Szeredi    2016-09-01  365  		if (err)
c11b9fdd6a612f Miklos Szeredi    2016-09-01  366  			goto out_dput;
6b8aa129dcbe0e Amir Goldstein    2017-06-21  367  	} else {
6b8aa129dcbe0e Amir Goldstein    2017-06-21  368  		err = PTR_ERR(work);
781b56fbc2cc93 NeilBrown         2025-06-09  369  		inode_unlock(dir);
6b8aa129dcbe0e Amir Goldstein    2017-06-21  370  		goto out_err;
e9be9d5e76e348 Miklos Szeredi    2014-10-24  371  	}
e9be9d5e76e348 Miklos Szeredi    2014-10-24  372  out_unlock:
781b56fbc2cc93 NeilBrown         2025-06-09  373  	if (work && !IS_ERR(work))
6b8aa129dcbe0e Amir Goldstein    2017-06-21  374  		inode_unlock(dir);
e9be9d5e76e348 Miklos Szeredi    2014-10-24  375  	return work;
e9be9d5e76e348 Miklos Szeredi    2014-10-24  376  
e9be9d5e76e348 Miklos Szeredi    2014-10-24  377  out_dput:
e9be9d5e76e348 Miklos Szeredi    2014-10-24  378  	dput(work);
781b56fbc2cc93 NeilBrown         2025-06-09  379  	inode_unlock(dir);
6b8aa129dcbe0e Amir Goldstein    2017-06-21  380  out_err:
1bd0a3aea4357e lijiazi           2019-12-16  381  	pr_warn("failed to create directory %s/%s (errno: %i); mounting read-only\n",
ad204488d3046b Miklos Szeredi    2017-11-10  382  		ofs->config.workdir, name, -err);
6b8aa129dcbe0e Amir Goldstein    2017-06-21  383  	work = NULL;
e9be9d5e76e348 Miklos Szeredi    2014-10-24 @384  	goto out_unlock;
e9be9d5e76e348 Miklos Szeredi    2014-10-24  385  }
e9be9d5e76e348 Miklos Szeredi    2014-10-24  386  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
