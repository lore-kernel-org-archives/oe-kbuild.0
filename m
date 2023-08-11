Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3428F7F1
	for <oe-kbuild@lists.linux.dev>; Fri, 11 Aug 2023 01:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691716533; x=1723252533;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iocm/KbziH16hYi1ELp/A+8Kvs/IVs2dceME7dt9kds=;
  b=lpLf79B9CirXh+tYYQA/l1+maS8KbsVdbuH5eR5U+BYy7DorFpz/x865
   GkUpnfWLaf9YkwPXsYW5hjlUTue45Kq9e3tx4hHQ8Q9TbAkbTSevPkRo/
   5EKrZpGQ80evJjEYuEpllifExNkzHDi7R0UUAFJfuyJN5GZWU6RCmKOnx
   X1XOJgu+6Wxl7unRSZeQEQfQvoVTTCDLlRsevDmp1C5q3ee29rMkXyfcX
   J2eX9LPdzdmY7U87i5PeBTay54tIIu2qXd5rQOakElS6J+PuS91oq49xw
   azYTf2ZdEjK52G+efjQVF+lYww1NEEFhkZ7g85VbiL5PveF+wQwBkG+Eo
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="356530243"
X-IronPort-AV: E=Sophos;i="6.01,163,1684825200"; 
   d="scan'208";a="356530243"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2023 18:15:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="735608541"
X-IronPort-AV: E=Sophos;i="6.01,163,1684825200"; 
   d="scan'208";a="735608541"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 10 Aug 2023 18:15:26 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qUGkO-0007OO-2f;
	Fri, 11 Aug 2023 01:15:24 +0000
Date: Fri, 11 Aug 2023 09:15:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [chrome-os:chromeos-6.1 36/42] fs/configfs/inode.c:189
 configfs_create() error: we previously assumed 'sd_parent' could be null
 (see line 182)
Message-ID: <202308110932.apiJRvXa-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com
TO: Guenter Roeck <groeck@google.com>

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   49642342732c55841e454f874f36062a1a64e0dd
commit: 6570cb0654b65ea2dbe52c1c0f2590e338d9ab7e [36/42] FIXUP: CHROMIUM: configfs: inherit file and directory owners
:::::: branch date: 6 hours ago
:::::: commit date: 25 hours ago
config: arc-randconfig-m041-20230811 (https://download.01.org/0day-ci/archive/20230811/202308110932.apiJRvXa-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230811/202308110932.apiJRvXa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202308110932.apiJRvXa-lkp@intel.com/

smatch warnings:
fs/configfs/inode.c:189 configfs_create() error: we previously assumed 'sd_parent' could be null (see line 182)

vim +/sd_parent +189 fs/configfs/inode.c

e74cc06df3b05e Louis Rilling    2009-01-28  156  
2743c515a1239b Al Viro          2019-09-11  157  struct inode *configfs_create(struct dentry *dentry, umode_t mode)
7063fbf2261194 Joel Becker      2005-12-15  158  {
7063fbf2261194 Joel Becker      2005-12-15  159  	struct inode *inode = NULL;
16d13b59b5b85e Al Viro          2012-03-17  160  	struct configfs_dirent *sd;
16d13b59b5b85e Al Viro          2012-03-17  161  	struct inode *p_inode;
e5e090ca97600b Daniel Rosenberg 2018-03-15  162  	struct dentry *parent;
16d13b59b5b85e Al Viro          2012-03-17  163  
16d13b59b5b85e Al Viro          2012-03-17  164  	if (!dentry)
2743c515a1239b Al Viro          2019-09-11  165  		return ERR_PTR(-ENOENT);
16d13b59b5b85e Al Viro          2012-03-17  166  
2b0143b5c986be David Howells    2015-03-17  167  	if (d_really_is_positive(dentry))
2743c515a1239b Al Viro          2019-09-11  168  		return ERR_PTR(-EEXIST);
16d13b59b5b85e Al Viro          2012-03-17  169  
16d13b59b5b85e Al Viro          2012-03-17  170  	sd = dentry->d_fsdata;
e5e090ca97600b Daniel Rosenberg 2018-03-15  171  	parent = dget_parent(dentry);
e5e090ca97600b Daniel Rosenberg 2018-03-15  172  	if (parent && !sd->s_iattr) {
6570cb0654b65e Tzung-Bi Shih    2023-08-09  173  		struct configfs_dirent *sd_parent = parent->d_fsdata;
6570cb0654b65e Tzung-Bi Shih    2023-08-09  174  
6570cb0654b65e Tzung-Bi Shih    2023-08-09  175  		sd->s_iattr = kzalloc(sizeof(struct iattr), GFP_KERNEL);
36caf34d422a0c Tzung-Bi Shih    2023-08-09  176  		if (!sd->s_iattr) {
36caf34d422a0c Tzung-Bi Shih    2023-08-09  177  			dput(parent);
e5e090ca97600b Daniel Rosenberg 2018-03-15  178  			return ERR_PTR(-ENOMEM);
e5e090ca97600b Daniel Rosenberg 2018-03-15  179  		}
6570cb0654b65e Tzung-Bi Shih    2023-08-09  180  
6570cb0654b65e Tzung-Bi Shih    2023-08-09  181  		sd->s_iattr->ia_mode = sd->s_mode;
6570cb0654b65e Tzung-Bi Shih    2023-08-09 @182  		if (sd_parent && sd_parent->s_iattr) {
6570cb0654b65e Tzung-Bi Shih    2023-08-09  183  			sd->s_iattr->ia_uid = sd_parent->s_iattr->ia_uid;
6570cb0654b65e Tzung-Bi Shih    2023-08-09  184  			sd->s_iattr->ia_gid = sd_parent->s_iattr->ia_gid;
6570cb0654b65e Tzung-Bi Shih    2023-08-09  185  		} else {
6570cb0654b65e Tzung-Bi Shih    2023-08-09  186  			sd->s_iattr->ia_uid = GLOBAL_ROOT_UID;
6570cb0654b65e Tzung-Bi Shih    2023-08-09  187  			sd->s_iattr->ia_gid = GLOBAL_ROOT_GID;
6570cb0654b65e Tzung-Bi Shih    2023-08-09  188  		}
6570cb0654b65e Tzung-Bi Shih    2023-08-09 @189  		if (sd_parent->s_dentry && d_inode(sd_parent->s_dentry))
6570cb0654b65e Tzung-Bi Shih    2023-08-09  190  			sd->s_iattr->ia_ctime = current_time(d_inode(sd_parent->s_dentry));
6570cb0654b65e Tzung-Bi Shih    2023-08-09  191  		else
6570cb0654b65e Tzung-Bi Shih    2023-08-09  192  			ktime_get_coarse_real_ts64(&sd->s_iattr->ia_ctime);
6570cb0654b65e Tzung-Bi Shih    2023-08-09  193  		sd->s_iattr->ia_atime = sd->s_iattr->ia_mtime = sd->s_iattr->ia_ctime;
36caf34d422a0c Tzung-Bi Shih    2023-08-09  194  	}
e5e090ca97600b Daniel Rosenberg 2018-03-15  195  	dput(parent);
16d13b59b5b85e Al Viro          2012-03-17  196  	inode = configfs_new_inode(mode, sd, dentry->d_sb);
16d13b59b5b85e Al Viro          2012-03-17  197  	if (!inode)
2743c515a1239b Al Viro          2019-09-11  198  		return ERR_PTR(-ENOMEM);
16d13b59b5b85e Al Viro          2012-03-17  199  
2b0143b5c986be David Howells    2015-03-17  200  	p_inode = d_inode(dentry->d_parent);
c2050a454c7f12 Deepa Dinamani   2016-09-14  201  	p_inode->i_mtime = p_inode->i_ctime = current_time(p_inode);
e74cc06df3b05e Louis Rilling    2009-01-28  202  	configfs_set_inode_lock_class(sd, inode);
2743c515a1239b Al Viro          2019-09-11  203  	return inode;
7063fbf2261194 Joel Becker      2005-12-15  204  }
7063fbf2261194 Joel Becker      2005-12-15  205  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
