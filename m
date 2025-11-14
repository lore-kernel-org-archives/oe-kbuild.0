Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 186792E0406
	for <oe-kbuild@lists.linux.dev>; Fri, 14 Nov 2025 23:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763164134; cv=none; b=RoliFbx0euFizz9T/d+deu1ISAKjh4ohEhEFjEI78Pk9w+4m4zRij/po4nj/o8oMFqHz2/YEAx12DJ6C7HRjvpx/e8MiaoscUfKfSt9j0SdWwgbVAM56hgQhc60TyxSKEUKZiSNeMNBovq8dnu3GRDwna9w7uphmXgEkxYzJJBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763164134; c=relaxed/simple;
	bh=lnlZm95PqpvEe1OM+TYZ1EhC2F2cSZnOrpezUL3jAbo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=D1ACnUmMW47ZR3tzdbifSsGQHFTAdnQ2RKvDeOd6mK1X59a0peytdtpkMbrZrflswHQ5paV526PrgcL36WgyRZ2/K8qYAa2Hv7mvlm8JIiV7TIDYfDefDALnQ0ZibGKpobL0OQKyfMkVHPMj4iwmijxTPn+LhnDLtVRfNujKtNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B50T+oNd; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B50T+oNd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763164131; x=1794700131;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lnlZm95PqpvEe1OM+TYZ1EhC2F2cSZnOrpezUL3jAbo=;
  b=B50T+oNdDO6ykQG4NW8or0vwQJ3J6YjLpgs340rraWjqBwmg4ubI3pWL
   gST4HAaaugTG2lKvfL3ABMclc1vggAtQRLTDl/jkZFKpcd9WekgS+CM89
   MiFNZRDfxLpvyckfdWINJxZonZKNM6XATUaOouJ/N9DDILXUibFoW4CyB
   5r8r8SbI7go8G7LaG1Q455mAMrkKH601nLbWT1IcOqiT+jyRkudaPMwno
   Y7bzvLVchCCnSLvN2KmMJRYIwDWeAhRMd/Se8OXl8SGcvj0Eq0u7TogX+
   yOwwfxJq1F1rFnzYH6BjapMj0C0m+KbEDnJ5CTYQ17yEvBuXodUkuScrm
   Q==;
X-CSE-ConnectionGUID: mrMFkC5SQvqZFiZtReOE3w==
X-CSE-MsgGUID: CGq+ifn+SyK8Es2Zj9n0EA==
X-IronPort-AV: E=McAfee;i="6800,10657,11613"; a="82894184"
X-IronPort-AV: E=Sophos;i="6.19,306,1754982000"; 
   d="scan'208";a="82894184"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2025 15:48:50 -0800
X-CSE-ConnectionGUID: 8eWAR4knTi6n8mCCr9b1aw==
X-CSE-MsgGUID: zUGhKNewQOC/n+dZbswBWw==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 14 Nov 2025 15:48:49 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vK3X4-0007Sd-3D;
	Fri, 14 Nov 2025 23:48:47 +0000
Date: Sat, 15 Nov 2025 07:47:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [dhowells-fs:cifs-next 5/9] fs/smb/client/transport.c:1071
 compound_send_recv() error: we previously assumed 'resp_iov' could be null
 (see line 1049)
Message-ID: <202511150702.M9d2Y8G2-lkp@intel.com>
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
TO: David Howells <dhowells@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git cifs-next
head:   29e729b4debaf2d5e2b7a7212998982175571f37
commit: b78ce07bce2954c0515e0b5de0d58d2cf61333db [5/9] cifs: Clean up some places where an extra kvec[] was required for rfc1002
:::::: branch date: 9 hours ago
:::::: commit date: 10 hours ago
config: x86_64-randconfig-r072-20251115 (https://download.01.org/0day-ci/archive/20251115/202511150702.M9d2Y8G2-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511150702.M9d2Y8G2-lkp@intel.com/

smatch warnings:
fs/smb/client/transport.c:1071 compound_send_recv() error: we previously assumed 'resp_iov' could be null (see line 1049)

vim +/resp_iov +1071 fs/smb/client/transport.c

5f68ea4aa98bcd fs/cifs/transport.c       Aurelien Aptel     2020-04-22   862  
b8f57ee8aad414 fs/cifs/transport.c       Pavel Shilovsky    2016-11-23   863  int
e0bba0b8548179 fs/cifs/transport.c       Ronnie Sahlberg    2018-08-01   864  compound_send_recv(const unsigned int xid, struct cifs_ses *ses,
352d96f3acc6e0 fs/cifs/transport.c       Aurelien Aptel     2020-05-31   865  		   struct TCP_Server_Info *server,
e0bba0b8548179 fs/cifs/transport.c       Ronnie Sahlberg    2018-08-01   866  		   const int flags, const int num_rqst, struct smb_rqst *rqst,
e0bba0b8548179 fs/cifs/transport.c       Ronnie Sahlberg    2018-08-01   867  		   int *resp_buf_type, struct kvec *resp_iov)
7ee1af765dfa31 fs/cifs/transport.c       Jeremy Allison     2006-08-02   868  {
480b1cb9dad894 fs/cifs/transport.c       Ronnie Sahlberg    2019-03-08   869  	int i, j, optype, rc = 0;
6015a42782dbf9 fs/smb/client/transport.c David Howells      2025-07-31   870  	struct smb_message *smb[MAX_COMPOUND];
8544f4aa9dd19a fs/cifs/transport.c       Pavel Shilovsky    2018-12-22   871  	bool cancelled_mid[MAX_COMPOUND] = {false};
34f4deb7c56c6f fs/cifs/transport.c       Pavel Shilovsky    2019-01-16   872  	struct cifs_credits credits[MAX_COMPOUND] = {
34f4deb7c56c6f fs/cifs/transport.c       Pavel Shilovsky    2019-01-16   873  		{ .value = 0, .instance = 0 }
34f4deb7c56c6f fs/cifs/transport.c       Pavel Shilovsky    2019-01-16   874  	};
34f4deb7c56c6f fs/cifs/transport.c       Pavel Shilovsky    2019-01-16   875  	unsigned int instance;
738f9de5cdb917 fs/cifs/transport.c       Pavel Shilovsky    2016-11-23   876  	char *buf;
7ee1af765dfa31 fs/cifs/transport.c       Jeremy Allison     2006-08-02   877  
a891f0f895f4a7 fs/cifs/transport.c       Pavel Shilovsky    2012-05-23   878  	optype = flags & CIFS_OP_MASK;
133672efbc1085 fs/cifs/transport.c       Steve French       2007-11-13   879  
e0bba0b8548179 fs/cifs/transport.c       Ronnie Sahlberg    2018-08-01   880  	for (i = 0; i < num_rqst; i++)
e0bba0b8548179 fs/cifs/transport.c       Ronnie Sahlberg    2018-08-01   881  		resp_buf_type[i] = CIFS_NO_BUFFER;  /* no response buf yet */
7ee1af765dfa31 fs/cifs/transport.c       Jeremy Allison     2006-08-02   882  
352d96f3acc6e0 fs/cifs/transport.c       Aurelien Aptel     2020-05-31   883  	if (!ses || !ses->server || !server) {
f96637be081141 fs/cifs/transport.c       Joe Perches        2013-05-04   884  		cifs_dbg(VFS, "Null session\n");
7ee1af765dfa31 fs/cifs/transport.c       Jeremy Allison     2006-08-02   885  		return -EIO;
7ee1af765dfa31 fs/cifs/transport.c       Jeremy Allison     2006-08-02   886  	}
7ee1af765dfa31 fs/cifs/transport.c       Jeremy Allison     2006-08-02   887  
d7d7a66aacd6fd fs/cifs/transport.c       Shyam Prasad N     2022-07-27   888  	spin_lock(&server->srv_lock);
080dc5e5656c1c fs/cifs/transport.c       Shyam Prasad N     2021-07-19   889  	if (server->tcpStatus == CifsExiting) {
d7d7a66aacd6fd fs/cifs/transport.c       Shyam Prasad N     2022-07-27   890  		spin_unlock(&server->srv_lock);
7ee1af765dfa31 fs/cifs/transport.c       Jeremy Allison     2006-08-02   891  		return -ENOENT;
080dc5e5656c1c fs/cifs/transport.c       Shyam Prasad N     2021-07-19   892  	}
d7d7a66aacd6fd fs/cifs/transport.c       Shyam Prasad N     2022-07-27   893  	spin_unlock(&server->srv_lock);
7ee1af765dfa31 fs/cifs/transport.c       Jeremy Allison     2006-08-02   894  
7091bcaba9f34c fs/cifs/transport.c       Pavel Shilovsky    2019-01-30   895  	/*
257b78099be015 fs/cifs/transport.c       Ronnie Sahlberg    2019-03-11   896  	 * Wait for all the requests to become available.
7091bcaba9f34c fs/cifs/transport.c       Pavel Shilovsky    2019-01-30   897  	 * This approach still leaves the possibility to be stuck waiting for
7091bcaba9f34c fs/cifs/transport.c       Pavel Shilovsky    2019-01-30   898  	 * credits if the server doesn't grant credits to the outstanding
257b78099be015 fs/cifs/transport.c       Ronnie Sahlberg    2019-03-11   899  	 * requests and if the client is completely idle, not generating any
257b78099be015 fs/cifs/transport.c       Ronnie Sahlberg    2019-03-11   900  	 * other requests.
257b78099be015 fs/cifs/transport.c       Ronnie Sahlberg    2019-03-11   901  	 * This can be handled by the eventual session reconnect.
792af7b05b8a78 fs/cifs/transport.c       Pavel Shilovsky    2012-03-23   902  	 */
3190b59a050ecd fs/cifs/transport.c       Aurelien Aptel     2019-06-24   903  	rc = wait_for_compound_request(server, num_rqst, flags,
257b78099be015 fs/cifs/transport.c       Ronnie Sahlberg    2019-03-11   904  				       &instance);
257b78099be015 fs/cifs/transport.c       Ronnie Sahlberg    2019-03-11   905  	if (rc)
257b78099be015 fs/cifs/transport.c       Ronnie Sahlberg    2019-03-11   906  		return rc;
97ea499883cc05 fs/cifs/transport.c       Pavel Shilovsky    2019-01-15   907  
257b78099be015 fs/cifs/transport.c       Ronnie Sahlberg    2019-03-11   908  	for (i = 0; i < num_rqst; i++) {
97ea499883cc05 fs/cifs/transport.c       Pavel Shilovsky    2019-01-15   909  		credits[i].value = 1;
97ea499883cc05 fs/cifs/transport.c       Pavel Shilovsky    2019-01-15   910  		credits[i].instance = instance;
8544f4aa9dd19a fs/cifs/transport.c       Pavel Shilovsky    2018-12-22   911  	}
7ee1af765dfa31 fs/cifs/transport.c       Jeremy Allison     2006-08-02   912  
792af7b05b8a78 fs/cifs/transport.c       Pavel Shilovsky    2012-03-23   913  	/*
792af7b05b8a78 fs/cifs/transport.c       Pavel Shilovsky    2012-03-23   914  	 * Make sure that we sign in the same order that we send on this socket
792af7b05b8a78 fs/cifs/transport.c       Pavel Shilovsky    2012-03-23   915  	 * and avoid races inside tcp sendmsg code that could cause corruption
792af7b05b8a78 fs/cifs/transport.c       Pavel Shilovsky    2012-03-23   916  	 * of smb data.
792af7b05b8a78 fs/cifs/transport.c       Pavel Shilovsky    2012-03-23   917  	 */
7ee1af765dfa31 fs/cifs/transport.c       Jeremy Allison     2006-08-02   918  
cc391b694ff085 fs/cifs/transport.c       Vincent Whitchurch 2022-06-01   919  	cifs_server_lock(server);
7ee1af765dfa31 fs/cifs/transport.c       Jeremy Allison     2006-08-02   920  
97ea499883cc05 fs/cifs/transport.c       Pavel Shilovsky    2019-01-15   921  	/*
97ea499883cc05 fs/cifs/transport.c       Pavel Shilovsky    2019-01-15   922  	 * All the parts of the compound chain belong obtained credits from the
257b78099be015 fs/cifs/transport.c       Ronnie Sahlberg    2019-03-11   923  	 * same session. We can not use credits obtained from the previous
97ea499883cc05 fs/cifs/transport.c       Pavel Shilovsky    2019-01-15   924  	 * session to send this request. Check if there were reconnects after
97ea499883cc05 fs/cifs/transport.c       Pavel Shilovsky    2019-01-15   925  	 * we obtained credits and return -EAGAIN in such cases to let callers
97ea499883cc05 fs/cifs/transport.c       Pavel Shilovsky    2019-01-15   926  	 * handle it.
97ea499883cc05 fs/cifs/transport.c       Pavel Shilovsky    2019-01-15   927  	 */
3190b59a050ecd fs/cifs/transport.c       Aurelien Aptel     2019-06-24   928  	if (instance != server->reconnect_instance) {
cc391b694ff085 fs/cifs/transport.c       Vincent Whitchurch 2022-06-01   929  		cifs_server_unlock(server);
97ea499883cc05 fs/cifs/transport.c       Pavel Shilovsky    2019-01-15   930  		for (j = 0; j < num_rqst; j++)
3190b59a050ecd fs/cifs/transport.c       Aurelien Aptel     2019-06-24   931  			add_credits(server, &credits[j], optype);
97ea499883cc05 fs/cifs/transport.c       Pavel Shilovsky    2019-01-15   932  		return -EAGAIN;
97ea499883cc05 fs/cifs/transport.c       Pavel Shilovsky    2019-01-15   933  	}
97ea499883cc05 fs/cifs/transport.c       Pavel Shilovsky    2019-01-15   934  
e0bba0b8548179 fs/cifs/transport.c       Ronnie Sahlberg    2018-08-01   935  	for (i = 0; i < num_rqst; i++) {
6015a42782dbf9 fs/smb/client/transport.c David Howells      2025-07-31   936  		smb[i] = server->ops->setup_request(ses, server, &rqst[i]);
6015a42782dbf9 fs/smb/client/transport.c David Howells      2025-07-31   937  		if (IS_ERR(smb[i])) {
3190b59a050ecd fs/cifs/transport.c       Aurelien Aptel     2019-06-24   938  			revert_current_mid(server, i);
e0bba0b8548179 fs/cifs/transport.c       Ronnie Sahlberg    2018-08-01   939  			for (j = 0; j < i; j++)
6015a42782dbf9 fs/smb/client/transport.c David Howells      2025-07-31   940  				delete_mid(smb[j]);
cc391b694ff085 fs/cifs/transport.c       Vincent Whitchurch 2022-06-01   941  			cifs_server_unlock(server);
8544f4aa9dd19a fs/cifs/transport.c       Pavel Shilovsky    2018-12-22   942  
7ee1af765dfa31 fs/cifs/transport.c       Jeremy Allison     2006-08-02   943  			/* Update # of requests on wire to server */
8544f4aa9dd19a fs/cifs/transport.c       Pavel Shilovsky    2018-12-22   944  			for (j = 0; j < num_rqst; j++)
3190b59a050ecd fs/cifs/transport.c       Aurelien Aptel     2019-06-24   945  				add_credits(server, &credits[j], optype);
6015a42782dbf9 fs/smb/client/transport.c David Howells      2025-07-31   946  			return PTR_ERR(smb[i]);
e0bba0b8548179 fs/cifs/transport.c       Ronnie Sahlberg    2018-08-01   947  		}
e0bba0b8548179 fs/cifs/transport.c       Ronnie Sahlberg    2018-08-01   948  
6015a42782dbf9 fs/smb/client/transport.c David Howells      2025-07-31   949  		smb[i]->mid_state = MID_REQUEST_SUBMITTED;
6015a42782dbf9 fs/smb/client/transport.c David Howells      2025-07-31   950  		smb[i]->optype = optype;
4e34feb5e96328 fs/cifs/transport.c       Ronnie Sahlberg    2018-08-30   951  		/*
ee258d79159afe fs/cifs/transport.c       Pavel Shilovsky    2019-01-03   952  		 * Invoke callback for every part of the compound chain
ee258d79159afe fs/cifs/transport.c       Pavel Shilovsky    2019-01-03   953  		 * to calculate credits properly. Wake up this thread only when
ee258d79159afe fs/cifs/transport.c       Pavel Shilovsky    2019-01-03   954  		 * the last element is received.
4e34feb5e96328 fs/cifs/transport.c       Ronnie Sahlberg    2018-08-30   955  		 */
4e34feb5e96328 fs/cifs/transport.c       Ronnie Sahlberg    2018-08-30   956  		if (i < num_rqst - 1)
6015a42782dbf9 fs/smb/client/transport.c David Howells      2025-07-31   957  			smb[i]->callback = cifs_compound_callback;
ee258d79159afe fs/cifs/transport.c       Pavel Shilovsky    2019-01-03   958  		else
6015a42782dbf9 fs/smb/client/transport.c David Howells      2025-07-31   959  			smb[i]->callback = cifs_compound_last_callback;
7ee1af765dfa31 fs/cifs/transport.c       Jeremy Allison     2006-08-02   960  	}
3190b59a050ecd fs/cifs/transport.c       Aurelien Aptel     2019-06-24   961  	rc = smb_send_rqst(server, num_rqst, rqst, flags);
e0bba0b8548179 fs/cifs/transport.c       Ronnie Sahlberg    2018-08-01   962  
e0bba0b8548179 fs/cifs/transport.c       Ronnie Sahlberg    2018-08-01   963  	for (i = 0; i < num_rqst; i++)
6015a42782dbf9 fs/smb/client/transport.c David Howells      2025-07-31   964  		cifs_save_when_sent(smb[i]);
7ee1af765dfa31 fs/cifs/transport.c       Jeremy Allison     2006-08-02   965  
c781af7e0c1fed fs/cifs/transport.c       Pavel Shilovsky    2019-03-04   966  	if (rc < 0) {
3190b59a050ecd fs/cifs/transport.c       Aurelien Aptel     2019-06-24   967  		revert_current_mid(server, num_rqst);
3190b59a050ecd fs/cifs/transport.c       Aurelien Aptel     2019-06-24   968  		server->sequence_number -= 2;
c781af7e0c1fed fs/cifs/transport.c       Pavel Shilovsky    2019-03-04   969  	}
e0bba0b8548179 fs/cifs/transport.c       Ronnie Sahlberg    2018-08-01   970  
cc391b694ff085 fs/cifs/transport.c       Vincent Whitchurch 2022-06-01   971  	cifs_server_unlock(server);
7ee1af765dfa31 fs/cifs/transport.c       Jeremy Allison     2006-08-02   972  
d69cb728e70c40 fs/cifs/transport.c       Ronnie Sahlberg    2019-05-01   973  	/*
d69cb728e70c40 fs/cifs/transport.c       Ronnie Sahlberg    2019-05-01   974  	 * If sending failed for some reason or it is an oplock break that we
d69cb728e70c40 fs/cifs/transport.c       Ronnie Sahlberg    2019-05-01   975  	 * will not receive a response to - return credits back
d69cb728e70c40 fs/cifs/transport.c       Ronnie Sahlberg    2019-05-01   976  	 */
d69cb728e70c40 fs/cifs/transport.c       Ronnie Sahlberg    2019-05-01   977  	if (rc < 0 || (flags & CIFS_NO_SRV_RSP)) {
ee258d79159afe fs/cifs/transport.c       Pavel Shilovsky    2019-01-03   978  		for (i = 0; i < num_rqst; i++)
3190b59a050ecd fs/cifs/transport.c       Aurelien Aptel     2019-06-24   979  			add_credits(server, &credits[i], optype);
7ee1af765dfa31 fs/cifs/transport.c       Jeremy Allison     2006-08-02   980  		goto out;
ee258d79159afe fs/cifs/transport.c       Pavel Shilovsky    2019-01-03   981  	}
ee258d79159afe fs/cifs/transport.c       Pavel Shilovsky    2019-01-03   982  
ee258d79159afe fs/cifs/transport.c       Pavel Shilovsky    2019-01-03   983  	/*
ee258d79159afe fs/cifs/transport.c       Pavel Shilovsky    2019-01-03   984  	 * At this point the request is passed to the network stack - we assume
ee258d79159afe fs/cifs/transport.c       Pavel Shilovsky    2019-01-03   985  	 * that any credits taken from the server structure on the client have
ee258d79159afe fs/cifs/transport.c       Pavel Shilovsky    2019-01-03   986  	 * been spent and we can't return them back. Once we receive responses
ee258d79159afe fs/cifs/transport.c       Pavel Shilovsky    2019-01-03   987  	 * we will collect credits granted by the server in the mid callbacks
ee258d79159afe fs/cifs/transport.c       Pavel Shilovsky    2019-01-03   988  	 * and add those credits to the server structure.
ee258d79159afe fs/cifs/transport.c       Pavel Shilovsky    2019-01-03   989  	 */
7ee1af765dfa31 fs/cifs/transport.c       Jeremy Allison     2006-08-02   990  
cb5c2e63948451 fs/cifs/transport.c       Ronnie Sahlberg    2018-10-10   991  	/*
cb5c2e63948451 fs/cifs/transport.c       Ronnie Sahlberg    2018-10-10   992  	 * Compounding is never used during session establish.
cb5c2e63948451 fs/cifs/transport.c       Ronnie Sahlberg    2018-10-10   993  	 */
d7d7a66aacd6fd fs/cifs/transport.c       Shyam Prasad N     2022-07-27   994  	spin_lock(&ses->ses_lock);
dd3cd8709ed5f4 fs/cifs/transport.c       Shyam Prasad N     2022-04-07   995  	if ((ses->ses_status == SES_NEW) || (optype & CIFS_NEG_OP) || (optype & CIFS_SESS_OP)) {
d7d7a66aacd6fd fs/cifs/transport.c       Shyam Prasad N     2022-07-27   996  		spin_unlock(&ses->ses_lock);
080dc5e5656c1c fs/cifs/transport.c       Shyam Prasad N     2021-07-19   997  
cc391b694ff085 fs/cifs/transport.c       Vincent Whitchurch 2022-06-01   998  		cifs_server_lock(server);
f486ef8e2003f6 fs/cifs/transport.c       Shyam Prasad N     2021-07-19   999  		smb311_update_preauth_hash(ses, server, rqst[0].rq_iov, rqst[0].rq_nvec);
cc391b694ff085 fs/cifs/transport.c       Vincent Whitchurch 2022-06-01  1000  		cifs_server_unlock(server);
080dc5e5656c1c fs/cifs/transport.c       Shyam Prasad N     2021-07-19  1001  
d7d7a66aacd6fd fs/cifs/transport.c       Shyam Prasad N     2022-07-27  1002  		spin_lock(&ses->ses_lock);
05946d4b7a7349 fs/cifs/transport.c       Vincent Whitchurch 2021-03-10  1003  	}
d7d7a66aacd6fd fs/cifs/transport.c       Shyam Prasad N     2022-07-27  1004  	spin_unlock(&ses->ses_lock);
8bd68c6e47abff fs/cifs/transport.c       Aurelien Aptel     2018-02-16  1005  
cb5c2e63948451 fs/cifs/transport.c       Ronnie Sahlberg    2018-10-10  1006  	for (i = 0; i < num_rqst; i++) {
6015a42782dbf9 fs/smb/client/transport.c David Howells      2025-07-31  1007  		rc = wait_for_response(server, smb[i]);
8a26f0f781f56d fs/cifs/transport.c       Pavel Shilovsky    2019-01-03  1008  		if (rc != 0)
8a26f0f781f56d fs/cifs/transport.c       Pavel Shilovsky    2019-01-03  1009  			break;
8a26f0f781f56d fs/cifs/transport.c       Pavel Shilovsky    2019-01-03  1010  	}
1be912dde772b7 fs/cifs/transport.c       Jeff Layton        2011-01-28  1011  	if (rc != 0) {
8a26f0f781f56d fs/cifs/transport.c       Pavel Shilovsky    2019-01-03  1012  		for (; i < num_rqst; i++) {
e3d100eae44b42 fs/cifs/transport.c       Paulo Alcantara    2021-03-08  1013  			cifs_server_dbg(FYI, "Cancelling wait for mid %llu cmd: %d\n",
6015a42782dbf9 fs/smb/client/transport.c David Howells      2025-07-31  1014  				 smb[i]->mid, le16_to_cpu(smb[i]->command));
6015a42782dbf9 fs/smb/client/transport.c David Howells      2025-07-31  1015  			send_cancel(server, &rqst[i], smb[i]);
6015a42782dbf9 fs/smb/client/transport.c David Howells      2025-07-31  1016  			spin_lock(&smb[i]->mid_lock);
6015a42782dbf9 fs/smb/client/transport.c David Howells      2025-07-31  1017  			smb[i]->wait_cancelled = true;
6015a42782dbf9 fs/smb/client/transport.c David Howells      2025-07-31  1018  			if (smb[i]->mid_state == MID_REQUEST_SUBMITTED ||
6015a42782dbf9 fs/smb/client/transport.c David Howells      2025-07-31  1019  			    smb[i]->mid_state == MID_RESPONSE_RECEIVED) {
6015a42782dbf9 fs/smb/client/transport.c David Howells      2025-07-31  1020  				smb[i]->callback = cifs_cancelled_callback;
8544f4aa9dd19a fs/cifs/transport.c       Pavel Shilovsky    2018-12-22  1021  				cancelled_mid[i] = true;
34f4deb7c56c6f fs/cifs/transport.c       Pavel Shilovsky    2019-01-16  1022  				credits[i].value = 0;
1be912dde772b7 fs/cifs/transport.c       Jeff Layton        2011-01-28  1023  			}
6015a42782dbf9 fs/smb/client/transport.c David Howells      2025-07-31  1024  			spin_unlock(&smb[i]->mid_lock);
1be912dde772b7 fs/cifs/transport.c       Jeff Layton        2011-01-28  1025  		}
cb5c2e63948451 fs/cifs/transport.c       Ronnie Sahlberg    2018-10-10  1026  	}
cb5c2e63948451 fs/cifs/transport.c       Ronnie Sahlberg    2018-10-10  1027  
cb5c2e63948451 fs/cifs/transport.c       Ronnie Sahlberg    2018-10-10  1028  	for (i = 0; i < num_rqst; i++) {
cb5c2e63948451 fs/cifs/transport.c       Ronnie Sahlberg    2018-10-10  1029  		if (rc < 0)
cb5c2e63948451 fs/cifs/transport.c       Ronnie Sahlberg    2018-10-10  1030  			goto out;
7ee1af765dfa31 fs/cifs/transport.c       Jeremy Allison     2006-08-02  1031  
6015a42782dbf9 fs/smb/client/transport.c David Howells      2025-07-31  1032  		rc = cifs_sync_mid_result(smb[i], server);
053d50344568e5 fs/cifs/transport.c       Jeff Layton        2011-01-11  1033  		if (rc != 0) {
8544f4aa9dd19a fs/cifs/transport.c       Pavel Shilovsky    2018-12-22  1034  			/* mark this mid as cancelled to not free it below */
8544f4aa9dd19a fs/cifs/transport.c       Pavel Shilovsky    2018-12-22  1035  			cancelled_mid[i] = true;
8544f4aa9dd19a fs/cifs/transport.c       Pavel Shilovsky    2018-12-22  1036  			goto out;
d6e04ae64c6b06 fs/cifs/transport.c       Steve French       2005-06-13  1037  		}
d6e04ae64c6b06 fs/cifs/transport.c       Steve French       2005-06-13  1038  
6015a42782dbf9 fs/smb/client/transport.c David Howells      2025-07-31  1039  		if (!smb[i]->resp_buf ||
6015a42782dbf9 fs/smb/client/transport.c David Howells      2025-07-31  1040  		    smb[i]->mid_state != MID_RESPONSE_READY) {
d6e04ae64c6b06 fs/cifs/transport.c       Steve French       2005-06-13  1041  			rc = -EIO;
f96637be081141 fs/cifs/transport.c       Joe Perches        2013-05-04  1042  			cifs_dbg(FYI, "Bad MID state?\n");
2b2bdfba7a3679 fs/cifs/transport.c       Steve French       2008-12-11  1043  			goto out;
2b2bdfba7a3679 fs/cifs/transport.c       Steve French       2008-12-11  1044  		}
2b2bdfba7a3679 fs/cifs/transport.c       Steve French       2008-12-11  1045  
b78ce07bce2954 fs/smb/client/transport.c David Howells      2025-08-06  1046  		rc = server->ops->check_receive(smb[i], server,
b78ce07bce2954 fs/smb/client/transport.c David Howells      2025-08-06  1047  						     flags & CIFS_LOG_ERROR);
b78ce07bce2954 fs/smb/client/transport.c David Howells      2025-08-06  1048  
b78ce07bce2954 fs/smb/client/transport.c David Howells      2025-08-06 @1049  		if (resp_iov) {
6015a42782dbf9 fs/smb/client/transport.c David Howells      2025-07-31  1050  			buf = (char *)smb[i]->resp_buf;
e0bba0b8548179 fs/cifs/transport.c       Ronnie Sahlberg    2018-08-01  1051  			resp_iov[i].iov_base = buf;
9c902f67d10e5c fs/smb/client/transport.c David Howells      2025-09-05  1052  			resp_iov[i].iov_len = smb[i]->resp_buf_size;
e0bba0b8548179 fs/cifs/transport.c       Ronnie Sahlberg    2018-08-01  1053  
6015a42782dbf9 fs/smb/client/transport.c David Howells      2025-07-31  1054  			if (smb[i]->large_buf)
e0bba0b8548179 fs/cifs/transport.c       Ronnie Sahlberg    2018-08-01  1055  				resp_buf_type[i] = CIFS_LARGE_BUFFER;
ec637e3ffb6b97 fs/cifs/transport.c       Steve French       2005-12-12  1056  			else
e0bba0b8548179 fs/cifs/transport.c       Ronnie Sahlberg    2018-08-01  1057  				resp_buf_type[i] = CIFS_SMALL_BUFFER;
a891f0f895f4a7 fs/cifs/transport.c       Pavel Shilovsky    2012-05-23  1058  
70f08f914a37a0 fs/cifs/transport.c       Enzo Matsumiya     2022-08-05  1059  			/* mark it so buf will not be freed by delete_mid */
392e1c5dc9cc93 fs/cifs/transport.c       Ronnie Sahlberg    2019-05-06  1060  			if ((flags & CIFS_NO_RSP_BUF) == 0)
6015a42782dbf9 fs/smb/client/transport.c David Howells      2025-07-31  1061  				smb[i]->resp_buf = NULL;
b78ce07bce2954 fs/smb/client/transport.c David Howells      2025-08-06  1062  		}
cb5c2e63948451 fs/cifs/transport.c       Ronnie Sahlberg    2018-10-10  1063  	}
cb5c2e63948451 fs/cifs/transport.c       Ronnie Sahlberg    2018-10-10  1064  
cb5c2e63948451 fs/cifs/transport.c       Ronnie Sahlberg    2018-10-10  1065  	/*
cb5c2e63948451 fs/cifs/transport.c       Ronnie Sahlberg    2018-10-10  1066  	 * Compounding is never used during session establish.
cb5c2e63948451 fs/cifs/transport.c       Ronnie Sahlberg    2018-10-10  1067  	 */
d7d7a66aacd6fd fs/cifs/transport.c       Shyam Prasad N     2022-07-27  1068  	spin_lock(&ses->ses_lock);
dd3cd8709ed5f4 fs/cifs/transport.c       Shyam Prasad N     2022-04-07  1069  	if ((ses->ses_status == SES_NEW) || (optype & CIFS_NEG_OP) || (optype & CIFS_SESS_OP)) {
cb5c2e63948451 fs/cifs/transport.c       Ronnie Sahlberg    2018-10-10  1070  		struct kvec iov = {
cb5c2e63948451 fs/cifs/transport.c       Ronnie Sahlberg    2018-10-10 @1071  			.iov_base = resp_iov[0].iov_base,
cb5c2e63948451 fs/cifs/transport.c       Ronnie Sahlberg    2018-10-10  1072  			.iov_len = resp_iov[0].iov_len
cb5c2e63948451 fs/cifs/transport.c       Ronnie Sahlberg    2018-10-10  1073  		};
d7d7a66aacd6fd fs/cifs/transport.c       Shyam Prasad N     2022-07-27  1074  		spin_unlock(&ses->ses_lock);
cc391b694ff085 fs/cifs/transport.c       Vincent Whitchurch 2022-06-01  1075  		cifs_server_lock(server);
f486ef8e2003f6 fs/cifs/transport.c       Shyam Prasad N     2021-07-19  1076  		smb311_update_preauth_hash(ses, server, &iov, 1);
cc391b694ff085 fs/cifs/transport.c       Vincent Whitchurch 2022-06-01  1077  		cifs_server_unlock(server);
d7d7a66aacd6fd fs/cifs/transport.c       Shyam Prasad N     2022-07-27  1078  		spin_lock(&ses->ses_lock);
e0bba0b8548179 fs/cifs/transport.c       Ronnie Sahlberg    2018-08-01  1079  	}
d7d7a66aacd6fd fs/cifs/transport.c       Shyam Prasad N     2022-07-27  1080  	spin_unlock(&ses->ses_lock);
cb5c2e63948451 fs/cifs/transport.c       Ronnie Sahlberg    2018-10-10  1081  
7ee1af765dfa31 fs/cifs/transport.c       Jeremy Allison     2006-08-02  1082  out:
4e34feb5e96328 fs/cifs/transport.c       Ronnie Sahlberg    2018-08-30  1083  	/*
4e34feb5e96328 fs/cifs/transport.c       Ronnie Sahlberg    2018-08-30  1084  	 * This will dequeue all mids. After this it is important that the
bdcffe4be7cb90 fs/smb/client/transport.c Xiaxi Shen         2024-08-07  1085  	 * demultiplex_thread will not process any of these mids any further.
4e34feb5e96328 fs/cifs/transport.c       Ronnie Sahlberg    2018-08-30  1086  	 * This is prevented above by using a noop callback that will not
4e34feb5e96328 fs/cifs/transport.c       Ronnie Sahlberg    2018-08-30  1087  	 * wake this thread except for the very last PDU.
4e34feb5e96328 fs/cifs/transport.c       Ronnie Sahlberg    2018-08-30  1088  	 */
8544f4aa9dd19a fs/cifs/transport.c       Pavel Shilovsky    2018-12-22  1089  	for (i = 0; i < num_rqst; i++) {
8544f4aa9dd19a fs/cifs/transport.c       Pavel Shilovsky    2018-12-22  1090  		if (!cancelled_mid[i])
6015a42782dbf9 fs/smb/client/transport.c David Howells      2025-07-31  1091  			delete_mid(smb[i]);
8544f4aa9dd19a fs/cifs/transport.c       Pavel Shilovsky    2018-12-22  1092  	}
^1da177e4c3f41 fs/cifs/transport.c       Linus Torvalds     2005-04-16  1093  
d6e04ae64c6b06 fs/cifs/transport.c       Steve French       2005-06-13  1094  	return rc;
d6e04ae64c6b06 fs/cifs/transport.c       Steve French       2005-06-13  1095  }
^1da177e4c3f41 fs/cifs/transport.c       Linus Torvalds     2005-04-16  1096  

:::::: The code at line 1071 was first introduced by commit
:::::: cb5c2e63948451d38c977685fffc06e23beb4517 cifs: fix a credits leak for compund commands

:::::: TO: Ronnie Sahlberg <lsahlber@redhat.com>
:::::: CC: Steve French <stfrench@microsoft.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
