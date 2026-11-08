Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794108320;
	b=igtq51cTsJGItgR+nFlInABjUaLb/BD+bFOuWqthEErK8TTyY8qMLlKM1AexF4pPb2WF
	 aoOV598sU14VcSUR4PMnWSMCTHpS0Mg4n1ULRORHk/3IKYckQ5hHpyMouAo3OxioJDgQH
	 Ly1OaXKfGtXZeJK2tIUnyBjp52a2L3att/RaquP1FKqt5cqAHYIES/HT/9oZmGfYpThHe
	 8E9ovapi+rAn9CDu6ZwUmz3Q+eIL/dDpaKBOONcUB4ytPmxTELKlOHGrUlpzL8Rw0hBLs
	 vRIa67Rov7v+3DmyXAs3NL1F0fIocAuMQGAkIZGKULZGI3EgO0GLvIRUcL8/Y/HtuuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794108320;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=OtEyBYOJY4p56E1Ez+NSIYlDlfkrZ7Cpqn+I2dnEOwQ=;
	b=egnhBh1I5g9jc0aVLrQCaCPuu6h42QzDPAJrws6TintUISttUo9FzTHTXSChvvCnlaI1
	 jbidUnrKRmiTiyHsBSfE04lzLlNTBNlU6vSoOahrdXoTPDDsm5hCPj5RAohbGqzyJXpfY
	 6T5bfmMguPc8DtGIaUXuWC93mVqhRMOKZcPYyYJ4CcgViGyBtHaCrYeavSEA2QjRSbL53
	 7/JqrJLzXUQokwTbB/g0x0DzxiOmRMAkngf7Kou9VFYrLpM1nmKpwqt8VCHn7qEgPYJiQ
	 uU34EjEangbU3tR8dKPTUJrUNhSjZeGK6uoIrYOZYTfugIrePB75fqa0IXxwVAp4Hgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CdHgyJIQ;
	arc=none smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36BE4606A31A
	for <oe-kbuild@lists.linux.dev>; Sun,  8 Nov 2026 03:25:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36BE4606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CdHgyJIQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794108319; x=1825644319;
  h=date:from:to:cc:subject:message-id;
  bh=9OfH38CWet+6OcCz369ZKmPdPobxRjN9KvO1d2MAHXg=;
  b=CdHgyJIQN2KaCUe7HE8e7MtjefeBqilmtHrgoDMVI3e/jv3IIiDk5hxl
   +QPbBQRRg4LazzUwl4QF1qnsq+i9VXrv8JOkHVHCSTejqbGANVoBwjQhr
   OEqkT/EcCvhiJX2YPvJC0TN7zYNor19jnKMTpZ9aB6Q/1t1egpXrMjptP
   hA5n+QhBxythOYdzKEUsHcG/WfHH0T6ISRqNuy9/wglvVgmn8VkkXkOds
   6Zk/u44rzX+P4wnLlJhdeqtqI12iTfPzmyUqoEdK/iXAay6yPHaMUmJ/v
   1lhRkNgn5dezJtMue7pW2N8Vef5LEmNau6yh6aaj89/cuy1rjNOPvXn5c
   Q==;
X-CSE-ConnectionGUID: QEuVWCo1RFOCqKeI9y8M3Q==
X-CSE-MsgGUID: 9s0SAKeIRe6MoTJy2kf9JA==
X-IronPort-AV: E=McAfee;i="6800,10657,11959"; a="2792579"
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="2792579"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2026 19:25:18 -0800
X-CSE-ConnectionGUID: 3MYau3X4TM2BtPYD2anC6A==
X-CSE-MsgGUID: Kid5OPmYR16HGTdWa5x7zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="7922636"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 07 Nov 2026 19:25:17 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPtWs-00000000Ayx-0i9t;
	Sun, 08 Nov 2026 03:25:14 +0000
Date: Sun, 08 Nov 2026 04:25:06 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android13-5.15 54/54] fs/cifs/file.c:4897
 cifs_oplock_break() warn: variable dereferenced before check 'inode' (see
 line 4868)
Message-ID: <202611080410.pfEN3OXx-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   a5a9930e03c61e245e77f94ef4d0fef4d57c5092
commit: b99f490ea87ebcca3a429fd8837067feb56a4c7c [54/54] cifs: fix potential oops in cifs_oplock_break
:::::: branch date: 27 hours ago
:::::: commit date: 3 years, 2 months ago
config: i386-randconfig-2200-20261107 (https://download.01.org/0day-ci/archive/20261108/202611080410.pfEN3OXx-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 0fa861dbbf46e5a75f621406fd91cb015d8754bf)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202611080410.pfEN3OXx-lkp@intel.com/

smatch warnings:
fs/cifs/file.c:4897 cifs_oplock_break() warn: variable dereferenced before check 'inode' (see line 4868)

vim +/inode +4897 fs/cifs/file.c

9ad1506b42c828 Pavel Shilovsky    2011-04-08  4862  
9b646972467fb5 Tejun Heo          2010-07-20  4863  void cifs_oplock_break(struct work_struct *work)
3bc303c254335d Jeff Layton        2009-09-21  4864  {
3bc303c254335d Jeff Layton        2009-09-21  4865  	struct cifsFileInfo *cfile = container_of(work, struct cifsFileInfo,
3bc303c254335d Jeff Layton        2009-09-21  4866  						  oplock_break);
2b0143b5c986be David Howells      2015-03-17  4867  	struct inode *inode = d_inode(cfile->dentry);
b99f490ea87ebc Steve French       2023-08-10 @4868  	struct cifs_sb_info *cifs_sb = CIFS_SB(inode->i_sb);
3bc303c254335d Jeff Layton        2009-09-21  4869  	struct cifsInodeInfo *cinode = CIFS_I(inode);
b99f490ea87ebc Steve French       2023-08-10  4870  	struct cifs_tcon *tcon;
b99f490ea87ebc Steve French       2023-08-10  4871  	struct TCP_Server_Info *server;
b99f490ea87ebc Steve French       2023-08-10  4872  	struct tcon_link *tlink;
eb4b756b1e60b6 Jeff Layton        2010-10-22  4873  	int rc = 0;
49f47945386e7c Bharath SM         2023-05-15  4874  	bool purge_cache = false, oplock_break_cancelled;
49f47945386e7c Bharath SM         2023-05-15  4875  	__u64 persistent_fid, volatile_fid;
49f47945386e7c Bharath SM         2023-05-15  4876  	__u16 net_fid;
3bc303c254335d Jeff Layton        2009-09-21  4877  
c11f1df5003d53 Sachin Prabhu      2014-03-11  4878  	wait_on_bit(&cinode->flags, CIFS_INODE_PENDING_WRITERS,
743162013d40ca NeilBrown          2014-07-07  4879  			TASK_UNINTERRUPTIBLE);
c11f1df5003d53 Sachin Prabhu      2014-03-11  4880  
b99f490ea87ebc Steve French       2023-08-10  4881  	tlink = cifs_sb_tlink(cifs_sb);
b99f490ea87ebc Steve French       2023-08-10  4882  	if (IS_ERR(tlink))
b99f490ea87ebc Steve French       2023-08-10  4883  		goto out;
b99f490ea87ebc Steve French       2023-08-10  4884  	tcon = tlink_tcon(tlink);
b99f490ea87ebc Steve French       2023-08-10  4885  	server = tcon->ses->server;
b99f490ea87ebc Steve French       2023-08-10  4886  
9bd45408366840 Pavel Shilovsky    2019-10-29  4887  	server->ops->downgrade_oplock(server, cinode, cfile->oplock_level,
9bd45408366840 Pavel Shilovsky    2019-10-29  4888  				      cfile->oplock_epoch, &purge_cache);
c11f1df5003d53 Sachin Prabhu      2014-03-11  4889  
18cceb6a78f46b Pavel Shilovsky    2013-09-05  4890  	if (!CIFS_CACHE_WRITE(cinode) && CIFS_CACHE_READ(cinode) &&
63b7d3a41ccade Pavel Shilovsky    2012-12-24  4891  						cifs_has_mand_locks(cinode)) {
f96637be081141 Joe Perches        2013-05-04  4892  		cifs_dbg(FYI, "Reset oplock to None for inode=%p due to mand locks\n",
63b7d3a41ccade Pavel Shilovsky    2012-12-24  4893  			 inode);
18cceb6a78f46b Pavel Shilovsky    2013-09-05  4894  		cinode->oplock = 0;
63b7d3a41ccade Pavel Shilovsky    2012-12-24  4895  	}
63b7d3a41ccade Pavel Shilovsky    2012-12-24  4896  
3bc303c254335d Jeff Layton        2009-09-21 @4897  	if (inode && S_ISREG(inode->i_mode)) {
18cceb6a78f46b Pavel Shilovsky    2013-09-05  4898  		if (CIFS_CACHE_READ(cinode))
8737c9305bd560 Al Viro            2009-12-24  4899  			break_lease(inode, O_RDONLY);
d54ff73259a852 Steve French       2010-04-27  4900  		else
8737c9305bd560 Al Viro            2009-12-24  4901  			break_lease(inode, O_WRONLY);
3bc303c254335d Jeff Layton        2009-09-21  4902  		rc = filemap_fdatawrite(inode->i_mapping);
9bd45408366840 Pavel Shilovsky    2019-10-29  4903  		if (!CIFS_CACHE_READ(cinode) || purge_cache) {
eb4b756b1e60b6 Jeff Layton        2010-10-22  4904  			rc = filemap_fdatawait(inode->i_mapping);
eb4b756b1e60b6 Jeff Layton        2010-10-22  4905  			mapping_set_error(inode->i_mapping, rc);
4f73c7d342d57d Jeff Layton        2014-04-30  4906  			cifs_zap_mapping(inode);
3bc303c254335d Jeff Layton        2009-09-21  4907  		}
f96637be081141 Joe Perches        2013-05-04  4908  		cifs_dbg(FYI, "Oplock flush inode %p rc %d\n", inode, rc);
9bd45408366840 Pavel Shilovsky    2019-10-29  4909  		if (CIFS_CACHE_WRITE(cinode))
9bd45408366840 Pavel Shilovsky    2019-10-29  4910  			goto oplock_break_ack;
3bc303c254335d Jeff Layton        2009-09-21  4911  	}
3bc303c254335d Jeff Layton        2009-09-21  4912  
85160e03a79e0d Pavel Shilovsky    2011-10-22  4913  	rc = cifs_push_locks(cfile);
85160e03a79e0d Pavel Shilovsky    2011-10-22  4914  	if (rc)
f96637be081141 Joe Perches        2013-05-04  4915  		cifs_dbg(VFS, "Push locks rc = %d\n", rc);
85160e03a79e0d Pavel Shilovsky    2011-10-22  4916  
9bd45408366840 Pavel Shilovsky    2019-10-29  4917  oplock_break_ack:
3dc3a86b88bda8 Bharath SM         2023-04-26  4918  	/*
3dc3a86b88bda8 Bharath SM         2023-04-26  4919  	 * When oplock break is received and there are no active
3dc3a86b88bda8 Bharath SM         2023-04-26  4920  	 * file handles but cached, then schedule deferred close immediately.
3dc3a86b88bda8 Bharath SM         2023-04-26  4921  	 * So, new open will not use cached handle.
3dc3a86b88bda8 Bharath SM         2023-04-26  4922  	 */
3dc3a86b88bda8 Bharath SM         2023-04-26  4923  
653d30a1512c44 Bharath SM         2023-05-03  4924  	if (!CIFS_CACHE_HANDLE(cinode) && !list_empty(&cinode->deferred_closes))
3dc3a86b88bda8 Bharath SM         2023-04-26  4925  		cifs_close_deferred_file(cinode);
3dc3a86b88bda8 Bharath SM         2023-04-26  4926  
49f47945386e7c Bharath SM         2023-05-15  4927  	persistent_fid = cfile->fid.persistent_fid;
49f47945386e7c Bharath SM         2023-05-15  4928  	volatile_fid = cfile->fid.volatile_fid;
49f47945386e7c Bharath SM         2023-05-15  4929  	net_fid = cfile->fid.netfid;
49f47945386e7c Bharath SM         2023-05-15  4930  	oplock_break_cancelled = cfile->oplock_break_cancelled;
49f47945386e7c Bharath SM         2023-05-15  4931  
49f47945386e7c Bharath SM         2023-05-15  4932  	_cifsFileInfo_put(cfile, false /* do not wait for ourself */, false);
9687c85dfbf84a Rohith Surabattula 2021-05-20  4933  	/*
63fb45ddc49189 Bharath SM         2023-06-18  4934  	 * MS-SMB2 3.2.5.19.1 and 3.2.5.19.2 (and MS-CIFS 3.2.5.42) do not require
63fb45ddc49189 Bharath SM         2023-06-18  4935  	 * an acknowledgment to be sent when the file has already been closed.
9687c85dfbf84a Rohith Surabattula 2021-05-20  4936  	 */
63fb45ddc49189 Bharath SM         2023-06-18  4937  	spin_lock(&cinode->open_file_lock);
b99f490ea87ebc Steve French       2023-08-10  4938  	/* check list empty since can race with kill_sb calling tree disconnect */
b99f490ea87ebc Steve French       2023-08-10  4939  	if (!oplock_break_cancelled && !list_empty(&cinode->openFileList)) {
63fb45ddc49189 Bharath SM         2023-06-18  4940  		spin_unlock(&cinode->open_file_lock);
b99f490ea87ebc Steve French       2023-08-10  4941  		rc = server->ops->oplock_response(tcon, persistent_fid,
49f47945386e7c Bharath SM         2023-05-15  4942  						  volatile_fid, net_fid, cinode);
9e992755be8f2d Rohith Surabattula 2021-08-09  4943  		cifs_dbg(FYI, "Oplock release rc = %d\n", rc);
eb4ccc102d5fe8 Steve French       2023-06-11  4944  	} else
63fb45ddc49189 Bharath SM         2023-06-18  4945  		spin_unlock(&cinode->open_file_lock);
c9c965fa197439 Bharath SM         2022-08-11  4946  
b99f490ea87ebc Steve French       2023-08-10  4947  	cifs_put_tlink(tlink);
b99f490ea87ebc Steve French       2023-08-10  4948  out:
c11f1df5003d53 Sachin Prabhu      2014-03-11  4949  	cifs_done_oplock_break(cinode);
3bc303c254335d Jeff Layton        2009-09-21  4950  }
3bc303c254335d Jeff Layton        2009-09-21  4951  

:::::: The code at line 4897 was first introduced by commit
:::::: 3bc303c254335dbd7c7012cc1760b12f1d5514d3 cifs: convert oplock breaks to use slow_work facility (try #4)

:::::: TO: Jeff Layton <jlayton@redhat.com>
:::::: CC: Steve French <sfrench@us.ibm.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
