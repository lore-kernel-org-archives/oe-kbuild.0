Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7430E53A2
	for <oe-kbuild@lists.linux.dev>; Sat, 27 May 2023 11:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685187483; x=1716723483;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tUsXu8Kxw2KznFWFTnEIo+xOeGBlmAmRkkfz2iffewk=;
  b=Fn871v97NI+v+XLSJ3ygXQgBSPl/FdCICgsHWJDlgeaK88xz5a9QBh1v
   HmgeFNxjLSXHDtGo9MtJQIzW0GQbU0CYlfLwv/hj0WVwCmvSi9Af22wNS
   YTV9mILD16sXHcSFCuTnyJjC3JddsQlN0LPysEYX0hVkPXH/RqvdmhTAs
   fgI3wJRJGTKj+F/2KaWWGOzCbNpo3itjPROf1YdIHECPqLaCKebZwD0c+
   k3TO3a+lYkImeYuk1wfOj+Bio7G7SB0D9it2GUCHJhKsFq/REoZa+wTr7
   q3iSuNZtp/ARGMrCQ1HSQfqokofqGdS8lYK7pc5dRyCpx9gVQX4L6Ep8A
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="420147793"
X-IronPort-AV: E=Sophos;i="6.00,196,1681196400"; 
   d="scan'208";a="420147793"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2023 04:38:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="699684797"
X-IronPort-AV: E=Sophos;i="6.00,196,1681196400"; 
   d="scan'208";a="699684797"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 27 May 2023 04:38:01 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q2sFE-000Jvq-2u;
	Sat, 27 May 2023 11:38:00 +0000
Date: Sat, 27 May 2023 19:37:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/smb/client/cifsfs.c:982 cifs_smb3_do_mount() warn: possible
 memory leak of 'cifs_sb'
Message-ID: <202305271925.BCcovUqS-lkp@intel.com>
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
TO: Steve French <stfrench@microsoft.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   49572d5361298711207ab387a6c318407deb963a
commit: 38c8a9a52082579090e34c033d439ed2cd1a462d smb: move client and server files to common directory fs/smb
date:   3 days ago
:::::: branch date: 11 hours ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-m001-20230526 (https://download.01.org/0day-ci/archive/20230527/202305271925.BCcovUqS-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202305271925.BCcovUqS-lkp@intel.com/

smatch warnings:
fs/smb/client/cifsfs.c:982 cifs_smb3_do_mount() warn: possible memory leak of 'cifs_sb'
fs/smb/client/connect.c:2725 cifs_match_super() error: 'tlink' dereferencing possible ERR_PTR()
fs/smb/client/connect.c:2924 generic_ip_connect() error: we previously assumed 'socket' could be null (see line 2912)
fs/smb/client/smb2pdu.c:3729 SMB2_change_notify() error: we previously assumed 'plen' could be null (see line 3688)
fs/smb/client/cifssmb.c:4089 CIFSFindFirst() warn: missing error code? 'rc'
fs/smb/client/cifssmb.c:4216 CIFSFindNext() warn: missing error code? 'rc'

vim +/cifs_sb +982 fs/smb/client/cifsfs.c

ee01a14d9ddcf3 fs/cifs/cifsfs.c Al Viro         2011-06-17  882  
24e0a1eff9e2b9 fs/cifs/cifsfs.c Ronnie Sahlberg 2020-12-10  883  struct dentry *
c7c137b931b689 fs/cifs/cifsfs.c Steve French    2018-06-06  884  cifs_smb3_do_mount(struct file_system_type *fs_type,
24e0a1eff9e2b9 fs/cifs/cifsfs.c Ronnie Sahlberg 2020-12-10  885  	      int flags, struct smb3_fs_context *old_ctx)
^1da177e4c3f41 fs/cifs/cifsfs.c Linus Torvalds  2005-04-16  886  {
^1da177e4c3f41 fs/cifs/cifsfs.c Linus Torvalds  2005-04-16  887  	int rc;
8378a51e3f8140 fs/cifs/cifsfs.c Ronnie Sahlberg 2022-05-31  888  	struct super_block *sb = NULL;
d17abdf7566566 fs/cifs/cifsfs.c Ronnie Sahlberg 2020-11-10  889  	struct cifs_sb_info *cifs_sb = NULL;
25c7f41e9234f6 fs/cifs/cifsfs.c Pavel Shilovsky 2011-05-26  890  	struct cifs_mnt_data mnt_data;
724d9f1cfba0cb fs/cifs/cifsfs.c Pavel Shilovsky 2011-05-05  891  	struct dentry *root;
^1da177e4c3f41 fs/cifs/cifsfs.c Linus Torvalds  2005-04-16  892  
1810769e3a5137 fs/cifs/cifsfs.c Paulo Alcantara 2023-04-27  893  	if (cifsFYI) {
1810769e3a5137 fs/cifs/cifsfs.c Paulo Alcantara 2023-04-27  894  		cifs_dbg(FYI, "%s: devname=%s flags=0x%x\n", __func__,
1810769e3a5137 fs/cifs/cifsfs.c Paulo Alcantara 2023-04-27  895  			 old_ctx->source, flags);
1810769e3a5137 fs/cifs/cifsfs.c Paulo Alcantara 2023-04-27  896  	} else {
1810769e3a5137 fs/cifs/cifsfs.c Paulo Alcantara 2023-04-27  897  		cifs_info("Attempting to mount %s\n", old_ctx->source);
1810769e3a5137 fs/cifs/cifsfs.c Paulo Alcantara 2023-04-27  898  	}
24e0a1eff9e2b9 fs/cifs/cifsfs.c Ronnie Sahlberg 2020-12-10  899  
d17abdf7566566 fs/cifs/cifsfs.c Ronnie Sahlberg 2020-11-10  900  	cifs_sb = kzalloc(sizeof(struct cifs_sb_info), GFP_KERNEL);
d17abdf7566566 fs/cifs/cifsfs.c Ronnie Sahlberg 2020-11-10  901  	if (cifs_sb == NULL) {
d17abdf7566566 fs/cifs/cifsfs.c Ronnie Sahlberg 2020-11-10  902  		root = ERR_PTR(-ENOMEM);
24e0a1eff9e2b9 fs/cifs/cifsfs.c Ronnie Sahlberg 2020-12-10  903  		goto out;
24e0a1eff9e2b9 fs/cifs/cifsfs.c Ronnie Sahlberg 2020-12-10  904  	}
^1da177e4c3f41 fs/cifs/cifsfs.c Linus Torvalds  2005-04-16  905  
d17abdf7566566 fs/cifs/cifsfs.c Ronnie Sahlberg 2020-11-10  906  	cifs_sb->ctx = kzalloc(sizeof(struct smb3_fs_context), GFP_KERNEL);
d17abdf7566566 fs/cifs/cifsfs.c Ronnie Sahlberg 2020-11-10  907  	if (!cifs_sb->ctx) {
d17abdf7566566 fs/cifs/cifsfs.c Ronnie Sahlberg 2020-11-10  908  		root = ERR_PTR(-ENOMEM);
d17abdf7566566 fs/cifs/cifsfs.c Ronnie Sahlberg 2020-11-10  909  		goto out;
d17abdf7566566 fs/cifs/cifsfs.c Ronnie Sahlberg 2020-11-10  910  	}
d17abdf7566566 fs/cifs/cifsfs.c Ronnie Sahlberg 2020-11-10  911  	rc = smb3_fs_context_dup(cifs_sb->ctx, old_ctx);
24e0a1eff9e2b9 fs/cifs/cifsfs.c Ronnie Sahlberg 2020-12-10  912  	if (rc) {
24e0a1eff9e2b9 fs/cifs/cifsfs.c Ronnie Sahlberg 2020-12-10  913  		root = ERR_PTR(rc);
24e0a1eff9e2b9 fs/cifs/cifsfs.c Ronnie Sahlberg 2020-12-10  914  		goto out;
24e0a1eff9e2b9 fs/cifs/cifsfs.c Ronnie Sahlberg 2020-12-10  915  	}
724d9f1cfba0cb fs/cifs/cifsfs.c Pavel Shilovsky 2011-05-05  916  
51acd208bd57c8 fs/cifs/cifsfs.c Ronnie Sahlberg 2020-12-14  917  	rc = cifs_setup_cifs_sb(cifs_sb);
4214ebf4654798 fs/cifs/cifsfs.c Sachin Prabhu   2016-07-29  918  	if (rc) {
4214ebf4654798 fs/cifs/cifsfs.c Sachin Prabhu   2016-07-29  919  		root = ERR_PTR(rc);
d17abdf7566566 fs/cifs/cifsfs.c Ronnie Sahlberg 2020-11-10  920  		goto out;
a6b5058fafdf50 fs/cifs/cifsfs.c Aurelien Aptel  2016-05-25  921  	}
a6b5058fafdf50 fs/cifs/cifsfs.c Aurelien Aptel  2016-05-25  922  
d17abdf7566566 fs/cifs/cifsfs.c Ronnie Sahlberg 2020-11-10  923  	rc = cifs_mount(cifs_sb, cifs_sb->ctx);
97d1152acec064 fs/cifs/cifsfs.c Al Viro         2011-06-17  924  	if (rc) {
1751e8a6cb935e fs/cifs/cifsfs.c Linus Torvalds  2017-11-27  925  		if (!(flags & SB_SILENT))
f96637be081141 fs/cifs/cifsfs.c Joe Perches     2013-05-04  926  			cifs_dbg(VFS, "cifs_mount failed w/return code = %d\n",
f96637be081141 fs/cifs/cifsfs.c Joe Perches     2013-05-04  927  				 rc);
97d1152acec064 fs/cifs/cifsfs.c Al Viro         2011-06-17  928  		root = ERR_PTR(rc);
d17abdf7566566 fs/cifs/cifsfs.c Ronnie Sahlberg 2020-11-10  929  		goto out;
97d1152acec064 fs/cifs/cifsfs.c Al Viro         2011-06-17  930  	}
97d1152acec064 fs/cifs/cifsfs.c Al Viro         2011-06-17  931  
d17abdf7566566 fs/cifs/cifsfs.c Ronnie Sahlberg 2020-11-10  932  	mnt_data.ctx = cifs_sb->ctx;
25c7f41e9234f6 fs/cifs/cifsfs.c Pavel Shilovsky 2011-05-26  933  	mnt_data.cifs_sb = cifs_sb;
25c7f41e9234f6 fs/cifs/cifsfs.c Pavel Shilovsky 2011-05-26  934  	mnt_data.flags = flags;
25c7f41e9234f6 fs/cifs/cifsfs.c Pavel Shilovsky 2011-05-26  935  
9249e17fe094d8 fs/cifs/cifsfs.c David Howells   2012-06-25  936  	/* BB should we make this contingent on mount parm? */
1751e8a6cb935e fs/cifs/cifsfs.c Linus Torvalds  2017-11-27  937  	flags |= SB_NODIRATIME | SB_NOATIME;
9249e17fe094d8 fs/cifs/cifsfs.c David Howells   2012-06-25  938  
9249e17fe094d8 fs/cifs/cifsfs.c David Howells   2012-06-25  939  	sb = sget(fs_type, cifs_match_super, cifs_set_super, flags, &mnt_data);
724d9f1cfba0cb fs/cifs/cifsfs.c Pavel Shilovsky 2011-05-05  940  	if (IS_ERR(sb)) {
724d9f1cfba0cb fs/cifs/cifsfs.c Pavel Shilovsky 2011-05-05  941  		root = ERR_CAST(sb);
97d1152acec064 fs/cifs/cifsfs.c Al Viro         2011-06-17  942  		cifs_umount(cifs_sb);
6cf5abbfa8c8a2 fs/cifs/cifsfs.c Ronnie Sahlberg 2020-12-16  943  		cifs_sb = NULL;
d757d71bfc3066 fs/cifs/cifsfs.c Al Viro         2011-06-17  944  		goto out;
724d9f1cfba0cb fs/cifs/cifsfs.c Pavel Shilovsky 2011-05-05  945  	}
^1da177e4c3f41 fs/cifs/cifsfs.c Linus Torvalds  2005-04-16  946  
ee01a14d9ddcf3 fs/cifs/cifsfs.c Al Viro         2011-06-17  947  	if (sb->s_root) {
f96637be081141 fs/cifs/cifsfs.c Joe Perches     2013-05-04  948  		cifs_dbg(FYI, "Use existing superblock\n");
97d1152acec064 fs/cifs/cifsfs.c Al Viro         2011-06-17  949  		cifs_umount(cifs_sb);
6cf5abbfa8c8a2 fs/cifs/cifsfs.c Ronnie Sahlberg 2020-12-16  950  		cifs_sb = NULL;
5c4f1ad7c6aa3b fs/cifs/cifsfs.c Al Viro         2011-06-17  951  	} else {
97d1152acec064 fs/cifs/cifsfs.c Al Viro         2011-06-17  952  		rc = cifs_read_super(sb);
^1da177e4c3f41 fs/cifs/cifsfs.c Linus Torvalds  2005-04-16  953  		if (rc) {
724d9f1cfba0cb fs/cifs/cifsfs.c Pavel Shilovsky 2011-05-05  954  			root = ERR_PTR(rc);
641a58d66d0863 fs/cifs/cifsfs.c Pavel Shilovsky 2011-05-26  955  			goto out_super;
^1da177e4c3f41 fs/cifs/cifsfs.c Linus Torvalds  2005-04-16  956  		}
724d9f1cfba0cb fs/cifs/cifsfs.c Pavel Shilovsky 2011-05-05  957  
1751e8a6cb935e fs/cifs/cifsfs.c Linus Torvalds  2017-11-27  958  		sb->s_flags |= SB_ACTIVE;
5c4f1ad7c6aa3b fs/cifs/cifsfs.c Al Viro         2011-06-17  959  	}
724d9f1cfba0cb fs/cifs/cifsfs.c Pavel Shilovsky 2011-05-05  960  
6cf5abbfa8c8a2 fs/cifs/cifsfs.c Ronnie Sahlberg 2020-12-16  961  	root = cifs_get_root(cifs_sb ? cifs_sb->ctx : old_ctx, sb);
9403c9c598e91d fs/cifs/cifsfs.c Al Viro         2011-06-17  962  	if (IS_ERR(root))
f87d39d951329c fs/cifs/cifsfs.c Steve French    2011-05-27  963  		goto out_super;
25c7f41e9234f6 fs/cifs/cifsfs.c Pavel Shilovsky 2011-05-26  964  
269f67e1ffead6 fs/cifs/cifsfs.c Ronnie Sahlberg 2021-03-09  965  	if (cifs_sb)
269f67e1ffead6 fs/cifs/cifsfs.c Ronnie Sahlberg 2021-03-09  966  		cifs_sb->root = dget(root);
269f67e1ffead6 fs/cifs/cifsfs.c Ronnie Sahlberg 2021-03-09  967  
f96637be081141 fs/cifs/cifsfs.c Joe Perches     2013-05-04  968  	cifs_dbg(FYI, "dentry root is: %p\n", root);
d17abdf7566566 fs/cifs/cifsfs.c Ronnie Sahlberg 2020-11-10  969  	return root;
25c7f41e9234f6 fs/cifs/cifsfs.c Pavel Shilovsky 2011-05-26  970  
641a58d66d0863 fs/cifs/cifsfs.c Pavel Shilovsky 2011-05-26  971  out_super:
641a58d66d0863 fs/cifs/cifsfs.c Pavel Shilovsky 2011-05-26  972  	deactivate_locked_super(sb);
3d6cc9898efdfb fs/cifs/cifsfs.c Ronnie Sahlberg 2022-02-11  973  	return root;
641a58d66d0863 fs/cifs/cifsfs.c Pavel Shilovsky 2011-05-26  974  out:
d17abdf7566566 fs/cifs/cifsfs.c Ronnie Sahlberg 2020-11-10  975  	if (cifs_sb) {
8378a51e3f8140 fs/cifs/cifsfs.c Ronnie Sahlberg 2022-05-31  976  		if (!sb || IS_ERR(sb)) {  /* otherwise kill_sb will handle */
4214ebf4654798 fs/cifs/cifsfs.c Sachin Prabhu   2016-07-29  977  			kfree(cifs_sb->prepath);
c741cba2cd1d14 fs/cifs/cifsfs.c Ronnie Sahlberg 2020-12-14  978  			smb3_cleanup_fs_context(cifs_sb->ctx);
5c4f1ad7c6aa3b fs/cifs/cifsfs.c Al Viro         2011-06-17  979  			kfree(cifs_sb);
d17abdf7566566 fs/cifs/cifsfs.c Ronnie Sahlberg 2020-11-10  980  		}
8378a51e3f8140 fs/cifs/cifsfs.c Ronnie Sahlberg 2022-05-31  981  	}
d17abdf7566566 fs/cifs/cifsfs.c Ronnie Sahlberg 2020-11-10 @982  	return root;
^1da177e4c3f41 fs/cifs/cifsfs.c Linus Torvalds  2005-04-16  983  }
^1da177e4c3f41 fs/cifs/cifsfs.c Linus Torvalds  2005-04-16  984  

:::::: The code at line 982 was first introduced by commit
:::::: d17abdf7566566fc402c31899b353044a7ff3cf4 cifs: add an smb3_fs_context to cifs_sb

:::::: TO: Ronnie Sahlberg <lsahlber@redhat.com>
:::::: CC: Steve French <stfrench@microsoft.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
