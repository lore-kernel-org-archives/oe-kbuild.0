Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FA0C33C7
	for <oe-kbuild@lists.linux.dev>; Mon, 12 Aug 2024 10:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723458024; cv=none; b=WIUG7oqwd5by1sYbHxjrFiSpozBKsmf2iO9Ee/OG2cjgrxBHxY9D8LBo3Qb8a8ubbq+XqU7R+EygIt7Ef0BPqpIVsiQrrhS+sFqYwt+SnHFaxzk6o1OHnSAS4NoAjw84l0zSos4kxRyj+I8CSdLTTyquaaquskgPPYByx4LLgS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723458024; c=relaxed/simple;
	bh=S0LwnfpZZQ/fqcBjKIHnNmOSa+Tb2gi5w7DY+IWEhhM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ORjVC02sxc3E1Fqcwz7QWfkaFWiiMx/LmUIHpG81e/QsUOS1pS9m2rJ/2ia0JIjvoo5QKmb2dxQegokDtkfyMd3rxcvjlnLKRb/sqhmubkMipUUPX48GM+R2l2c5urLQ69pMa/lSWm0r3noxGHYSoafgYTHJS63rBbA5O15j8us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O5Y438zM; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O5Y438zM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723458023; x=1754994023;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=S0LwnfpZZQ/fqcBjKIHnNmOSa+Tb2gi5w7DY+IWEhhM=;
  b=O5Y438zMdlGb/h0jwvpKFqRvR8O/QioHmjm2NMoaNY6vRswgQDo0r1V/
   mu70M277B5bLJilpCC2InFO1fftOf7+S/sNug43/se01+iFbwSPrxcoBM
   fYf5w7lpbUKPMMZ9xCzqsgt2BA5w945gLCTb3Wiv4AuBJxFWyn56ObL4T
   uAE3rqDkFYOQtQReM4hB4jd5v32GGQ9w7vdA7UFsNUKS7sr3lb+C3thKq
   z+tEOTgt+GRoi4jz4jxSNSITpgxFspAovSH3OuMW7MHzzewTHPlkylbbh
   XfnyvBU5Nz8szdwhyObvCc4UCG/yRk4sMQGRC5l82U6fgrXW+VvPYOTpz
   Q==;
X-CSE-ConnectionGUID: dZ1SSEnFSeWDDKRRSnZBRw==
X-CSE-MsgGUID: a2PVY3+sSWqVG2nAY0RJOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11161"; a="21532878"
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; 
   d="scan'208";a="21532878"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2024 03:20:22 -0700
X-CSE-ConnectionGUID: QsxumaEVSQqCfmKkTvX0vQ==
X-CSE-MsgGUID: ++YaCSKORcGmPanQTCd+IA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; 
   d="scan'208";a="57868837"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 12 Aug 2024 03:20:21 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sdS9y-000BdD-1N;
	Mon, 12 Aug 2024 10:20:18 +0000
Date: Mon, 12 Aug 2024 18:19:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [smfrench-smb3:5.15-stable-full-cifs-backport 46/56]
 fs/cifs/smb2pdu.c:3905:17-20: ERROR: invalid reference to the index variable
 of the iterator on line 3845
Message-ID: <202408121858.WpBeY7E1-lkp@intel.com>
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
TO: Steve French <stfrench@microsoft.com>

tree:   https://github.com/smfrench/smb3-kernel.git 5.15-stable-full-cifs-backport
head:   dd5dc9ded7fc13ae3d27e8178d8581f040af54f2
commit: abf3b4697c9af3739fac5b164e1d6a3ad2f6f05a [46/56] cifs: check reconnects for channels of active tcons too
:::::: branch date: 3 days ago
:::::: commit date: 4 days ago
config: i386-randconfig-052-20240812 (https://download.01.org/0day-ci/archive/20240812/202408121858.WpBeY7E1-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202408121858.WpBeY7E1-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/cifs/smb2pdu.c:3905:17-20: ERROR: invalid reference to the index variable of the iterator on line 3845

vim +3905 fs/cifs/smb2pdu.c

9094fad1ed90ca Pavel Shilovsky  2012-07-12  3820  
53e0e11efe9289 Pavel Shilovsky  2016-11-04  3821  void smb2_reconnect_server(struct work_struct *work)
53e0e11efe9289 Pavel Shilovsky  2016-11-04  3822  {
53e0e11efe9289 Pavel Shilovsky  2016-11-04  3823  	struct TCP_Server_Info *server = container_of(work,
53e0e11efe9289 Pavel Shilovsky  2016-11-04  3824  					struct TCP_Server_Info, reconnect.work);
abf3b4697c9af3 Steve French     2024-08-07  3825  	struct TCP_Server_Info *pserver;
abf3b4697c9af3 Steve French     2024-08-07  3826  	struct cifs_ses *ses, *ses2;
53e0e11efe9289 Pavel Shilovsky  2016-11-04  3827  	struct cifs_tcon *tcon, *tcon2;
abf3b4697c9af3 Steve French     2024-08-07  3828  	struct list_head tmp_list, tmp_ses_list;
abf3b4697c9af3 Steve French     2024-08-07  3829  	bool tcon_exist = false, ses_exist = false;
abf3b4697c9af3 Steve French     2024-08-07  3830  	bool tcon_selected = false, ses_selected = false;
18ea43113f5b74 Germano Percossi 2017-04-07  3831  	int rc;
abf3b4697c9af3 Steve French     2024-08-07  3832  	bool resched = false;
18ea43113f5b74 Germano Percossi 2017-04-07  3833  
abf3b4697c9af3 Steve French     2024-08-07  3834  	/* If server is a channel, select the primary channel */
abf3b4697c9af3 Steve French     2024-08-07  3835  	pserver = CIFS_SERVER_IS_CHAN(server) ? server->primary_server : server;
53e0e11efe9289 Pavel Shilovsky  2016-11-04  3836  
53e0e11efe9289 Pavel Shilovsky  2016-11-04  3837  	/* Prevent simultaneous reconnects that can corrupt tcon->rlist list */
abf3b4697c9af3 Steve French     2024-08-07  3838  	mutex_lock(&pserver->reconnect_mutex);
53e0e11efe9289 Pavel Shilovsky  2016-11-04  3839  
53e0e11efe9289 Pavel Shilovsky  2016-11-04  3840  	INIT_LIST_HEAD(&tmp_list);
abf3b4697c9af3 Steve French     2024-08-07  3841  	INIT_LIST_HEAD(&tmp_ses_list);
abf3b4697c9af3 Steve French     2024-08-07  3842  	cifs_dbg(FYI, "Reconnecting tcons and channels\n");
53e0e11efe9289 Pavel Shilovsky  2016-11-04  3843  
53e0e11efe9289 Pavel Shilovsky  2016-11-04  3844  	spin_lock(&cifs_tcp_ses_lock);
abf3b4697c9af3 Steve French     2024-08-07 @3845  	list_for_each_entry(ses, &pserver->smb_ses_list, smb_ses_list) {
abf3b4697c9af3 Steve French     2024-08-07  3846  
abf3b4697c9af3 Steve French     2024-08-07  3847  		tcon_selected = ses_selected = false;
abf3b4697c9af3 Steve French     2024-08-07  3848  
53e0e11efe9289 Pavel Shilovsky  2016-11-04  3849  		list_for_each_entry(tcon, &ses->tcon_list, tcon_list) {
96a988ffeb90db Pavel Shilovsky  2016-11-29  3850  			if (tcon->need_reconnect || tcon->need_reopen_files) {
53e0e11efe9289 Pavel Shilovsky  2016-11-04  3851  				tcon->tc_count++;
53e0e11efe9289 Pavel Shilovsky  2016-11-04  3852  				list_add_tail(&tcon->rlist, &tmp_list);
abf3b4697c9af3 Steve French     2024-08-07  3853  				tcon_selected = tcon_exist = true;
53e0e11efe9289 Pavel Shilovsky  2016-11-04  3854  			}
53e0e11efe9289 Pavel Shilovsky  2016-11-04  3855  		}
0ff2b018b02f89 Ronnie Sahlberg  2019-06-05  3856  		/*
0ff2b018b02f89 Ronnie Sahlberg  2019-06-05  3857  		 * IPC has the same lifetime as its session and uses its
0ff2b018b02f89 Ronnie Sahlberg  2019-06-05  3858  		 * refcount.
0ff2b018b02f89 Ronnie Sahlberg  2019-06-05  3859  		 */
b327a717e50698 Aurelien Aptel   2018-01-24  3860  		if (ses->tcon_ipc && ses->tcon_ipc->need_reconnect) {
b327a717e50698 Aurelien Aptel   2018-01-24  3861  			list_add_tail(&ses->tcon_ipc->rlist, &tmp_list);
abf3b4697c9af3 Steve French     2024-08-07  3862  			tcon_selected = tcon_exist = true;
abf3b4697c9af3 Steve French     2024-08-07  3863  			ses->ses_count++;
abf3b4697c9af3 Steve French     2024-08-07  3864  		}
abf3b4697c9af3 Steve French     2024-08-07  3865  		/*
abf3b4697c9af3 Steve French     2024-08-07  3866  		 * handle the case where channel needs to reconnect
abf3b4697c9af3 Steve French     2024-08-07  3867  		 * binding session, but tcon is healthy (some other channel
abf3b4697c9af3 Steve French     2024-08-07  3868  		 * is active)
abf3b4697c9af3 Steve French     2024-08-07  3869  		 */
abf3b4697c9af3 Steve French     2024-08-07  3870  		if (!tcon_selected && cifs_chan_needs_reconnect(ses, server)) {
abf3b4697c9af3 Steve French     2024-08-07  3871  			list_add_tail(&ses->rlist, &tmp_ses_list);
abf3b4697c9af3 Steve French     2024-08-07  3872  			ses_selected = ses_exist = true;
0ff2b018b02f89 Ronnie Sahlberg  2019-06-05  3873  			ses->ses_count++;
b327a717e50698 Aurelien Aptel   2018-01-24  3874  		}
53e0e11efe9289 Pavel Shilovsky  2016-11-04  3875  	}
53e0e11efe9289 Pavel Shilovsky  2016-11-04  3876  	/*
53e0e11efe9289 Pavel Shilovsky  2016-11-04  3877  	 * Get the reference to server struct to be sure that the last call of
53e0e11efe9289 Pavel Shilovsky  2016-11-04  3878  	 * cifs_put_tcon() in the loop below won't release the server pointer.
53e0e11efe9289 Pavel Shilovsky  2016-11-04  3879  	 */
abf3b4697c9af3 Steve French     2024-08-07  3880  	if (tcon_exist || ses_exist)
53e0e11efe9289 Pavel Shilovsky  2016-11-04  3881  		server->srv_count++;
53e0e11efe9289 Pavel Shilovsky  2016-11-04  3882  
53e0e11efe9289 Pavel Shilovsky  2016-11-04  3883  	spin_unlock(&cifs_tcp_ses_lock);
53e0e11efe9289 Pavel Shilovsky  2016-11-04  3884  
53e0e11efe9289 Pavel Shilovsky  2016-11-04  3885  	list_for_each_entry_safe(tcon, tcon2, &tmp_list, rlist) {
352d96f3acc6e0 Aurelien Aptel   2020-05-31  3886  		rc = smb2_reconnect(SMB2_INTERNAL_CMD, tcon, server);
18ea43113f5b74 Germano Percossi 2017-04-07  3887  		if (!rc)
96a988ffeb90db Pavel Shilovsky  2016-11-29  3888  			cifs_reopen_persistent_handles(tcon);
18ea43113f5b74 Germano Percossi 2017-04-07  3889  		else
18ea43113f5b74 Germano Percossi 2017-04-07  3890  			resched = true;
53e0e11efe9289 Pavel Shilovsky  2016-11-04  3891  		list_del_init(&tcon->rlist);
0ff2b018b02f89 Ronnie Sahlberg  2019-06-05  3892  		if (tcon->ipc)
0ff2b018b02f89 Ronnie Sahlberg  2019-06-05  3893  			cifs_put_smb_ses(tcon->ses);
0ff2b018b02f89 Ronnie Sahlberg  2019-06-05  3894  		else
53e0e11efe9289 Pavel Shilovsky  2016-11-04  3895  			cifs_put_tcon(tcon);
53e0e11efe9289 Pavel Shilovsky  2016-11-04  3896  	}
53e0e11efe9289 Pavel Shilovsky  2016-11-04  3897  
abf3b4697c9af3 Steve French     2024-08-07  3898  	if (!ses_exist)
abf3b4697c9af3 Steve French     2024-08-07  3899  		goto done;
abf3b4697c9af3 Steve French     2024-08-07  3900  
abf3b4697c9af3 Steve French     2024-08-07  3901  	/* allocate a dummy tcon struct used for reconnect */
abf3b4697c9af3 Steve French     2024-08-07  3902  	tcon = kzalloc(sizeof(struct cifs_tcon), GFP_KERNEL);
abf3b4697c9af3 Steve French     2024-08-07  3903  	if (!tcon) {
abf3b4697c9af3 Steve French     2024-08-07  3904  		resched = true;
abf3b4697c9af3 Steve French     2024-08-07 @3905  		list_del_init(&ses->rlist);
abf3b4697c9af3 Steve French     2024-08-07  3906  		cifs_put_smb_ses(ses);
abf3b4697c9af3 Steve French     2024-08-07  3907  		goto done;
abf3b4697c9af3 Steve French     2024-08-07  3908  	}
abf3b4697c9af3 Steve French     2024-08-07  3909  
abf3b4697c9af3 Steve French     2024-08-07  3910  	tcon->tidStatus = CifsGood;
abf3b4697c9af3 Steve French     2024-08-07  3911  	tcon->retry = false;
abf3b4697c9af3 Steve French     2024-08-07  3912  	tcon->need_reconnect = false;
abf3b4697c9af3 Steve French     2024-08-07  3913  
abf3b4697c9af3 Steve French     2024-08-07  3914  	/* now reconnect sessions for necessary channels */
abf3b4697c9af3 Steve French     2024-08-07  3915  	list_for_each_entry_safe(ses, ses2, &tmp_ses_list, rlist) {
abf3b4697c9af3 Steve French     2024-08-07  3916  		tcon->ses = ses;
abf3b4697c9af3 Steve French     2024-08-07  3917  		rc = smb2_reconnect(SMB2_INTERNAL_CMD, tcon, server);
abf3b4697c9af3 Steve French     2024-08-07  3918  		if (rc)
abf3b4697c9af3 Steve French     2024-08-07  3919  			resched = true;
abf3b4697c9af3 Steve French     2024-08-07  3920  		list_del_init(&ses->rlist);
abf3b4697c9af3 Steve French     2024-08-07  3921  		cifs_put_smb_ses(ses);
abf3b4697c9af3 Steve French     2024-08-07  3922  	}
abf3b4697c9af3 Steve French     2024-08-07  3923  	kfree(tcon);
abf3b4697c9af3 Steve French     2024-08-07  3924  
abf3b4697c9af3 Steve French     2024-08-07  3925  done:
abf3b4697c9af3 Steve French     2024-08-07  3926  	cifs_dbg(FYI, "Reconnecting tcons and channels finished\n");
18ea43113f5b74 Germano Percossi 2017-04-07  3927  	if (resched)
18ea43113f5b74 Germano Percossi 2017-04-07  3928  		queue_delayed_work(cifsiod_wq, &server->reconnect, 2 * HZ);
abf3b4697c9af3 Steve French     2024-08-07  3929  	mutex_unlock(&pserver->reconnect_mutex);
53e0e11efe9289 Pavel Shilovsky  2016-11-04  3930  
53e0e11efe9289 Pavel Shilovsky  2016-11-04  3931  	/* now we can safely release srv struct */
abf3b4697c9af3 Steve French     2024-08-07  3932  	if (tcon_exist || ses_exist)
53e0e11efe9289 Pavel Shilovsky  2016-11-04  3933  		cifs_put_tcp_session(server, 1);
53e0e11efe9289 Pavel Shilovsky  2016-11-04  3934  }
53e0e11efe9289 Pavel Shilovsky  2016-11-04  3935  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
