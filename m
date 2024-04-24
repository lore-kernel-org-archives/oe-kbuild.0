Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B1C4156C4F
	for <oe-kbuild@lists.linux.dev>; Wed, 24 Apr 2024 06:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713938764; cv=none; b=aLKUPok2Cm6awQ5bTFwkFhGzyA8Q6UBAFNRMrGRznCYu7GxMiE3H7yGro2HlUfsf/oVJo6QcJXs5wNfweaMqQHIDfvptByVCz8NoTOjxtrty2xZAaPx+SwdrE7hbORjq4bjAmclOC3R8TSF5pSFyfFlF/ib+Bi4y7McWWsfTJKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713938764; c=relaxed/simple;
	bh=DQvp6KEqE6n+r8iRrP9toUXY8pbhtHP4peTepuv9ikU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=A8xEK8kdIezfKrnebxW9GMpSj3TJcedq0DPTvGuu54TqbGoEus0PPlvglQty6Io5kBzfdF1AjJvMrcmzzB1ALOkQ4KxBYk6AWHzODGHevguxIq12UYQ87Kh30OD7gzthF1HnE2i/a+kdVwoRuTILJRbwDX/R5uo4lLwi5WgPhlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=els6aMBD; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="els6aMBD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713938762; x=1745474762;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=DQvp6KEqE6n+r8iRrP9toUXY8pbhtHP4peTepuv9ikU=;
  b=els6aMBDv1oNTH67zGdPjDZq4LPAX7P89N/oeOtboBJIHxCvPWQJ6VSz
   ndVSqWxgYzJ4/o3VjJCfGYAIN6HMie7bPZ6xcppllzDBZImoXtyiCTH2F
   KvcODgf5Lli209YjZGcTLBq9qAc9zsSNiPLzMbOANCxGAXE8MPLR2UZyy
   5qnXZXEAAFyl2czrvM/uKr3SsdT3QhrPp9Xs+30ZwspX51lQ94rxrsFe6
   Le+Ih0hZaBYwBmEE75r8FRxNntOwVzgbZ3YDepcUH8VVv+ZkArTrCcoIU
   TAazUQPCYygqNrCI/41pPRaHf+db4hGaYjq3U4DCOgsa9z75kopVDf6nO
   w==;
X-CSE-ConnectionGUID: e70B0Uo/QGihi7fDNjuVNw==
X-CSE-MsgGUID: K7ANTFbDScC8XBD5bqTYYw==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="20248766"
X-IronPort-AV: E=Sophos;i="6.07,225,1708416000"; 
   d="scan'208";a="20248766"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2024 23:06:00 -0700
X-CSE-ConnectionGUID: e4D3FEZcRsSyQtf1YP4ZoA==
X-CSE-MsgGUID: 1io1teBCT0qOBNkfb1GIMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,225,1708416000"; 
   d="scan'208";a="55805772"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 23 Apr 2024 23:05:59 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rzVlU-0000vG-2R;
	Wed, 24 Apr 2024 06:05:56 +0000
Date: Wed, 24 Apr 2024 14:05:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/smb/server/smb2pdu.c:1992 smb2_tree_connect() error:
 uninitialized symbol 'share'.
Message-ID: <202404241435.Yxr6Wapq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Namjae Jeon <linkinjeon@kernel.org>
CC: Steve French <stfrench@microsoft.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9d1ddab261f3e2af7c384dc02238784ce0cf9f98
commit: e9d8c2f95ab8acaf3f4d4a53682a4afa3c263692 ksmbd: add continuous availability share parameter
date:   4 days ago
:::::: branch date: 13 hours ago
:::::: commit date: 4 days ago
config: x86_64-randconfig-161-20240424 (https://download.01.org/0day-ci/archive/20240424/202404241435.Yxr6Wapq-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202404241435.Yxr6Wapq-lkp@intel.com/

New smatch warnings:
fs/smb/server/smb2pdu.c:1992 smb2_tree_connect() error: uninitialized symbol 'share'.

Old smatch warnings:
fs/smb/server/smb2pdu.c:3697 smb2_open() warn: Function too hairy.  No more merges.

vim +/share +1992 fs/smb/server/smb2pdu.c

e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  1914  
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  1915  /**
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  1916   * smb2_tree_connect() - handler for smb2 tree connect command
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  1917   * @work:	smb work containing smb request buffer
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  1918   *
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  1919   * Return:      0 on success, otherwise error
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  1920   */
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  1921  int smb2_tree_connect(struct ksmbd_work *work)
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  1922  {
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  1923  	struct ksmbd_conn *conn = work->conn;
7b7d709ef7cf28 fs/smb/server/smb2pdu.c Namjae Jeon       2023-06-24  1924  	struct smb2_tree_connect_req *req;
7b7d709ef7cf28 fs/smb/server/smb2pdu.c Namjae Jeon       2023-06-24  1925  	struct smb2_tree_connect_rsp *rsp;
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  1926  	struct ksmbd_session *sess = work->sess;
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  1927  	char *treename = NULL, *name = NULL;
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  1928  	struct ksmbd_tree_conn_status status;
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  1929  	struct ksmbd_share_config *share;
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  1930  	int rc = -EINVAL;
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  1931  
7b7d709ef7cf28 fs/smb/server/smb2pdu.c Namjae Jeon       2023-06-24  1932  	WORK_BUFFERS(work, req, rsp);
7b7d709ef7cf28 fs/smb/server/smb2pdu.c Namjae Jeon       2023-06-24  1933  
c6cd2e8d2d9aa7 fs/smb/server/smb2pdu.c Namjae Jeon       2024-03-19  1934  	treename = smb_strndup_from_utf16((char *)req + le16_to_cpu(req->PathOffset),
070fb21e5912b6 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-05-26  1935  					  le16_to_cpu(req->PathLength), true,
070fb21e5912b6 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-05-26  1936  					  conn->local_nls);
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  1937  	if (IS_ERR(treename)) {
bde1694aecdb53 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-06-28  1938  		pr_err("treename is NULL\n");
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  1939  		status.ret = KSMBD_TREE_CONN_STATUS_ERROR;
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  1940  		goto out_err1;
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  1941  	}
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  1942  
16b5f54e30c1dd fs/ksmbd/smb2pdu.c      Atte Heikkilä     2022-09-15  1943  	name = ksmbd_extract_sharename(conn->um, treename);
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  1944  	if (IS_ERR(name)) {
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  1945  		status.ret = KSMBD_TREE_CONN_STATUS_ERROR;
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  1946  		goto out_err1;
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  1947  	}
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  1948  
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  1949  	ksmbd_debug(SMB, "tree connect request for tree %s treename %s\n",
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  1950  		    name, treename);
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  1951  
af7c39d971e43c fs/ksmbd/smb2pdu.c      Namjae Jeon       2022-07-25  1952  	status = ksmbd_tree_conn_connect(conn, sess, name);
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  1953  	if (status.ret == KSMBD_TREE_CONN_STATUS_OK)
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  1954  		rsp->hdr.Id.SyncId.TreeId = cpu_to_le32(status.tree_conn->id);
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  1955  	else
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  1956  		goto out_err1;
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  1957  
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  1958  	share = status.tree_conn->share_conf;
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  1959  	if (test_share_config_flag(share, KSMBD_SHARE_FLAG_PIPE)) {
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  1960  		ksmbd_debug(SMB, "IPC share path request\n");
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  1961  		rsp->ShareType = SMB2_SHARE_TYPE_PIPE;
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  1962  		rsp->MaximalAccess = FILE_READ_DATA_LE | FILE_READ_EA_LE |
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  1963  			FILE_EXECUTE_LE | FILE_READ_ATTRIBUTES_LE |
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  1964  			FILE_DELETE_LE | FILE_READ_CONTROL_LE |
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  1965  			FILE_WRITE_DAC_LE | FILE_WRITE_OWNER_LE |
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  1966  			FILE_SYNCHRONIZE_LE;
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  1967  	} else {
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  1968  		rsp->ShareType = SMB2_SHARE_TYPE_DISK;
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  1969  		rsp->MaximalAccess = FILE_READ_DATA_LE | FILE_READ_EA_LE |
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  1970  			FILE_EXECUTE_LE | FILE_READ_ATTRIBUTES_LE;
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  1971  		if (test_tree_conn_flag(status.tree_conn,
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  1972  					KSMBD_TREE_CONN_FLAG_WRITABLE)) {
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  1973  			rsp->MaximalAccess |= FILE_WRITE_DATA_LE |
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  1974  				FILE_APPEND_DATA_LE | FILE_WRITE_EA_LE |
3aefd54da5ec6e fs/cifsd/smb2pdu.c      Wan Jiabing       2021-06-07  1975  				FILE_DELETE_LE | FILE_WRITE_ATTRIBUTES_LE |
3aefd54da5ec6e fs/cifsd/smb2pdu.c      Wan Jiabing       2021-06-07  1976  				FILE_DELETE_CHILD_LE | FILE_READ_CONTROL_LE |
3aefd54da5ec6e fs/cifsd/smb2pdu.c      Wan Jiabing       2021-06-07  1977  				FILE_WRITE_DAC_LE | FILE_WRITE_OWNER_LE |
3aefd54da5ec6e fs/cifsd/smb2pdu.c      Wan Jiabing       2021-06-07  1978  				FILE_SYNCHRONIZE_LE;
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  1979  		}
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  1980  	}
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  1981  
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  1982  	status.tree_conn->maximal_access = le32_to_cpu(rsp->MaximalAccess);
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  1983  	if (conn->posix_ext_supported)
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  1984  		status.tree_conn->posix_extensions = true;
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  1985  
33b235a6e6ebe0 fs/smb/server/smb2pdu.c Namjae Jeon       2023-10-05  1986  	write_lock(&sess->tree_conns_lock);
33b235a6e6ebe0 fs/smb/server/smb2pdu.c Namjae Jeon       2023-10-05  1987  	status.tree_conn->t_state = TREE_CONNECTED;
33b235a6e6ebe0 fs/smb/server/smb2pdu.c Namjae Jeon       2023-10-05  1988  	write_unlock(&sess->tree_conns_lock);
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  1989  	rsp->StructureSize = cpu_to_le16(16);
cdfb2fef522d0c fs/ksmbd/smb2pdu.c      Marios Makassikis 2022-12-23  1990  out_err1:
e9d8c2f95ab8ac fs/smb/server/smb2pdu.c Namjae Jeon       2024-04-20  1991  	if (server_conf.flags & KSMBD_GLOBAL_FLAG_DURABLE_HANDLE &&
e9d8c2f95ab8ac fs/smb/server/smb2pdu.c Namjae Jeon       2024-04-20 @1992  	    test_share_config_flag(share,
e9d8c2f95ab8ac fs/smb/server/smb2pdu.c Namjae Jeon       2024-04-20  1993  				   KSMBD_SHARE_FLAG_CONTINUOUS_AVAILABILITY))
e9d8c2f95ab8ac fs/smb/server/smb2pdu.c Namjae Jeon       2024-04-20  1994  		rsp->Capabilities = SMB2_SHARE_CAP_CONTINUOUS_AVAILABILITY;
e9d8c2f95ab8ac fs/smb/server/smb2pdu.c Namjae Jeon       2024-04-20  1995  	else
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  1996  		rsp->Capabilities = 0;
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  1997  	rsp->Reserved = 0;
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  1998  	/* default manual caching */
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  1999  	rsp->ShareFlags = SMB2_SHAREFLAG_MANUAL_CACHING;
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  2000  
e2b76ab8b5c932 fs/smb/server/smb2pdu.c Namjae Jeon       2023-08-29  2001  	rc = ksmbd_iov_pin_rsp(work, rsp, sizeof(struct smb2_tree_connect_rsp));
e2b76ab8b5c932 fs/smb/server/smb2pdu.c Namjae Jeon       2023-08-29  2002  	if (rc)
e2b76ab8b5c932 fs/smb/server/smb2pdu.c Namjae Jeon       2023-08-29  2003  		status.ret = KSMBD_TREE_CONN_STATUS_NOMEM;
e2b76ab8b5c932 fs/smb/server/smb2pdu.c Namjae Jeon       2023-08-29  2004  
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  2005  	if (!IS_ERR(treename))
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  2006  		kfree(treename);
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  2007  	if (!IS_ERR(name))
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  2008  		kfree(name);
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  2009  
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  2010  	switch (status.ret) {
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  2011  	case KSMBD_TREE_CONN_STATUS_OK:
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  2012  		rsp->hdr.Status = STATUS_SUCCESS;
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  2013  		rc = 0;
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  2014  		break;
4963d74f8a6cc0 fs/ksmbd/smb2pdu.c      Atte Heikkilä     2022-08-09  2015  	case -ESTALE:
fe54833dc8d97e fs/ksmbd/smb2pdu.c      Namjae Jeon       2022-08-08  2016  	case -ENOENT:
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  2017  	case KSMBD_TREE_CONN_STATUS_NO_SHARE:
fe54833dc8d97e fs/ksmbd/smb2pdu.c      Namjae Jeon       2022-08-08  2018  		rsp->hdr.Status = STATUS_BAD_NETWORK_NAME;
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  2019  		break;
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  2020  	case -ENOMEM:
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  2021  	case KSMBD_TREE_CONN_STATUS_NOMEM:
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  2022  		rsp->hdr.Status = STATUS_NO_MEMORY;
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  2023  		break;
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  2024  	case KSMBD_TREE_CONN_STATUS_ERROR:
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  2025  	case KSMBD_TREE_CONN_STATUS_TOO_MANY_CONNS:
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  2026  	case KSMBD_TREE_CONN_STATUS_TOO_MANY_SESSIONS:
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  2027  		rsp->hdr.Status = STATUS_ACCESS_DENIED;
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  2028  		break;
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  2029  	case -EINVAL:
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  2030  		rsp->hdr.Status = STATUS_INVALID_PARAMETER;
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  2031  		break;
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  2032  	default:
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  2033  		rsp->hdr.Status = STATUS_ACCESS_DENIED;
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  2034  	}
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  2035  
cdfb2fef522d0c fs/ksmbd/smb2pdu.c      Marios Makassikis 2022-12-23  2036  	if (status.ret != KSMBD_TREE_CONN_STATUS_OK)
cdfb2fef522d0c fs/ksmbd/smb2pdu.c      Marios Makassikis 2022-12-23  2037  		smb2_set_err_rsp(work);
cdfb2fef522d0c fs/ksmbd/smb2pdu.c      Marios Makassikis 2022-12-23  2038  
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  2039  	return rc;
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  2040  }
e2f34481b24db2 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  2041  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
