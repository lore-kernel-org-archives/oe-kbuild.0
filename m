Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCC4667A0E
	for <oe-kbuild@lists.linux.dev>; Wed, 31 Jan 2024 09:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706693833; cv=none; b=cbD0G3vV1prhfMg3LLsDR8f1qxIUf1+zsK0fgHJFNyRIl+VflIAy7EsUcNbe3CpaM95z7PqaJdIW8Pfy/ARgCsDGleGfsfzGkW5/i7zmAx4XnfK+CizaayrNp7J3V1lb9Qid2NGT2AsTEm3CM/BpAiNHBkRxD8Gn4RS25jWVp20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706693833; c=relaxed/simple;
	bh=ueNqadQcBer5/2rrOzMNvBxAaunOounXFb62DBhL1tQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HRLktMTdg6XnnIbpSuARc8YJxjALLpRMHqu9N7YMFRHcxJJU5rKt2GxVvmMi7RiGDgvnWByYA8SEEfv8OsH8auU+mV8PyRIvVRnHfm4ven8l2fGWTFH9Y+Oy3OcSsDNnxWFH1eRr+0DBIH77cViILEw5tmqkStcj/beXezQ6PIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MnfjXUvQ; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MnfjXUvQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706693831; x=1738229831;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ueNqadQcBer5/2rrOzMNvBxAaunOounXFb62DBhL1tQ=;
  b=MnfjXUvQKucVTdy529JDFAvMOXemG6WW6h5VXIE3D1zTrUW7p6FTc6QS
   kTs0Kz/bdtN3//qalSlyevrl6H0U0h9x6nyQIMr++/m582rmx3UHifr0d
   j1zkXAytqPcqQr9lcMWOLbC5dusW80sK71mV5ai+ZTzvqKx/8XlBepptc
   28SSjtf+tNGznJC0GFozECqAMr45UO9NRVSsY55QenKg6oxvMNEAgsyr+
   MHtoFY8oPjKONmBxHStGx82pGnO0TXV813dow4/g3o3Emz2V7kjJ+OtjD
   RxKl3KuEvZnrXK3+Fph0rgvXzG/28PR3vCofLFazkVEYLDMRYxbgFrXC6
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="2488786"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="scan'208";a="2488786"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2024 01:37:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="scan'208";a="36805476"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 31 Jan 2024 01:37:08 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rV71i-0001Ob-38;
	Wed, 31 Jan 2024 09:37:03 +0000
Date: Wed, 31 Jan 2024 17:34:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: fs/smb/client/smb2ops.c:1612:23-29: ERROR: reference preceded by
 free on line 1732
Message-ID: <202401311755.WFmed0Aw-lkp@intel.com>
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
TO: Shyam Prasad N <sprasad@microsoft.com>
CC: Steve French <stfrench@microsoft.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2a6526c4f389bb741e511be11721b3d1cbf1034a
commit: 4f1fffa2376922f3d1d506e49c0fd445b023a28e cifs: commands that are retried should have replay flag set
date:   7 days ago
:::::: branch date: 10 hours ago
:::::: commit date: 7 days ago
config: x86_64-randconfig-104-20240131 (https://download.01.org/0day-ci/archive/20240131/202401311755.WFmed0Aw-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202401311755.WFmed0Aw-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/smb/client/smb2ops.c:1612:23-29: ERROR: reference preceded by free on line 1732
   fs/smb/client/smb2ops.c:1631:12-18: ERROR: reference preceded by free on line 1732
   fs/smb/client/smb2ops.c:1646:31-37: ERROR: reference preceded by free on line 1732
   fs/smb/client/smb2ops.c:1732:7-13: ERROR: reference preceded by free on line 1732
   fs/smb/client/smb2ops.c:1266:7-9: ERROR: reference preceded by free on line 1266
--
>> fs/smb/client/smb2pdu.c:2902:8-14: ERROR: reference preceded by free on line 2902
   fs/smb/client/smb2pdu.c:2915:7-13: ERROR: reference preceded by free on line 2902
   fs/smb/client/smb2pdu.c:2902:8-14: ERROR: reference preceded by free on line 2915
   fs/smb/client/smb2pdu.c:2915:7-13: ERROR: reference preceded by free on line 2915

vim +1612 fs/smb/client/smb2ops.c

41c1358e9181ab1 fs/cifs/smb2ops.c       Steve French    2013-11-14  1493  
f5b05d622a3e99e fs/cifs/smb2ops.c       Ronnie Sahlberg 2018-10-07  1494  static int
f5b05d622a3e99e fs/cifs/smb2ops.c       Ronnie Sahlberg 2018-10-07  1495  smb2_ioctl_query_info(const unsigned int xid,
8d8b26e58432cb2 fs/cifs/smb2ops.c       Ronnie Sahlberg 2018-10-17  1496  		      struct cifs_tcon *tcon,
0f060936e490c62 fs/cifs/smb2ops.c       Amir Goldstein  2020-02-03  1497  		      struct cifs_sb_info *cifs_sb,
8d8b26e58432cb2 fs/cifs/smb2ops.c       Ronnie Sahlberg 2018-10-17  1498  		      __le16 *path, int is_dir,
f5b05d622a3e99e fs/cifs/smb2ops.c       Ronnie Sahlberg 2018-10-07  1499  		      unsigned long p)
f5b05d622a3e99e fs/cifs/smb2ops.c       Ronnie Sahlberg 2018-10-07  1500  {
f4e5ceb6c1a64f9 fs/smb/client/smb2ops.c Paulo Alcantara 2023-08-17  1501  	struct smb2_compound_vars *vars;
b2ca6c2c9eddc41 fs/cifs/smb2ops.c       Ronnie Sahlberg 2020-05-21  1502  	struct smb_rqst *rqst;
b2ca6c2c9eddc41 fs/cifs/smb2ops.c       Ronnie Sahlberg 2020-05-21  1503  	struct kvec *rsp_iov;
f5b05d622a3e99e fs/cifs/smb2ops.c       Ronnie Sahlberg 2018-10-07  1504  	struct cifs_ses *ses = tcon->ses;
4f1fffa2376922f fs/smb/client/smb2ops.c Shyam Prasad N  2024-01-21  1505  	struct TCP_Server_Info *server;
f5b05d622a3e99e fs/cifs/smb2ops.c       Ronnie Sahlberg 2018-10-07  1506  	char __user *arg = (char __user *)p;
f5b05d622a3e99e fs/cifs/smb2ops.c       Ronnie Sahlberg 2018-10-07  1507  	struct smb_query_info qi;
f5b05d622a3e99e fs/cifs/smb2ops.c       Ronnie Sahlberg 2018-10-07  1508  	struct smb_query_info __user *pqi;
f5b05d622a3e99e fs/cifs/smb2ops.c       Ronnie Sahlberg 2018-10-07  1509  	int rc = 0;
04ad69c342fc4de fs/cifs/smb2ops.c       Paulo Alcantara 2021-03-08  1510  	int flags = CIFS_CP_CREATE_CLOSE_OP;
f5778c398713692 fs/cifs/smb2ops.c       Ronnie Sahlberg 2019-03-15  1511  	struct smb2_query_info_rsp *qi_rsp = NULL;
f5778c398713692 fs/cifs/smb2ops.c       Ronnie Sahlberg 2019-03-15  1512  	struct smb2_ioctl_rsp *io_rsp = NULL;
8d8b26e58432cb2 fs/cifs/smb2ops.c       Ronnie Sahlberg 2018-10-17  1513  	void *buffer = NULL;
8d8b26e58432cb2 fs/cifs/smb2ops.c       Ronnie Sahlberg 2018-10-17  1514  	int resp_buftype[3];
8d8b26e58432cb2 fs/cifs/smb2ops.c       Ronnie Sahlberg 2018-10-17  1515  	struct cifs_open_parms oparms;
8d8b26e58432cb2 fs/cifs/smb2ops.c       Ronnie Sahlberg 2018-10-17  1516  	u8 oplock = SMB2_OPLOCK_LEVEL_NONE;
8d8b26e58432cb2 fs/cifs/smb2ops.c       Ronnie Sahlberg 2018-10-17  1517  	struct cifs_fid fid;
0e90696dc2b33a2 fs/cifs/smb2ops.c       Ronnie Sahlberg 2019-07-25  1518  	unsigned int size[2];
0e90696dc2b33a2 fs/cifs/smb2ops.c       Ronnie Sahlberg 2019-07-25  1519  	void *data[2];
0f060936e490c62 fs/cifs/smb2ops.c       Amir Goldstein  2020-02-03  1520  	int create_options = is_dir ? CREATE_NOT_FILE : CREATE_NOT_DIR;
d6f5e358452479f fs/cifs/smb2ops.c       Paulo Alcantara 2022-03-29  1521  	void (*free_req1_func)(struct smb_rqst *r);
4f1fffa2376922f fs/smb/client/smb2ops.c Shyam Prasad N  2024-01-21  1522  	int retries = 0, cur_sleep = 1;
4f1fffa2376922f fs/smb/client/smb2ops.c Shyam Prasad N  2024-01-21  1523  
4f1fffa2376922f fs/smb/client/smb2ops.c Shyam Prasad N  2024-01-21  1524  replay_again:
4f1fffa2376922f fs/smb/client/smb2ops.c Shyam Prasad N  2024-01-21  1525  	/* reinitialize for possible replay */
4f1fffa2376922f fs/smb/client/smb2ops.c Shyam Prasad N  2024-01-21  1526  	flags = CIFS_CP_CREATE_CLOSE_OP;
4f1fffa2376922f fs/smb/client/smb2ops.c Shyam Prasad N  2024-01-21  1527  	oplock = SMB2_OPLOCK_LEVEL_NONE;
4f1fffa2376922f fs/smb/client/smb2ops.c Shyam Prasad N  2024-01-21  1528  	server = cifs_pick_channel(ses);
8d8b26e58432cb2 fs/cifs/smb2ops.c       Ronnie Sahlberg 2018-10-17  1529  
b2ca6c2c9eddc41 fs/cifs/smb2ops.c       Ronnie Sahlberg 2020-05-21  1530  	vars = kzalloc(sizeof(*vars), GFP_ATOMIC);
b2ca6c2c9eddc41 fs/cifs/smb2ops.c       Ronnie Sahlberg 2020-05-21  1531  	if (vars == NULL)
b2ca6c2c9eddc41 fs/cifs/smb2ops.c       Ronnie Sahlberg 2020-05-21  1532  		return -ENOMEM;
b2ca6c2c9eddc41 fs/cifs/smb2ops.c       Ronnie Sahlberg 2020-05-21  1533  	rqst = &vars->rqst[0];
b2ca6c2c9eddc41 fs/cifs/smb2ops.c       Ronnie Sahlberg 2020-05-21  1534  	rsp_iov = &vars->rsp_iov[0];
b2ca6c2c9eddc41 fs/cifs/smb2ops.c       Ronnie Sahlberg 2020-05-21  1535  
8d8b26e58432cb2 fs/cifs/smb2ops.c       Ronnie Sahlberg 2018-10-17  1536  	resp_buftype[0] = resp_buftype[1] = resp_buftype[2] = CIFS_NO_BUFFER;
f5b05d622a3e99e fs/cifs/smb2ops.c       Ronnie Sahlberg 2018-10-07  1537  
d6f5e358452479f fs/cifs/smb2ops.c       Paulo Alcantara 2022-03-29  1538  	if (copy_from_user(&qi, arg, sizeof(struct smb_query_info))) {
d6f5e358452479f fs/cifs/smb2ops.c       Paulo Alcantara 2022-03-29  1539  		rc = -EFAULT;
d6f5e358452479f fs/cifs/smb2ops.c       Paulo Alcantara 2022-03-29  1540  		goto free_vars;
d6f5e358452479f fs/cifs/smb2ops.c       Paulo Alcantara 2022-03-29  1541  	}
b2ca6c2c9eddc41 fs/cifs/smb2ops.c       Ronnie Sahlberg 2020-05-21  1542  	if (qi.output_buffer_length > 1024) {
d6f5e358452479f fs/cifs/smb2ops.c       Paulo Alcantara 2022-03-29  1543  		rc = -EINVAL;
d6f5e358452479f fs/cifs/smb2ops.c       Paulo Alcantara 2022-03-29  1544  		goto free_vars;
b2ca6c2c9eddc41 fs/cifs/smb2ops.c       Ronnie Sahlberg 2020-05-21  1545  	}
f5b05d622a3e99e fs/cifs/smb2ops.c       Ronnie Sahlberg 2018-10-07  1546  
352d96f3acc6e02 fs/cifs/smb2ops.c       Aurelien Aptel  2020-05-31  1547  	if (!ses || !server) {
d6f5e358452479f fs/cifs/smb2ops.c       Paulo Alcantara 2022-03-29  1548  		rc = -EIO;
d6f5e358452479f fs/cifs/smb2ops.c       Paulo Alcantara 2022-03-29  1549  		goto free_vars;
b2ca6c2c9eddc41 fs/cifs/smb2ops.c       Ronnie Sahlberg 2020-05-21  1550  	}
f5b05d622a3e99e fs/cifs/smb2ops.c       Ronnie Sahlberg 2018-10-07  1551  
f5b05d622a3e99e fs/cifs/smb2ops.c       Ronnie Sahlberg 2018-10-07  1552  	if (smb3_encryption_required(tcon))
f5b05d622a3e99e fs/cifs/smb2ops.c       Ronnie Sahlberg 2018-10-07  1553  		flags |= CIFS_TRANSFORM_REQ;
f5b05d622a3e99e fs/cifs/smb2ops.c       Ronnie Sahlberg 2018-10-07  1554  
b92e358757b91c2 fs/cifs/smb2ops.c       Paulo Alcantara 2022-03-29  1555  	if (qi.output_buffer_length) {
b92e358757b91c2 fs/cifs/smb2ops.c       Paulo Alcantara 2022-03-29  1556  		buffer = memdup_user(arg + sizeof(struct smb_query_info), qi.output_buffer_length);
b2ca6c2c9eddc41 fs/cifs/smb2ops.c       Ronnie Sahlberg 2020-05-21  1557  		if (IS_ERR(buffer)) {
d6f5e358452479f fs/cifs/smb2ops.c       Paulo Alcantara 2022-03-29  1558  			rc = PTR_ERR(buffer);
d6f5e358452479f fs/cifs/smb2ops.c       Paulo Alcantara 2022-03-29  1559  			goto free_vars;
b2ca6c2c9eddc41 fs/cifs/smb2ops.c       Ronnie Sahlberg 2020-05-21  1560  		}
b92e358757b91c2 fs/cifs/smb2ops.c       Paulo Alcantara 2022-03-29  1561  	}
f5b05d622a3e99e fs/cifs/smb2ops.c       Ronnie Sahlberg 2018-10-07  1562  
8d8b26e58432cb2 fs/cifs/smb2ops.c       Ronnie Sahlberg 2018-10-17  1563  	/* Open */
b2ca6c2c9eddc41 fs/cifs/smb2ops.c       Ronnie Sahlberg 2020-05-21  1564  	rqst[0].rq_iov = &vars->open_iov[0];
8d8b26e58432cb2 fs/cifs/smb2ops.c       Ronnie Sahlberg 2018-10-17  1565  	rqst[0].rq_nvec = SMB2_CREATE_IOV_SIZE;
f5b05d622a3e99e fs/cifs/smb2ops.c       Ronnie Sahlberg 2018-10-07  1566  
de036dcaca65cf9 fs/cifs/smb2ops.c       Volker Lendecke 2023-01-11  1567  	oparms = (struct cifs_open_parms) {
de036dcaca65cf9 fs/cifs/smb2ops.c       Volker Lendecke 2023-01-11  1568  		.tcon = tcon,
de036dcaca65cf9 fs/cifs/smb2ops.c       Volker Lendecke 2023-01-11  1569  		.disposition = FILE_OPEN,
de036dcaca65cf9 fs/cifs/smb2ops.c       Volker Lendecke 2023-01-11  1570  		.create_options = cifs_create_options(cifs_sb, create_options),
de036dcaca65cf9 fs/cifs/smb2ops.c       Volker Lendecke 2023-01-11  1571  		.fid = &fid,
de036dcaca65cf9 fs/cifs/smb2ops.c       Volker Lendecke 2023-01-11  1572  	};
8d8b26e58432cb2 fs/cifs/smb2ops.c       Ronnie Sahlberg 2018-10-17  1573  
efac779b1c69670 fs/cifs/smb2ops.c       Ronnie Sahlberg 2019-04-11  1574  	if (qi.flags & PASSTHRU_FSCTL) {
efac779b1c69670 fs/cifs/smb2ops.c       Ronnie Sahlberg 2019-04-11  1575  		switch (qi.info_type & FSCTL_DEVICE_ACCESS_MASK) {
efac779b1c69670 fs/cifs/smb2ops.c       Ronnie Sahlberg 2019-04-11  1576  		case FSCTL_DEVICE_ACCESS_FILE_READ_WRITE_ACCESS:
efac779b1c69670 fs/cifs/smb2ops.c       Ronnie Sahlberg 2019-04-11  1577  			oparms.desired_access = FILE_READ_DATA | FILE_WRITE_DATA | FILE_READ_ATTRIBUTES | SYNCHRONIZE;
46e6661963fb5d5 fs/cifs/smb2ops.c       Steve French    2019-04-11  1578  			break;
46e6661963fb5d5 fs/cifs/smb2ops.c       Steve French    2019-04-11  1579  		case FSCTL_DEVICE_ACCESS_FILE_ANY_ACCESS:
46e6661963fb5d5 fs/cifs/smb2ops.c       Steve French    2019-04-11  1580  			oparms.desired_access = GENERIC_ALL;
46e6661963fb5d5 fs/cifs/smb2ops.c       Steve French    2019-04-11  1581  			break;
46e6661963fb5d5 fs/cifs/smb2ops.c       Steve French    2019-04-11  1582  		case FSCTL_DEVICE_ACCESS_FILE_READ_ACCESS:
46e6661963fb5d5 fs/cifs/smb2ops.c       Steve French    2019-04-11  1583  			oparms.desired_access = GENERIC_READ;
46e6661963fb5d5 fs/cifs/smb2ops.c       Steve French    2019-04-11  1584  			break;
46e6661963fb5d5 fs/cifs/smb2ops.c       Steve French    2019-04-11  1585  		case FSCTL_DEVICE_ACCESS_FILE_WRITE_ACCESS:
46e6661963fb5d5 fs/cifs/smb2ops.c       Steve French    2019-04-11  1586  			oparms.desired_access = GENERIC_WRITE;
efac779b1c69670 fs/cifs/smb2ops.c       Ronnie Sahlberg 2019-04-11  1587  			break;
efac779b1c69670 fs/cifs/smb2ops.c       Ronnie Sahlberg 2019-04-11  1588  		}
0e90696dc2b33a2 fs/cifs/smb2ops.c       Ronnie Sahlberg 2019-07-25  1589  	} else if (qi.flags & PASSTHRU_SET_INFO) {
0e90696dc2b33a2 fs/cifs/smb2ops.c       Ronnie Sahlberg 2019-07-25  1590  		oparms.desired_access = GENERIC_WRITE;
0e90696dc2b33a2 fs/cifs/smb2ops.c       Ronnie Sahlberg 2019-07-25  1591  	} else {
0e90696dc2b33a2 fs/cifs/smb2ops.c       Ronnie Sahlberg 2019-07-25  1592  		oparms.desired_access = FILE_READ_ATTRIBUTES | READ_CONTROL;
efac779b1c69670 fs/cifs/smb2ops.c       Ronnie Sahlberg 2019-04-11  1593  	}
efac779b1c69670 fs/cifs/smb2ops.c       Ronnie Sahlberg 2019-04-11  1594  
352d96f3acc6e02 fs/cifs/smb2ops.c       Aurelien Aptel  2020-05-31  1595  	rc = SMB2_open_init(tcon, server,
352d96f3acc6e02 fs/cifs/smb2ops.c       Aurelien Aptel  2020-05-31  1596  			    &rqst[0], &oplock, &oparms, path);
8d8b26e58432cb2 fs/cifs/smb2ops.c       Ronnie Sahlberg 2018-10-17  1597  	if (rc)
d6f5e358452479f fs/cifs/smb2ops.c       Paulo Alcantara 2022-03-29  1598  		goto free_output_buffer;
e77fe73c7e38c36 fs/cifs/smb2ops.c       Ronnie Sahlberg 2018-12-31  1599  	smb2_set_next_command(tcon, &rqst[0]);
8d8b26e58432cb2 fs/cifs/smb2ops.c       Ronnie Sahlberg 2018-10-17  1600  
8d8b26e58432cb2 fs/cifs/smb2ops.c       Ronnie Sahlberg 2018-10-17  1601  	/* Query */
31ba4331d571f50 fs/cifs/smb2ops.c       Steve French    2019-03-13  1602  	if (qi.flags & PASSTHRU_FSCTL) {
31ba4331d571f50 fs/cifs/smb2ops.c       Steve French    2019-03-13  1603  		/* Can eventually relax perm check since server enforces too */
d6f5e358452479f fs/cifs/smb2ops.c       Paulo Alcantara 2022-03-29  1604  		if (!capable(CAP_SYS_ADMIN)) {
31ba4331d571f50 fs/cifs/smb2ops.c       Steve French    2019-03-13  1605  			rc = -EPERM;
d6f5e358452479f fs/cifs/smb2ops.c       Paulo Alcantara 2022-03-29  1606  			goto free_open_req;
d6f5e358452479f fs/cifs/smb2ops.c       Paulo Alcantara 2022-03-29  1607  		}
b2ca6c2c9eddc41 fs/cifs/smb2ops.c       Ronnie Sahlberg 2020-05-21  1608  		rqst[1].rq_iov = &vars->io_iov[0];
f5778c398713692 fs/cifs/smb2ops.c       Ronnie Sahlberg 2019-03-15  1609  		rqst[1].rq_nvec = SMB2_IOCTL_IOV_SIZE;
f5778c398713692 fs/cifs/smb2ops.c       Ronnie Sahlberg 2019-03-15  1610  
d6f5e358452479f fs/cifs/smb2ops.c       Paulo Alcantara 2022-03-29  1611  		rc = SMB2_ioctl_init(tcon, server, &rqst[1], COMPOUND_FID, COMPOUND_FID,
400d0ad63b19089 fs/cifs/smb2ops.c       Enzo Matsumiya  2022-08-17 @1612  				     qi.info_type, buffer, qi.output_buffer_length,
d6f5e358452479f fs/cifs/smb2ops.c       Paulo Alcantara 2022-03-29  1613  				     CIFSMaxBufSize - MAX_SMB2_CREATE_RESPONSE_SIZE -
731b82bb1750a90 fs/cifs/smb2ops.c       Ronnie Sahlberg 2020-01-08  1614  				     MAX_SMB2_CLOSE_RESPONSE_SIZE);
d6f5e358452479f fs/cifs/smb2ops.c       Paulo Alcantara 2022-03-29  1615  		free_req1_func = SMB2_ioctl_free;
0e90696dc2b33a2 fs/cifs/smb2ops.c       Ronnie Sahlberg 2019-07-25  1616  	} else if (qi.flags == PASSTHRU_SET_INFO) {
0e90696dc2b33a2 fs/cifs/smb2ops.c       Ronnie Sahlberg 2019-07-25  1617  		/* Can eventually relax perm check since server enforces too */
d6f5e358452479f fs/cifs/smb2ops.c       Paulo Alcantara 2022-03-29  1618  		if (!capable(CAP_SYS_ADMIN)) {
0e90696dc2b33a2 fs/cifs/smb2ops.c       Ronnie Sahlberg 2019-07-25  1619  			rc = -EPERM;
d6f5e358452479f fs/cifs/smb2ops.c       Paulo Alcantara 2022-03-29  1620  			goto free_open_req;
d6f5e358452479f fs/cifs/smb2ops.c       Paulo Alcantara 2022-03-29  1621  		}
d6f5e358452479f fs/cifs/smb2ops.c       Paulo Alcantara 2022-03-29  1622  		if (qi.output_buffer_length < 8) {
b92e358757b91c2 fs/cifs/smb2ops.c       Paulo Alcantara 2022-03-29  1623  			rc = -EINVAL;
d6f5e358452479f fs/cifs/smb2ops.c       Paulo Alcantara 2022-03-29  1624  			goto free_open_req;
d6f5e358452479f fs/cifs/smb2ops.c       Paulo Alcantara 2022-03-29  1625  		}
f4e5ceb6c1a64f9 fs/smb/client/smb2ops.c Paulo Alcantara 2023-08-17  1626  		rqst[1].rq_iov = vars->si_iov;
0e90696dc2b33a2 fs/cifs/smb2ops.c       Ronnie Sahlberg 2019-07-25  1627  		rqst[1].rq_nvec = 1;
0e90696dc2b33a2 fs/cifs/smb2ops.c       Ronnie Sahlberg 2019-07-25  1628  
b92e358757b91c2 fs/cifs/smb2ops.c       Paulo Alcantara 2022-03-29  1629  		/* MS-FSCC 2.4.13 FileEndOfFileInformation */
0e90696dc2b33a2 fs/cifs/smb2ops.c       Ronnie Sahlberg 2019-07-25  1630  		size[0] = 8;
0e90696dc2b33a2 fs/cifs/smb2ops.c       Ronnie Sahlberg 2019-07-25  1631  		data[0] = buffer;
0e90696dc2b33a2 fs/cifs/smb2ops.c       Ronnie Sahlberg 2019-07-25  1632  
d6f5e358452479f fs/cifs/smb2ops.c       Paulo Alcantara 2022-03-29  1633  		rc = SMB2_set_info_init(tcon, server, &rqst[1], COMPOUND_FID, COMPOUND_FID,
d6f5e358452479f fs/cifs/smb2ops.c       Paulo Alcantara 2022-03-29  1634  					current->tgid, FILE_END_OF_FILE_INFORMATION,
0e90696dc2b33a2 fs/cifs/smb2ops.c       Ronnie Sahlberg 2019-07-25  1635  					SMB2_O_INFO_FILE, 0, data, size);
d6f5e358452479f fs/cifs/smb2ops.c       Paulo Alcantara 2022-03-29  1636  		free_req1_func = SMB2_set_info_free;
31ba4331d571f50 fs/cifs/smb2ops.c       Steve French    2019-03-13  1637  	} else if (qi.flags == PASSTHRU_QUERY_INFO) {
f4e5ceb6c1a64f9 fs/smb/client/smb2ops.c Paulo Alcantara 2023-08-17  1638  		rqst[1].rq_iov = &vars->qi_iov;
8d8b26e58432cb2 fs/cifs/smb2ops.c       Ronnie Sahlberg 2018-10-17  1639  		rqst[1].rq_nvec = 1;
8d8b26e58432cb2 fs/cifs/smb2ops.c       Ronnie Sahlberg 2018-10-17  1640  
352d96f3acc6e02 fs/cifs/smb2ops.c       Aurelien Aptel  2020-05-31  1641  		rc = SMB2_query_info_init(tcon, server,
352d96f3acc6e02 fs/cifs/smb2ops.c       Aurelien Aptel  2020-05-31  1642  				  &rqst[1], COMPOUND_FID,
31ba4331d571f50 fs/cifs/smb2ops.c       Steve French    2019-03-13  1643  				  COMPOUND_FID, qi.file_info_class,
31ba4331d571f50 fs/cifs/smb2ops.c       Steve French    2019-03-13  1644  				  qi.info_type, qi.additional_information,
f5b05d622a3e99e fs/cifs/smb2ops.c       Ronnie Sahlberg 2018-10-07  1645  				  qi.input_buffer_length,
f5b05d622a3e99e fs/cifs/smb2ops.c       Ronnie Sahlberg 2018-10-07  1646  				  qi.output_buffer_length, buffer);
d6f5e358452479f fs/cifs/smb2ops.c       Paulo Alcantara 2022-03-29  1647  		free_req1_func = SMB2_query_info_free;
31ba4331d571f50 fs/cifs/smb2ops.c       Steve French    2019-03-13  1648  	} else { /* unknown flags */
a0a3036b81f1f66 fs/cifs/smb2ops.c       Joe Perches     2020-04-14  1649  		cifs_tcon_dbg(VFS, "Invalid passthru query flags: 0x%x\n",
a0a3036b81f1f66 fs/cifs/smb2ops.c       Joe Perches     2020-04-14  1650  			      qi.flags);
31ba4331d571f50 fs/cifs/smb2ops.c       Steve French    2019-03-13  1651  		rc = -EINVAL;
31ba4331d571f50 fs/cifs/smb2ops.c       Steve French    2019-03-13  1652  	}
31ba4331d571f50 fs/cifs/smb2ops.c       Steve French    2019-03-13  1653  
f5b05d622a3e99e fs/cifs/smb2ops.c       Ronnie Sahlberg 2018-10-07  1654  	if (rc)
d6f5e358452479f fs/cifs/smb2ops.c       Paulo Alcantara 2022-03-29  1655  		goto free_open_req;
e77fe73c7e38c36 fs/cifs/smb2ops.c       Ronnie Sahlberg 2018-12-31  1656  	smb2_set_next_command(tcon, &rqst[1]);
8d8b26e58432cb2 fs/cifs/smb2ops.c       Ronnie Sahlberg 2018-10-17  1657  	smb2_set_related(&rqst[1]);
8d8b26e58432cb2 fs/cifs/smb2ops.c       Ronnie Sahlberg 2018-10-17  1658  
8d8b26e58432cb2 fs/cifs/smb2ops.c       Ronnie Sahlberg 2018-10-17  1659  	/* Close */
f4e5ceb6c1a64f9 fs/smb/client/smb2ops.c Paulo Alcantara 2023-08-17  1660  	rqst[2].rq_iov = &vars->close_iov;
8d8b26e58432cb2 fs/cifs/smb2ops.c       Ronnie Sahlberg 2018-10-17  1661  	rqst[2].rq_nvec = 1;
f5b05d622a3e99e fs/cifs/smb2ops.c       Ronnie Sahlberg 2018-10-07  1662  
352d96f3acc6e02 fs/cifs/smb2ops.c       Aurelien Aptel  2020-05-31  1663  	rc = SMB2_close_init(tcon, server,
352d96f3acc6e02 fs/cifs/smb2ops.c       Aurelien Aptel  2020-05-31  1664  			     &rqst[2], COMPOUND_FID, COMPOUND_FID, false);
f5b05d622a3e99e fs/cifs/smb2ops.c       Ronnie Sahlberg 2018-10-07  1665  	if (rc)
d6f5e358452479f fs/cifs/smb2ops.c       Paulo Alcantara 2022-03-29  1666  		goto free_req_1;
8d8b26e58432cb2 fs/cifs/smb2ops.c       Ronnie Sahlberg 2018-10-17  1667  	smb2_set_related(&rqst[2]);
f5b05d622a3e99e fs/cifs/smb2ops.c       Ronnie Sahlberg 2018-10-07  1668  
4f1fffa2376922f fs/smb/client/smb2ops.c Shyam Prasad N  2024-01-21  1669  	if (retries) {
4f1fffa2376922f fs/smb/client/smb2ops.c Shyam Prasad N  2024-01-21  1670  		smb2_set_replay(server, &rqst[0]);
4f1fffa2376922f fs/smb/client/smb2ops.c Shyam Prasad N  2024-01-21  1671  		smb2_set_replay(server, &rqst[1]);
4f1fffa2376922f fs/smb/client/smb2ops.c Shyam Prasad N  2024-01-21  1672  		smb2_set_replay(server, &rqst[2]);
4f1fffa2376922f fs/smb/client/smb2ops.c Shyam Prasad N  2024-01-21  1673  	}
4f1fffa2376922f fs/smb/client/smb2ops.c Shyam Prasad N  2024-01-21  1674  
352d96f3acc6e02 fs/cifs/smb2ops.c       Aurelien Aptel  2020-05-31  1675  	rc = compound_send_recv(xid, ses, server,
352d96f3acc6e02 fs/cifs/smb2ops.c       Aurelien Aptel  2020-05-31  1676  				flags, 3, rqst,
8d8b26e58432cb2 fs/cifs/smb2ops.c       Ronnie Sahlberg 2018-10-17  1677  				resp_buftype, rsp_iov);
8d8b26e58432cb2 fs/cifs/smb2ops.c       Ronnie Sahlberg 2018-10-17  1678  	if (rc)
d6f5e358452479f fs/cifs/smb2ops.c       Paulo Alcantara 2022-03-29  1679  		goto out;
d2f15428d6a0ebf fs/cifs/smb2ops.c       Steve French    2019-09-22  1680  
d2f15428d6a0ebf fs/cifs/smb2ops.c       Steve French    2019-09-22  1681  	/* No need to bump num_remote_opens since handle immediately closed */
f5778c398713692 fs/cifs/smb2ops.c       Ronnie Sahlberg 2019-03-15  1682  	if (qi.flags & PASSTHRU_FSCTL) {
f5778c398713692 fs/cifs/smb2ops.c       Ronnie Sahlberg 2019-03-15  1683  		pqi = (struct smb_query_info __user *)arg;
f5778c398713692 fs/cifs/smb2ops.c       Ronnie Sahlberg 2019-03-15  1684  		io_rsp = (struct smb2_ioctl_rsp *)rsp_iov[1].iov_base;
f5778c398713692 fs/cifs/smb2ops.c       Ronnie Sahlberg 2019-03-15  1685  		if (le32_to_cpu(io_rsp->OutputCount) < qi.input_buffer_length)
f5778c398713692 fs/cifs/smb2ops.c       Ronnie Sahlberg 2019-03-15  1686  			qi.input_buffer_length = le32_to_cpu(io_rsp->OutputCount);
5242fcb706cb47d fs/cifs/smb2ops.c       Ronnie Sahlberg 2019-04-15  1687  		if (qi.input_buffer_length > 0 &&
2b1116bbe898aef fs/cifs/smb2ops.c       Markus Elfring  2019-11-05  1688  		    le32_to_cpu(io_rsp->OutputOffset) + qi.input_buffer_length
d6f5e358452479f fs/cifs/smb2ops.c       Paulo Alcantara 2022-03-29  1689  		    > rsp_iov[1].iov_len) {
d6f5e358452479f fs/cifs/smb2ops.c       Paulo Alcantara 2022-03-29  1690  			rc = -EFAULT;
d6f5e358452479f fs/cifs/smb2ops.c       Paulo Alcantara 2022-03-29  1691  			goto out;
d6f5e358452479f fs/cifs/smb2ops.c       Paulo Alcantara 2022-03-29  1692  		}
2b1116bbe898aef fs/cifs/smb2ops.c       Markus Elfring  2019-11-05  1693  
2b1116bbe898aef fs/cifs/smb2ops.c       Markus Elfring  2019-11-05  1694  		if (copy_to_user(&pqi->input_buffer_length,
2b1116bbe898aef fs/cifs/smb2ops.c       Markus Elfring  2019-11-05  1695  				 &qi.input_buffer_length,
d6f5e358452479f fs/cifs/smb2ops.c       Paulo Alcantara 2022-03-29  1696  				 sizeof(qi.input_buffer_length))) {
d6f5e358452479f fs/cifs/smb2ops.c       Paulo Alcantara 2022-03-29  1697  			rc = -EFAULT;
d6f5e358452479f fs/cifs/smb2ops.c       Paulo Alcantara 2022-03-29  1698  			goto out;
d6f5e358452479f fs/cifs/smb2ops.c       Paulo Alcantara 2022-03-29  1699  		}
2b1116bbe898aef fs/cifs/smb2ops.c       Markus Elfring  2019-11-05  1700  
5242fcb706cb47d fs/cifs/smb2ops.c       Ronnie Sahlberg 2019-04-15  1701  		if (copy_to_user((void __user *)pqi + sizeof(struct smb_query_info),
5242fcb706cb47d fs/cifs/smb2ops.c       Ronnie Sahlberg 2019-04-15  1702  				 (const void *)io_rsp + le32_to_cpu(io_rsp->OutputOffset),
2b1116bbe898aef fs/cifs/smb2ops.c       Markus Elfring  2019-11-05  1703  				 qi.input_buffer_length))
d6f5e358452479f fs/cifs/smb2ops.c       Paulo Alcantara 2022-03-29  1704  			rc = -EFAULT;
f5778c398713692 fs/cifs/smb2ops.c       Ronnie Sahlberg 2019-03-15  1705  	} else {
f5b05d622a3e99e fs/cifs/smb2ops.c       Ronnie Sahlberg 2018-10-07  1706  		pqi = (struct smb_query_info __user *)arg;
f5778c398713692 fs/cifs/smb2ops.c       Ronnie Sahlberg 2019-03-15  1707  		qi_rsp = (struct smb2_query_info_rsp *)rsp_iov[1].iov_base;
f5778c398713692 fs/cifs/smb2ops.c       Ronnie Sahlberg 2019-03-15  1708  		if (le32_to_cpu(qi_rsp->OutputBufferLength) < qi.input_buffer_length)
f5778c398713692 fs/cifs/smb2ops.c       Ronnie Sahlberg 2019-03-15  1709  			qi.input_buffer_length = le32_to_cpu(qi_rsp->OutputBufferLength);
2b1116bbe898aef fs/cifs/smb2ops.c       Markus Elfring  2019-11-05  1710  		if (copy_to_user(&pqi->input_buffer_length,
2b1116bbe898aef fs/cifs/smb2ops.c       Markus Elfring  2019-11-05  1711  				 &qi.input_buffer_length,
d6f5e358452479f fs/cifs/smb2ops.c       Paulo Alcantara 2022-03-29  1712  				 sizeof(qi.input_buffer_length))) {
d6f5e358452479f fs/cifs/smb2ops.c       Paulo Alcantara 2022-03-29  1713  			rc = -EFAULT;
d6f5e358452479f fs/cifs/smb2ops.c       Paulo Alcantara 2022-03-29  1714  			goto out;
d6f5e358452479f fs/cifs/smb2ops.c       Paulo Alcantara 2022-03-29  1715  		}
2b1116bbe898aef fs/cifs/smb2ops.c       Markus Elfring  2019-11-05  1716  
2b1116bbe898aef fs/cifs/smb2ops.c       Markus Elfring  2019-11-05  1717  		if (copy_to_user(pqi + 1, qi_rsp->Buffer,
2b1116bbe898aef fs/cifs/smb2ops.c       Markus Elfring  2019-11-05  1718  				 qi.input_buffer_length))
d6f5e358452479f fs/cifs/smb2ops.c       Paulo Alcantara 2022-03-29  1719  			rc = -EFAULT;
f5778c398713692 fs/cifs/smb2ops.c       Ronnie Sahlberg 2019-03-15  1720  	}
f5b05d622a3e99e fs/cifs/smb2ops.c       Ronnie Sahlberg 2018-10-07  1721  
d6f5e358452479f fs/cifs/smb2ops.c       Paulo Alcantara 2022-03-29  1722  out:
8d8b26e58432cb2 fs/cifs/smb2ops.c       Ronnie Sahlberg 2018-10-17  1723  	free_rsp_buf(resp_buftype[0], rsp_iov[0].iov_base);
8d8b26e58432cb2 fs/cifs/smb2ops.c       Ronnie Sahlberg 2018-10-17  1724  	free_rsp_buf(resp_buftype[1], rsp_iov[1].iov_base);
8d8b26e58432cb2 fs/cifs/smb2ops.c       Ronnie Sahlberg 2018-10-17  1725  	free_rsp_buf(resp_buftype[2], rsp_iov[2].iov_base);
d6f5e358452479f fs/cifs/smb2ops.c       Paulo Alcantara 2022-03-29  1726  	SMB2_close_free(&rqst[2]);
d6f5e358452479f fs/cifs/smb2ops.c       Paulo Alcantara 2022-03-29  1727  free_req_1:
d6f5e358452479f fs/cifs/smb2ops.c       Paulo Alcantara 2022-03-29  1728  	free_req1_func(&rqst[1]);
d6f5e358452479f fs/cifs/smb2ops.c       Paulo Alcantara 2022-03-29  1729  free_open_req:
d6f5e358452479f fs/cifs/smb2ops.c       Paulo Alcantara 2022-03-29  1730  	SMB2_open_free(&rqst[0]);
d6f5e358452479f fs/cifs/smb2ops.c       Paulo Alcantara 2022-03-29  1731  free_output_buffer:
ccd48ec3d4a6cc5 fs/cifs/smb2ops.c       Aurelien Aptel  2021-04-09 @1732  	kfree(buffer);
d6f5e358452479f fs/cifs/smb2ops.c       Paulo Alcantara 2022-03-29  1733  free_vars:
d6f5e358452479f fs/cifs/smb2ops.c       Paulo Alcantara 2022-03-29  1734  	kfree(vars);
4f1fffa2376922f fs/smb/client/smb2ops.c Shyam Prasad N  2024-01-21  1735  
4f1fffa2376922f fs/smb/client/smb2ops.c Shyam Prasad N  2024-01-21  1736  	if (is_replayable_error(rc) &&
4f1fffa2376922f fs/smb/client/smb2ops.c Shyam Prasad N  2024-01-21  1737  	    smb2_should_replay(tcon, &retries, &cur_sleep))
4f1fffa2376922f fs/smb/client/smb2ops.c Shyam Prasad N  2024-01-21  1738  		goto replay_again;
4f1fffa2376922f fs/smb/client/smb2ops.c Shyam Prasad N  2024-01-21  1739  
f5b05d622a3e99e fs/cifs/smb2ops.c       Ronnie Sahlberg 2018-10-07  1740  	return rc;
f5b05d622a3e99e fs/cifs/smb2ops.c       Ronnie Sahlberg 2018-10-07  1741  }
f5b05d622a3e99e fs/cifs/smb2ops.c       Ronnie Sahlberg 2018-10-07  1742  

:::::: The code at line 1612 was first introduced by commit
:::::: 400d0ad63b190895e29f43bc75b1260111d3fd34 cifs: remove useless parameter 'is_fsctl' from SMB2_ioctl()

:::::: TO: Enzo Matsumiya <ematsumiya@suse.de>
:::::: CC: Steve French <stfrench@microsoft.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
