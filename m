Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D88E2D9EE0
	for <oe-kbuild@lists.linux.dev>; Fri,  3 Oct 2025 17:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759512059; cv=none; b=EgDn+XpAL4EvovgDMXivsIfSNC2zyMDyoUArko8fhQvi/vNV0TUuOudEVdcN7HY8vyAPg0Lv/8oGMeBJvRmR3Iaq7PGC07iYnUCU1E2e+y6McgQmqmvuTd7aiWuYO73mRrGvNR+cW5Bqhpi/sPqFkzA/550R2zfhF/BD82k84fU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759512059; c=relaxed/simple;
	bh=C9CpBLzw1pO3vtP9TOCHCa6fzRdReKRfq65D5kQW2jE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=VmjpfJy16qpcA0IbipGt5eB6Mn7EGXXbkzQyrIUCbmso/m8nnuXfW+Y7qndMhLXYJCkHjrEulaZus5fNFtOZTtittCZvHk6KCvlv3Jz0Cv9F3cgh73n3K1Y6OSckRxgfVO9bpaFmSwCQgsk56TumQCnekUJfC1lSa8FiyNi6HWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Tefqo/FV; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Tefqo/FV"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3f0308469a4so1360836f8f.0
        for <oe-kbuild@lists.linux.dev>; Fri, 03 Oct 2025 10:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759512055; x=1760116855; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=K1jUhJGkvuXEQLZn2ZvNWi0i88zQ8eeDqvcxRlddFH8=;
        b=Tefqo/FVgyiN91J3iiSx67tc58joaAmRc8pL9U+6gAi8z3qNaaEju9JOOQ+tjADVdh
         cJ8ICE4VXyJP7sE5MoZM2+4DCW5twRhWYTR5cdA6SQzC1Aqhyp+1QYqNkTiG9W3/6O2G
         Brl6y6M0Y8EIo554YqNEsks9ddG+r/9/C7CoTSAH8wDizdLD1+ZHC5EuOF/Ki0Ile5Cv
         d4eINZ41rXBNf7DgfMa+hFmtxoFBhYzJQ6Jn/P0whZA9nRIkW+FlndNFvpZ2gRs/CfkU
         w/U7agpvdhlBNzUQt2+NgblvyUnOl6QoWzmm3drpqTbHKD8fP5wCJW6Bo7h+nbcQ2oXL
         H5Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759512055; x=1760116855;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K1jUhJGkvuXEQLZn2ZvNWi0i88zQ8eeDqvcxRlddFH8=;
        b=WrKt5IMVkcyCXA875spLEtIA27e9otoTxgHnZSWQPk8qGNhw6Qolpu6n/yAPfPXyjW
         C5s+L+K2jgV51cY+ChIl4dqVQjQTOURsij5e4E3zeyQlPlq4Sg9+T4WpKb5d3sb1yz4/
         dNaI8RRkHH0Cbra/7f2HtOO4Wqcs8KKsyQyLUmK8XLL8mbUoYmIOD8Pt/UlDXzbpc1Bs
         KW0z60SWIbNQ0bXswCgS1YFKs0sUHYyjI1RNYSkdJ0B4pldoWmEA8Rpnqu/LoeDO+0ii
         eLcZ02KRVN3OmG/g1G2FfYaa2iGGTl6uMbt8gyKwdhBut7ljjJTHuspcRNwmnpHHJsNO
         yWAQ==
X-Gm-Message-State: AOJu0YxMeLmXHKc5VsD2yC8QEzSqMR0TY49IkzQQ23Fd3WwvGXo0V1mo
	8Zi5/Aq+2kY65qjsrXSQEA/V2/GYmc7S9J8RMgoP8P8MZIf7UfVDexkzuiCSsdIlg4jkWjS0IgS
	FtWKe
X-Gm-Gg: ASbGncuJhFJTJTw8K8qgzfL350ae05en3zF7Woz/Kge8ijd9pkNizNXxI5r+IENRllA
	DOE1oIw03IkPOGu2kBBXnnaCr/Tb95SHel3DAjz9TpxWzugmDZhSk/0ZDxuEYKXVd4qJ85fZl/P
	gcxHHOC2g+Kh77tvRYnq2hjqkD5DB4EDpsDiop3yP+waCdgVOf2KyEeixhRRya+Dr96kRlCpZ+l
	eVaEWA0eFQIi6SA3JtP6hxqtTU+HvVm7C6hw44jQk30Dvd3wUSa/pM9QwwHHwP14MlwBtoxdaPI
	QU4LS7ia4ia4msw7Rq9cuQeOJSlUSiWEaIct+bsEkrkKYp6WP8rCN7e9zSXB2e5N4T1RwM4D+mo
	VPDHzHO3n4xx1IYR3B/2M8nzR0Hq139P3i2A8gE32gGDe3MgHFUDl49Ug9Bt4lH8N8mk=
X-Google-Smtp-Source: AGHT+IE9qXd8T2vmx1DiEYO/pYDUzvVktkgheDcwQex8b4BwN0UphaLhZk2mruoWTzAaN8uZMCOdzA==
X-Received: by 2002:a05:6000:2086:b0:3ee:15c6:9a55 with SMTP id ffacd0b85a97d-425671c0c88mr2523518f8f.34.1759512054900;
        Fri, 03 Oct 2025 10:20:54 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4255d8e980dsm9487329f8f.36.2025.10.03.10.20.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 10:20:54 -0700 (PDT)
Date: Fri, 3 Oct 2025 20:20:50 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Enzo Matsumiya <ematsumiya@suse.de>,
	linux-cifs@vger.kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, smfrench@gmail.com,
	pc@manguebit.com, ronniesahlberg@gmail.com, sprasad@microsoft.com,
	tom@talpey.com, bharathsm@microsoft.com, henrique.carvalho@suse.com
Subject: Re: [PATCH 16/20] smb: client: add is_dir argument to query_path_info
Message-ID: <202510032329.NN83GCga-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250929132805.220558-17-ematsumiya@suse.de>
Message-ID: <20251003172050.iT6v2DkAEuz3n-ivE7ImYGmJr9bFu3C7WmDipi4Jhd0@z>

Hi Enzo,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Enzo-Matsumiya/smb-client-remove-cfids_invalidation_worker/20250929-213155
base:   v6.17
patch link:    https://lore.kernel.org/r/20250929132805.220558-17-ematsumiya%40suse.de
patch subject: [PATCH 16/20] smb: client: add is_dir argument to query_path_info
config: i386-randconfig-141-20251003 (https://download.01.org/0day-ci/archive/20251003/202510032329.NN83GCga-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202510032329.NN83GCga-lkp@intel.com/

New smatch warnings:
fs/smb/client/inode.c:1313 cifs_get_fattr() error: we previously assumed 'inode' could be null (see line 1288)

vim +/inode +1313 fs/smb/client/inode.c

a18280e7fdea1f fs/smb/client/inode.c Paulo Alcantara                   2023-08-17  1259  static int cifs_get_fattr(struct cifs_open_info_data *data,
a18280e7fdea1f fs/smb/client/inode.c Paulo Alcantara                   2023-08-17  1260  			  struct super_block *sb, int xid,
a18280e7fdea1f fs/smb/client/inode.c Paulo Alcantara                   2023-08-17  1261  			  const struct cifs_fid *fid,
a18280e7fdea1f fs/smb/client/inode.c Paulo Alcantara                   2023-08-17  1262  			  struct cifs_fattr *fattr,
a18280e7fdea1f fs/smb/client/inode.c Paulo Alcantara                   2023-08-17  1263  			  struct inode **inode,
a18280e7fdea1f fs/smb/client/inode.c Paulo Alcantara                   2023-08-17  1264  			  const char *full_path)
^1da177e4c3f41 fs/cifs/inode.c       Linus Torvalds                    2005-04-16  1265  {
a18280e7fdea1f fs/smb/client/inode.c Paulo Alcantara                   2023-08-17  1266  	struct cifs_open_info_data tmp_data = {};
1208ef1f76540b fs/cifs/inode.c       Pavel Shilovsky                   2012-05-27  1267  	struct cifs_tcon *tcon;
1208ef1f76540b fs/cifs/inode.c       Pavel Shilovsky                   2012-05-27  1268  	struct TCP_Server_Info *server;
7ffec372458d16 fs/cifs/inode.c       Jeff Layton                       2010-09-29  1269  	struct tcon_link *tlink;
^1da177e4c3f41 fs/cifs/inode.c       Linus Torvalds                    2005-04-16  1270  	struct cifs_sb_info *cifs_sb = CIFS_SB(sb);
b8f7442bc46e48 fs/cifs/inode.c       Aurelien Aptel                    2019-11-18  1271  	void *smb1_backup_rsp_buf = NULL;
b8f7442bc46e48 fs/cifs/inode.c       Aurelien Aptel                    2019-11-18  1272  	int rc = 0;
b8f7442bc46e48 fs/cifs/inode.c       Aurelien Aptel                    2019-11-18  1273  	int tmprc = 0;
^1da177e4c3f41 fs/cifs/inode.c       Linus Torvalds                    2005-04-16  1274  
7ffec372458d16 fs/cifs/inode.c       Jeff Layton                       2010-09-29  1275  	tlink = cifs_sb_tlink(cifs_sb);
7ffec372458d16 fs/cifs/inode.c       Jeff Layton                       2010-09-29  1276  	if (IS_ERR(tlink))
7ffec372458d16 fs/cifs/inode.c       Jeff Layton                       2010-09-29  1277  		return PTR_ERR(tlink);
1208ef1f76540b fs/cifs/inode.c       Pavel Shilovsky                   2012-05-27  1278  	tcon = tlink_tcon(tlink);
1208ef1f76540b fs/cifs/inode.c       Pavel Shilovsky                   2012-05-27  1279  	server = tcon->ses->server;
7ffec372458d16 fs/cifs/inode.c       Jeff Layton                       2010-09-29  1280  
b8f7442bc46e48 fs/cifs/inode.c       Aurelien Aptel                    2019-11-18  1281  	/*
b8f7442bc46e48 fs/cifs/inode.c       Aurelien Aptel                    2019-11-18  1282  	 * 1. Fetch file metadata if not provided (data)
b8f7442bc46e48 fs/cifs/inode.c       Aurelien Aptel                    2019-11-18  1283  	 */
^1da177e4c3f41 fs/cifs/inode.c       Linus Torvalds                    2005-04-16  1284  
b8f7442bc46e48 fs/cifs/inode.c       Aurelien Aptel                    2019-11-18  1285  	if (!data) {
65e58ef1dafb0c fs/smb/client/inode.c Enzo Matsumiya                    2025-09-29  1286  		bool is_dir = false;
65e58ef1dafb0c fs/smb/client/inode.c Enzo Matsumiya                    2025-09-29  1287  
65e58ef1dafb0c fs/smb/client/inode.c Enzo Matsumiya                    2025-09-29 @1288  		if (inode && *inode)

The check implies that "inode" can be NULL.  Pretty sure this
check can be removed unless something changed out of tree.

65e58ef1dafb0c fs/smb/client/inode.c Enzo Matsumiya                    2025-09-29  1289  			is_dir = S_ISDIR((*inode)->i_mode);
65e58ef1dafb0c fs/smb/client/inode.c Enzo Matsumiya                    2025-09-29  1290  
8b4e285d8ce3c6 fs/smb/client/inode.c Paulo Alcantara                   2023-08-17  1291  		rc = server->ops->query_path_info(xid, tcon, cifs_sb,
65e58ef1dafb0c fs/smb/client/inode.c Enzo Matsumiya                    2025-09-29  1292  						  full_path, &tmp_data, is_dir);
76894f3e2f7117 fs/cifs/inode.c       Paulo Alcantara                   2022-10-03  1293  		data = &tmp_data;
^1da177e4c3f41 fs/cifs/inode.c       Linus Torvalds                    2005-04-16  1294  	}
0b8f18e358384a fs/cifs/inode.c       Jeff Layton                       2009-07-09  1295  
b8f7442bc46e48 fs/cifs/inode.c       Aurelien Aptel                    2019-11-18  1296  	/*
b8f7442bc46e48 fs/cifs/inode.c       Aurelien Aptel                    2019-11-18  1297  	 * 2. Convert it to internal cifs metadata (fattr)
b8f7442bc46e48 fs/cifs/inode.c       Aurelien Aptel                    2019-11-18  1298  	 */
b8f7442bc46e48 fs/cifs/inode.c       Aurelien Aptel                    2019-11-18  1299  
b8f7442bc46e48 fs/cifs/inode.c       Aurelien Aptel                    2019-11-18  1300  	switch (rc) {
b8f7442bc46e48 fs/cifs/inode.c       Aurelien Aptel                    2019-11-18  1301  	case 0:
2e4564b31b645f fs/cifs/inode.c       Steve French                      2020-10-22  1302  		/*
2e4564b31b645f fs/cifs/inode.c       Steve French                      2020-10-22  1303  		 * If the file is a reparse point, it is more complicated
2e4564b31b645f fs/cifs/inode.c       Steve French                      2020-10-22  1304  		 * since we have to check if its reparse tag matches a known
2e4564b31b645f fs/cifs/inode.c       Steve French                      2020-10-22  1305  		 * special file type e.g. symlink or fifo or char etc.
2e4564b31b645f fs/cifs/inode.c       Steve French                      2020-10-22  1306  		 */
5f71ebc4129449 fs/smb/client/inode.c Paulo Alcantara                   2023-08-17  1307  		if (cifs_open_data_reparse(data)) {
a18280e7fdea1f fs/smb/client/inode.c Paulo Alcantara                   2023-08-17  1308  			rc = reparse_info_to_fattr(data, sb, xid, tcon,
858e74876c5cbf fs/smb/client/inode.c Paulo Alcantara                   2024-01-19  1309  						   full_path, fattr);
a18280e7fdea1f fs/smb/client/inode.c Paulo Alcantara                   2023-08-17  1310  		} else {
a18280e7fdea1f fs/smb/client/inode.c Paulo Alcantara                   2023-08-17  1311  			cifs_open_info_to_fattr(fattr, data, sb);
76894f3e2f7117 fs/cifs/inode.c       Paulo Alcantara                   2022-10-03  1312  		}
ec4535b2a1d709 fs/smb/client/inode.c Paulo Alcantara                   2024-04-08 @1313  		if (!rc && *inode &&
                                                                                                                   ^^^^^^

The rest of the function assumes inode is a valid pointer.

regards,
dan carpenter

ec4535b2a1d709 fs/smb/client/inode.c Paulo Alcantara                   2024-04-08  1314  		    (fattr->cf_flags & CIFS_FATTR_DELETE_PENDING))
fc20c523211a38 fs/smb/client/inode.c Meetakshi Setiya                  2024-03-14  1315  			cifs_mark_open_handles_for_deleted_file(*inode, full_path);
b8f7442bc46e48 fs/cifs/inode.c       Aurelien Aptel                    2019-11-18  1316  		break;
b8f7442bc46e48 fs/cifs/inode.c       Aurelien Aptel                    2019-11-18  1317  	case -EREMOTE:
b8f7442bc46e48 fs/cifs/inode.c       Aurelien Aptel                    2019-11-18  1318  		/* DFS link, no metadata available on this server */
a18280e7fdea1f fs/smb/client/inode.c Paulo Alcantara                   2023-08-17  1319  		cifs_create_junction_fattr(fattr, sb);
b9a3260f25ab5d fs/cifs/inode.c       Steve French                      2008-05-20  1320  		rc = 0;
b8f7442bc46e48 fs/cifs/inode.c       Aurelien Aptel                    2019-11-18  1321  		break;
b8f7442bc46e48 fs/cifs/inode.c       Aurelien Aptel                    2019-11-18  1322  	case -EACCES:
fb157ed226d225 fs/cifs/inode.c       Steve French                      2022-08-01  1323  #ifdef CONFIG_CIFS_ALLOW_INSECURE_LEGACY
1e77a8c204c9d1 fs/cifs/inode.c       Steve French                      2018-10-19  1324  		/*
b8f7442bc46e48 fs/cifs/inode.c       Aurelien Aptel                    2019-11-18  1325  		 * perm errors, try again with backup flags if possible
b8f7442bc46e48 fs/cifs/inode.c       Aurelien Aptel                    2019-11-18  1326  		 *
b8f7442bc46e48 fs/cifs/inode.c       Aurelien Aptel                    2019-11-18  1327  		 * For SMB2 and later the backup intent flag
b8f7442bc46e48 fs/cifs/inode.c       Aurelien Aptel                    2019-11-18  1328  		 * is already sent if needed on open and there
b8f7442bc46e48 fs/cifs/inode.c       Aurelien Aptel                    2019-11-18  1329  		 * is no path based FindFirst operation to use
b8f7442bc46e48 fs/cifs/inode.c       Aurelien Aptel                    2019-11-18  1330  		 * to retry with
1e77a8c204c9d1 fs/cifs/inode.c       Steve French                      2018-10-19  1331  		 */
b8f7442bc46e48 fs/cifs/inode.c       Aurelien Aptel                    2019-11-18  1332  		if (backup_cred(cifs_sb) && is_smb1_server(server)) {
b8f7442bc46e48 fs/cifs/inode.c       Aurelien Aptel                    2019-11-18  1333  			/* for easier reading */
76894f3e2f7117 fs/cifs/inode.c       Paulo Alcantara                   2022-10-03  1334  			FILE_ALL_INFO *fi;
b8f7442bc46e48 fs/cifs/inode.c       Aurelien Aptel                    2019-11-18  1335  			FILE_DIRECTORY_INFO *fdi;
b8f7442bc46e48 fs/cifs/inode.c       Aurelien Aptel                    2019-11-18  1336  			SEARCH_ID_FULL_DIR_INFO *si;
b8f7442bc46e48 fs/cifs/inode.c       Aurelien Aptel                    2019-11-18  1337  
b8f7442bc46e48 fs/cifs/inode.c       Aurelien Aptel                    2019-11-18  1338  			rc = cifs_backup_query_path_info(xid, tcon, sb,
b8f7442bc46e48 fs/cifs/inode.c       Aurelien Aptel                    2019-11-18  1339  							 full_path,
b8f7442bc46e48 fs/cifs/inode.c       Aurelien Aptel                    2019-11-18  1340  							 &smb1_backup_rsp_buf,
76894f3e2f7117 fs/cifs/inode.c       Paulo Alcantara                   2022-10-03  1341  							 &fi);
b8f7442bc46e48 fs/cifs/inode.c       Aurelien Aptel                    2019-11-18  1342  			if (rc)
b8f7442bc46e48 fs/cifs/inode.c       Aurelien Aptel                    2019-11-18  1343  				goto out;
1e77a8c204c9d1 fs/cifs/inode.c       Steve French                      2018-10-19  1344  
76894f3e2f7117 fs/cifs/inode.c       Paulo Alcantara                   2022-10-03  1345  			move_cifs_info_to_smb2(&data->fi, fi);
76894f3e2f7117 fs/cifs/inode.c       Paulo Alcantara                   2022-10-03  1346  			fdi = (FILE_DIRECTORY_INFO *)fi;
76894f3e2f7117 fs/cifs/inode.c       Paulo Alcantara                   2022-10-03  1347  			si = (SEARCH_ID_FULL_DIR_INFO *)fi;
c052e2b423f3ea fs/cifs/inode.c       Shirish Pargaonkar                2012-09-28  1348  
a18280e7fdea1f fs/smb/client/inode.c Paulo Alcantara                   2023-08-17  1349  			cifs_dir_info_to_fattr(fattr, fdi, cifs_sb);
a18280e7fdea1f fs/smb/client/inode.c Paulo Alcantara                   2023-08-17  1350  			fattr->cf_uniqueid = le64_to_cpu(si->UniqueId);
b8f7442bc46e48 fs/cifs/inode.c       Aurelien Aptel                    2019-11-18  1351  			/* uniqueid set, skip get inum step */
b8f7442bc46e48 fs/cifs/inode.c       Aurelien Aptel                    2019-11-18  1352  			goto handle_mnt_opt;
b8f7442bc46e48 fs/cifs/inode.c       Aurelien Aptel                    2019-11-18  1353  		} else {
b8f7442bc46e48 fs/cifs/inode.c       Aurelien Aptel                    2019-11-18  1354  			/* nothing we can do, bail out */
b8f7442bc46e48 fs/cifs/inode.c       Aurelien Aptel                    2019-11-18  1355  			goto out;
c052e2b423f3ea fs/cifs/inode.c       Shirish Pargaonkar                2012-09-28  1356  		}
fb157ed226d225 fs/cifs/inode.c       Steve French                      2022-08-01  1357  #else
fb157ed226d225 fs/cifs/inode.c       Steve French                      2022-08-01  1358  		goto out;
fb157ed226d225 fs/cifs/inode.c       Steve French                      2022-08-01  1359  #endif /* CONFIG_CIFS_ALLOW_INSECURE_LEGACY */
b8f7442bc46e48 fs/cifs/inode.c       Aurelien Aptel                    2019-11-18  1360  		break;
b8f7442bc46e48 fs/cifs/inode.c       Aurelien Aptel                    2019-11-18  1361  	default:
b8f7442bc46e48 fs/cifs/inode.c       Aurelien Aptel                    2019-11-18  1362  		cifs_dbg(FYI, "%s: unhandled err rc %d\n", __func__, rc);
b8f7442bc46e48 fs/cifs/inode.c       Aurelien Aptel                    2019-11-18  1363  		goto out;
132ac7b77cc95a fs/cifs/inode.c       Jeff Layton                       2009-02-10  1364  	}
b8f7442bc46e48 fs/cifs/inode.c       Aurelien Aptel                    2019-11-18  1365  
a108471b5730b5 fs/cifs/inode.c       Ross Lagerwall                    2015-12-02  1366  	/*
a18280e7fdea1f fs/smb/client/inode.c Paulo Alcantara                   2023-08-17  1367  	 * 3. Get or update inode number (fattr->cf_uniqueid)
a108471b5730b5 fs/cifs/inode.c       Ross Lagerwall                    2015-12-02  1368  	 */
b8f7442bc46e48 fs/cifs/inode.c       Aurelien Aptel                    2019-11-18  1369  
a18280e7fdea1f fs/smb/client/inode.c Paulo Alcantara                   2023-08-17  1370  	cifs_set_fattr_ino(xid, tcon, sb, inode, full_path, data, fattr);
b8f7442bc46e48 fs/cifs/inode.c       Aurelien Aptel                    2019-11-18  1371  
7ea884c77e5c97 fs/cifs/inode.c       Steve French                      2018-03-31  1372  	/*
b8f7442bc46e48 fs/cifs/inode.c       Aurelien Aptel                    2019-11-18  1373  	 * 4. Tweak fattr based on mount options
7ea884c77e5c97 fs/cifs/inode.c       Steve French                      2018-03-31  1374  	 */
fb157ed226d225 fs/cifs/inode.c       Steve French                      2022-08-01  1375  #ifdef CONFIG_CIFS_ALLOW_INSECURE_LEGACY
b8f7442bc46e48 fs/cifs/inode.c       Aurelien Aptel                    2019-11-18  1376  handle_mnt_opt:
fb157ed226d225 fs/cifs/inode.c       Steve French                      2022-08-01  1377  #endif /* CONFIG_CIFS_ALLOW_INSECURE_LEGACY */
0b8f18e358384a fs/cifs/inode.c       Jeff Layton                       2009-07-09  1378  	/* query for SFU type info if supported and needed */
a18280e7fdea1f fs/smb/client/inode.c Paulo Alcantara                   2023-08-17  1379  	if ((fattr->cf_cifsattrs & ATTR_SYSTEM) &&
a18280e7fdea1f fs/smb/client/inode.c Paulo Alcantara                   2023-08-17  1380  	    (cifs_sb->mnt_cifs_flags & CIFS_MOUNT_UNX_EMUL)) {
a18280e7fdea1f fs/smb/client/inode.c Paulo Alcantara                   2023-08-17  1381  		tmprc = cifs_sfu_type(fattr, full_path, cifs_sb, xid);
0b8f18e358384a fs/cifs/inode.c       Jeff Layton                       2009-07-09  1382  		if (tmprc)
f96637be081141 fs/cifs/inode.c       Joe Perches                       2013-05-04  1383  			cifs_dbg(FYI, "cifs_sfu_type failed: %d\n", tmprc);
^1da177e4c3f41 fs/cifs/inode.c       Linus Torvalds                    2005-04-16  1384  	}
^1da177e4c3f41 fs/cifs/inode.c       Linus Torvalds                    2005-04-16  1385  
953f868138dbf4 fs/cifs/inode.c       Steve French                      2007-10-31  1386  	/* fill in 0777 bits from ACL */
e2f8fbfb8d09c0 fs/cifs/inode.c       Steve French                      2019-07-19  1387  	if (cifs_sb->mnt_cifs_flags & CIFS_MOUNT_MODE_FROM_SID) {
a18280e7fdea1f fs/smb/client/inode.c Paulo Alcantara                   2023-08-17  1388  		rc = cifs_acl_to_fattr(cifs_sb, fattr, *inode,
a18280e7fdea1f fs/smb/client/inode.c Paulo Alcantara                   2023-08-17  1389  				       true, full_path, fid);
01ec372cef1e5a fs/cifs/inode.c       Ronnie Sahlberg                   2020-09-03  1390  		if (rc == -EREMOTE)
01ec372cef1e5a fs/cifs/inode.c       Ronnie Sahlberg                   2020-09-03  1391  			rc = 0;
e2f8fbfb8d09c0 fs/cifs/inode.c       Steve French                      2019-07-19  1392  		if (rc) {
e2f8fbfb8d09c0 fs/cifs/inode.c       Steve French                      2019-07-19  1393  			cifs_dbg(FYI, "%s: Get mode from SID failed. rc=%d\n",
e2f8fbfb8d09c0 fs/cifs/inode.c       Steve French                      2019-07-19  1394  				 __func__, rc);
b8f7442bc46e48 fs/cifs/inode.c       Aurelien Aptel                    2019-11-18  1395  			goto out;
e2f8fbfb8d09c0 fs/cifs/inode.c       Steve French                      2019-07-19  1396  		}
e2f8fbfb8d09c0 fs/cifs/inode.c       Steve French                      2019-07-19  1397  	} else if (cifs_sb->mnt_cifs_flags & CIFS_MOUNT_CIFS_ACL) {
a18280e7fdea1f fs/smb/client/inode.c Paulo Alcantara                   2023-08-17  1398  		rc = cifs_acl_to_fattr(cifs_sb, fattr, *inode,
a18280e7fdea1f fs/smb/client/inode.c Paulo Alcantara                   2023-08-17  1399  				       false, full_path, fid);
01ec372cef1e5a fs/cifs/inode.c       Ronnie Sahlberg                   2020-09-03  1400  		if (rc == -EREMOTE)
01ec372cef1e5a fs/cifs/inode.c       Ronnie Sahlberg                   2020-09-03  1401  			rc = 0;
68464b88cc0a73 fs/cifs/inode.c       Dan Carpenter via samba-technical 2019-11-26  1402  		if (rc) {
f96637be081141 fs/cifs/inode.c       Joe Perches                       2013-05-04  1403  			cifs_dbg(FYI, "%s: Getting ACL failed with error: %d\n",
78415d2d306bfe fs/cifs/inode.c       Shirish Pargaonkar                2010-11-27  1404  				 __func__, rc);
b8f7442bc46e48 fs/cifs/inode.c       Aurelien Aptel                    2019-11-18  1405  			goto out;
78415d2d306bfe fs/cifs/inode.c       Shirish Pargaonkar                2010-11-27  1406  		}
2f3017e7cc7515 fs/smb/client/inode.c Steve French                      2024-09-21  1407  	} else if (cifs_sb->mnt_cifs_flags & CIFS_MOUNT_UNX_EMUL)
0b8f18e358384a fs/cifs/inode.c       Jeff Layton                       2009-07-09  1408  		/* fill in remaining high mode bits e.g. SUID, VTX */
a18280e7fdea1f fs/smb/client/inode.c Paulo Alcantara                   2023-08-17  1409  		cifs_sfu_mode(fattr, full_path, cifs_sb, xid);
2f3017e7cc7515 fs/smb/client/inode.c Steve French                      2024-09-21  1410  	else if (!(tcon->posix_extensions))
2f3017e7cc7515 fs/smb/client/inode.c Steve French                      2024-09-21  1411  		/* clear write bits if ATTR_READONLY is set */
2f3017e7cc7515 fs/smb/client/inode.c Steve French                      2024-09-21  1412  		if (fattr->cf_cifsattrs & ATTR_READONLY)
2f3017e7cc7515 fs/smb/client/inode.c Steve French                      2024-09-21  1413  			fattr->cf_mode &= ~(S_IWUGO);
2f3017e7cc7515 fs/smb/client/inode.c Steve French                      2024-09-21  1414  
b9a3260f25ab5d fs/cifs/inode.c       Steve French                      2008-05-20  1415  
1b12b9c15b4371 fs/cifs/inode.c       Stefan Metzmacher                 2010-08-05  1416  	/* check for Minshall+French symlinks */
1b12b9c15b4371 fs/cifs/inode.c       Stefan Metzmacher                 2010-08-05  1417  	if (cifs_sb->mnt_cifs_flags & CIFS_MOUNT_MF_SYMLINKS) {
a18280e7fdea1f fs/smb/client/inode.c Paulo Alcantara                   2023-08-17  1418  		tmprc = check_mf_symlink(xid, tcon, cifs_sb, fattr, full_path);
cb084b1a9be347 fs/cifs/inode.c       Sachin Prabhu                     2013-11-25  1419  		cifs_dbg(FYI, "check_mf_symlink: %d\n", tmprc);
1b12b9c15b4371 fs/cifs/inode.c       Stefan Metzmacher                 2010-08-05  1420  	}
1b12b9c15b4371 fs/cifs/inode.c       Stefan Metzmacher                 2010-08-05  1421  
b8f7442bc46e48 fs/cifs/inode.c       Aurelien Aptel                    2019-11-18  1422  out:
b8f7442bc46e48 fs/cifs/inode.c       Aurelien Aptel                    2019-11-18  1423  	cifs_buf_release(smb1_backup_rsp_buf);
7ffec372458d16 fs/cifs/inode.c       Jeff Layton                       2010-09-29  1424  	cifs_put_tlink(tlink);
76894f3e2f7117 fs/cifs/inode.c       Paulo Alcantara                   2022-10-03  1425  	cifs_free_open_info(&tmp_data);
a18280e7fdea1f fs/smb/client/inode.c Paulo Alcantara                   2023-08-17  1426  	return rc;
a18280e7fdea1f fs/smb/client/inode.c Paulo Alcantara                   2023-08-17  1427  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

