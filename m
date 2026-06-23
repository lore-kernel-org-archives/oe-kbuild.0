Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ED1A625
	for <oe-kbuild@lists.linux.dev>; Tue, 23 Jun 2026 00:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782173498; cv=none; b=ltym7moIR2jca1sjiLhsYm+rYOqpUqVHa+TI9yv5SmYONhX12pBG8mMvjII+YHeYVgTAwSgVmKdcicKAbKP5G3AplROjs6BCihgmKdtqKG/3iYa7+wX1EmcuuT40OmIxOehfpgvR+xfnQIa8cfosdMLe9p6YG6AP2F49czneY34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782173498; c=relaxed/simple;
	bh=bC4dmDwuDu6vX5NfrgszYIysLde8rxqijvVb/YBMqmc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gvt/4z9DivZe4dU2QQRTaol5RYKMBnvvNKgbe1B8i/aydThJiCweb/ZXQSLHHkmT0IhuQAo0Z5tq2wrfoY5J6erU+28cbcoX/EA7yJcoEiUJQMp9Bu3OPitEh1+XPvMqEV90JUSKlNYHvE2SqxB25vo23kuVGnxkRrdvkgeteyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZwdGpi4L; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZwdGpi4L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782173496; x=1813709496;
  h=date:from:to:cc:subject:message-id;
  bh=bC4dmDwuDu6vX5NfrgszYIysLde8rxqijvVb/YBMqmc=;
  b=ZwdGpi4LOh4pn8Niw4ZDEr5X0PNquL0DUiYwVoPjprS1T8ynaRmHcsmT
   uYeQcnkDFzDa/6bI9/z5r2XBKuxubTOOsDkIRBibCVAC7CDhwFUc5xrPX
   eRsk+PfmXiVfWRYu4LbVl4ura5Vgg6DAlwbWq95cQLtrd1JeEBUSTX75x
   YpGq4vCmIVNSrl2iEbIhDI/MQaLpwK9RIUSYR3Cp2LJDatajXwgFFFE8L
   lm6CY0p7Mde+se0cRaStrv2m0RDOOGOJ0cwbyfuKPziJD4eenJKT9Bhyl
   S8o8VzUS1VQnvPvuWrkm5LPmofKYX3Rsa858Z7ySFRvjdW7yltpH4yvqZ
   Q==;
X-CSE-ConnectionGUID: 8Ud63TCMRjW1wGnsScZ3Cw==
X-CSE-MsgGUID: ZESVcDufTWufNjCJtmvzOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="82015840"
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; 
   d="scan'208";a="82015840"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2026 17:11:35 -0700
X-CSE-ConnectionGUID: 5H8GvSQfT8uFCbEN8gmbhw==
X-CSE-MsgGUID: 6Kef07ALSiqhXi3Aus0jQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; 
   d="scan'208";a="253704246"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 22 Jun 2026 17:11:33 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wboji-0000000025p-2taN;
	Tue, 23 Jun 2026 00:11:30 +0000
Date: Tue, 23 Jun 2026 08:10:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 14532/14705] fs/smb/client/smb2ops.c:2536
 smb2_query_dir_first() error: we previously assumed 'srch_inf' could be null
 (see line 2472)
Message-ID: <202606230844.phrBIl9m-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Shyam Prasad N <sprasad@microsoft.com>
CC: Steve French <stfrench@microsoft.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   948efecf22e49aa4bf55bb73ec79a0ddcfd38571
commit: 4cd21dc3081a1ac48a9f7dced566588787446be5 [14532/14705] cifs: query dir should reuse cfid even if not fully cached
:::::: branch date: 12 hours ago
:::::: commit date: 4 days ago
config: x86_64-randconfig-161 (https://download.01.org/0day-ci/archive/20260623/202606230844.phrBIl9m-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202606230844.phrBIl9m-lkp@intel.com/

smatch warnings:
fs/smb/client/smb2ops.c:2536 smb2_query_dir_first() error: we previously assumed 'srch_inf' could be null (see line 2472)

vim +/srch_inf +2536 fs/smb/client/smb2ops.c

d26c2ddd3356966 fs/cifs/smb2ops.c       Steve French    2020-02-06  2451  
d324f08d6a87149 fs/cifs/smb2ops.c       Pavel Shilovsky 2012-09-18  2452  static int
d324f08d6a87149 fs/cifs/smb2ops.c       Pavel Shilovsky 2012-09-18  2453  smb2_query_dir_first(const unsigned int xid, struct cifs_tcon *tcon,
d324f08d6a87149 fs/cifs/smb2ops.c       Pavel Shilovsky 2012-09-18  2454  		     const char *path, struct cifs_sb_info *cifs_sb,
d324f08d6a87149 fs/cifs/smb2ops.c       Pavel Shilovsky 2012-09-18  2455  		     struct cifs_fid *fid, __u16 search_flags,
d324f08d6a87149 fs/cifs/smb2ops.c       Pavel Shilovsky 2012-09-18  2456  		     struct cifs_search_info *srch_inf)
d324f08d6a87149 fs/cifs/smb2ops.c       Pavel Shilovsky 2012-09-18  2457  {
d324f08d6a87149 fs/cifs/smb2ops.c       Pavel Shilovsky 2012-09-18  2458  	__le16 *utf16_path;
3e2b0ecbc5b9c61 fs/smb/client/smb2ops.c Shyam Prasad N  2026-03-10  2459  	struct smb_rqst rqst[3];
3e2b0ecbc5b9c61 fs/smb/client/smb2ops.c Shyam Prasad N  2026-03-10  2460  	struct kvec rsp_iov[3];
3e2b0ecbc5b9c61 fs/smb/client/smb2ops.c Shyam Prasad N  2026-03-10  2461  	int resp_buftype[3];
37478608f0eb6f2 fs/cifs/smb2ops.c       Ronnie Sahlberg 2020-01-08  2462  	struct kvec open_iov[SMB2_CREATE_IOV_SIZE];
3e2b0ecbc5b9c61 fs/smb/client/smb2ops.c Shyam Prasad N  2026-03-10  2463  	struct kvec qd_iov[SMB2_QUERY_DIRECTORY_IOV_SIZE + 1]; /* +1 for padding */
3e2b0ecbc5b9c61 fs/smb/client/smb2ops.c Shyam Prasad N  2026-03-10  2464  	struct kvec qd2_iov[SMB2_QUERY_DIRECTORY_IOV_SIZE + 1]; /* +1 for padding */
37478608f0eb6f2 fs/cifs/smb2ops.c       Ronnie Sahlberg 2020-01-08  2465  	int rc, flags = 0;
37478608f0eb6f2 fs/cifs/smb2ops.c       Ronnie Sahlberg 2020-01-08  2466  	u8 oplock = SMB2_OPLOCK_LEVEL_NONE;
064f6047a123d61 fs/cifs/smb2ops.c       Pavel Shilovsky 2013-07-09  2467  	struct cifs_open_parms oparms;
37478608f0eb6f2 fs/cifs/smb2ops.c       Ronnie Sahlberg 2020-01-08  2468  	struct smb2_query_directory_rsp *qd_rsp = NULL;
3e2b0ecbc5b9c61 fs/smb/client/smb2ops.c Shyam Prasad N  2026-03-10  2469  	struct smb2_query_directory_rsp *qd2_rsp = NULL;
37478608f0eb6f2 fs/cifs/smb2ops.c       Ronnie Sahlberg 2020-01-08  2470  	struct smb2_create_rsp *op_rsp = NULL;
4f1fffa2376922f fs/smb/client/smb2ops.c Shyam Prasad N  2024-01-21  2471  	struct TCP_Server_Info *server;
4cd21dc3081a1ac fs/smb/client/smb2ops.c Shyam Prasad N  2026-04-09 @2472  	struct cached_fid *cfid = srch_inf ? srch_inf->cfid : NULL;
16d480ed4990ed5 fs/smb/client/smb2ops.c Shyam Prasad N  2026-01-31  2473  	int retries = 0, cur_sleep = 0;
3e2b0ecbc5b9c61 fs/smb/client/smb2ops.c Shyam Prasad N  2026-03-10  2474  	unsigned int compound_resp_bufsize;
4cd21dc3081a1ac fs/smb/client/smb2ops.c Shyam Prasad N  2026-04-09  2475  	bool use_cfid_lease = false;
4cd21dc3081a1ac fs/smb/client/smb2ops.c Shyam Prasad N  2026-04-09  2476  	bool cfid_open_locked = false;
4f1fffa2376922f fs/smb/client/smb2ops.c Shyam Prasad N  2024-01-21  2477  
4f1fffa2376922f fs/smb/client/smb2ops.c Shyam Prasad N  2024-01-21  2478  replay_again:
4f1fffa2376922f fs/smb/client/smb2ops.c Shyam Prasad N  2024-01-21  2479  	/* reinitialize for possible replay */
4f1fffa2376922f fs/smb/client/smb2ops.c Shyam Prasad N  2024-01-21  2480  	flags = 0;
4cd21dc3081a1ac fs/smb/client/smb2ops.c Shyam Prasad N  2026-04-09  2481  	use_cfid_lease = false;
4f1fffa2376922f fs/smb/client/smb2ops.c Shyam Prasad N  2024-01-21  2482  	oplock = SMB2_OPLOCK_LEVEL_NONE;
4f1fffa2376922f fs/smb/client/smb2ops.c Shyam Prasad N  2024-01-21  2483  	server = cifs_pick_channel(tcon->ses);
d324f08d6a87149 fs/cifs/smb2ops.c       Pavel Shilovsky 2012-09-18  2484  
d324f08d6a87149 fs/cifs/smb2ops.c       Pavel Shilovsky 2012-09-18  2485  	utf16_path = cifs_convert_path_to_utf16(path, cifs_sb);
d324f08d6a87149 fs/cifs/smb2ops.c       Pavel Shilovsky 2012-09-18  2486  	if (!utf16_path)
d324f08d6a87149 fs/cifs/smb2ops.c       Pavel Shilovsky 2012-09-18  2487  		return -ENOMEM;
d324f08d6a87149 fs/cifs/smb2ops.c       Pavel Shilovsky 2012-09-18  2488  
4cd21dc3081a1ac fs/smb/client/smb2ops.c Shyam Prasad N  2026-04-09  2489  	if (cfid) {
4cd21dc3081a1ac fs/smb/client/smb2ops.c Shyam Prasad N  2026-04-09  2490  		mutex_lock(&cfid->cfid_open_mutex);
4cd21dc3081a1ac fs/smb/client/smb2ops.c Shyam Prasad N  2026-04-09  2491  		cfid_open_locked = true;
4cd21dc3081a1ac fs/smb/client/smb2ops.c Shyam Prasad N  2026-04-09  2492  		use_cfid_lease = cached_dir_copy_lease_key(cfid,
4cd21dc3081a1ac fs/smb/client/smb2ops.c Shyam Prasad N  2026-04-09  2493  						      fid->lease_key);
4cd21dc3081a1ac fs/smb/client/smb2ops.c Shyam Prasad N  2026-04-09  2494  		oplock = use_cfid_lease ?
4cd21dc3081a1ac fs/smb/client/smb2ops.c Shyam Prasad N  2026-04-09  2495  			SMB2_OPLOCK_LEVEL_II : SMB2_OPLOCK_LEVEL_NONE;
4cd21dc3081a1ac fs/smb/client/smb2ops.c Shyam Prasad N  2026-04-09  2496  	}
4cd21dc3081a1ac fs/smb/client/smb2ops.c Shyam Prasad N  2026-04-09  2497  
37478608f0eb6f2 fs/cifs/smb2ops.c       Ronnie Sahlberg 2020-01-08  2498  	if (smb3_encryption_required(tcon))
37478608f0eb6f2 fs/cifs/smb2ops.c       Ronnie Sahlberg 2020-01-08  2499  		flags |= CIFS_TRANSFORM_REQ;
37478608f0eb6f2 fs/cifs/smb2ops.c       Ronnie Sahlberg 2020-01-08  2500  
3e2b0ecbc5b9c61 fs/smb/client/smb2ops.c Shyam Prasad N  2026-03-10  2501  	/*
3e2b0ecbc5b9c61 fs/smb/client/smb2ops.c Shyam Prasad N  2026-03-10  2502  	 * Clamp compound Create+QD1+QD2 response sizing to a response size
a83536312b4a62a fs/smb/client/smb2ops.c Shyam Prasad N  2026-04-08  2503  	 * suited for one credit. This keeps the first QueryDir operation
a83536312b4a62a fs/smb/client/smb2ops.c Shyam Prasad N  2026-04-08  2504  	 * simple and compatible, while smb2_query_dir_next uses multi-credit
a83536312b4a62a fs/smb/client/smb2ops.c Shyam Prasad N  2026-04-08  2505  	 * sizing for larger paginated responses.
3e2b0ecbc5b9c61 fs/smb/client/smb2ops.c Shyam Prasad N  2026-03-10  2506  	 */
3e2b0ecbc5b9c61 fs/smb/client/smb2ops.c Shyam Prasad N  2026-03-10  2507  	compound_resp_bufsize = min_t(unsigned int, CIFSMaxBufSize,
3e2b0ecbc5b9c61 fs/smb/client/smb2ops.c Shyam Prasad N  2026-03-10  2508  				      SMB2_MAX_BUFFER_SIZE);
3e2b0ecbc5b9c61 fs/smb/client/smb2ops.c Shyam Prasad N  2026-03-10  2509  
37478608f0eb6f2 fs/cifs/smb2ops.c       Ronnie Sahlberg 2020-01-08  2510  	memset(rqst, 0, sizeof(rqst));
3e2b0ecbc5b9c61 fs/smb/client/smb2ops.c Shyam Prasad N  2026-03-10  2511  	resp_buftype[0] = resp_buftype[1] = resp_buftype[2] = CIFS_NO_BUFFER;
37478608f0eb6f2 fs/cifs/smb2ops.c       Ronnie Sahlberg 2020-01-08  2512  	memset(rsp_iov, 0, sizeof(rsp_iov));
37478608f0eb6f2 fs/cifs/smb2ops.c       Ronnie Sahlberg 2020-01-08  2513  
37478608f0eb6f2 fs/cifs/smb2ops.c       Ronnie Sahlberg 2020-01-08  2514  	/* Open */
37478608f0eb6f2 fs/cifs/smb2ops.c       Ronnie Sahlberg 2020-01-08  2515  	memset(&open_iov, 0, sizeof(open_iov));
37478608f0eb6f2 fs/cifs/smb2ops.c       Ronnie Sahlberg 2020-01-08  2516  	rqst[0].rq_iov = open_iov;
37478608f0eb6f2 fs/cifs/smb2ops.c       Ronnie Sahlberg 2020-01-08  2517  	rqst[0].rq_nvec = SMB2_CREATE_IOV_SIZE;
37478608f0eb6f2 fs/cifs/smb2ops.c       Ronnie Sahlberg 2020-01-08  2518  
de036dcaca65cf9 fs/cifs/smb2ops.c       Volker Lendecke 2023-01-11  2519  	oparms = (struct cifs_open_parms) {
de036dcaca65cf9 fs/cifs/smb2ops.c       Volker Lendecke 2023-01-11  2520  		.tcon = tcon,
fddc6ccc487e5de fs/cifs/smb2ops.c       Shyam Prasad N  2023-03-17  2521  		.path = path,
de036dcaca65cf9 fs/cifs/smb2ops.c       Volker Lendecke 2023-01-11  2522  		.desired_access = FILE_READ_ATTRIBUTES | FILE_READ_DATA,
de036dcaca65cf9 fs/cifs/smb2ops.c       Volker Lendecke 2023-01-11  2523  		.disposition = FILE_OPEN,
de036dcaca65cf9 fs/cifs/smb2ops.c       Volker Lendecke 2023-01-11  2524  		.create_options = cifs_create_options(cifs_sb, 0),
de036dcaca65cf9 fs/cifs/smb2ops.c       Volker Lendecke 2023-01-11  2525  		.fid = fid,
79520587fe42cd4 fs/smb/client/smb2ops.c Shyam Prasad N  2024-02-09  2526  		.replay = !!(retries),
de036dcaca65cf9 fs/cifs/smb2ops.c       Volker Lendecke 2023-01-11  2527  	};
064f6047a123d61 fs/cifs/smb2ops.c       Pavel Shilovsky 2013-07-09  2528  
352d96f3acc6e02 fs/cifs/smb2ops.c       Aurelien Aptel  2020-05-31  2529  	rc = SMB2_open_init(tcon, server,
352d96f3acc6e02 fs/cifs/smb2ops.c       Aurelien Aptel  2020-05-31  2530  			    &rqst[0], &oplock, &oparms, utf16_path);
37478608f0eb6f2 fs/cifs/smb2ops.c       Ronnie Sahlberg 2020-01-08  2531  	if (rc)
37478608f0eb6f2 fs/cifs/smb2ops.c       Ronnie Sahlberg 2020-01-08  2532  		goto qdf_free;
37478608f0eb6f2 fs/cifs/smb2ops.c       Ronnie Sahlberg 2020-01-08  2533  	smb2_set_next_command(tcon, &rqst[0]);
d324f08d6a87149 fs/cifs/smb2ops.c       Pavel Shilovsky 2012-09-18  2534  
3e2b0ecbc5b9c61 fs/smb/client/smb2ops.c Shyam Prasad N  2026-03-10  2535  	/* First Query directory */
d324f08d6a87149 fs/cifs/smb2ops.c       Pavel Shilovsky 2012-09-18 @2536  	srch_inf->entries_in_buffer = 0;
0595751f267994c fs/cifs/smb2ops.c       Aurelien Aptel  2018-05-17  2537  	srch_inf->index_of_last_entry = 2;
d324f08d6a87149 fs/cifs/smb2ops.c       Pavel Shilovsky 2012-09-18  2538  
37478608f0eb6f2 fs/cifs/smb2ops.c       Ronnie Sahlberg 2020-01-08  2539  	memset(&qd_iov, 0, sizeof(qd_iov));
37478608f0eb6f2 fs/cifs/smb2ops.c       Ronnie Sahlberg 2020-01-08  2540  	rqst[1].rq_iov = qd_iov;
37478608f0eb6f2 fs/cifs/smb2ops.c       Ronnie Sahlberg 2020-01-08  2541  	rqst[1].rq_nvec = SMB2_QUERY_DIRECTORY_IOV_SIZE;
37478608f0eb6f2 fs/cifs/smb2ops.c       Ronnie Sahlberg 2020-01-08  2542  
352d96f3acc6e02 fs/cifs/smb2ops.c       Aurelien Aptel  2020-05-31  2543  	rc = SMB2_query_directory_init(xid, tcon, server,
352d96f3acc6e02 fs/cifs/smb2ops.c       Aurelien Aptel  2020-05-31  2544  				       &rqst[1],
37478608f0eb6f2 fs/cifs/smb2ops.c       Ronnie Sahlberg 2020-01-08  2545  				       COMPOUND_FID, COMPOUND_FID,
3e2b0ecbc5b9c61 fs/smb/client/smb2ops.c Shyam Prasad N  2026-03-10  2546  				       0, srch_inf->info_level,
3e2b0ecbc5b9c61 fs/smb/client/smb2ops.c Shyam Prasad N  2026-03-10  2547  				       SMB2_QD1_OUTPUT_SIZE(compound_resp_bufsize));
37478608f0eb6f2 fs/cifs/smb2ops.c       Ronnie Sahlberg 2020-01-08  2548  	if (rc)
37478608f0eb6f2 fs/cifs/smb2ops.c       Ronnie Sahlberg 2020-01-08  2549  		goto qdf_free;
37478608f0eb6f2 fs/cifs/smb2ops.c       Ronnie Sahlberg 2020-01-08  2550  
37478608f0eb6f2 fs/cifs/smb2ops.c       Ronnie Sahlberg 2020-01-08  2551  	smb2_set_related(&rqst[1]);
3e2b0ecbc5b9c61 fs/smb/client/smb2ops.c Shyam Prasad N  2026-03-10  2552  	smb2_set_next_command(tcon, &rqst[1]);
3e2b0ecbc5b9c61 fs/smb/client/smb2ops.c Shyam Prasad N  2026-03-10  2553  
3e2b0ecbc5b9c61 fs/smb/client/smb2ops.c Shyam Prasad N  2026-03-10  2554  	/* Second Query directory - minimal size to check if more data exists */
3e2b0ecbc5b9c61 fs/smb/client/smb2ops.c Shyam Prasad N  2026-03-10  2555  	memset(&qd2_iov, 0, sizeof(qd2_iov));
3e2b0ecbc5b9c61 fs/smb/client/smb2ops.c Shyam Prasad N  2026-03-10  2556  	rqst[2].rq_iov = qd2_iov;
3e2b0ecbc5b9c61 fs/smb/client/smb2ops.c Shyam Prasad N  2026-03-10  2557  	rqst[2].rq_nvec = SMB2_QUERY_DIRECTORY_IOV_SIZE;
3e2b0ecbc5b9c61 fs/smb/client/smb2ops.c Shyam Prasad N  2026-03-10  2558  
3e2b0ecbc5b9c61 fs/smb/client/smb2ops.c Shyam Prasad N  2026-03-10  2559  	rc = SMB2_query_directory_init(xid, tcon, server,
3e2b0ecbc5b9c61 fs/smb/client/smb2ops.c Shyam Prasad N  2026-03-10  2560  				       &rqst[2],
3e2b0ecbc5b9c61 fs/smb/client/smb2ops.c Shyam Prasad N  2026-03-10  2561  				       COMPOUND_FID, COMPOUND_FID,
3e2b0ecbc5b9c61 fs/smb/client/smb2ops.c Shyam Prasad N  2026-03-10  2562  				       0, srch_inf->info_level, SMB2_QD2_RESPONSE_SIZE);
3e2b0ecbc5b9c61 fs/smb/client/smb2ops.c Shyam Prasad N  2026-03-10  2563  	if (rc)
3e2b0ecbc5b9c61 fs/smb/client/smb2ops.c Shyam Prasad N  2026-03-10  2564  		goto qdf_free;
3e2b0ecbc5b9c61 fs/smb/client/smb2ops.c Shyam Prasad N  2026-03-10  2565  
3e2b0ecbc5b9c61 fs/smb/client/smb2ops.c Shyam Prasad N  2026-03-10  2566  	smb2_set_related(&rqst[2]);
37478608f0eb6f2 fs/cifs/smb2ops.c       Ronnie Sahlberg 2020-01-08  2567  
4f1fffa2376922f fs/smb/client/smb2ops.c Shyam Prasad N  2024-01-21  2568  	if (retries) {
16d480ed4990ed5 fs/smb/client/smb2ops.c Shyam Prasad N  2026-01-31  2569  		/* Back-off before retry */
16d480ed4990ed5 fs/smb/client/smb2ops.c Shyam Prasad N  2026-01-31  2570  		if (cur_sleep)
16d480ed4990ed5 fs/smb/client/smb2ops.c Shyam Prasad N  2026-01-31  2571  			msleep(cur_sleep);
4f1fffa2376922f fs/smb/client/smb2ops.c Shyam Prasad N  2024-01-21  2572  		smb2_set_replay(server, &rqst[0]);
4f1fffa2376922f fs/smb/client/smb2ops.c Shyam Prasad N  2024-01-21  2573  		smb2_set_replay(server, &rqst[1]);
3e2b0ecbc5b9c61 fs/smb/client/smb2ops.c Shyam Prasad N  2026-03-10  2574  		smb2_set_replay(server, &rqst[2]);
4f1fffa2376922f fs/smb/client/smb2ops.c Shyam Prasad N  2024-01-21  2575  	}
4f1fffa2376922f fs/smb/client/smb2ops.c Shyam Prasad N  2024-01-21  2576  
352d96f3acc6e02 fs/cifs/smb2ops.c       Aurelien Aptel  2020-05-31  2577  	rc = compound_send_recv(xid, tcon->ses, server,
3e2b0ecbc5b9c61 fs/smb/client/smb2ops.c Shyam Prasad N  2026-03-10  2578  				flags, 3, rqst,
37478608f0eb6f2 fs/cifs/smb2ops.c       Ronnie Sahlberg 2020-01-08  2579  				resp_buftype, rsp_iov);
4cd21dc3081a1ac fs/smb/client/smb2ops.c Shyam Prasad N  2026-04-09  2580  	if (cfid_open_locked) {
4cd21dc3081a1ac fs/smb/client/smb2ops.c Shyam Prasad N  2026-04-09  2581  		mutex_unlock(&cfid->cfid_open_mutex);
4cd21dc3081a1ac fs/smb/client/smb2ops.c Shyam Prasad N  2026-04-09  2582  		cfid_open_locked = false;
4cd21dc3081a1ac fs/smb/client/smb2ops.c Shyam Prasad N  2026-04-09  2583  	}
37478608f0eb6f2 fs/cifs/smb2ops.c       Ronnie Sahlberg 2020-01-08  2584  
37478608f0eb6f2 fs/cifs/smb2ops.c       Ronnie Sahlberg 2020-01-08  2585  	/* If the open failed there is nothing to do */
37478608f0eb6f2 fs/cifs/smb2ops.c       Ronnie Sahlberg 2020-01-08  2586  	op_rsp = (struct smb2_create_rsp *)rsp_iov[0].iov_base;
0d35e382e4e96a4 fs/cifs/smb2ops.c       Ronnie Sahlberg 2021-11-05  2587  	if (op_rsp == NULL || op_rsp->hdr.Status != STATUS_SUCCESS) {
37478608f0eb6f2 fs/cifs/smb2ops.c       Ronnie Sahlberg 2020-01-08  2588  		cifs_dbg(FYI, "query_dir_first: open failed rc=%d\n", rc);
37478608f0eb6f2 fs/cifs/smb2ops.c       Ronnie Sahlberg 2020-01-08  2589  		goto qdf_free;
37478608f0eb6f2 fs/cifs/smb2ops.c       Ronnie Sahlberg 2020-01-08  2590  	}
351a59dace0e0e3 fs/cifs/smb2ops.c       Paulo Alcantara 2022-03-21  2591  	fid->persistent_fid = op_rsp->PersistentFileId;
351a59dace0e0e3 fs/cifs/smb2ops.c       Paulo Alcantara 2022-03-21  2592  	fid->volatile_fid = op_rsp->VolatileFileId;
37478608f0eb6f2 fs/cifs/smb2ops.c       Ronnie Sahlberg 2020-01-08  2593  
37478608f0eb6f2 fs/cifs/smb2ops.c       Ronnie Sahlberg 2020-01-08  2594  	/* Anything else than ENODATA means a genuine error */
37478608f0eb6f2 fs/cifs/smb2ops.c       Ronnie Sahlberg 2020-01-08  2595  	if (rc && rc != -ENODATA) {
064f6047a123d61 fs/cifs/smb2ops.c       Pavel Shilovsky 2013-07-09  2596  		SMB2_close(xid, tcon, fid->persistent_fid, fid->volatile_fid);
37478608f0eb6f2 fs/cifs/smb2ops.c       Ronnie Sahlberg 2020-01-08  2597  		cifs_dbg(FYI, "query_dir_first: query directory failed rc=%d\n", rc);
37478608f0eb6f2 fs/cifs/smb2ops.c       Ronnie Sahlberg 2020-01-08  2598  		trace_smb3_query_dir_err(xid, fid->persistent_fid,
37478608f0eb6f2 fs/cifs/smb2ops.c       Ronnie Sahlberg 2020-01-08  2599  					 tcon->tid, tcon->ses->Suid, 0, 0, rc);
37478608f0eb6f2 fs/cifs/smb2ops.c       Ronnie Sahlberg 2020-01-08  2600  		goto qdf_free;
37478608f0eb6f2 fs/cifs/smb2ops.c       Ronnie Sahlberg 2020-01-08  2601  	}
37478608f0eb6f2 fs/cifs/smb2ops.c       Ronnie Sahlberg 2020-01-08  2602  
1be1fa42ebb73ad fs/cifs/smb2ops.c       Shyam Prasad N  2020-03-09  2603  	atomic_inc(&tcon->num_remote_opens);
1be1fa42ebb73ad fs/cifs/smb2ops.c       Shyam Prasad N  2020-03-09  2604  
37478608f0eb6f2 fs/cifs/smb2ops.c       Ronnie Sahlberg 2020-01-08  2605  	qd_rsp = (struct smb2_query_directory_rsp *)rsp_iov[1].iov_base;
0d35e382e4e96a4 fs/cifs/smb2ops.c       Ronnie Sahlberg 2021-11-05  2606  	if (qd_rsp->hdr.Status == STATUS_NO_MORE_FILES) {
37478608f0eb6f2 fs/cifs/smb2ops.c       Ronnie Sahlberg 2020-01-08  2607  		trace_smb3_query_dir_done(xid, fid->persistent_fid,
37478608f0eb6f2 fs/cifs/smb2ops.c       Ronnie Sahlberg 2020-01-08  2608  					  tcon->tid, tcon->ses->Suid, 0, 0);
37478608f0eb6f2 fs/cifs/smb2ops.c       Ronnie Sahlberg 2020-01-08  2609  		srch_inf->endOfSearch = true;
37478608f0eb6f2 fs/cifs/smb2ops.c       Ronnie Sahlberg 2020-01-08  2610  		rc = 0;
37478608f0eb6f2 fs/cifs/smb2ops.c       Ronnie Sahlberg 2020-01-08  2611  		goto qdf_free;
37478608f0eb6f2 fs/cifs/smb2ops.c       Ronnie Sahlberg 2020-01-08  2612  	}
37478608f0eb6f2 fs/cifs/smb2ops.c       Ronnie Sahlberg 2020-01-08  2613  
3e2b0ecbc5b9c61 fs/smb/client/smb2ops.c Shyam Prasad N  2026-03-10  2614  	qd2_rsp = (struct smb2_query_directory_rsp *)rsp_iov[2].iov_base;
3e2b0ecbc5b9c61 fs/smb/client/smb2ops.c Shyam Prasad N  2026-03-10  2615  
3e2b0ecbc5b9c61 fs/smb/client/smb2ops.c Shyam Prasad N  2026-03-10  2616  	/*
3e2b0ecbc5b9c61 fs/smb/client/smb2ops.c Shyam Prasad N  2026-03-10  2617  	 * If QD2 has data, combine QD1 and QD2 responses before parsing.
3e2b0ecbc5b9c61 fs/smb/client/smb2ops.c Shyam Prasad N  2026-03-10  2618  	 * The server cursor advances past both responses, so we can't discard QD2.
3e2b0ecbc5b9c61 fs/smb/client/smb2ops.c Shyam Prasad N  2026-03-10  2619  	 */
3e2b0ecbc5b9c61 fs/smb/client/smb2ops.c Shyam Prasad N  2026-03-10  2620  	if (qd2_rsp && qd2_rsp->hdr.Status == STATUS_SUCCESS &&
3e2b0ecbc5b9c61 fs/smb/client/smb2ops.c Shyam Prasad N  2026-03-10  2621  	    le32_to_cpu(qd2_rsp->OutputBufferLength) > 0) {
3e2b0ecbc5b9c61 fs/smb/client/smb2ops.c Shyam Prasad N  2026-03-10  2622  		char *combined_buf;
3e2b0ecbc5b9c61 fs/smb/client/smb2ops.c Shyam Prasad N  2026-03-10  2623  		size_t qd1_data_len, qd2_data_len, combined_len;
3e2b0ecbc5b9c61 fs/smb/client/smb2ops.c Shyam Prasad N  2026-03-10  2624  		u16 qd1_offset, qd2_offset;
3e2b0ecbc5b9c61 fs/smb/client/smb2ops.c Shyam Prasad N  2026-03-10  2625  		struct smb2_query_directory_rsp *combined_rsp;
3e2b0ecbc5b9c61 fs/smb/client/smb2ops.c Shyam Prasad N  2026-03-10  2626  		struct kvec combined_iov;
3e2b0ecbc5b9c61 fs/smb/client/smb2ops.c Shyam Prasad N  2026-03-10  2627  		FILE_DIRECTORY_INFO *last_entry_in_qd1;
3e2b0ecbc5b9c61 fs/smb/client/smb2ops.c Shyam Prasad N  2026-03-10  2628  		char *qd1_entries_start, *qd2_entries_start;
3e2b0ecbc5b9c61 fs/smb/client/smb2ops.c Shyam Prasad N  2026-03-10  2629  		unsigned int next_offset;
3e2b0ecbc5b9c61 fs/smb/client/smb2ops.c Shyam Prasad N  2026-03-10  2630  
3e2b0ecbc5b9c61 fs/smb/client/smb2ops.c Shyam Prasad N  2026-03-10  2631  		qd1_offset = le16_to_cpu(qd_rsp->OutputBufferOffset);
3e2b0ecbc5b9c61 fs/smb/client/smb2ops.c Shyam Prasad N  2026-03-10  2632  		qd2_offset = le16_to_cpu(qd2_rsp->OutputBufferOffset);
3e2b0ecbc5b9c61 fs/smb/client/smb2ops.c Shyam Prasad N  2026-03-10  2633  		qd1_data_len = le32_to_cpu(qd_rsp->OutputBufferLength);
3e2b0ecbc5b9c61 fs/smb/client/smb2ops.c Shyam Prasad N  2026-03-10  2634  		qd2_data_len = le32_to_cpu(qd2_rsp->OutputBufferLength);
3e2b0ecbc5b9c61 fs/smb/client/smb2ops.c Shyam Prasad N  2026-03-10  2635  
3e2b0ecbc5b9c61 fs/smb/client/smb2ops.c Shyam Prasad N  2026-03-10  2636  		/* Allocate buffer for: QD1 header + QD1 data + QD2 data */
3e2b0ecbc5b9c61 fs/smb/client/smb2ops.c Shyam Prasad N  2026-03-10  2637  		combined_len = qd1_offset + qd1_data_len + qd2_data_len;
3e2b0ecbc5b9c61 fs/smb/client/smb2ops.c Shyam Prasad N  2026-03-10  2638  		combined_buf = kmalloc(combined_len, GFP_KERNEL);
3e2b0ecbc5b9c61 fs/smb/client/smb2ops.c Shyam Prasad N  2026-03-10  2639  		if (!combined_buf) {
3e2b0ecbc5b9c61 fs/smb/client/smb2ops.c Shyam Prasad N  2026-03-10  2640  			rc = -ENOMEM;
3e2b0ecbc5b9c61 fs/smb/client/smb2ops.c Shyam Prasad N  2026-03-10  2641  			goto qdf_free;
3e2b0ecbc5b9c61 fs/smb/client/smb2ops.c Shyam Prasad N  2026-03-10  2642  		}
3e2b0ecbc5b9c61 fs/smb/client/smb2ops.c Shyam Prasad N  2026-03-10  2643  
3e2b0ecbc5b9c61 fs/smb/client/smb2ops.c Shyam Prasad N  2026-03-10  2644  		/* Copy QD1 header and data */
3e2b0ecbc5b9c61 fs/smb/client/smb2ops.c Shyam Prasad N  2026-03-10  2645  		memcpy(combined_buf, qd_rsp, qd1_offset + qd1_data_len);
3e2b0ecbc5b9c61 fs/smb/client/smb2ops.c Shyam Prasad N  2026-03-10  2646  
3e2b0ecbc5b9c61 fs/smb/client/smb2ops.c Shyam Prasad N  2026-03-10  2647  		/* Append QD2 data (directory entries only, not the header) */
3e2b0ecbc5b9c61 fs/smb/client/smb2ops.c Shyam Prasad N  2026-03-10  2648  		memcpy(combined_buf + qd1_offset + qd1_data_len,
3e2b0ecbc5b9c61 fs/smb/client/smb2ops.c Shyam Prasad N  2026-03-10  2649  		       (char *)qd2_rsp + qd2_offset, qd2_data_len);
3e2b0ecbc5b9c61 fs/smb/client/smb2ops.c Shyam Prasad N  2026-03-10  2650  
3e2b0ecbc5b9c61 fs/smb/client/smb2ops.c Shyam Prasad N  2026-03-10  2651  		/* Update OutputBufferLength to reflect combined data */
3e2b0ecbc5b9c61 fs/smb/client/smb2ops.c Shyam Prasad N  2026-03-10  2652  		combined_rsp = (struct smb2_query_directory_rsp *)combined_buf;
3e2b0ecbc5b9c61 fs/smb/client/smb2ops.c Shyam Prasad N  2026-03-10  2653  		combined_rsp->OutputBufferLength = cpu_to_le32(qd1_data_len + qd2_data_len);
3e2b0ecbc5b9c61 fs/smb/client/smb2ops.c Shyam Prasad N  2026-03-10  2654  
3e2b0ecbc5b9c61 fs/smb/client/smb2ops.c Shyam Prasad N  2026-03-10  2655  		/*
3e2b0ecbc5b9c61 fs/smb/client/smb2ops.c Shyam Prasad N  2026-03-10  2656  		 * Chain QD1 and QD2 entries: find the last entry in QD1 and update
3e2b0ecbc5b9c61 fs/smb/client/smb2ops.c Shyam Prasad N  2026-03-10  2657  		 * its NextEntryOffset to point to the first entry in QD2.
3e2b0ecbc5b9c61 fs/smb/client/smb2ops.c Shyam Prasad N  2026-03-10  2658  		 */
3e2b0ecbc5b9c61 fs/smb/client/smb2ops.c Shyam Prasad N  2026-03-10  2659  		if (qd1_data_len > 0) {
3e2b0ecbc5b9c61 fs/smb/client/smb2ops.c Shyam Prasad N  2026-03-10  2660  			qd1_entries_start = combined_buf + qd1_offset;
3e2b0ecbc5b9c61 fs/smb/client/smb2ops.c Shyam Prasad N  2026-03-10  2661  			qd2_entries_start = combined_buf + qd1_offset + qd1_data_len;
3e2b0ecbc5b9c61 fs/smb/client/smb2ops.c Shyam Prasad N  2026-03-10  2662  			last_entry_in_qd1 = (FILE_DIRECTORY_INFO *)qd1_entries_start;
3e2b0ecbc5b9c61 fs/smb/client/smb2ops.c Shyam Prasad N  2026-03-10  2663  
3e2b0ecbc5b9c61 fs/smb/client/smb2ops.c Shyam Prasad N  2026-03-10  2664  			/* Walk QD1 entries to find the last one with bounds checking */
3e2b0ecbc5b9c61 fs/smb/client/smb2ops.c Shyam Prasad N  2026-03-10  2665  			while (1) {
3e2b0ecbc5b9c61 fs/smb/client/smb2ops.c Shyam Prasad N  2026-03-10  2666  				char *end_of_qd1 = qd1_entries_start + qd1_data_len;
3e2b0ecbc5b9c61 fs/smb/client/smb2ops.c Shyam Prasad N  2026-03-10  2667  
3e2b0ecbc5b9c61 fs/smb/client/smb2ops.c Shyam Prasad N  2026-03-10  2668  				next_offset = le32_to_cpu(last_entry_in_qd1->NextEntryOffset);
3e2b0ecbc5b9c61 fs/smb/client/smb2ops.c Shyam Prasad N  2026-03-10  2669  				if (next_offset == 0)
3e2b0ecbc5b9c61 fs/smb/client/smb2ops.c Shyam Prasad N  2026-03-10  2670  					break;  /* Found last entry */
3e2b0ecbc5b9c61 fs/smb/client/smb2ops.c Shyam Prasad N  2026-03-10  2671  
3e2b0ecbc5b9c61 fs/smb/client/smb2ops.c Shyam Prasad N  2026-03-10  2672  				/* Bounds check before advancing */
3e2b0ecbc5b9c61 fs/smb/client/smb2ops.c Shyam Prasad N  2026-03-10  2673  				if ((char *)last_entry_in_qd1 + next_offset >= end_of_qd1) {
3e2b0ecbc5b9c61 fs/smb/client/smb2ops.c Shyam Prasad N  2026-03-10  2674  					cifs_dbg(VFS, "query_dir_first: invalid NextEntryOffset in QD1\n");
3e2b0ecbc5b9c61 fs/smb/client/smb2ops.c Shyam Prasad N  2026-03-10  2675  					kfree(combined_buf);
3e2b0ecbc5b9c61 fs/smb/client/smb2ops.c Shyam Prasad N  2026-03-10  2676  					rc = -EIO;
3e2b0ecbc5b9c61 fs/smb/client/smb2ops.c Shyam Prasad N  2026-03-10  2677  					goto qdf_free;
3e2b0ecbc5b9c61 fs/smb/client/smb2ops.c Shyam Prasad N  2026-03-10  2678  				}
3e2b0ecbc5b9c61 fs/smb/client/smb2ops.c Shyam Prasad N  2026-03-10  2679  
3e2b0ecbc5b9c61 fs/smb/client/smb2ops.c Shyam Prasad N  2026-03-10  2680  				last_entry_in_qd1 = (FILE_DIRECTORY_INFO *)
3e2b0ecbc5b9c61 fs/smb/client/smb2ops.c Shyam Prasad N  2026-03-10  2681  					((char *)last_entry_in_qd1 + next_offset);
3e2b0ecbc5b9c61 fs/smb/client/smb2ops.c Shyam Prasad N  2026-03-10  2682  			}
3e2b0ecbc5b9c61 fs/smb/client/smb2ops.c Shyam Prasad N  2026-03-10  2683  
3e2b0ecbc5b9c61 fs/smb/client/smb2ops.c Shyam Prasad N  2026-03-10  2684  			/* Chain last QD1 entry to first QD2 entry */
3e2b0ecbc5b9c61 fs/smb/client/smb2ops.c Shyam Prasad N  2026-03-10  2685  			last_entry_in_qd1->NextEntryOffset =
3e2b0ecbc5b9c61 fs/smb/client/smb2ops.c Shyam Prasad N  2026-03-10  2686  				cpu_to_le32(qd2_entries_start - (char *)last_entry_in_qd1);
3e2b0ecbc5b9c61 fs/smb/client/smb2ops.c Shyam Prasad N  2026-03-10  2687  		}
3e2b0ecbc5b9c61 fs/smb/client/smb2ops.c Shyam Prasad N  2026-03-10  2688  
3e2b0ecbc5b9c61 fs/smb/client/smb2ops.c Shyam Prasad N  2026-03-10  2689  		/* Parse the combined buffer */
3e2b0ecbc5b9c61 fs/smb/client/smb2ops.c Shyam Prasad N  2026-03-10  2690  		combined_iov.iov_base = combined_buf;
3e2b0ecbc5b9c61 fs/smb/client/smb2ops.c Shyam Prasad N  2026-03-10  2691  		combined_iov.iov_len = combined_len;
3e2b0ecbc5b9c61 fs/smb/client/smb2ops.c Shyam Prasad N  2026-03-10  2692  		rc = smb2_parse_query_directory(tcon, &combined_iov, CIFS_DYNAMIC_BUFFER,
3e2b0ecbc5b9c61 fs/smb/client/smb2ops.c Shyam Prasad N  2026-03-10  2693  						srch_inf);
3e2b0ecbc5b9c61 fs/smb/client/smb2ops.c Shyam Prasad N  2026-03-10  2694  		if (rc) {
3e2b0ecbc5b9c61 fs/smb/client/smb2ops.c Shyam Prasad N  2026-03-10  2695  			kfree(combined_buf);
3e2b0ecbc5b9c61 fs/smb/client/smb2ops.c Shyam Prasad N  2026-03-10  2696  			trace_smb3_query_dir_err(xid, fid->persistent_fid, tcon->tid,
3e2b0ecbc5b9c61 fs/smb/client/smb2ops.c Shyam Prasad N  2026-03-10  2697  						 tcon->ses->Suid, 0, 0, rc);
3e2b0ecbc5b9c61 fs/smb/client/smb2ops.c Shyam Prasad N  2026-03-10  2698  			goto qdf_free;
3e2b0ecbc5b9c61 fs/smb/client/smb2ops.c Shyam Prasad N  2026-03-10  2699  		}
3e2b0ecbc5b9c61 fs/smb/client/smb2ops.c Shyam Prasad N  2026-03-10  2700  		/* Ownership of combined_buf transferred to srch_inf->ntwrk_buf_start */
3e2b0ecbc5b9c61 fs/smb/client/smb2ops.c Shyam Prasad N  2026-03-10  2701  		srch_inf->endOfSearch = false;
3e2b0ecbc5b9c61 fs/smb/client/smb2ops.c Shyam Prasad N  2026-03-10  2702  		cifs_dbg(FYI, "query_dir_first: combined QD1 and QD2, %d entries\n",
3e2b0ecbc5b9c61 fs/smb/client/smb2ops.c Shyam Prasad N  2026-03-10  2703  			 srch_inf->entries_in_buffer);
3e2b0ecbc5b9c61 fs/smb/client/smb2ops.c Shyam Prasad N  2026-03-10  2704  	} else {
3e2b0ecbc5b9c61 fs/smb/client/smb2ops.c Shyam Prasad N  2026-03-10  2705  		/* No data in QD2, just parse QD1 */
37478608f0eb6f2 fs/cifs/smb2ops.c       Ronnie Sahlberg 2020-01-08  2706  		rc = smb2_parse_query_directory(tcon, &rsp_iov[1], resp_buftype[1],
37478608f0eb6f2 fs/cifs/smb2ops.c       Ronnie Sahlberg 2020-01-08  2707  						srch_inf);
37478608f0eb6f2 fs/cifs/smb2ops.c       Ronnie Sahlberg 2020-01-08  2708  		if (rc) {
37478608f0eb6f2 fs/cifs/smb2ops.c       Ronnie Sahlberg 2020-01-08  2709  			trace_smb3_query_dir_err(xid, fid->persistent_fid, tcon->tid,
37478608f0eb6f2 fs/cifs/smb2ops.c       Ronnie Sahlberg 2020-01-08  2710  						 tcon->ses->Suid, 0, 0, rc);
37478608f0eb6f2 fs/cifs/smb2ops.c       Ronnie Sahlberg 2020-01-08  2711  			goto qdf_free;
d324f08d6a87149 fs/cifs/smb2ops.c       Pavel Shilovsky 2012-09-18  2712  		}
37478608f0eb6f2 fs/cifs/smb2ops.c       Ronnie Sahlberg 2020-01-08  2713  		resp_buftype[1] = CIFS_NO_BUFFER;
37478608f0eb6f2 fs/cifs/smb2ops.c       Ronnie Sahlberg 2020-01-08  2714  
3e2b0ecbc5b9c61 fs/smb/client/smb2ops.c Shyam Prasad N  2026-03-10  2715  		/* Check if QD2 indicates end of directory */
3e2b0ecbc5b9c61 fs/smb/client/smb2ops.c Shyam Prasad N  2026-03-10  2716  		if (qd2_rsp && qd2_rsp->hdr.Status == STATUS_NO_MORE_FILES) {
3e2b0ecbc5b9c61 fs/smb/client/smb2ops.c Shyam Prasad N  2026-03-10  2717  			srch_inf->endOfSearch = true;
3e2b0ecbc5b9c61 fs/smb/client/smb2ops.c Shyam Prasad N  2026-03-10  2718  			cifs_dbg(FYI, "query_dir_first: small directory, all entries read\n");
3e2b0ecbc5b9c61 fs/smb/client/smb2ops.c Shyam Prasad N  2026-03-10  2719  		}
3e2b0ecbc5b9c61 fs/smb/client/smb2ops.c Shyam Prasad N  2026-03-10  2720  	}
3e2b0ecbc5b9c61 fs/smb/client/smb2ops.c Shyam Prasad N  2026-03-10  2721  
37478608f0eb6f2 fs/cifs/smb2ops.c       Ronnie Sahlberg 2020-01-08  2722  	trace_smb3_query_dir_done(xid, fid->persistent_fid, tcon->tid,
37478608f0eb6f2 fs/cifs/smb2ops.c       Ronnie Sahlberg 2020-01-08  2723  			tcon->ses->Suid, 0, srch_inf->entries_in_buffer);
37478608f0eb6f2 fs/cifs/smb2ops.c       Ronnie Sahlberg 2020-01-08  2724  
37478608f0eb6f2 fs/cifs/smb2ops.c       Ronnie Sahlberg 2020-01-08  2725   qdf_free:
4cd21dc3081a1ac fs/smb/client/smb2ops.c Shyam Prasad N  2026-04-09  2726  	if (cfid_open_locked)
4cd21dc3081a1ac fs/smb/client/smb2ops.c Shyam Prasad N  2026-04-09  2727  		mutex_unlock(&cfid->cfid_open_mutex);
37478608f0eb6f2 fs/cifs/smb2ops.c       Ronnie Sahlberg 2020-01-08  2728  	kfree(utf16_path);
37478608f0eb6f2 fs/cifs/smb2ops.c       Ronnie Sahlberg 2020-01-08  2729  	SMB2_open_free(&rqst[0]);
37478608f0eb6f2 fs/cifs/smb2ops.c       Ronnie Sahlberg 2020-01-08  2730  	SMB2_query_directory_free(&rqst[1]);
3e2b0ecbc5b9c61 fs/smb/client/smb2ops.c Shyam Prasad N  2026-03-10  2731  	SMB2_query_directory_free(&rqst[2]);
37478608f0eb6f2 fs/cifs/smb2ops.c       Ronnie Sahlberg 2020-01-08  2732  	free_rsp_buf(resp_buftype[0], rsp_iov[0].iov_base);
37478608f0eb6f2 fs/cifs/smb2ops.c       Ronnie Sahlberg 2020-01-08  2733  	free_rsp_buf(resp_buftype[1], rsp_iov[1].iov_base);
3e2b0ecbc5b9c61 fs/smb/client/smb2ops.c Shyam Prasad N  2026-03-10  2734  	free_rsp_buf(resp_buftype[2], rsp_iov[2].iov_base);
4f1fffa2376922f fs/smb/client/smb2ops.c Shyam Prasad N  2024-01-21  2735  
4f1fffa2376922f fs/smb/client/smb2ops.c Shyam Prasad N  2024-01-21  2736  	if (is_replayable_error(rc) &&
4f1fffa2376922f fs/smb/client/smb2ops.c Shyam Prasad N  2024-01-21  2737  	    smb2_should_replay(tcon, &retries, &cur_sleep))
4f1fffa2376922f fs/smb/client/smb2ops.c Shyam Prasad N  2024-01-21  2738  		goto replay_again;
4f1fffa2376922f fs/smb/client/smb2ops.c Shyam Prasad N  2024-01-21  2739  
d324f08d6a87149 fs/cifs/smb2ops.c       Pavel Shilovsky 2012-09-18  2740  	return rc;
d324f08d6a87149 fs/cifs/smb2ops.c       Pavel Shilovsky 2012-09-18  2741  }
d324f08d6a87149 fs/cifs/smb2ops.c       Pavel Shilovsky 2012-09-18  2742  

:::::: The code at line 2536 was first introduced by commit
:::::: d324f08d6a87149597817f4496ef0f7ac185e8da CIFS: Add readdir support for SMB2

:::::: TO: Pavel Shilovsky <pshilovsky@samba.org>
:::::: CC: Steve French <smfrench@gmail.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
