Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7975A47ACF6
	for <oe-kbuild@lists.linux.dev>; Thu, 24 Sep 2026 12:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790252886; cv=none; b=FvzYdS5cy/VJOF8B+ATUZeytEKoVh/pZ7AzTVEW1DmuyGJX0JnEfsyllfi9E/7AfOgeljpLpEYWqaPVyD1fJfvpS9PBbsDJX3DU6LTX8QTgMSdtSN4sWogcWAx7BSlZ11ejdeGpEkalgNu7YxjimD806GAU79mXr3m1tOyfvqgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790252886; c=relaxed/simple;
	bh=ivcSwA8SNtYlKp3q7pdWNz4z7uT4Yezl3fDJgIPP6jI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=drS248LtTXburq/IqPMozNe8r04o6hGYZzgomWmTDT/PSVnY2Jeb9gCcdappNYxe9ywT3YRh/tsxX0rWF8lFNJ4/42yV1u3EOXWTshAKF+b42+i+Q6KvNXIi30y9vTVQWx5vRDaWohu7TARj7NCVtV4Bfo34uo7+fqCWIAbEifs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G6HwOA7e; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G6HwOA7e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790252884; x=1821788884;
  h=date:from:to:cc:subject:message-id;
  bh=ivcSwA8SNtYlKp3q7pdWNz4z7uT4Yezl3fDJgIPP6jI=;
  b=G6HwOA7eahFveVmKC9mTL2yF83Rf3+y0XRDF9qeMk61COmTJ7m/RbYte
   MjcVDlw36j7PVCPulk8X+Q1gxTwB5JUYwPbThw7Lo5ne/l/GNZW5Ka2Sf
   PkWeG1VPvsApah8Skb+DghsQstkJyM36L2ZyFXOaIu0C+buppNpBvVhsu
   NIOP6FU0adox+iAWvZp9eVyGyqG/nO+RId05JV0PkHmTibt5ss37lCvIy
   ReP4E5Qg42ofkQyqq99iSSJJJdaR0ZVLCOySKKsRMhSvy8ISPRvAFE+VC
   /YYMHnBVN9Fz3ab7ldvRo1pxoujwOyxIWdIul6/3q/UFgTfUeZR7wd1yK
   A==;
X-CSE-ConnectionGUID: onBqxes/SxagKv8S8mt8eQ==
X-CSE-MsgGUID: D9t6RZwxSrmnvo6SuQsUNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="78574721"
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; 
   d="scan'208";a="78574721"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 05:28:03 -0700
X-CSE-ConnectionGUID: bnwky1+fSsezm1BBic3vFw==
X-CSE-MsgGUID: aoR19XksRZOqTG2amhyyWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; 
   d="scan'208";a="282103588"
Received: from igk-lkp-server01.igk.intel.com (HELO a88263cc608e) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 24 Sep 2026 05:28:01 -0700
Received: from kbuild by a88263cc608e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9iYR-000000000KY-2IET;
	Thu, 24 Sep 2026 12:27:59 +0000
Date: Thu, 24 Sep 2026 14:27:19 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 8364/9480] fs/smb/client/transport.c:1118
 compound_send_recv() error: we previously assumed 'resp_iov' could be null
 (see line 1094)
Message-ID: <202609241449.HlHmnZFZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Zihan Xi <zihanx@nebusec.ai>
CC: Paulo Alcantara <pc@manguebit.org>
CC: Luxing Yin <root@tr0jan.top>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3d7783543c2646af69ad65825e810060494bea21
commit: 6c5c547f037bc18f0b8d0b5db5a648f8f630ce85 [8364/9480] smb: client: close completed creates on compound wait errors
:::::: branch date: 13 hours ago
:::::: commit date: 3 days ago
config: i386-randconfig-r2202-20260924 (https://download.01.org/0day-ci/archive/20260924/202609241449.HlHmnZFZ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202609241449.HlHmnZFZ-lkp@intel.com/

smatch warnings:
fs/smb/client/transport.c:1118 compound_send_recv() error: we previously assumed 'resp_iov' could be null (see line 1094)

vim +/resp_iov +1118 fs/smb/client/transport.c

5f68ea4aa98bcd fs/cifs/transport.c       Aurelien Aptel     2020-04-22   872  
b8f57ee8aad414 fs/cifs/transport.c       Pavel Shilovsky    2016-11-23   873  int
e0bba0b8548179 fs/cifs/transport.c       Ronnie Sahlberg    2018-08-01   874  compound_send_recv(const unsigned int xid, struct cifs_ses *ses,
352d96f3acc6e0 fs/cifs/transport.c       Aurelien Aptel     2020-05-31   875  		   struct TCP_Server_Info *server,
e0bba0b8548179 fs/cifs/transport.c       Ronnie Sahlberg    2018-08-01   876  		   const int flags, const int num_rqst, struct smb_rqst *rqst,
e0bba0b8548179 fs/cifs/transport.c       Ronnie Sahlberg    2018-08-01   877  		   int *resp_buf_type, struct kvec *resp_iov)
7ee1af765dfa31 fs/cifs/transport.c       Jeremy Allison     2006-08-02   878  {
480b1cb9dad894 fs/cifs/transport.c       Ronnie Sahlberg    2019-03-08   879  	int i, j, optype, rc = 0;
6c5c547f037bc1 fs/smb/client/transport.c Zihan Xi           2026-09-16   880  	int num_processed = 0;
83bfbd0bb9025f fs/smb/client/transport.c David Howells      2025-09-05   881  	struct mid_q_entry *mid[MAX_COMPOUND];
8544f4aa9dd19a fs/cifs/transport.c       Pavel Shilovsky    2018-12-22   882  	bool cancelled_mid[MAX_COMPOUND] = {false};
34f4deb7c56c6f fs/cifs/transport.c       Pavel Shilovsky    2019-01-16   883  	struct cifs_credits credits[MAX_COMPOUND] = {
34f4deb7c56c6f fs/cifs/transport.c       Pavel Shilovsky    2019-01-16   884  		{ .value = 0, .instance = 0 }
34f4deb7c56c6f fs/cifs/transport.c       Pavel Shilovsky    2019-01-16   885  	};
34f4deb7c56c6f fs/cifs/transport.c       Pavel Shilovsky    2019-01-16   886  	unsigned int instance;
738f9de5cdb917 fs/cifs/transport.c       Pavel Shilovsky    2016-11-23   887  	char *buf;
7ee1af765dfa31 fs/cifs/transport.c       Jeremy Allison     2006-08-02   888  
a891f0f895f4a7 fs/cifs/transport.c       Pavel Shilovsky    2012-05-23   889  	optype = flags & CIFS_OP_MASK;
133672efbc1085 fs/cifs/transport.c       Steve French       2007-11-13   890  
e0bba0b8548179 fs/cifs/transport.c       Ronnie Sahlberg    2018-08-01   891  	for (i = 0; i < num_rqst; i++)
e0bba0b8548179 fs/cifs/transport.c       Ronnie Sahlberg    2018-08-01   892  		resp_buf_type[i] = CIFS_NO_BUFFER;  /* no response buf yet */
7ee1af765dfa31 fs/cifs/transport.c       Jeremy Allison     2006-08-02   893  
352d96f3acc6e0 fs/cifs/transport.c       Aurelien Aptel     2020-05-31   894  	if (!ses || !ses->server || !server) {
f96637be081141 fs/cifs/transport.c       Joe Perches        2013-05-04   895  		cifs_dbg(VFS, "Null session\n");
f80ac7eda1cf52 fs/smb/client/transport.c David Howells      2025-10-24   896  		return smb_EIO(smb_eio_trace_null_pointers);
7ee1af765dfa31 fs/cifs/transport.c       Jeremy Allison     2006-08-02   897  	}
7ee1af765dfa31 fs/cifs/transport.c       Jeremy Allison     2006-08-02   898  
d7d7a66aacd6fd fs/cifs/transport.c       Shyam Prasad N     2022-07-27   899  	spin_lock(&server->srv_lock);
080dc5e5656c1c fs/cifs/transport.c       Shyam Prasad N     2021-07-19   900  	if (server->tcpStatus == CifsExiting) {
d7d7a66aacd6fd fs/cifs/transport.c       Shyam Prasad N     2022-07-27   901  		spin_unlock(&server->srv_lock);
7ee1af765dfa31 fs/cifs/transport.c       Jeremy Allison     2006-08-02   902  		return -ENOENT;
080dc5e5656c1c fs/cifs/transport.c       Shyam Prasad N     2021-07-19   903  	}
d7d7a66aacd6fd fs/cifs/transport.c       Shyam Prasad N     2022-07-27   904  	spin_unlock(&server->srv_lock);
7ee1af765dfa31 fs/cifs/transport.c       Jeremy Allison     2006-08-02   905  
7091bcaba9f34c fs/cifs/transport.c       Pavel Shilovsky    2019-01-30   906  	/*
257b78099be015 fs/cifs/transport.c       Ronnie Sahlberg    2019-03-11   907  	 * Wait for all the requests to become available.
7091bcaba9f34c fs/cifs/transport.c       Pavel Shilovsky    2019-01-30   908  	 * This approach still leaves the possibility to be stuck waiting for
7091bcaba9f34c fs/cifs/transport.c       Pavel Shilovsky    2019-01-30   909  	 * credits if the server doesn't grant credits to the outstanding
257b78099be015 fs/cifs/transport.c       Ronnie Sahlberg    2019-03-11   910  	 * requests and if the client is completely idle, not generating any
257b78099be015 fs/cifs/transport.c       Ronnie Sahlberg    2019-03-11   911  	 * other requests.
257b78099be015 fs/cifs/transport.c       Ronnie Sahlberg    2019-03-11   912  	 * This can be handled by the eventual session reconnect.
792af7b05b8a78 fs/cifs/transport.c       Pavel Shilovsky    2012-03-23   913  	 */
3190b59a050ecd fs/cifs/transport.c       Aurelien Aptel     2019-06-24   914  	rc = wait_for_compound_request(server, num_rqst, flags,
257b78099be015 fs/cifs/transport.c       Ronnie Sahlberg    2019-03-11   915  				       &instance);
257b78099be015 fs/cifs/transport.c       Ronnie Sahlberg    2019-03-11   916  	if (rc)
257b78099be015 fs/cifs/transport.c       Ronnie Sahlberg    2019-03-11   917  		return rc;
97ea499883cc05 fs/cifs/transport.c       Pavel Shilovsky    2019-01-15   918  
257b78099be015 fs/cifs/transport.c       Ronnie Sahlberg    2019-03-11   919  	for (i = 0; i < num_rqst; i++) {
97ea499883cc05 fs/cifs/transport.c       Pavel Shilovsky    2019-01-15   920  		credits[i].value = 1;
97ea499883cc05 fs/cifs/transport.c       Pavel Shilovsky    2019-01-15   921  		credits[i].instance = instance;
8544f4aa9dd19a fs/cifs/transport.c       Pavel Shilovsky    2018-12-22   922  	}
7ee1af765dfa31 fs/cifs/transport.c       Jeremy Allison     2006-08-02   923  
792af7b05b8a78 fs/cifs/transport.c       Pavel Shilovsky    2012-03-23   924  	/*
792af7b05b8a78 fs/cifs/transport.c       Pavel Shilovsky    2012-03-23   925  	 * Make sure that we sign in the same order that we send on this socket
792af7b05b8a78 fs/cifs/transport.c       Pavel Shilovsky    2012-03-23   926  	 * and avoid races inside tcp sendmsg code that could cause corruption
792af7b05b8a78 fs/cifs/transport.c       Pavel Shilovsky    2012-03-23   927  	 * of smb data.
792af7b05b8a78 fs/cifs/transport.c       Pavel Shilovsky    2012-03-23   928  	 */
7ee1af765dfa31 fs/cifs/transport.c       Jeremy Allison     2006-08-02   929  
cc391b694ff085 fs/cifs/transport.c       Vincent Whitchurch 2022-06-01   930  	cifs_server_lock(server);
7ee1af765dfa31 fs/cifs/transport.c       Jeremy Allison     2006-08-02   931  
97ea499883cc05 fs/cifs/transport.c       Pavel Shilovsky    2019-01-15   932  	/*
97ea499883cc05 fs/cifs/transport.c       Pavel Shilovsky    2019-01-15   933  	 * All the parts of the compound chain belong obtained credits from the
257b78099be015 fs/cifs/transport.c       Ronnie Sahlberg    2019-03-11   934  	 * same session. We can not use credits obtained from the previous
97ea499883cc05 fs/cifs/transport.c       Pavel Shilovsky    2019-01-15   935  	 * session to send this request. Check if there were reconnects after
97ea499883cc05 fs/cifs/transport.c       Pavel Shilovsky    2019-01-15   936  	 * we obtained credits and return -EAGAIN in such cases to let callers
97ea499883cc05 fs/cifs/transport.c       Pavel Shilovsky    2019-01-15   937  	 * handle it.
97ea499883cc05 fs/cifs/transport.c       Pavel Shilovsky    2019-01-15   938  	 */
3190b59a050ecd fs/cifs/transport.c       Aurelien Aptel     2019-06-24   939  	if (instance != server->reconnect_instance) {
cc391b694ff085 fs/cifs/transport.c       Vincent Whitchurch 2022-06-01   940  		cifs_server_unlock(server);
97ea499883cc05 fs/cifs/transport.c       Pavel Shilovsky    2019-01-15   941  		for (j = 0; j < num_rqst; j++)
3190b59a050ecd fs/cifs/transport.c       Aurelien Aptel     2019-06-24   942  			add_credits(server, &credits[j], optype);
97ea499883cc05 fs/cifs/transport.c       Pavel Shilovsky    2019-01-15   943  		return -EAGAIN;
97ea499883cc05 fs/cifs/transport.c       Pavel Shilovsky    2019-01-15   944  	}
97ea499883cc05 fs/cifs/transport.c       Pavel Shilovsky    2019-01-15   945  
e0bba0b8548179 fs/cifs/transport.c       Ronnie Sahlberg    2018-08-01   946  	for (i = 0; i < num_rqst; i++) {
83bfbd0bb9025f fs/smb/client/transport.c David Howells      2025-09-05   947  		mid[i] = server->ops->setup_request(ses, server, &rqst[i]);
83bfbd0bb9025f fs/smb/client/transport.c David Howells      2025-09-05   948  		if (IS_ERR(mid[i])) {
3190b59a050ecd fs/cifs/transport.c       Aurelien Aptel     2019-06-24   949  			revert_current_mid(server, i);
e0bba0b8548179 fs/cifs/transport.c       Ronnie Sahlberg    2018-08-01   950  			for (j = 0; j < i; j++)
87fba18abbb843 fs/smb/client/transport.c David Howells      2025-10-03   951  				delete_mid(server, mid[j]);
cc391b694ff085 fs/cifs/transport.c       Vincent Whitchurch 2022-06-01   952  			cifs_server_unlock(server);
8544f4aa9dd19a fs/cifs/transport.c       Pavel Shilovsky    2018-12-22   953  
7ee1af765dfa31 fs/cifs/transport.c       Jeremy Allison     2006-08-02   954  			/* Update # of requests on wire to server */
8544f4aa9dd19a fs/cifs/transport.c       Pavel Shilovsky    2018-12-22   955  			for (j = 0; j < num_rqst; j++)
3190b59a050ecd fs/cifs/transport.c       Aurelien Aptel     2019-06-24   956  				add_credits(server, &credits[j], optype);
83bfbd0bb9025f fs/smb/client/transport.c David Howells      2025-09-05   957  			return PTR_ERR(mid[i]);
e0bba0b8548179 fs/cifs/transport.c       Ronnie Sahlberg    2018-08-01   958  		}
e0bba0b8548179 fs/cifs/transport.c       Ronnie Sahlberg    2018-08-01   959  
28405cb5b2fde2 fs/smb/client/transport.c David Howells      2025-08-05   960  		mid[i]->sr_flags = flags;
83bfbd0bb9025f fs/smb/client/transport.c David Howells      2025-09-05   961  		mid[i]->mid_state = MID_REQUEST_SUBMITTED;
83bfbd0bb9025f fs/smb/client/transport.c David Howells      2025-09-05   962  		mid[i]->optype = optype;
4e34feb5e96328 fs/cifs/transport.c       Ronnie Sahlberg    2018-08-30   963  		/*
ee258d79159afe fs/cifs/transport.c       Pavel Shilovsky    2019-01-03   964  		 * Invoke callback for every part of the compound chain
ee258d79159afe fs/cifs/transport.c       Pavel Shilovsky    2019-01-03   965  		 * to calculate credits properly. Wake up this thread only when
ee258d79159afe fs/cifs/transport.c       Pavel Shilovsky    2019-01-03   966  		 * the last element is received.
4e34feb5e96328 fs/cifs/transport.c       Ronnie Sahlberg    2018-08-30   967  		 */
4e34feb5e96328 fs/cifs/transport.c       Ronnie Sahlberg    2018-08-30   968  		if (i < num_rqst - 1)
83bfbd0bb9025f fs/smb/client/transport.c David Howells      2025-09-05   969  			mid[i]->callback = cifs_compound_callback;
ee258d79159afe fs/cifs/transport.c       Pavel Shilovsky    2019-01-03   970  		else
83bfbd0bb9025f fs/smb/client/transport.c David Howells      2025-09-05   971  			mid[i]->callback = cifs_compound_last_callback;
7ee1af765dfa31 fs/cifs/transport.c       Jeremy Allison     2006-08-02   972  	}
3190b59a050ecd fs/cifs/transport.c       Aurelien Aptel     2019-06-24   973  	rc = smb_send_rqst(server, num_rqst, rqst, flags);
e0bba0b8548179 fs/cifs/transport.c       Ronnie Sahlberg    2018-08-01   974  
e0bba0b8548179 fs/cifs/transport.c       Ronnie Sahlberg    2018-08-01   975  	for (i = 0; i < num_rqst; i++)
83bfbd0bb9025f fs/smb/client/transport.c David Howells      2025-09-05   976  		cifs_save_when_sent(mid[i]);
7ee1af765dfa31 fs/cifs/transport.c       Jeremy Allison     2006-08-02   977  
c781af7e0c1fed fs/cifs/transport.c       Pavel Shilovsky    2019-03-04   978  	if (rc < 0) {
3190b59a050ecd fs/cifs/transport.c       Aurelien Aptel     2019-06-24   979  		revert_current_mid(server, num_rqst);
3190b59a050ecd fs/cifs/transport.c       Aurelien Aptel     2019-06-24   980  		server->sequence_number -= 2;
8f6f8a48399f82 fs/smb/client/transport.c Adarsh Das         2026-09-19   981  		for (i = 0; i < num_rqst; i++) {
8f6f8a48399f82 fs/smb/client/transport.c Adarsh Das         2026-09-19   982  			delete_mid(server, mid[i]);
8f6f8a48399f82 fs/smb/client/transport.c Adarsh Das         2026-09-19   983  			cancelled_mid[i] = true;
8f6f8a48399f82 fs/smb/client/transport.c Adarsh Das         2026-09-19   984  		}
c781af7e0c1fed fs/cifs/transport.c       Pavel Shilovsky    2019-03-04   985  	}
e0bba0b8548179 fs/cifs/transport.c       Ronnie Sahlberg    2018-08-01   986  
cc391b694ff085 fs/cifs/transport.c       Vincent Whitchurch 2022-06-01   987  	cifs_server_unlock(server);
7ee1af765dfa31 fs/cifs/transport.c       Jeremy Allison     2006-08-02   988  
d69cb728e70c40 fs/cifs/transport.c       Ronnie Sahlberg    2019-05-01   989  	/*
d69cb728e70c40 fs/cifs/transport.c       Ronnie Sahlberg    2019-05-01   990  	 * If sending failed for some reason or it is an oplock break that we
d69cb728e70c40 fs/cifs/transport.c       Ronnie Sahlberg    2019-05-01   991  	 * will not receive a response to - return credits back
d69cb728e70c40 fs/cifs/transport.c       Ronnie Sahlberg    2019-05-01   992  	 */
d69cb728e70c40 fs/cifs/transport.c       Ronnie Sahlberg    2019-05-01   993  	if (rc < 0 || (flags & CIFS_NO_SRV_RSP)) {
ee258d79159afe fs/cifs/transport.c       Pavel Shilovsky    2019-01-03   994  		for (i = 0; i < num_rqst; i++)
3190b59a050ecd fs/cifs/transport.c       Aurelien Aptel     2019-06-24   995  			add_credits(server, &credits[i], optype);
7ee1af765dfa31 fs/cifs/transport.c       Jeremy Allison     2006-08-02   996  		goto out;
ee258d79159afe fs/cifs/transport.c       Pavel Shilovsky    2019-01-03   997  	}
ee258d79159afe fs/cifs/transport.c       Pavel Shilovsky    2019-01-03   998  
ee258d79159afe fs/cifs/transport.c       Pavel Shilovsky    2019-01-03   999  	/*
ee258d79159afe fs/cifs/transport.c       Pavel Shilovsky    2019-01-03  1000  	 * At this point the request is passed to the network stack - we assume
ee258d79159afe fs/cifs/transport.c       Pavel Shilovsky    2019-01-03  1001  	 * that any credits taken from the server structure on the client have
ee258d79159afe fs/cifs/transport.c       Pavel Shilovsky    2019-01-03  1002  	 * been spent and we can't return them back. Once we receive responses
ee258d79159afe fs/cifs/transport.c       Pavel Shilovsky    2019-01-03  1003  	 * we will collect credits granted by the server in the mid callbacks
ee258d79159afe fs/cifs/transport.c       Pavel Shilovsky    2019-01-03  1004  	 * and add those credits to the server structure.
ee258d79159afe fs/cifs/transport.c       Pavel Shilovsky    2019-01-03  1005  	 */
7ee1af765dfa31 fs/cifs/transport.c       Jeremy Allison     2006-08-02  1006  
cb5c2e63948451 fs/cifs/transport.c       Ronnie Sahlberg    2018-10-10  1007  	/*
cb5c2e63948451 fs/cifs/transport.c       Ronnie Sahlberg    2018-10-10  1008  	 * Compounding is never used during session establish.
cb5c2e63948451 fs/cifs/transport.c       Ronnie Sahlberg    2018-10-10  1009  	 */
d7d7a66aacd6fd fs/cifs/transport.c       Shyam Prasad N     2022-07-27  1010  	spin_lock(&ses->ses_lock);
dd3cd8709ed5f4 fs/cifs/transport.c       Shyam Prasad N     2022-04-07  1011  	if ((ses->ses_status == SES_NEW) || (optype & CIFS_NEG_OP) || (optype & CIFS_SESS_OP)) {
d7d7a66aacd6fd fs/cifs/transport.c       Shyam Prasad N     2022-07-27  1012  		spin_unlock(&ses->ses_lock);
080dc5e5656c1c fs/cifs/transport.c       Shyam Prasad N     2021-07-19  1013  
62432a3f514509 fs/smb/client/transport.c David Howells      2025-08-06  1014  		if (WARN_ON_ONCE(num_rqst != 1 || !resp_iov))
62432a3f514509 fs/smb/client/transport.c David Howells      2025-08-06  1015  			return -EINVAL;
62432a3f514509 fs/smb/client/transport.c David Howells      2025-08-06  1016  
cc391b694ff085 fs/cifs/transport.c       Vincent Whitchurch 2022-06-01  1017  		cifs_server_lock(server);
f486ef8e2003f6 fs/cifs/transport.c       Shyam Prasad N     2021-07-19  1018  		smb311_update_preauth_hash(ses, server, rqst[0].rq_iov, rqst[0].rq_nvec);
cc391b694ff085 fs/cifs/transport.c       Vincent Whitchurch 2022-06-01  1019  		cifs_server_unlock(server);
080dc5e5656c1c fs/cifs/transport.c       Shyam Prasad N     2021-07-19  1020  
d7d7a66aacd6fd fs/cifs/transport.c       Shyam Prasad N     2022-07-27  1021  		spin_lock(&ses->ses_lock);
05946d4b7a7349 fs/cifs/transport.c       Vincent Whitchurch 2021-03-10  1022  	}
d7d7a66aacd6fd fs/cifs/transport.c       Shyam Prasad N     2022-07-27  1023  	spin_unlock(&ses->ses_lock);
8bd68c6e47abff fs/cifs/transport.c       Aurelien Aptel     2018-02-16  1024  
cb5c2e63948451 fs/cifs/transport.c       Ronnie Sahlberg    2018-10-10  1025  	for (i = 0; i < num_rqst; i++) {
83bfbd0bb9025f fs/smb/client/transport.c David Howells      2025-09-05  1026  		rc = wait_for_response(server, mid[i]);
8a26f0f781f56d fs/cifs/transport.c       Pavel Shilovsky    2019-01-03  1027  		if (rc != 0)
8a26f0f781f56d fs/cifs/transport.c       Pavel Shilovsky    2019-01-03  1028  			break;
8a26f0f781f56d fs/cifs/transport.c       Pavel Shilovsky    2019-01-03  1029  	}
1be912dde772b7 fs/cifs/transport.c       Jeff Layton        2011-01-28  1030  	if (rc != 0) {
6c5c547f037bc1 fs/smb/client/transport.c Zihan Xi           2026-09-16  1031  		/*
6c5c547f037bc1 fs/smb/client/transport.c Zihan Xi           2026-09-16  1032  		 * A completed CREATE earlier in the compound chain may have
6c5c547f037bc1 fs/smb/client/transport.c Zihan Xi           2026-09-16  1033  		 * opened a remote handle even though a later wait was
6c5c547f037bc1 fs/smb/client/transport.c Zihan Xi           2026-09-16  1034  		 * interrupted. Mark it cancelled so __release_mid() invokes
6c5c547f037bc1 fs/smb/client/transport.c Zihan Xi           2026-09-16  1035  		 * the existing unmatched-open cleanup.
6c5c547f037bc1 fs/smb/client/transport.c Zihan Xi           2026-09-16  1036  		 */
6c5c547f037bc1 fs/smb/client/transport.c Zihan Xi           2026-09-16  1037  		cifs_mark_compound_mids_cancelled(mid, i);
6c5c547f037bc1 fs/smb/client/transport.c Zihan Xi           2026-09-16  1038  
8a26f0f781f56d fs/cifs/transport.c       Pavel Shilovsky    2019-01-03  1039  		for (; i < num_rqst; i++) {
e3d100eae44b42 fs/cifs/transport.c       Paulo Alcantara    2021-03-08  1040  			cifs_server_dbg(FYI, "Cancelling wait for mid %llu cmd: %d\n",
83bfbd0bb9025f fs/smb/client/transport.c David Howells      2025-09-05  1041  				 mid[i]->mid, le16_to_cpu(mid[i]->command));
28405cb5b2fde2 fs/smb/client/transport.c David Howells      2025-08-05  1042  			send_cancel(ses, server, &rqst[i], mid[i], xid);
83bfbd0bb9025f fs/smb/client/transport.c David Howells      2025-09-05  1043  			spin_lock(&mid[i]->mid_lock);
83bfbd0bb9025f fs/smb/client/transport.c David Howells      2025-09-05  1044  			mid[i]->wait_cancelled = true;
28405cb5b2fde2 fs/smb/client/transport.c David Howells      2025-08-05  1045  			if (mid[i]->mid_state == MID_REQUEST_SUBMITTED ||
28405cb5b2fde2 fs/smb/client/transport.c David Howells      2025-08-05  1046  			    mid[i]->mid_state == MID_RESPONSE_RECEIVED) {
83bfbd0bb9025f fs/smb/client/transport.c David Howells      2025-09-05  1047  				mid[i]->callback = cifs_cancelled_callback;
8544f4aa9dd19a fs/cifs/transport.c       Pavel Shilovsky    2018-12-22  1048  				cancelled_mid[i] = true;
34f4deb7c56c6f fs/cifs/transport.c       Pavel Shilovsky    2019-01-16  1049  				credits[i].value = 0;
1be912dde772b7 fs/cifs/transport.c       Jeff Layton        2011-01-28  1050  			}
83bfbd0bb9025f fs/smb/client/transport.c David Howells      2025-09-05  1051  			spin_unlock(&mid[i]->mid_lock);
1be912dde772b7 fs/cifs/transport.c       Jeff Layton        2011-01-28  1052  		}
cb5c2e63948451 fs/cifs/transport.c       Ronnie Sahlberg    2018-10-10  1053  	}
cb5c2e63948451 fs/cifs/transport.c       Ronnie Sahlberg    2018-10-10  1054  
cb5c2e63948451 fs/cifs/transport.c       Ronnie Sahlberg    2018-10-10  1055  	for (i = 0; i < num_rqst; i++) {
cb5c2e63948451 fs/cifs/transport.c       Ronnie Sahlberg    2018-10-10  1056  		if (rc < 0)
cb5c2e63948451 fs/cifs/transport.c       Ronnie Sahlberg    2018-10-10  1057  			goto out;
7ee1af765dfa31 fs/cifs/transport.c       Jeremy Allison     2006-08-02  1058  
83bfbd0bb9025f fs/smb/client/transport.c David Howells      2025-09-05  1059  		rc = cifs_sync_mid_result(mid[i], server);
053d50344568e5 fs/cifs/transport.c       Jeff Layton        2011-01-11  1060  		if (rc != 0) {
6c5c547f037bc1 fs/smb/client/transport.c Zihan Xi           2026-09-16  1061  			/*
6c5c547f037bc1 fs/smb/client/transport.c Zihan Xi           2026-09-16  1062  			 * A previous CREATE may have completed before this
6c5c547f037bc1 fs/smb/client/transport.c Zihan Xi           2026-09-16  1063  			 * response failed. Mark it cancelled so its remote
6c5c547f037bc1 fs/smb/client/transport.c Zihan Xi           2026-09-16  1064  			 * handle is closed when the mid is released.
6c5c547f037bc1 fs/smb/client/transport.c Zihan Xi           2026-09-16  1065  			 */
6c5c547f037bc1 fs/smb/client/transport.c Zihan Xi           2026-09-16  1066  			cifs_mark_compound_mids_cancelled(mid, i);
6c5c547f037bc1 fs/smb/client/transport.c Zihan Xi           2026-09-16  1067  			/* Keep their response buffers for cancelled-mid cleanup. */
6c5c547f037bc1 fs/smb/client/transport.c Zihan Xi           2026-09-16  1068  			num_processed = 0;
8544f4aa9dd19a fs/cifs/transport.c       Pavel Shilovsky    2018-12-22  1069  			/* mark this mid as cancelled to not free it below */
8544f4aa9dd19a fs/cifs/transport.c       Pavel Shilovsky    2018-12-22  1070  			cancelled_mid[i] = true;
8544f4aa9dd19a fs/cifs/transport.c       Pavel Shilovsky    2018-12-22  1071  			goto out;
d6e04ae64c6b06 fs/cifs/transport.c       Steve French       2005-06-13  1072  		}
d6e04ae64c6b06 fs/cifs/transport.c       Steve French       2005-06-13  1073  
83bfbd0bb9025f fs/smb/client/transport.c David Howells      2025-09-05  1074  		if (!mid[i]->resp_buf ||
83bfbd0bb9025f fs/smb/client/transport.c David Howells      2025-09-05  1075  		    mid[i]->mid_state != MID_RESPONSE_READY) {
f80ac7eda1cf52 fs/smb/client/transport.c David Howells      2025-10-24  1076  			rc = smb_EIO1(smb_eio_trace_rx_mid_unready, mid[i]->mid_state);
f96637be081141 fs/cifs/transport.c       Joe Perches        2013-05-04  1077  			cifs_dbg(FYI, "Bad MID state?\n");
6c5c547f037bc1 fs/smb/client/transport.c Zihan Xi           2026-09-16  1078  			cifs_mark_compound_mids_cancelled(mid, i);
6c5c547f037bc1 fs/smb/client/transport.c Zihan Xi           2026-09-16  1079  			num_processed = 0;
2b2bdfba7a3679 fs/cifs/transport.c       Steve French       2008-12-11  1080  			goto out;
2b2bdfba7a3679 fs/cifs/transport.c       Steve French       2008-12-11  1081  		}
2b2bdfba7a3679 fs/cifs/transport.c       Steve French       2008-12-11  1082  
62432a3f514509 fs/smb/client/transport.c David Howells      2025-08-06  1083  		rc = server->ops->check_receive(mid[i], server,
62432a3f514509 fs/smb/client/transport.c David Howells      2025-08-06  1084  						flags & CIFS_LOG_ERROR);
6c5c547f037bc1 fs/smb/client/transport.c Zihan Xi           2026-09-16  1085  		num_processed = i + 1;
6c5c547f037bc1 fs/smb/client/transport.c Zihan Xi           2026-09-16  1086  	}
62432a3f514509 fs/smb/client/transport.c David Howells      2025-08-06  1087  
6c5c547f037bc1 fs/smb/client/transport.c Zihan Xi           2026-09-16  1088  out:
6c5c547f037bc1 fs/smb/client/transport.c Zihan Xi           2026-09-16  1089  	/*
6c5c547f037bc1 fs/smb/client/transport.c Zihan Xi           2026-09-16  1090  	 * Delay moving response buffers out of their mids until response
6c5c547f037bc1 fs/smb/client/transport.c Zihan Xi           2026-09-16  1091  	 * synchronization completes. This lets cancelled-mid cleanup inspect
6c5c547f037bc1 fs/smb/client/transport.c Zihan Xi           2026-09-16  1092  	 * an earlier CREATE response if a later MID fails.
6c5c547f037bc1 fs/smb/client/transport.c Zihan Xi           2026-09-16  1093  	 */
62432a3f514509 fs/smb/client/transport.c David Howells      2025-08-06 @1094  	if (resp_iov) {
6c5c547f037bc1 fs/smb/client/transport.c Zihan Xi           2026-09-16  1095  		for (i = 0; i < num_processed; i++) {
83bfbd0bb9025f fs/smb/client/transport.c David Howells      2025-09-05  1096  			buf = (char *)mid[i]->resp_buf;
e0bba0b8548179 fs/cifs/transport.c       Ronnie Sahlberg    2018-08-01  1097  			resp_iov[i].iov_base = buf;
83bfbd0bb9025f fs/smb/client/transport.c David Howells      2025-09-05  1098  			resp_iov[i].iov_len = mid[i]->resp_buf_size;
e0bba0b8548179 fs/cifs/transport.c       Ronnie Sahlberg    2018-08-01  1099  
83bfbd0bb9025f fs/smb/client/transport.c David Howells      2025-09-05  1100  			if (mid[i]->large_buf)
e0bba0b8548179 fs/cifs/transport.c       Ronnie Sahlberg    2018-08-01  1101  				resp_buf_type[i] = CIFS_LARGE_BUFFER;
ec637e3ffb6b97 fs/cifs/transport.c       Steve French       2005-12-12  1102  			else
e0bba0b8548179 fs/cifs/transport.c       Ronnie Sahlberg    2018-08-01  1103  				resp_buf_type[i] = CIFS_SMALL_BUFFER;
a891f0f895f4a7 fs/cifs/transport.c       Pavel Shilovsky    2012-05-23  1104  
70f08f914a37a0 fs/cifs/transport.c       Enzo Matsumiya     2022-08-05  1105  			/* mark it so buf will not be freed by delete_mid */
392e1c5dc9cc93 fs/cifs/transport.c       Ronnie Sahlberg    2019-05-06  1106  			if ((flags & CIFS_NO_RSP_BUF) == 0)
83bfbd0bb9025f fs/smb/client/transport.c David Howells      2025-09-05  1107  				mid[i]->resp_buf = NULL;
62432a3f514509 fs/smb/client/transport.c David Howells      2025-08-06  1108  		}
cb5c2e63948451 fs/cifs/transport.c       Ronnie Sahlberg    2018-10-10  1109  	}
cb5c2e63948451 fs/cifs/transport.c       Ronnie Sahlberg    2018-10-10  1110  
cb5c2e63948451 fs/cifs/transport.c       Ronnie Sahlberg    2018-10-10  1111  	/*
cb5c2e63948451 fs/cifs/transport.c       Ronnie Sahlberg    2018-10-10  1112  	 * Compounding is never used during session establish.
cb5c2e63948451 fs/cifs/transport.c       Ronnie Sahlberg    2018-10-10  1113  	 */
6c5c547f037bc1 fs/smb/client/transport.c Zihan Xi           2026-09-16  1114  	if (num_processed == num_rqst) {
d7d7a66aacd6fd fs/cifs/transport.c       Shyam Prasad N     2022-07-27  1115  		spin_lock(&ses->ses_lock);
dd3cd8709ed5f4 fs/cifs/transport.c       Shyam Prasad N     2022-04-07  1116  		if ((ses->ses_status == SES_NEW) || (optype & CIFS_NEG_OP) || (optype & CIFS_SESS_OP)) {
cb5c2e63948451 fs/cifs/transport.c       Ronnie Sahlberg    2018-10-10  1117  			struct kvec iov = {
cb5c2e63948451 fs/cifs/transport.c       Ronnie Sahlberg    2018-10-10 @1118  				.iov_base = resp_iov[0].iov_base,
cb5c2e63948451 fs/cifs/transport.c       Ronnie Sahlberg    2018-10-10  1119  				.iov_len = resp_iov[0].iov_len
cb5c2e63948451 fs/cifs/transport.c       Ronnie Sahlberg    2018-10-10  1120  			};
d7d7a66aacd6fd fs/cifs/transport.c       Shyam Prasad N     2022-07-27  1121  			spin_unlock(&ses->ses_lock);
cc391b694ff085 fs/cifs/transport.c       Vincent Whitchurch 2022-06-01  1122  			cifs_server_lock(server);
f486ef8e2003f6 fs/cifs/transport.c       Shyam Prasad N     2021-07-19  1123  			smb311_update_preauth_hash(ses, server, &iov, 1);
cc391b694ff085 fs/cifs/transport.c       Vincent Whitchurch 2022-06-01  1124  			cifs_server_unlock(server);
d7d7a66aacd6fd fs/cifs/transport.c       Shyam Prasad N     2022-07-27  1125  			spin_lock(&ses->ses_lock);
e0bba0b8548179 fs/cifs/transport.c       Ronnie Sahlberg    2018-08-01  1126  		}
d7d7a66aacd6fd fs/cifs/transport.c       Shyam Prasad N     2022-07-27  1127  		spin_unlock(&ses->ses_lock);
6c5c547f037bc1 fs/smb/client/transport.c Zihan Xi           2026-09-16  1128  	}
cb5c2e63948451 fs/cifs/transport.c       Ronnie Sahlberg    2018-10-10  1129  
4e34feb5e96328 fs/cifs/transport.c       Ronnie Sahlberg    2018-08-30  1130  	/*
4e34feb5e96328 fs/cifs/transport.c       Ronnie Sahlberg    2018-08-30  1131  	 * This will dequeue all mids. After this it is important that the
bdcffe4be7cb90 fs/smb/client/transport.c Xiaxi Shen         2024-08-07  1132  	 * demultiplex_thread will not process any of these mids any further.
4e34feb5e96328 fs/cifs/transport.c       Ronnie Sahlberg    2018-08-30  1133  	 * This is prevented above by using a noop callback that will not
4e34feb5e96328 fs/cifs/transport.c       Ronnie Sahlberg    2018-08-30  1134  	 * wake this thread except for the very last PDU.
4e34feb5e96328 fs/cifs/transport.c       Ronnie Sahlberg    2018-08-30  1135  	 */
8544f4aa9dd19a fs/cifs/transport.c       Pavel Shilovsky    2018-12-22  1136  	for (i = 0; i < num_rqst; i++) {
8544f4aa9dd19a fs/cifs/transport.c       Pavel Shilovsky    2018-12-22  1137  		if (!cancelled_mid[i])
87fba18abbb843 fs/smb/client/transport.c David Howells      2025-10-03  1138  			delete_mid(server, mid[i]);
8544f4aa9dd19a fs/cifs/transport.c       Pavel Shilovsky    2018-12-22  1139  	}
^1da177e4c3f41 fs/cifs/transport.c       Linus Torvalds     2005-04-16  1140  
d6e04ae64c6b06 fs/cifs/transport.c       Steve French       2005-06-13  1141  	return rc;
d6e04ae64c6b06 fs/cifs/transport.c       Steve French       2005-06-13  1142  }
^1da177e4c3f41 fs/cifs/transport.c       Linus Torvalds     2005-04-16  1143  

:::::: The code at line 1118 was first introduced by commit
:::::: cb5c2e63948451d38c977685fffc06e23beb4517 cifs: fix a credits leak for compund commands

:::::: TO: Ronnie Sahlberg <lsahlber@redhat.com>
:::::: CC: Steve French <stfrench@microsoft.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
