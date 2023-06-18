Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DA1F1102
	for <oe-kbuild@lists.linux.dev>; Sun, 18 Jun 2023 05:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687067709; x=1718603709;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4HbUymhzlvPMz0Lrj1vLicUhgLI44gK1PpoWysdA5Ag=;
  b=DwpDf3QY6M1MldaQIFx5IGeReie+B5UEdKYMp2zO9Vr2PrIi5uc+ElHw
   P3Aq/qP4PQGptR0Nlg3YqM2ipUWkfdVWljBy4ubg9VpUZ62bhyE7Bqb8P
   3W9hiASfxG0RQ7LN3KUCPAp31s4PPCnGY4HEgo8ucFAbXBB040eJJeJhI
   gSz9xCLvpxHzf5iUUPWNQqApOWSCqZy3mzzQdwQPV6oO1pzh0vLfj/vQt
   o1+dU3nC8c3UJ54x38IllzIYOTgIqVDBMYN6FaaLGfGzesyJ3L49UNQjN
   pvr7R/EKvqO48XXz/IEeiZD4wx8TYpoq3cZsXMj8FEgr6c6M3lJg/dg1b
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10744"; a="356942032"
X-IronPort-AV: E=Sophos;i="6.00,251,1681196400"; 
   d="scan'208";a="356942032"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2023 22:55:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10744"; a="663626781"
X-IronPort-AV: E=Sophos;i="6.00,251,1681196400"; 
   d="scan'208";a="663626781"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 17 Jun 2023 22:55:06 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qAlNR-0003Tv-2P;
	Sun, 18 Jun 2023 05:55:05 +0000
Date: Sun, 18 Jun 2023 13:55:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/smb/client/file.c:4946 cifs_oplock_break() warn: variable
 dereferenced before check 'tcon->ses' (see line 4883)
Message-ID: <202306181310.Vn99s6jW-lkp@intel.com>
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
CC: Bharath SM <bharathsm@microsoft.com>
CC: Shyam Prasad N <sprasad@microsoft.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   1b29d271614abd97cc39782daa9d6dd70e98609f
commit: c774e6779f38bf36f0cce65e30793704bab4b0d7 cifs: fix lease break oops in xfstest generic/098
date:   4 days ago
:::::: branch date: 12 hours ago
:::::: commit date: 4 days ago
config: x86_64-randconfig-m001-20230618 (https://download.01.org/0day-ci/archive/20230618/202306181310.Vn99s6jW-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230618/202306181310.Vn99s6jW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202306181310.Vn99s6jW-lkp@intel.com/

smatch warnings:
fs/smb/client/file.c:4946 cifs_oplock_break() warn: variable dereferenced before check 'tcon->ses' (see line 4883)

vim +4946 fs/smb/client/file.c

9ad1506b42c828 fs/cifs/file.c       Pavel Shilovsky    2011-04-08  4875  
9b646972467fb5 fs/cifs/file.c       Tejun Heo          2010-07-20  4876  void cifs_oplock_break(struct work_struct *work)
3bc303c254335d fs/cifs/file.c       Jeff Layton        2009-09-21  4877  {
3bc303c254335d fs/cifs/file.c       Jeff Layton        2009-09-21  4878  	struct cifsFileInfo *cfile = container_of(work, struct cifsFileInfo,
3bc303c254335d fs/cifs/file.c       Jeff Layton        2009-09-21  4879  						  oplock_break);
2b0143b5c986be fs/cifs/file.c       David Howells      2015-03-17  4880  	struct inode *inode = d_inode(cfile->dentry);
3bc303c254335d fs/cifs/file.c       Jeff Layton        2009-09-21  4881  	struct cifsInodeInfo *cinode = CIFS_I(inode);
95a3f2f377735e fs/cifs/file.c       Pavel Shilovsky    2012-09-18  4882  	struct cifs_tcon *tcon = tlink_tcon(cfile->tlink);
c11f1df5003d53 fs/cifs/file.c       Sachin Prabhu      2014-03-11 @4883  	struct TCP_Server_Info *server = tcon->ses->server;
eb4b756b1e60b6 fs/cifs/file.c       Jeff Layton        2010-10-22  4884  	int rc = 0;
59a556aebc43dd fs/cifs/file.c       Bharath SM         2023-05-15  4885  	bool purge_cache = false, oplock_break_cancelled;
59a556aebc43dd fs/cifs/file.c       Bharath SM         2023-05-15  4886  	__u64 persistent_fid, volatile_fid;
59a556aebc43dd fs/cifs/file.c       Bharath SM         2023-05-15  4887  	__u16 net_fid;
3bc303c254335d fs/cifs/file.c       Jeff Layton        2009-09-21  4888  
c11f1df5003d53 fs/cifs/file.c       Sachin Prabhu      2014-03-11  4889  	wait_on_bit(&cinode->flags, CIFS_INODE_PENDING_WRITERS,
743162013d40ca fs/cifs/file.c       NeilBrown          2014-07-07  4890  			TASK_UNINTERRUPTIBLE);
c11f1df5003d53 fs/cifs/file.c       Sachin Prabhu      2014-03-11  4891  
9bd45408366840 fs/cifs/file.c       Pavel Shilovsky    2019-10-29  4892  	server->ops->downgrade_oplock(server, cinode, cfile->oplock_level,
9bd45408366840 fs/cifs/file.c       Pavel Shilovsky    2019-10-29  4893  				      cfile->oplock_epoch, &purge_cache);
c11f1df5003d53 fs/cifs/file.c       Sachin Prabhu      2014-03-11  4894  
18cceb6a78f46b fs/cifs/file.c       Pavel Shilovsky    2013-09-05  4895  	if (!CIFS_CACHE_WRITE(cinode) && CIFS_CACHE_READ(cinode) &&
63b7d3a41ccade fs/cifs/file.c       Pavel Shilovsky    2012-12-24  4896  						cifs_has_mand_locks(cinode)) {
f96637be081141 fs/cifs/file.c       Joe Perches        2013-05-04  4897  		cifs_dbg(FYI, "Reset oplock to None for inode=%p due to mand locks\n",
63b7d3a41ccade fs/cifs/file.c       Pavel Shilovsky    2012-12-24  4898  			 inode);
18cceb6a78f46b fs/cifs/file.c       Pavel Shilovsky    2013-09-05  4899  		cinode->oplock = 0;
63b7d3a41ccade fs/cifs/file.c       Pavel Shilovsky    2012-12-24  4900  	}
63b7d3a41ccade fs/cifs/file.c       Pavel Shilovsky    2012-12-24  4901  
3bc303c254335d fs/cifs/file.c       Jeff Layton        2009-09-21  4902  	if (inode && S_ISREG(inode->i_mode)) {
18cceb6a78f46b fs/cifs/file.c       Pavel Shilovsky    2013-09-05  4903  		if (CIFS_CACHE_READ(cinode))
8737c9305bd560 fs/cifs/file.c       Al Viro            2009-12-24  4904  			break_lease(inode, O_RDONLY);
d54ff73259a852 fs/cifs/file.c       Steve French       2010-04-27  4905  		else
8737c9305bd560 fs/cifs/file.c       Al Viro            2009-12-24  4906  			break_lease(inode, O_WRONLY);
3bc303c254335d fs/cifs/file.c       Jeff Layton        2009-09-21  4907  		rc = filemap_fdatawrite(inode->i_mapping);
9bd45408366840 fs/cifs/file.c       Pavel Shilovsky    2019-10-29  4908  		if (!CIFS_CACHE_READ(cinode) || purge_cache) {
eb4b756b1e60b6 fs/cifs/file.c       Jeff Layton        2010-10-22  4909  			rc = filemap_fdatawait(inode->i_mapping);
eb4b756b1e60b6 fs/cifs/file.c       Jeff Layton        2010-10-22  4910  			mapping_set_error(inode->i_mapping, rc);
4f73c7d342d57d fs/cifs/file.c       Jeff Layton        2014-04-30  4911  			cifs_zap_mapping(inode);
3bc303c254335d fs/cifs/file.c       Jeff Layton        2009-09-21  4912  		}
f96637be081141 fs/cifs/file.c       Joe Perches        2013-05-04  4913  		cifs_dbg(FYI, "Oplock flush inode %p rc %d\n", inode, rc);
9bd45408366840 fs/cifs/file.c       Pavel Shilovsky    2019-10-29  4914  		if (CIFS_CACHE_WRITE(cinode))
9bd45408366840 fs/cifs/file.c       Pavel Shilovsky    2019-10-29  4915  			goto oplock_break_ack;
3bc303c254335d fs/cifs/file.c       Jeff Layton        2009-09-21  4916  	}
3bc303c254335d fs/cifs/file.c       Jeff Layton        2009-09-21  4917  
85160e03a79e0d fs/cifs/file.c       Pavel Shilovsky    2011-10-22  4918  	rc = cifs_push_locks(cfile);
85160e03a79e0d fs/cifs/file.c       Pavel Shilovsky    2011-10-22  4919  	if (rc)
f96637be081141 fs/cifs/file.c       Joe Perches        2013-05-04  4920  		cifs_dbg(VFS, "Push locks rc = %d\n", rc);
85160e03a79e0d fs/cifs/file.c       Pavel Shilovsky    2011-10-22  4921  
9bd45408366840 fs/cifs/file.c       Pavel Shilovsky    2019-10-29  4922  oplock_break_ack:
d906be3fa571f6 fs/cifs/file.c       Bharath SM         2023-04-26  4923  	/*
d906be3fa571f6 fs/cifs/file.c       Bharath SM         2023-04-26  4924  	 * When oplock break is received and there are no active
d906be3fa571f6 fs/cifs/file.c       Bharath SM         2023-04-26  4925  	 * file handles but cached, then schedule deferred close immediately.
d906be3fa571f6 fs/cifs/file.c       Bharath SM         2023-04-26  4926  	 * So, new open will not use cached handle.
d906be3fa571f6 fs/cifs/file.c       Bharath SM         2023-04-26  4927  	 */
d906be3fa571f6 fs/cifs/file.c       Bharath SM         2023-04-26  4928  
47592fa8eb0374 fs/cifs/file.c       Bharath SM         2023-05-03  4929  	if (!CIFS_CACHE_HANDLE(cinode) && !list_empty(&cinode->deferred_closes))
d906be3fa571f6 fs/cifs/file.c       Bharath SM         2023-04-26  4930  		cifs_close_deferred_file(cinode);
d906be3fa571f6 fs/cifs/file.c       Bharath SM         2023-04-26  4931  
59a556aebc43dd fs/cifs/file.c       Bharath SM         2023-05-15  4932  	persistent_fid = cfile->fid.persistent_fid;
59a556aebc43dd fs/cifs/file.c       Bharath SM         2023-05-15  4933  	volatile_fid = cfile->fid.volatile_fid;
59a556aebc43dd fs/cifs/file.c       Bharath SM         2023-05-15  4934  	net_fid = cfile->fid.netfid;
59a556aebc43dd fs/cifs/file.c       Bharath SM         2023-05-15  4935  	oplock_break_cancelled = cfile->oplock_break_cancelled;
59a556aebc43dd fs/cifs/file.c       Bharath SM         2023-05-15  4936  
59a556aebc43dd fs/cifs/file.c       Bharath SM         2023-05-15  4937  	_cifsFileInfo_put(cfile, false /* do not wait for ourself */, false);
9687c85dfbf84a fs/cifs/file.c       Rohith Surabattula 2021-05-20  4938  	/*
9e992755be8f2d fs/cifs/file.c       Rohith Surabattula 2021-08-09  4939  	 * releasing stale oplock after recent reconnect of smb session using
9e992755be8f2d fs/cifs/file.c       Rohith Surabattula 2021-08-09  4940  	 * a now incorrect file handle is not a data integrity issue but do
9e992755be8f2d fs/cifs/file.c       Rohith Surabattula 2021-08-09  4941  	 * not bother sending an oplock release if session to server still is
9e992755be8f2d fs/cifs/file.c       Rohith Surabattula 2021-08-09  4942  	 * disconnected since oplock already released by the server
9687c85dfbf84a fs/cifs/file.c       Rohith Surabattula 2021-05-20  4943  	 */
59a556aebc43dd fs/cifs/file.c       Bharath SM         2023-05-15  4944  	if (!oplock_break_cancelled) {
c774e6779f38bf fs/smb/client/file.c Steve French       2023-06-11  4945  		/* check for server null since can race with kill_sb calling tree disconnect */
c774e6779f38bf fs/smb/client/file.c Steve French       2023-06-11 @4946  		if (tcon->ses && tcon->ses->server) {
59a556aebc43dd fs/cifs/file.c       Bharath SM         2023-05-15  4947  			rc = tcon->ses->server->ops->oplock_response(tcon, persistent_fid,
59a556aebc43dd fs/cifs/file.c       Bharath SM         2023-05-15  4948  				volatile_fid, net_fid, cinode);
9e992755be8f2d fs/cifs/file.c       Rohith Surabattula 2021-08-09  4949  			cifs_dbg(FYI, "Oplock release rc = %d\n", rc);
c774e6779f38bf fs/smb/client/file.c Steve French       2023-06-11  4950  		} else
c774e6779f38bf fs/smb/client/file.c Steve French       2023-06-11  4951  			pr_warn_once("lease break not sent for unmounted share\n");
c3f207ab29f793 fs/cifs/file.c       Rohith Surabattula 2021-04-13  4952  	}
9e31678fb403ea fs/cifs/file.c       Bharath SM         2022-08-11  4953  
c11f1df5003d53 fs/cifs/file.c       Sachin Prabhu      2014-03-11  4954  	cifs_done_oplock_break(cinode);
3bc303c254335d fs/cifs/file.c       Jeff Layton        2009-09-21  4955  }
3bc303c254335d fs/cifs/file.c       Jeff Layton        2009-09-21  4956  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
