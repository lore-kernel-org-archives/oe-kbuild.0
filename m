Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 394FF2F50
	for <oe-kbuild@lists.linux.dev>; Sat, 12 Aug 2023 15:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691854101; x=1723390101;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vO3HWxXL5XEqo54eYjgxS3VeztBkOaoiGhSQGG42cS8=;
  b=g8JJHdfYXRQ/W38+SdVl2vpJWgWbnjDrSrYXqUUTY8D2dJSb3ECOPhYS
   bgKI5UgeZoZ8S4UBhFjtw/vopeDgUhUjYyo3hpsUEx5dEMbUAm1aOhM5a
   6r+itNa9txXK4eU0/h1Cu8POO1Ldh3T2CvVp9OKo7W4j+cO8X1no0a00A
   9p+jwdJUlnv1/ApGvVnCVk2CMzVFwGq7zb90OtVk75ZSoPQfLBzTByxPi
   k4UM2Bn2zU1T6FxJwwUgcGejm9Qa6tXrhtIyIbqyXYMZRpgcoTyGj5LFi
   sIkZawfy42EDZLSmVGPtJvozYgh6e+0sZKCkaYs+iBBtQ6qAxJxQcbjxO
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10800"; a="369305299"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200"; 
   d="scan'208";a="369305299"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2023 08:28:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="876477829"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 12 Aug 2023 08:28:20 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qUqXI-0008di-02;
	Sat, 12 Aug 2023 15:28:16 +0000
Date: Sat, 12 Aug 2023 23:27:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [cifs:for-next 1/3] fs/smb/client/file.c:4910 cifs_oplock_break()
 warn: variable dereferenced before check 'inode' (see line 4881)
Message-ID: <202308122352.c4EuwZ7z-lkp@intel.com>
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
TO: Steve French <stfrench@microsoft.com>
CC: Bharath SM <bharathsm@microsoft.com>
CC: Shyam Prasad N <sprasad@microsoft.com>
CC: "Paulo Alcantara (SUSE)" <pc@manguebit.com>

tree:   git://git.samba.org/sfrench/cifs-2.6.git for-next
head:   10bb84ebfa5139d502b180474553147e42529528
commit: e8f5f849ffce24490eb9449e98312b66c0dba76f [1/3] cifs: fix potential oops in cifs_oplock_break
:::::: branch date: 22 hours ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-m001-20230812 (https://download.01.org/0day-ci/archive/20230812/202308122352.c4EuwZ7z-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230812/202308122352.c4EuwZ7z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202308122352.c4EuwZ7z-lkp@intel.com/

smatch warnings:
fs/smb/client/file.c:4910 cifs_oplock_break() warn: variable dereferenced before check 'inode' (see line 4881)

vim +/inode +4910 fs/smb/client/file.c

9ad1506b42c828 fs/cifs/file.c       Pavel Shilovsky    2011-04-08  4875  
9b646972467fb5 fs/cifs/file.c       Tejun Heo          2010-07-20  4876  void cifs_oplock_break(struct work_struct *work)
3bc303c254335d fs/cifs/file.c       Jeff Layton        2009-09-21  4877  {
3bc303c254335d fs/cifs/file.c       Jeff Layton        2009-09-21  4878  	struct cifsFileInfo *cfile = container_of(work, struct cifsFileInfo,
3bc303c254335d fs/cifs/file.c       Jeff Layton        2009-09-21  4879  						  oplock_break);
2b0143b5c986be fs/cifs/file.c       David Howells      2015-03-17  4880  	struct inode *inode = d_inode(cfile->dentry);
e8f5f849ffce24 fs/smb/client/file.c Steve French       2023-08-10 @4881  	struct cifs_sb_info *cifs_sb = CIFS_SB(inode->i_sb);
3bc303c254335d fs/cifs/file.c       Jeff Layton        2009-09-21  4882  	struct cifsInodeInfo *cinode = CIFS_I(inode);
e8f5f849ffce24 fs/smb/client/file.c Steve French       2023-08-10  4883  	struct cifs_tcon *tcon;
e8f5f849ffce24 fs/smb/client/file.c Steve French       2023-08-10  4884  	struct TCP_Server_Info *server;
e8f5f849ffce24 fs/smb/client/file.c Steve French       2023-08-10  4885  	struct tcon_link *tlink;
eb4b756b1e60b6 fs/cifs/file.c       Jeff Layton        2010-10-22  4886  	int rc = 0;
59a556aebc43dd fs/cifs/file.c       Bharath SM         2023-05-15  4887  	bool purge_cache = false, oplock_break_cancelled;
59a556aebc43dd fs/cifs/file.c       Bharath SM         2023-05-15  4888  	__u64 persistent_fid, volatile_fid;
59a556aebc43dd fs/cifs/file.c       Bharath SM         2023-05-15  4889  	__u16 net_fid;
3bc303c254335d fs/cifs/file.c       Jeff Layton        2009-09-21  4890  
c11f1df5003d53 fs/cifs/file.c       Sachin Prabhu      2014-03-11  4891  	wait_on_bit(&cinode->flags, CIFS_INODE_PENDING_WRITERS,
743162013d40ca fs/cifs/file.c       NeilBrown          2014-07-07  4892  			TASK_UNINTERRUPTIBLE);
c11f1df5003d53 fs/cifs/file.c       Sachin Prabhu      2014-03-11  4893  
e8f5f849ffce24 fs/smb/client/file.c Steve French       2023-08-10  4894  	tlink = cifs_sb_tlink(cifs_sb);
e8f5f849ffce24 fs/smb/client/file.c Steve French       2023-08-10  4895  	if (IS_ERR(tlink))
e8f5f849ffce24 fs/smb/client/file.c Steve French       2023-08-10  4896  		goto out;
e8f5f849ffce24 fs/smb/client/file.c Steve French       2023-08-10  4897  	tcon = tlink_tcon(tlink);
e8f5f849ffce24 fs/smb/client/file.c Steve French       2023-08-10  4898  	server = tcon->ses->server;
e8f5f849ffce24 fs/smb/client/file.c Steve French       2023-08-10  4899  
9bd45408366840 fs/cifs/file.c       Pavel Shilovsky    2019-10-29  4900  	server->ops->downgrade_oplock(server, cinode, cfile->oplock_level,
9bd45408366840 fs/cifs/file.c       Pavel Shilovsky    2019-10-29  4901  				      cfile->oplock_epoch, &purge_cache);
c11f1df5003d53 fs/cifs/file.c       Sachin Prabhu      2014-03-11  4902  
18cceb6a78f46b fs/cifs/file.c       Pavel Shilovsky    2013-09-05  4903  	if (!CIFS_CACHE_WRITE(cinode) && CIFS_CACHE_READ(cinode) &&
63b7d3a41ccade fs/cifs/file.c       Pavel Shilovsky    2012-12-24  4904  						cifs_has_mand_locks(cinode)) {
f96637be081141 fs/cifs/file.c       Joe Perches        2013-05-04  4905  		cifs_dbg(FYI, "Reset oplock to None for inode=%p due to mand locks\n",
63b7d3a41ccade fs/cifs/file.c       Pavel Shilovsky    2012-12-24  4906  			 inode);
18cceb6a78f46b fs/cifs/file.c       Pavel Shilovsky    2013-09-05  4907  		cinode->oplock = 0;
63b7d3a41ccade fs/cifs/file.c       Pavel Shilovsky    2012-12-24  4908  	}
63b7d3a41ccade fs/cifs/file.c       Pavel Shilovsky    2012-12-24  4909  
3bc303c254335d fs/cifs/file.c       Jeff Layton        2009-09-21 @4910  	if (inode && S_ISREG(inode->i_mode)) {
18cceb6a78f46b fs/cifs/file.c       Pavel Shilovsky    2013-09-05  4911  		if (CIFS_CACHE_READ(cinode))
8737c9305bd560 fs/cifs/file.c       Al Viro            2009-12-24  4912  			break_lease(inode, O_RDONLY);
d54ff73259a852 fs/cifs/file.c       Steve French       2010-04-27  4913  		else
8737c9305bd560 fs/cifs/file.c       Al Viro            2009-12-24  4914  			break_lease(inode, O_WRONLY);
3bc303c254335d fs/cifs/file.c       Jeff Layton        2009-09-21  4915  		rc = filemap_fdatawrite(inode->i_mapping);
9bd45408366840 fs/cifs/file.c       Pavel Shilovsky    2019-10-29  4916  		if (!CIFS_CACHE_READ(cinode) || purge_cache) {
eb4b756b1e60b6 fs/cifs/file.c       Jeff Layton        2010-10-22  4917  			rc = filemap_fdatawait(inode->i_mapping);
eb4b756b1e60b6 fs/cifs/file.c       Jeff Layton        2010-10-22  4918  			mapping_set_error(inode->i_mapping, rc);
4f73c7d342d57d fs/cifs/file.c       Jeff Layton        2014-04-30  4919  			cifs_zap_mapping(inode);
3bc303c254335d fs/cifs/file.c       Jeff Layton        2009-09-21  4920  		}
f96637be081141 fs/cifs/file.c       Joe Perches        2013-05-04  4921  		cifs_dbg(FYI, "Oplock flush inode %p rc %d\n", inode, rc);
9bd45408366840 fs/cifs/file.c       Pavel Shilovsky    2019-10-29  4922  		if (CIFS_CACHE_WRITE(cinode))
9bd45408366840 fs/cifs/file.c       Pavel Shilovsky    2019-10-29  4923  			goto oplock_break_ack;
3bc303c254335d fs/cifs/file.c       Jeff Layton        2009-09-21  4924  	}
3bc303c254335d fs/cifs/file.c       Jeff Layton        2009-09-21  4925  
85160e03a79e0d fs/cifs/file.c       Pavel Shilovsky    2011-10-22  4926  	rc = cifs_push_locks(cfile);
85160e03a79e0d fs/cifs/file.c       Pavel Shilovsky    2011-10-22  4927  	if (rc)
f96637be081141 fs/cifs/file.c       Joe Perches        2013-05-04  4928  		cifs_dbg(VFS, "Push locks rc = %d\n", rc);
85160e03a79e0d fs/cifs/file.c       Pavel Shilovsky    2011-10-22  4929  
9bd45408366840 fs/cifs/file.c       Pavel Shilovsky    2019-10-29  4930  oplock_break_ack:
d906be3fa571f6 fs/cifs/file.c       Bharath SM         2023-04-26  4931  	/*
d906be3fa571f6 fs/cifs/file.c       Bharath SM         2023-04-26  4932  	 * When oplock break is received and there are no active
d906be3fa571f6 fs/cifs/file.c       Bharath SM         2023-04-26  4933  	 * file handles but cached, then schedule deferred close immediately.
d906be3fa571f6 fs/cifs/file.c       Bharath SM         2023-04-26  4934  	 * So, new open will not use cached handle.
d906be3fa571f6 fs/cifs/file.c       Bharath SM         2023-04-26  4935  	 */
d906be3fa571f6 fs/cifs/file.c       Bharath SM         2023-04-26  4936  
47592fa8eb0374 fs/cifs/file.c       Bharath SM         2023-05-03  4937  	if (!CIFS_CACHE_HANDLE(cinode) && !list_empty(&cinode->deferred_closes))
d906be3fa571f6 fs/cifs/file.c       Bharath SM         2023-04-26  4938  		cifs_close_deferred_file(cinode);
d906be3fa571f6 fs/cifs/file.c       Bharath SM         2023-04-26  4939  
59a556aebc43dd fs/cifs/file.c       Bharath SM         2023-05-15  4940  	persistent_fid = cfile->fid.persistent_fid;
59a556aebc43dd fs/cifs/file.c       Bharath SM         2023-05-15  4941  	volatile_fid = cfile->fid.volatile_fid;
59a556aebc43dd fs/cifs/file.c       Bharath SM         2023-05-15  4942  	net_fid = cfile->fid.netfid;
59a556aebc43dd fs/cifs/file.c       Bharath SM         2023-05-15  4943  	oplock_break_cancelled = cfile->oplock_break_cancelled;
59a556aebc43dd fs/cifs/file.c       Bharath SM         2023-05-15  4944  
59a556aebc43dd fs/cifs/file.c       Bharath SM         2023-05-15  4945  	_cifsFileInfo_put(cfile, false /* do not wait for ourself */, false);
9687c85dfbf84a fs/cifs/file.c       Rohith Surabattula 2021-05-20  4946  	/*
da787d5b74983f fs/smb/client/file.c Bharath SM         2023-06-18  4947  	 * MS-SMB2 3.2.5.19.1 and 3.2.5.19.2 (and MS-CIFS 3.2.5.42) do not require
da787d5b74983f fs/smb/client/file.c Bharath SM         2023-06-18  4948  	 * an acknowledgment to be sent when the file has already been closed.
9687c85dfbf84a fs/cifs/file.c       Rohith Surabattula 2021-05-20  4949  	 */
da787d5b74983f fs/smb/client/file.c Bharath SM         2023-06-18  4950  	spin_lock(&cinode->open_file_lock);
e8f5f849ffce24 fs/smb/client/file.c Steve French       2023-08-10  4951  	/* check list empty since can race with kill_sb calling tree disconnect */
e8f5f849ffce24 fs/smb/client/file.c Steve French       2023-08-10  4952  	if (!oplock_break_cancelled && !list_empty(&cinode->openFileList)) {
da787d5b74983f fs/smb/client/file.c Bharath SM         2023-06-18  4953  		spin_unlock(&cinode->open_file_lock);
e8f5f849ffce24 fs/smb/client/file.c Steve French       2023-08-10  4954  		rc = server->ops->oplock_response(tcon, persistent_fid,
59a556aebc43dd fs/cifs/file.c       Bharath SM         2023-05-15  4955  						  volatile_fid, net_fid, cinode);
9e992755be8f2d fs/cifs/file.c       Rohith Surabattula 2021-08-09  4956  		cifs_dbg(FYI, "Oplock release rc = %d\n", rc);
c774e6779f38bf fs/smb/client/file.c Steve French       2023-06-11  4957  	} else
da787d5b74983f fs/smb/client/file.c Bharath SM         2023-06-18  4958  		spin_unlock(&cinode->open_file_lock);
9e31678fb403ea fs/cifs/file.c       Bharath SM         2022-08-11  4959  
e8f5f849ffce24 fs/smb/client/file.c Steve French       2023-08-10  4960  	cifs_put_tlink(tlink);
e8f5f849ffce24 fs/smb/client/file.c Steve French       2023-08-10  4961  out:
c11f1df5003d53 fs/cifs/file.c       Sachin Prabhu      2014-03-11  4962  	cifs_done_oplock_break(cinode);
3bc303c254335d fs/cifs/file.c       Jeff Layton        2009-09-21  4963  }
3bc303c254335d fs/cifs/file.c       Jeff Layton        2009-09-21  4964  

:::::: The code at line 4910 was first introduced by commit
:::::: 3bc303c254335dbd7c7012cc1760b12f1d5514d3 cifs: convert oplock breaks to use slow_work facility (try #4)

:::::: TO: Jeff Layton <jlayton@redhat.com>
:::::: CC: Steve French <sfrench@us.ibm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
