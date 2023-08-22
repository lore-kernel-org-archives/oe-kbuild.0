Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB9220180
	for <oe-kbuild@lists.linux.dev>; Tue, 22 Aug 2023 20:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692734873; x=1724270873;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EZ9XDs2AgYBET/JaTybNASnf2hJ9x7k6yRVp3Cx+32A=;
  b=YwDC450UUyNsUw970X7e7Cxmca2tcCi9q0+0wIw4qj6xlLWn1PFarr0D
   zzHiOMvE9aLFO+7EHhQZNxTgAxRc7EiOl6mhCXn9VE6MG4jd7uY6R3Cgb
   0+zAYmpEKamaCCAzbKTRjwsCH770ZQHQywt7IJCojTl+Wdj0duWM79q9+
   GfIkG72Vhp9+piEjvYLsIhsVyuaorU5t+bBJfSbVoYasAQnlGqipWl2h+
   yet7qv/EBh2eXWRSthcF8ewP6KsN+QwZeOjL3MzqGo9k/C41aj9jAAJ6A
   gQL4/1yEQgquIZlo2/0gHvYLLxm3mX8LmolOCQhZV5rwQEUE7Q9xohPKc
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="354318910"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="354318910"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2023 13:07:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="801806138"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="801806138"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 22 Aug 2023 13:07:50 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYXfJ-0000Uw-1M;
	Tue, 22 Aug 2023 20:07:49 +0000
Date: Wed, 23 Aug 2023 04:07:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [cifs:for-next 11/22] fs/smb/client/inode.c:1479 cifs_root_iget()
 warn: passing zero to 'ERR_PTR'
Message-ID: <202308230303.KRXeOsV5-lkp@intel.com>
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
CC: linux-cifs@vger.kernel.org
CC: samba-technical@lists.samba.org
TO: Paulo Alcantara <pc@manguebit.com>
CC: Steve French <stfrench@microsoft.com>

tree:   git://git.samba.org/sfrench/cifs-2.6.git for-next
head:   064b45489ee066c951b0ace5e2a43fccb4c6b53e
commit: a18280e7fdea1f2f0736c45f9fee27eccd3998ae [11/22] smb: cilent: set reparse mount points as automounts
:::::: branch date: 4 hours ago
:::::: commit date: 2 days ago
config: i386-randconfig-141-20230822 (https://download.01.org/0day-ci/archive/20230823/202308230303.KRXeOsV5-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230823/202308230303.KRXeOsV5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202308230303.KRXeOsV5-lkp@intel.com/

smatch warnings:
fs/smb/client/inode.c:1479 cifs_root_iget() warn: passing zero to 'ERR_PTR'

vim +/ERR_PTR +1479 fs/smb/client/inode.c

cc0bad7552308e fs/cifs/inode.c       Jeff Layton        2009-06-25  1426  
^1da177e4c3f41 fs/cifs/inode.c       Linus Torvalds     2005-04-16  1427  /* gets root inode */
9b6763e0aacf24 fs/cifs/inode.c       Shirish Pargaonkar 2011-02-21  1428  struct inode *cifs_root_iget(struct super_block *sb)
^1da177e4c3f41 fs/cifs/inode.c       Linus Torvalds     2005-04-16  1429  {
0d424ad0a4b8c0 fs/cifs/inode.c       Jeff Layton        2010-09-20  1430  	struct cifs_sb_info *cifs_sb = CIFS_SB(sb);
a18280e7fdea1f fs/smb/client/inode.c Paulo Alcantara    2023-08-17  1431  	struct cifs_fattr fattr = {};
96daf2b09178d8 fs/cifs/inode.c       Steve French       2011-05-27  1432  	struct cifs_tcon *tcon = cifs_sb_master_tcon(cifs_sb);
a18280e7fdea1f fs/smb/client/inode.c Paulo Alcantara    2023-08-17  1433  	struct inode *inode = NULL;
a18280e7fdea1f fs/smb/client/inode.c Paulo Alcantara    2023-08-17  1434  	unsigned int xid;
a6b5058fafdf50 fs/cifs/inode.c       Aurelien Aptel     2016-05-25  1435  	char *path = NULL;
a6b5058fafdf50 fs/cifs/inode.c       Aurelien Aptel     2016-05-25  1436  	int len;
a18280e7fdea1f fs/smb/client/inode.c Paulo Alcantara    2023-08-17  1437  	int rc;
a6b5058fafdf50 fs/cifs/inode.c       Aurelien Aptel     2016-05-25  1438  
a6b5058fafdf50 fs/cifs/inode.c       Aurelien Aptel     2016-05-25  1439  	if ((cifs_sb->mnt_cifs_flags & CIFS_MOUNT_USE_PREFIX_PATH)
a6b5058fafdf50 fs/cifs/inode.c       Aurelien Aptel     2016-05-25  1440  	    && cifs_sb->prepath) {
a6b5058fafdf50 fs/cifs/inode.c       Aurelien Aptel     2016-05-25  1441  		len = strlen(cifs_sb->prepath);
a6b5058fafdf50 fs/cifs/inode.c       Aurelien Aptel     2016-05-25  1442  		path = kzalloc(len + 2 /* leading sep + null */, GFP_KERNEL);
a6b5058fafdf50 fs/cifs/inode.c       Aurelien Aptel     2016-05-25  1443  		if (path == NULL)
a6b5058fafdf50 fs/cifs/inode.c       Aurelien Aptel     2016-05-25  1444  			return ERR_PTR(-ENOMEM);
a6b5058fafdf50 fs/cifs/inode.c       Aurelien Aptel     2016-05-25  1445  		path[0] = '/';
a6b5058fafdf50 fs/cifs/inode.c       Aurelien Aptel     2016-05-25  1446  		memcpy(path+1, cifs_sb->prepath, len);
a6b5058fafdf50 fs/cifs/inode.c       Aurelien Aptel     2016-05-25  1447  	} else {
a6b5058fafdf50 fs/cifs/inode.c       Aurelien Aptel     2016-05-25  1448  		path = kstrdup("", GFP_KERNEL);
a6b5058fafdf50 fs/cifs/inode.c       Aurelien Aptel     2016-05-25  1449  		if (path == NULL)
a6b5058fafdf50 fs/cifs/inode.c       Aurelien Aptel     2016-05-25  1450  			return ERR_PTR(-ENOMEM);
a6b5058fafdf50 fs/cifs/inode.c       Aurelien Aptel     2016-05-25  1451  	}
ce634ab28e7dbc fs/cifs/inode.c       David Howells      2008-02-07  1452  
6d5786a34d98bf fs/cifs/inode.c       Pavel Shilovsky    2012-06-20  1453  	xid = get_xid();
b5b374eab11ef6 fs/cifs/inode.c       Steve French       2014-10-06  1454  	if (tcon->unix_ext) {
a18280e7fdea1f fs/smb/client/inode.c Paulo Alcantara    2023-08-17  1455  		rc = cifs_get_unix_fattr(path, sb, &fattr, &inode, xid);
b5b374eab11ef6 fs/cifs/inode.c       Steve French       2014-10-06  1456  		/* some servers mistakenly claim POSIX support */
b5b374eab11ef6 fs/cifs/inode.c       Steve French       2014-10-06  1457  		if (rc != -EOPNOTSUPP)
a18280e7fdea1f fs/smb/client/inode.c Paulo Alcantara    2023-08-17  1458  			goto iget_root;
a0a3036b81f1f6 fs/cifs/inode.c       Joe Perches        2020-04-14  1459  		cifs_dbg(VFS, "server does not support POSIX extensions\n");
b5b374eab11ef6 fs/cifs/inode.c       Steve French       2014-10-06  1460  		tcon->unix_ext = false;
b5b374eab11ef6 fs/cifs/inode.c       Steve French       2014-10-06  1461  	}
b5b374eab11ef6 fs/cifs/inode.c       Steve French       2014-10-06  1462  
a6b5058fafdf50 fs/cifs/inode.c       Aurelien Aptel     2016-05-25  1463  	convert_delimiter(path, CIFS_DIR_SEP(cifs_sb));
d313852d7ad044 fs/cifs/inode.c       Steve French       2020-06-11  1464  	if (tcon->posix_extensions)
a18280e7fdea1f fs/smb/client/inode.c Paulo Alcantara    2023-08-17  1465  		rc = smb311_posix_get_fattr(&fattr, path, sb, xid);
d313852d7ad044 fs/cifs/inode.c       Steve French       2020-06-11  1466  	else
a18280e7fdea1f fs/smb/client/inode.c Paulo Alcantara    2023-08-17  1467  		rc = cifs_get_fattr(NULL, sb, xid, NULL, &fattr, &inode, path);
a18280e7fdea1f fs/smb/client/inode.c Paulo Alcantara    2023-08-17  1468  
a18280e7fdea1f fs/smb/client/inode.c Paulo Alcantara    2023-08-17  1469  iget_root:
a18280e7fdea1f fs/smb/client/inode.c Paulo Alcantara    2023-08-17  1470  	if (!rc) {
a18280e7fdea1f fs/smb/client/inode.c Paulo Alcantara    2023-08-17  1471  		if (fattr.cf_flags & CIFS_FATTR_JUNCTION) {
a18280e7fdea1f fs/smb/client/inode.c Paulo Alcantara    2023-08-17  1472  			fattr.cf_flags &= ~CIFS_FATTR_JUNCTION;
a18280e7fdea1f fs/smb/client/inode.c Paulo Alcantara    2023-08-17  1473  			cifs_autodisable_serverino(cifs_sb);
a18280e7fdea1f fs/smb/client/inode.c Paulo Alcantara    2023-08-17  1474  		}
a18280e7fdea1f fs/smb/client/inode.c Paulo Alcantara    2023-08-17  1475  		inode = cifs_iget(sb, &fattr);
a18280e7fdea1f fs/smb/client/inode.c Paulo Alcantara    2023-08-17  1476  	}
0b8f18e358384a fs/cifs/inode.c       Jeff Layton        2009-07-09  1477  
a7851ce73b9fde fs/cifs/inode.c       Oskar Schirmer     2010-11-10  1478  	if (!inode) {
a7851ce73b9fde fs/cifs/inode.c       Oskar Schirmer     2010-11-10 @1479  		inode = ERR_PTR(rc);
a7851ce73b9fde fs/cifs/inode.c       Oskar Schirmer     2010-11-10  1480  		goto out;
a7851ce73b9fde fs/cifs/inode.c       Oskar Schirmer     2010-11-10  1481  	}
cc0bad7552308e fs/cifs/inode.c       Jeff Layton        2009-06-25  1482  
b327a717e50698 fs/cifs/inode.c       Aurelien Aptel     2018-01-24  1483  	if (rc && tcon->pipe) {
f96637be081141 fs/cifs/inode.c       Joe Perches        2013-05-04  1484  		cifs_dbg(FYI, "ipc connection - fake read inode\n");
b7ca69289680cf fs/cifs/inode.c       Steve French       2012-08-03  1485  		spin_lock(&inode->i_lock);
7f8ed420f80c91 fs/cifs/inode.c       Steve French       2007-09-28  1486  		inode->i_mode |= S_IFDIR;
bfe8684869601d fs/cifs/inode.c       Miklos Szeredi     2011-10-28  1487  		set_nlink(inode, 2);
7f8ed420f80c91 fs/cifs/inode.c       Steve French       2007-09-28  1488  		inode->i_op = &cifs_ipc_inode_ops;
7f8ed420f80c91 fs/cifs/inode.c       Steve French       2007-09-28  1489  		inode->i_fop = &simple_dir_operations;
8401e93678933a fs/cifs/inode.c       Ronnie Sahlberg    2020-12-12  1490  		inode->i_uid = cifs_sb->ctx->linux_uid;
8401e93678933a fs/cifs/inode.c       Ronnie Sahlberg    2020-12-12  1491  		inode->i_gid = cifs_sb->ctx->linux_gid;
b7ca69289680cf fs/cifs/inode.c       Steve French       2012-08-03  1492  		spin_unlock(&inode->i_lock);
ad661334b8ae42 fs/cifs/inode.c       Steve French       2008-08-12  1493  	} else if (rc) {
ce634ab28e7dbc fs/cifs/inode.c       David Howells      2008-02-07  1494  		iget_failed(inode);
a7851ce73b9fde fs/cifs/inode.c       Oskar Schirmer     2010-11-10  1495  		inode = ERR_PTR(rc);
7f8ed420f80c91 fs/cifs/inode.c       Steve French       2007-09-28  1496  	}
70431bfd825d9c fs/cifs/inode.c       David Howells      2020-11-17  1497  
a7851ce73b9fde fs/cifs/inode.c       Oskar Schirmer     2010-11-10  1498  out:
a6b5058fafdf50 fs/cifs/inode.c       Aurelien Aptel     2016-05-25  1499  	kfree(path);
31cd106bb141b5 fs/cifs/inode.c       Phillip Potter     2018-03-17  1500  	free_xid(xid);
a18280e7fdea1f fs/smb/client/inode.c Paulo Alcantara    2023-08-17  1501  	kfree(fattr.cf_symlink_target);
ce634ab28e7dbc fs/cifs/inode.c       David Howells      2008-02-07  1502  	return inode;
^1da177e4c3f41 fs/cifs/inode.c       Linus Torvalds     2005-04-16  1503  }
^1da177e4c3f41 fs/cifs/inode.c       Linus Torvalds     2005-04-16  1504  

:::::: The code at line 1479 was first introduced by commit
:::::: a7851ce73b9fdef53f251420e6883cf4f3766534 cifs: fix another memleak, in cifs_root_iget

:::::: TO: Oskar Schirmer <oskar@scara.com>
:::::: CC: Steve French <sfrench@us.ibm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
