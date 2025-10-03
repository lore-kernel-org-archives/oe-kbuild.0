Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 163652D7DE3
	for <oe-kbuild@lists.linux.dev>; Fri,  3 Oct 2025 17:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759511084; cv=none; b=WZdpnKwD3LNxe3RMM7HmwIExxP2sgJYDyYKc9Tdge00JR3Bjn8Sl4t3QXl1pUWMyJdTPO6ixZS1MfX42FUt/g0+T6oCu4xs9clPOf5ahozbp/fmR2hkrQ45FSZT+A1AwzLJm7sZdWQwusRzBDmxpsaWoReqSlxSQkBq1i9gKUYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759511084; c=relaxed/simple;
	bh=/pLNdd+3p5BJu+A5N/EcZ86MBqDkuToiULYIqXBl7ck=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=D3LOg+LHVIs8rRNrHC0RbS8LHPsfbyS7fVHLK9FeFByh1UQMOTv0pu1zs8kJ2BIGY5Ot86zzbfzMfTUzUw2gBH+Rokle+guFSIEelcs3z4iF0mOsAcwABuXmFKXlhlj4Mv+G8OsZzFqHggyYAQDHWH7xPbffeoJWKdFCfq1C5mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UO6YJd1f; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UO6YJd1f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759511082; x=1791047082;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/pLNdd+3p5BJu+A5N/EcZ86MBqDkuToiULYIqXBl7ck=;
  b=UO6YJd1fAUlUU+fbWzxoKttb3mzij0i1KeHz1aCcYS9trVzYCrrriXLK
   3oITcT6ylkuaIJF6m7GtWHV4V6d9w/CsIfzy0uEHIRqfFmX1Kd0g9VXsM
   BtsUIpiE/n7D+IzOnMcNDJUX1L2pEqMNffNQrjOw/zPhH92nvEsiOSazq
   QY7ExbE65ty6tsKDv3AYiCruFufVbxcEt5yMf3yYCL6WoPmnWg5moaDvQ
   1KjbUQ/E3ZnRKB2wmEKw7dB2fcfkWDdddh4MuqhBk0lAmCjHxIk5FIs7d
   I5jGtqpiTP+DRlu9no2DcD6TvDK2aI7WsVToYsz/X25tK1dmx0Ilu043I
   Q==;
X-CSE-ConnectionGUID: KN3iNqgRQiWpzr4WPuVMWQ==
X-CSE-MsgGUID: I/OpJPINQgO7PrC960cTUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11571"; a="79443308"
X-IronPort-AV: E=Sophos;i="6.18,313,1751266800"; 
   d="scan'208";a="79443308"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2025 10:04:41 -0700
X-CSE-ConnectionGUID: gR+VJyfBRwut1fYI/w65QQ==
X-CSE-MsgGUID: Cv7ehwiQSA2fljqVf25nKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,313,1751266800"; 
   d="scan'208";a="179137233"
Received: from lkp-server01.sh.intel.com (HELO 2f2a1232a4e4) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 03 Oct 2025 10:04:40 -0700
Received: from kbuild by 2f2a1232a4e4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v4jCv-0004lH-02;
	Fri, 03 Oct 2025 17:04:37 +0000
Date: Sat, 4 Oct 2025 01:04:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
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

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20250929132805.220558-17-ematsumiya@suse.de>
References: <20250929132805.220558-17-ematsumiya@suse.de>
TO: Enzo Matsumiya <ematsumiya@suse.de>
TO: linux-cifs@vger.kernel.org
CC: smfrench@gmail.com
CC: pc@manguebit.com
CC: ronniesahlberg@gmail.com
CC: sprasad@microsoft.com
CC: tom@talpey.com
CC: bharathsm@microsoft.com
CC: henrique.carvalho@suse.com

Hi Enzo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on v6.17]
[also build test WARNING on linus/master]
[cannot apply to cifs/for-next next-20251003]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Enzo-Matsumiya/smb-client-remove-cfids_invalidation_worker/20250929-213155
base:   v6.17
patch link:    https://lore.kernel.org/r/20250929132805.220558-17-ematsumiya%40suse.de
patch subject: [PATCH 16/20] smb: client: add is_dir argument to query_path_info
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: i386-randconfig-141-20251003 (https://download.01.org/0day-ci/archive/20251003/202510032329.NN83GCga-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202510032329.NN83GCga-lkp@intel.com/

New smatch warnings:
fs/smb/client/inode.c:1313 cifs_get_fattr() error: we previously assumed 'inode' could be null (see line 1288)

Old smatch warnings:
fs/smb/client/inode.c:1708 cifs_root_iget() warn: passing zero to 'ERR_PTR'
fs/smb/client/inode.c:2334 cifs_mkdir() warn: passing zero to 'ERR_PTR'

vim +/inode +1313 fs/smb/client/inode.c

5f71ebc4129449 fs/smb/client/inode.c Paulo Alcantara                   2023-08-17  1258  
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
a18280e7fdea1f fs/smb/client/inode.c Paulo Alcantara                   2023-08-17  1428  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
