Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4586614F9ED
	for <oe-kbuild@lists.linux.dev>; Thu, 25 Apr 2024 21:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714079720; cv=none; b=QiYE2KXG3E5HOcFKMMKh0awFvMzGHOlo4tjL52GX1xQEgDkkyFmGJFjmPozQZtAfFGJWBKvQFzsYOngiYRk8CWmCUdsF3UryvVkWaF17aPe67gdAntYQgjH6oxucGVO2v0SYiQzTz/IcaLJaiPXodXah92owoF2aceCmYpgrKc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714079720; c=relaxed/simple;
	bh=MBFmK9p5n/VordfRozzrpCvUl8LLfJwVwnIsD8k+z3A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fMlFeT5mixP3nl1NBzb92zOl4m7HzdXjkHOHRZ8m/XAvtPnjaECDaKB8Hs6nKHV2ig5Up/PNNt2XJsBNyEwtJMuKMgkUtl5mK32mU8DFWK7VvdegyGo+m9ObRlzErxld8Yvzlg+WLH6verAZH0tCNXtyvg/yQ6InjEIFYR+i7WQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=daIjhT34; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="daIjhT34"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714079718; x=1745615718;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MBFmK9p5n/VordfRozzrpCvUl8LLfJwVwnIsD8k+z3A=;
  b=daIjhT347LT4FL82mzlX5rOrW2nUtjxry1F5xMFXqeL1WO24bXH13x2E
   v1paTtSRWKluPrtLTWUTaUAh6CjIeFTKqT+yHCCa+XYl0RvKBI/ZLNXkA
   72th9FSuYQGiaySznogPLDssQ5eLG9fX8telcnlJQFPT5I3ZDNJAYQkDR
   kajRSA6HNWaSfWE5Kb+tFbvQnd5gFgAu/8pgjuuhlS2jYuBzeUF1VxQr7
   +5/aHhLRjhlSxvqDk3xmGyWlncWs86lTSEgNqX1bVEqtrN/mxMQ1JVkO6
   IUZfWMP8X6AGbBq286VqyUGERLNsPxKIMUNRoLnbN7cAryUAkAtXLExKn
   Q==;
X-CSE-ConnectionGUID: OZ02RFiLSMa38ETfOrl+Xw==
X-CSE-MsgGUID: b0P/xLvFShe23hSs7MBqBA==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="35189116"
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; 
   d="scan'208";a="35189116"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2024 14:15:17 -0700
X-CSE-ConnectionGUID: b4jEF2oTSjODQzH1z00sZw==
X-CSE-MsgGUID: iVE4VHPJStq8GNkREiAwdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; 
   d="scan'208";a="25203059"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 25 Apr 2024 14:15:16 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s06R0-0002sm-0O;
	Thu, 25 Apr 2024 21:15:14 +0000
Date: Fri, 26 Apr 2024 05:14:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/smb/client/smb2pdu.c:3639 __SMB2_close() error:
 __builtin_memcpy() '&rsp->network_open_info' too small (52 vs 56)
Message-ID: <202404260506.LY2fnQRZ-lkp@intel.com>
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
TO: Namjae Jeon <linkinjeon@kernel.org>
CC: Steve French <stfrench@microsoft.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a93289b830ce783955b22fbe5d1274a464c05acf
commit: 0268a7cc7fdc47d90b6c18859de7718d5059f6f1 ksmbd: common: use struct_group_attr instead of struct_group for network_open_info
date:   6 days ago
:::::: branch date: 3 hours ago
:::::: commit date: 6 days ago
config: x86_64-randconfig-161-20240426 (https://download.01.org/0day-ci/archive/20240426/202404260506.LY2fnQRZ-lkp@intel.com/config)
compiler: gcc-12 (Ubuntu 12.3.0-9ubuntu2) 12.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202404260506.LY2fnQRZ-lkp@intel.com/

smatch warnings:
fs/smb/client/smb2pdu.c:3639 __SMB2_close() error: __builtin_memcpy() '&rsp->network_open_info' too small (52 vs 56)

vim +3639 fs/smb/client/smb2pdu.c

8eb4ecfab03d21 fs/cifs/smb2pdu.c       Ronnie Sahlberg  2018-08-01  3575  
2503a0dba98948 fs/cifs/smb2pdu.c       Pavel Shilovsky  2011-12-26  3576  int
43f8a6a74ee244 fs/cifs/smb2pdu.c       Steve French     2019-12-02  3577  __SMB2_close(const unsigned int xid, struct cifs_tcon *tcon,
43f8a6a74ee244 fs/cifs/smb2pdu.c       Steve French     2019-12-02  3578  	     u64 persistent_fid, u64 volatile_fid,
43f8a6a74ee244 fs/cifs/smb2pdu.c       Steve French     2019-12-02  3579  	     struct smb2_file_network_open_info *pbuf)
2503a0dba98948 fs/cifs/smb2pdu.c       Pavel Shilovsky  2011-12-26  3580  {
40eff45b5dc7df fs/cifs/smb2pdu.c       Ronnie Sahlberg  2018-06-12  3581  	struct smb_rqst rqst;
8eb4ecfab03d21 fs/cifs/smb2pdu.c       Ronnie Sahlberg  2018-08-01  3582  	struct smb2_close_rsp *rsp = NULL;
2503a0dba98948 fs/cifs/smb2pdu.c       Pavel Shilovsky  2011-12-26  3583  	struct cifs_ses *ses = tcon->ses;
4f1fffa2376922 fs/smb/client/smb2pdu.c Shyam Prasad N   2024-01-21  3584  	struct TCP_Server_Info *server;
2503a0dba98948 fs/cifs/smb2pdu.c       Pavel Shilovsky  2011-12-26  3585  	struct kvec iov[1];
da502f7df03d2d fs/cifs/smb2pdu.c       Pavel Shilovsky  2016-10-25  3586  	struct kvec rsp_iov;
ef2298a06d0129 fs/cifs/smb2pdu.c       Garry McNulty    2018-10-03  3587  	int resp_buftype = CIFS_NO_BUFFER;
2503a0dba98948 fs/cifs/smb2pdu.c       Pavel Shilovsky  2011-12-26  3588  	int rc = 0;
9e8fae2597405a fs/cifs/smb2pdu.c       Steve French     2019-12-02  3589  	int flags = 0;
43f8a6a74ee244 fs/cifs/smb2pdu.c       Steve French     2019-12-02  3590  	bool query_attrs = false;
4f1fffa2376922 fs/smb/client/smb2pdu.c Shyam Prasad N   2024-01-21  3591  	int retries = 0, cur_sleep = 1;
4f1fffa2376922 fs/smb/client/smb2pdu.c Shyam Prasad N   2024-01-21  3592  
4f1fffa2376922 fs/smb/client/smb2pdu.c Shyam Prasad N   2024-01-21  3593  replay_again:
4f1fffa2376922 fs/smb/client/smb2pdu.c Shyam Prasad N   2024-01-21  3594  	/* reinitialize for possible replay */
4f1fffa2376922 fs/smb/client/smb2pdu.c Shyam Prasad N   2024-01-21  3595  	flags = 0;
4f1fffa2376922 fs/smb/client/smb2pdu.c Shyam Prasad N   2024-01-21  3596  	query_attrs = false;
4f1fffa2376922 fs/smb/client/smb2pdu.c Shyam Prasad N   2024-01-21  3597  	server = cifs_pick_channel(ses);
2503a0dba98948 fs/cifs/smb2pdu.c       Pavel Shilovsky  2011-12-26  3598  
f96637be081141 fs/cifs/smb2pdu.c       Joe Perches      2013-05-04  3599  	cifs_dbg(FYI, "Close\n");
2503a0dba98948 fs/cifs/smb2pdu.c       Pavel Shilovsky  2011-12-26  3600  
352d96f3acc6e0 fs/cifs/smb2pdu.c       Aurelien Aptel   2020-05-31  3601  	if (!ses || !server)
2503a0dba98948 fs/cifs/smb2pdu.c       Pavel Shilovsky  2011-12-26  3602  		return -EIO;
2503a0dba98948 fs/cifs/smb2pdu.c       Pavel Shilovsky  2011-12-26  3603  
5a77e75fedce55 fs/cifs/smb2pdu.c       Steve French     2018-05-09  3604  	if (smb3_encryption_required(tcon))
7fb8986e7449d0 fs/cifs/smb2pdu.c       Pavel Shilovsky  2016-10-31  3605  		flags |= CIFS_TRANSFORM_REQ;
7fb8986e7449d0 fs/cifs/smb2pdu.c       Pavel Shilovsky  2016-10-31  3606  
40eff45b5dc7df fs/cifs/smb2pdu.c       Ronnie Sahlberg  2018-06-12  3607  	memset(&rqst, 0, sizeof(struct smb_rqst));
8eb4ecfab03d21 fs/cifs/smb2pdu.c       Ronnie Sahlberg  2018-08-01  3608  	memset(&iov, 0, sizeof(iov));
40eff45b5dc7df fs/cifs/smb2pdu.c       Ronnie Sahlberg  2018-06-12  3609  	rqst.rq_iov = iov;
40eff45b5dc7df fs/cifs/smb2pdu.c       Ronnie Sahlberg  2018-06-12  3610  	rqst.rq_nvec = 1;
40eff45b5dc7df fs/cifs/smb2pdu.c       Ronnie Sahlberg  2018-06-12  3611  
43f8a6a74ee244 fs/cifs/smb2pdu.c       Steve French     2019-12-02  3612  	/* check if need to ask server to return timestamps in close response */
43f8a6a74ee244 fs/cifs/smb2pdu.c       Steve French     2019-12-02  3613  	if (pbuf)
43f8a6a74ee244 fs/cifs/smb2pdu.c       Steve French     2019-12-02  3614  		query_attrs = true;
43f8a6a74ee244 fs/cifs/smb2pdu.c       Steve French     2019-12-02  3615  
f90f979726bc37 fs/cifs/smb2pdu.c       Steve French     2019-09-03  3616  	trace_smb3_close_enter(xid, persistent_fid, tcon->tid, ses->Suid);
352d96f3acc6e0 fs/cifs/smb2pdu.c       Aurelien Aptel   2020-05-31  3617  	rc = SMB2_close_init(tcon, server,
352d96f3acc6e0 fs/cifs/smb2pdu.c       Aurelien Aptel   2020-05-31  3618  			     &rqst, persistent_fid, volatile_fid,
43f8a6a74ee244 fs/cifs/smb2pdu.c       Steve French     2019-12-02  3619  			     query_attrs);
8eb4ecfab03d21 fs/cifs/smb2pdu.c       Ronnie Sahlberg  2018-08-01  3620  	if (rc)
8eb4ecfab03d21 fs/cifs/smb2pdu.c       Ronnie Sahlberg  2018-08-01  3621  		goto close_exit;
8eb4ecfab03d21 fs/cifs/smb2pdu.c       Ronnie Sahlberg  2018-08-01  3622  
4f1fffa2376922 fs/smb/client/smb2pdu.c Shyam Prasad N   2024-01-21  3623  	if (retries)
4f1fffa2376922 fs/smb/client/smb2pdu.c Shyam Prasad N   2024-01-21  3624  		smb2_set_replay(server, &rqst);
4f1fffa2376922 fs/smb/client/smb2pdu.c Shyam Prasad N   2024-01-21  3625  
352d96f3acc6e0 fs/cifs/smb2pdu.c       Aurelien Aptel   2020-05-31  3626  	rc = cifs_send_recv(xid, ses, server,
352d96f3acc6e0 fs/cifs/smb2pdu.c       Aurelien Aptel   2020-05-31  3627  			    &rqst, &resp_buftype, flags, &rsp_iov);
da502f7df03d2d fs/cifs/smb2pdu.c       Pavel Shilovsky  2016-10-25  3628  	rsp = (struct smb2_close_rsp *)rsp_iov.iov_base;
2503a0dba98948 fs/cifs/smb2pdu.c       Pavel Shilovsky  2011-12-26  3629  
2503a0dba98948 fs/cifs/smb2pdu.c       Pavel Shilovsky  2011-12-26  3630  	if (rc != 0) {
2503a0dba98948 fs/cifs/smb2pdu.c       Pavel Shilovsky  2011-12-26  3631  		cifs_stats_fail_inc(tcon, SMB2_CLOSE_HE);
eccb4422cf97a4 fs/cifs/smb2pdu.c       Steve French     2018-05-17  3632  		trace_smb3_close_err(xid, persistent_fid, tcon->tid, ses->Suid,
eccb4422cf97a4 fs/cifs/smb2pdu.c       Steve French     2018-05-17  3633  				     rc);
2503a0dba98948 fs/cifs/smb2pdu.c       Pavel Shilovsky  2011-12-26  3634  		goto close_exit;
43f8a6a74ee244 fs/cifs/smb2pdu.c       Steve French     2019-12-02  3635  	} else {
f90f979726bc37 fs/cifs/smb2pdu.c       Steve French     2019-09-03  3636  		trace_smb3_close_done(xid, persistent_fid, tcon->tid,
f90f979726bc37 fs/cifs/smb2pdu.c       Steve French     2019-09-03  3637  				      ses->Suid);
43f8a6a74ee244 fs/cifs/smb2pdu.c       Steve French     2019-12-02  3638  		if (pbuf)
0015eb6e12384f fs/smb/client/smb2pdu.c Dmitry Antipov   2023-11-28 @3639  			memcpy(&pbuf->network_open_info,
0015eb6e12384f fs/smb/client/smb2pdu.c Dmitry Antipov   2023-11-28  3640  			       &rsp->network_open_info,
0015eb6e12384f fs/smb/client/smb2pdu.c Dmitry Antipov   2023-11-28  3641  			       sizeof(pbuf->network_open_info));
173217bd733658 fs/smb/client/smb2pdu.c Ritvik Budhiraja 2024-04-02  3642  		atomic_dec(&tcon->num_remote_opens);
43f8a6a74ee244 fs/cifs/smb2pdu.c       Steve French     2019-12-02  3643  	}
2503a0dba98948 fs/cifs/smb2pdu.c       Pavel Shilovsky  2011-12-26  3644  
2503a0dba98948 fs/cifs/smb2pdu.c       Pavel Shilovsky  2011-12-26  3645  close_exit:
8eb4ecfab03d21 fs/cifs/smb2pdu.c       Ronnie Sahlberg  2018-08-01  3646  	SMB2_close_free(&rqst);
2503a0dba98948 fs/cifs/smb2pdu.c       Pavel Shilovsky  2011-12-26  3647  	free_rsp_buf(resp_buftype, rsp);
9150c3adbf24d7 fs/cifs/smb2pdu.c       Pavel Shilovsky  2019-11-21  3648  
9150c3adbf24d7 fs/cifs/smb2pdu.c       Pavel Shilovsky  2019-11-21  3649  	/* retry close in a worker thread if this one is interrupted */
2659d3bff3e1b0 fs/cifs/smb2pdu.c       Paulo Alcantara  2021-01-13  3650  	if (is_interrupt_error(rc)) {
9e8fae2597405a fs/cifs/smb2pdu.c       Steve French     2019-12-02  3651  		int tmp_rc;
9e8fae2597405a fs/cifs/smb2pdu.c       Steve French     2019-12-02  3652  
9150c3adbf24d7 fs/cifs/smb2pdu.c       Pavel Shilovsky  2019-11-21  3653  		tmp_rc = smb2_handle_cancelled_close(tcon, persistent_fid,
9150c3adbf24d7 fs/cifs/smb2pdu.c       Pavel Shilovsky  2019-11-21  3654  						     volatile_fid);
9150c3adbf24d7 fs/cifs/smb2pdu.c       Pavel Shilovsky  2019-11-21  3655  		if (tmp_rc)
9150c3adbf24d7 fs/cifs/smb2pdu.c       Pavel Shilovsky  2019-11-21  3656  			cifs_dbg(VFS, "handle cancelled close fid 0x%llx returned error %d\n",
9150c3adbf24d7 fs/cifs/smb2pdu.c       Pavel Shilovsky  2019-11-21  3657  				 persistent_fid, tmp_rc);
9150c3adbf24d7 fs/cifs/smb2pdu.c       Pavel Shilovsky  2019-11-21  3658  	}
4f1fffa2376922 fs/smb/client/smb2pdu.c Shyam Prasad N   2024-01-21  3659  
4f1fffa2376922 fs/smb/client/smb2pdu.c Shyam Prasad N   2024-01-21  3660  	if (is_replayable_error(rc) &&
4f1fffa2376922 fs/smb/client/smb2pdu.c Shyam Prasad N   2024-01-21  3661  	    smb2_should_replay(tcon, &retries, &cur_sleep))
4f1fffa2376922 fs/smb/client/smb2pdu.c Shyam Prasad N   2024-01-21  3662  		goto replay_again;
4f1fffa2376922 fs/smb/client/smb2pdu.c Shyam Prasad N   2024-01-21  3663  
9150c3adbf24d7 fs/cifs/smb2pdu.c       Pavel Shilovsky  2019-11-21  3664  	return rc;
97ca1762246d6e fs/cifs/smb2pdu.c       Ronnie Sahlberg  2018-04-26  3665  }
97ca1762246d6e fs/cifs/smb2pdu.c       Ronnie Sahlberg  2018-04-26  3666  

:::::: The code at line 3639 was first introduced by commit
:::::: 0015eb6e12384ff1c589928e84deac2ad1ceb236 smb: client, common: fix fortify warnings

:::::: TO: Dmitry Antipov <dmantipov@yandex.ru>
:::::: CC: Steve French <stfrench@microsoft.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
