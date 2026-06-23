Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CEE83A7F69
	for <oe-kbuild@lists.linux.dev>; Tue, 23 Jun 2026 05:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782193312; cv=none; b=DHIKRPFY7Ed8irDnn3CeI+qMRb4cdz6zC6tnlcITRKQTxKrsBJZbqPyqNMOtAc92mMmNVfFsQiIuaRsLWzMTMBV9b7NWYmNHQnjfbu+NopI+qD7dqbCoHtAH1aA8tzsss0bhUVqXBPYaRupN/Ybbes+WQeqozDPSBX35g5+hYJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782193312; c=relaxed/simple;
	bh=UeSIsW7xNm8AyW7WQlCwWHqmpWSlAjX25Aya6gonhc4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=q18B/jXPJdf0ADNTUiMQT9IWSsPHhXz1T/X2TPW0WmOx4hTpboz9bCdGUY46WV0vXgD/hR8achKDdsWYrNkzo8tShm7ES6rp4In6ifJ5rG6sciDTdemsDtcBy/v52VWwgghn65md8SPwF2kAxh8qmMhWf5rTsNftfPffBaG0tEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d6bbP2Ng; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d6bbP2Ng"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-69690062350so4884399a12.0
        for <oe-kbuild@lists.linux.dev>; Mon, 22 Jun 2026 22:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782193309; x=1782798109; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gAU5DWKEEB7jPKrYgKa0RfpCoN16wq7td9T/zDSrym0=;
        b=d6bbP2NgP3t9l6XoNaX6a0NCmbZO17PmLRTXHKVoJrHzC4LNALfR0Hk+iCfpF7pMgO
         oiN/9HXHa3mT8AQxelpXmmJJvoZdY0rP1Hot/lPKwxODu2PMIj3LlMM94xdmqnO0ZtGo
         7psYAr+tlcRnPO6rln8iVez+0fr1/9vsYhZINjZCRhY6RUidMvPYL+2RDDIMxo0PylVb
         TEaQOKPEux1EU6yV7jgKx6sd6UrIPEEVlw56fhIneTonUsT5xj1+RgE1Yt/zs6DSGD4i
         pQxanfzSzfGS9c7uPodLeR5FepUbiXO/iXUf8xmsaLF6TjfToId21dEb2UUxyPc5AomG
         r3Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782193309; x=1782798109;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gAU5DWKEEB7jPKrYgKa0RfpCoN16wq7td9T/zDSrym0=;
        b=SZkxXOJNJeu/YPOabvNi7aZiKBdbq9+QfLBj+b7WT6BO/Xj0V2l7O03MvgEkaqN098
         9M4V7Gcn90yytZX9qeY20jc/hwhnOrlXjEPlz5k0XkisfIm8KC8oPJT9qCA1yAWIMFDv
         7Kh/Qp4P4PP1SR3S6Dbo+7KLQI/RZc7nOUkGH0US17mhaPMT1pi3G3zamzkRnf2/r3cy
         gyNJTiqxUuNlK5a/iPc5RiMlR5/9FFxW4A7+CZnSKoHF4KU/YstfRc5Ur4p2GsGvGJeB
         QQ4aeCY+JsmurM28LUMmxTsavDZKe07JUoEdX3AnBlMyrC/1wn6FeOaQa2HpcxdZx79y
         gxWQ==
X-Gm-Message-State: AOJu0Yx05GVPcUvsBxj2l4KS9mZEVVcvEubBA3HN7hiHBnki+6wIV13T
	Cnjwu5Tsv3YFqbEW97Ic1BhNTSGwcay/z/swe8NpIJh+DJpFgm2qy5WLhygQqw==
X-Gm-Gg: AfdE7clNZ7aTFno/rm2LmbsaGqc6xQt6TcqWDwO0mSLNlGL4yJSGgFeNzgRN5ZbEgm4
	2j2cxzgimE9zaEz7wc280R+s5/NkGCVr330aRIHeKoKRjpNvLgEChWN22r7/QU9DN4S04BdBk0y
	Ay280nF9ljqsfkT1P/JatMsBwpfYuTvLR/B5zk/m73x6AngLf8KlCFovKTUjn2+fz8jlgiCRvTd
	ioOjafrCsngH4nxYONBspl/cOahhuhAbJhjh1fBjMaD4wSHEh5j5/SpTlzNkjl1xvQCiCYjlEJQ
	75pOGXEHvA6ufZo+BrpR4BkeZS/7eJVzxy1YFuTIVxEr6wqYbZ+E2jdYqKUzXDQahvYgtYbJnjN
	dRy3ijKTnIcQ0+xC9XGsEqZYtGOhsFF4ve8lgQ932G59D2GDXwSEGmGqOlQSX9bCa4wnZ/Y33sI
	3C2sydcgZh
X-Received: by 2002:a17:907:db17:b0:bd8:d86d:568a with SMTP id a640c23a62f3a-c108f0fc519mr43378266b.47.1782193308268;
        Mon, 22 Jun 2026 22:41:48 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c5e4a14d4sm456500766b.7.2026.06.22.22.41.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 22:41:47 -0700 (PDT)
Date: Tue, 23 Jun 2026 08:41:43 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Shyam Prasad N <sprasad@microsoft.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Steve French <stfrench@microsoft.com>
Subject: [linux-next:master 14532/14705] fs/smb/client/smb2ops.c:2536
 smb2_query_dir_first() error: we previously assumed 'srch_inf' could be null
 (see line 2472)
Message-ID: <202606230844.phrBIl9m-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20260623054143.Jy0E4kJ4EB-39MZTpXgxEQPWDi7LvjI95RAeUkax4Ds@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   948efecf22e49aa4bf55bb73ec79a0ddcfd38571
commit: 4cd21dc3081a1ac48a9f7dced566588787446be5 [14532/14705] cifs: query dir should reuse cfid even if not fully cached
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
                                                                                                          ^^^^^^^^
The patch introduces a new NULL check

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

But the old code assumed it was non-NULL and dereferenced it
without checking throughout this function.

d324f08d6a87149 fs/cifs/smb2ops.c       Pavel Shilovsky 2012-09-18  2538  
37478608f0eb6f2 fs/cifs/smb2ops.c       Ronnie Sahlberg 2020-01-08  2539  	memset(&qd_iov, 0, sizeof(qd_iov));
37478608f0eb6f2 fs/cifs/smb2ops.c       Ronnie Sahlberg 2020-01-08  2540  	rqst[1].rq_iov = qd_iov;

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

