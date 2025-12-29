Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F18CF22256F
	for <oe-kbuild@lists.linux.dev>; Mon, 29 Dec 2025 14:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767017292; cv=none; b=bghKmEnHBv+7C2fIf2lk5rWv2ES6oWV3kkuvO3Agftasm6GGGXg2RbBK4Mg07Ht0c+JNw7ycBdlVjUL0q367RmusmBzouhpLA3VHWYiR/oG38c1ZrFGVv2UCDWfU1xAWHAR/mBujDl60uWRNqlFWETvsyghd3FanIFHKVaN5gOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767017292; c=relaxed/simple;
	bh=Qj28H2TpEf0+c2IVV/s9jmc5YBnwNZ5/ReeF9QSNv/Y=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UPkDkZNnyg0fN6IM50h1TQQrFchYVrSqqPUhInQIXOSete5kT4OrtVlsq1dleAy7zYB1554ac8v7QhUPZocrdXukkjPwQKK/pPwHFXkr3rpiqxGG6j5uHB2+mX8QxrXel79731WRFRp4DstOwXkiFh63+MQqqiZNxKczWoK3xqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h+IM6lcl; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h+IM6lcl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767017290; x=1798553290;
  h=date:from:to:cc:subject:message-id;
  bh=Qj28H2TpEf0+c2IVV/s9jmc5YBnwNZ5/ReeF9QSNv/Y=;
  b=h+IM6lclo1+BlzrDHG5DxVJ42G+iivaNHoniy+Iu/NFLVgUrpYlLIuC7
   evT039kmv/cy3xQnwoczXCUuXwoRpiRDo1EY+7gnKzjMW1Ta8u628CB5w
   y/z15nMMgXNC2Hn7pGfCGIN3Ska90S8zs8p1dts4G/JJrav9+omMD0ct9
   pozR+PwaqyVaJQvU7aKSHcZQyuDpsVp0sHDzBPiPpFsDV8FM3fFe03aD+
   sZTLhnRcsSVjSXy/ePaH+zW/sahNAC4NxwErFQ9HOtTHaaWhwzR5IDALG
   9bb2mTlIkGDqV1ENXf31k47r5oha/+miyOijONFKPSFrQXbevVnW+LXXY
   g==;
X-CSE-ConnectionGUID: mHmO1pEzSUCb1cjLACGozQ==
X-CSE-MsgGUID: /6ULmSOzS7iWu0RRHSfB/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="79257596"
X-IronPort-AV: E=Sophos;i="6.21,186,1763452800"; 
   d="scan'208";a="79257596"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2025 06:08:09 -0800
X-CSE-ConnectionGUID: 2SUtRqElSAqyK1k4j71TWQ==
X-CSE-MsgGUID: Pw14YZeeSAuKfqYSklsB0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,186,1763452800"; 
   d="scan'208";a="205451670"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 29 Dec 2025 06:08:07 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vaDun-000000007Gv-1kua;
	Mon, 29 Dec 2025 14:08:05 +0000
Date: Mon, 29 Dec 2025 22:07:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [sashal-next:net-next 1/3] fs/smb/client/ioctl.c:591
 cifs_ioctl() error: we previously assumed 'pSMBFile' could be null (see line
 369)
Message-ID: <202512292122.OhFWBF5l-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Steve French <stfrench@microsoft.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-next.git net-next
head:   aaf2130f92eac212cc9a89fa4ea1c404c7da79e9
commit: 145c9513b5b462e043eee05e35d42ef2ccd1ed24 [1/3] smb3 client: add missing tracepoint for unsupported ioctls
:::::: branch date: 11 hours ago
:::::: commit date: 16 hours ago
config: x86_64-randconfig-r071-20251229 (https://download.01.org/0day-ci/archive/20251229/202512292122.OhFWBF5l-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512292122.OhFWBF5l-lkp@intel.com/

smatch warnings:
fs/smb/client/ioctl.c:591 cifs_ioctl() error: we previously assumed 'pSMBFile' could be null (see line 369)

vim +/pSMBFile +591 fs/smb/client/ioctl.c

f654bac2227adc fs/cifs/ioctl.c       Steve French     2005-04-28  365  
6d5786a34d98bf fs/cifs/ioctl.c       Pavel Shilovsky  2012-06-20  366  	xid = get_xid();
f654bac2227adc fs/cifs/ioctl.c       Steve French     2005-04-28  367  
b0a752b5ce76bd fs/cifs/ioctl.c       Pavel Shilovsky  2016-11-16  368  	cifs_dbg(FYI, "cifs ioctl 0x%x\n", command);
073dd87c8e1ee5 fs/smb/client/ioctl.c Steve French     2024-03-06  369  	if (pSMBFile == NULL)
073dd87c8e1ee5 fs/smb/client/ioctl.c Steve French     2024-03-06  370  		trace_smb3_ioctl(xid, 0, command);
073dd87c8e1ee5 fs/smb/client/ioctl.c Steve French     2024-03-06  371  	else
073dd87c8e1ee5 fs/smb/client/ioctl.c Steve French     2024-03-06  372  		trace_smb3_ioctl(xid, pSMBFile->fid.persistent_fid, command);
073dd87c8e1ee5 fs/smb/client/ioctl.c Steve French     2024-03-06  373  
^1da177e4c3f41 fs/cifs/ioctl.c       Linus Torvalds   2005-04-16  374  	switch (command) {
36695673b01209 fs/cifs/ioctl.c       David Howells    2006-08-29  375  		case FS_IOC_GETFLAGS:
618763958b2291 fs/cifs/ioctl.c       Jeff Layton      2010-11-08  376  			if (pSMBFile == NULL)
618763958b2291 fs/cifs/ioctl.c       Jeff Layton      2010-11-08  377  				break;
618763958b2291 fs/cifs/ioctl.c       Jeff Layton      2010-11-08  378  			tcon = tlink_tcon(pSMBFile->tlink);
64a5cfa6db94c5 fs/cifs/ioctl.c       Steve French     2013-10-14  379  #ifdef CONFIG_CIFS_POSIX
fb157ed226d225 fs/cifs/ioctl.c       Steve French     2022-08-01  380  #ifdef CONFIG_CIFS_ALLOW_INSECURE_LEGACY
fdd7d1fff4e3b9 fs/smb/client/ioctl.c Steve French     2023-05-27  381  			caps = le64_to_cpu(tcon->fsUnixInfo.Capability);
f654bac2227adc fs/cifs/ioctl.c       Steve French     2005-04-28  382  			if (CIFS_UNIX_EXTATTR_CAP & caps) {
f10d9ba405ed25 fs/cifs/ioctl.c       Steve French     2013-10-13  383  				__u64	ExtAttrMask = 0;
4b4de76e35518f fs/cifs/ioctl.c       Pavel Shilovsky  2012-09-18  384  				rc = CIFSGetExtAttr(xid, tcon,
4b4de76e35518f fs/cifs/ioctl.c       Pavel Shilovsky  2012-09-18  385  						    pSMBFile->fid.netfid,
f654bac2227adc fs/cifs/ioctl.c       Steve French     2005-04-28  386  						    &ExtAttrBits, &ExtAttrMask);
f654bac2227adc fs/cifs/ioctl.c       Steve French     2005-04-28  387  				if (rc == 0)
f654bac2227adc fs/cifs/ioctl.c       Steve French     2005-04-28  388  					rc = put_user(ExtAttrBits &
36695673b01209 fs/cifs/ioctl.c       David Howells    2006-08-29  389  						FS_FL_USER_VISIBLE,
f654bac2227adc fs/cifs/ioctl.c       Steve French     2005-04-28  390  						(int __user *)arg);
92bbd67a55fee5 fs/cifs/ioctl.c       Zhang Xiaoxu     2022-11-15  391  				if (rc != -EOPNOTSUPP)
64a5cfa6db94c5 fs/cifs/ioctl.c       Steve French     2013-10-14  392  					break;
64a5cfa6db94c5 fs/cifs/ioctl.c       Steve French     2013-10-14  393  			}
fb157ed226d225 fs/cifs/ioctl.c       Steve French     2022-08-01  394  #endif /* CONFIG_CIFS_ALLOW_INSECURE_LEGACY */
64a5cfa6db94c5 fs/cifs/ioctl.c       Steve French     2013-10-14  395  #endif /* CONFIG_CIFS_POSIX */
64a5cfa6db94c5 fs/cifs/ioctl.c       Steve French     2013-10-14  396  			rc = 0;
64a5cfa6db94c5 fs/cifs/ioctl.c       Steve French     2013-10-14  397  			if (CIFS_I(inode)->cifsAttrs & ATTR_COMPRESSED) {
64a5cfa6db94c5 fs/cifs/ioctl.c       Steve French     2013-10-14  398  				/* add in the compressed bit */
64a5cfa6db94c5 fs/cifs/ioctl.c       Steve French     2013-10-14  399  				ExtAttrBits = FS_COMPR_FL;
64a5cfa6db94c5 fs/cifs/ioctl.c       Steve French     2013-10-14  400  				rc = put_user(ExtAttrBits & FS_FL_USER_VISIBLE,
64a5cfa6db94c5 fs/cifs/ioctl.c       Steve French     2013-10-14  401  					      (int __user *)arg);
f654bac2227adc fs/cifs/ioctl.c       Steve French     2005-04-28  402  			}
f654bac2227adc fs/cifs/ioctl.c       Steve French     2005-04-28  403  			break;
36695673b01209 fs/cifs/ioctl.c       David Howells    2006-08-29  404  		case FS_IOC_SETFLAGS:
618763958b2291 fs/cifs/ioctl.c       Jeff Layton      2010-11-08  405  			if (pSMBFile == NULL)
618763958b2291 fs/cifs/ioctl.c       Jeff Layton      2010-11-08  406  				break;
618763958b2291 fs/cifs/ioctl.c       Jeff Layton      2010-11-08  407  			tcon = tlink_tcon(pSMBFile->tlink);
4c51de1e8f928a fs/cifs/ioctl.c       Steve French     2021-09-13  408  			/* caps = le64_to_cpu(tcon->fsUnixInfo.Capability); */
64a5cfa6db94c5 fs/cifs/ioctl.c       Steve French     2013-10-14  409  
f654bac2227adc fs/cifs/ioctl.c       Steve French     2005-04-28  410  			if (get_user(ExtAttrBits, (int __user *)arg)) {
f654bac2227adc fs/cifs/ioctl.c       Steve French     2005-04-28  411  				rc = -EFAULT;
c81156dd217818 fs/cifs/ioctl.c       Steve French     2005-04-28  412  				break;
f654bac2227adc fs/cifs/ioctl.c       Steve French     2005-04-28  413  			}
64a5cfa6db94c5 fs/cifs/ioctl.c       Steve French     2013-10-14  414  
4b4de76e35518f fs/cifs/ioctl.c       Pavel Shilovsky  2012-09-18  415  			/*
64a5cfa6db94c5 fs/cifs/ioctl.c       Steve French     2013-10-14  416  			 * if (CIFS_UNIX_EXTATTR_CAP & caps)
64a5cfa6db94c5 fs/cifs/ioctl.c       Steve French     2013-10-14  417  			 *	rc = CIFSSetExtAttr(xid, tcon,
4b4de76e35518f fs/cifs/ioctl.c       Pavel Shilovsky  2012-09-18  418  			 *		       pSMBFile->fid.netfid,
4b4de76e35518f fs/cifs/ioctl.c       Pavel Shilovsky  2012-09-18  419  			 *		       extAttrBits,
4b4de76e35518f fs/cifs/ioctl.c       Pavel Shilovsky  2012-09-18  420  			 *		       &ExtAttrMask);
92bbd67a55fee5 fs/cifs/ioctl.c       Zhang Xiaoxu     2022-11-15  421  			 * if (rc != -EOPNOTSUPP)
64a5cfa6db94c5 fs/cifs/ioctl.c       Steve French     2013-10-14  422  			 *	break;
4b4de76e35518f fs/cifs/ioctl.c       Pavel Shilovsky  2012-09-18  423  			 */
64a5cfa6db94c5 fs/cifs/ioctl.c       Steve French     2013-10-14  424  
64a5cfa6db94c5 fs/cifs/ioctl.c       Steve French     2013-10-14  425  			/* Currently only flag we can set is compressed flag */
64a5cfa6db94c5 fs/cifs/ioctl.c       Steve French     2013-10-14  426  			if ((ExtAttrBits & FS_COMPR_FL) == 0)
64a5cfa6db94c5 fs/cifs/ioctl.c       Steve French     2013-10-14  427  				break;
64a5cfa6db94c5 fs/cifs/ioctl.c       Steve French     2013-10-14  428  
64a5cfa6db94c5 fs/cifs/ioctl.c       Steve French     2013-10-14  429  			/* Try to set compress flag */
64a5cfa6db94c5 fs/cifs/ioctl.c       Steve French     2013-10-14  430  			if (tcon->ses->server->ops->set_compression) {
64a5cfa6db94c5 fs/cifs/ioctl.c       Steve French     2013-10-14  431  				rc = tcon->ses->server->ops->set_compression(
64a5cfa6db94c5 fs/cifs/ioctl.c       Steve French     2013-10-14  432  							xid, tcon, pSMBFile);
64a5cfa6db94c5 fs/cifs/ioctl.c       Steve French     2013-10-14  433  				cifs_dbg(FYI, "set compress flag rc %d\n", rc);
f654bac2227adc fs/cifs/ioctl.c       Steve French     2005-04-28  434  			}
f654bac2227adc fs/cifs/ioctl.c       Steve French     2005-04-28  435  			break;
f19e84df37bda5 fs/cifs/ioctl.c       Steve French     2013-11-24  436  		case CIFS_IOC_COPYCHUNK_FILE:
312bbc5946c4b7 fs/cifs/ioctl.c       Sachin Prabhu    2017-04-04  437  			rc = cifs_ioctl_copychunk(xid, filep, arg);
41c1358e9181ab fs/cifs/ioctl.c       Steve French     2013-11-14  438  			break;
f5b05d622a3e99 fs/cifs/ioctl.c       Ronnie Sahlberg  2018-10-07  439  		case CIFS_QUERY_INFO:
f5b05d622a3e99 fs/cifs/ioctl.c       Ronnie Sahlberg  2018-10-07  440  			rc = cifs_ioctl_query_info(xid, filep, arg);
f5b05d622a3e99 fs/cifs/ioctl.c       Ronnie Sahlberg  2018-10-07  441  			break;
b3152e2c7aa9ad fs/cifs/ioctl.c       Steve French     2015-06-24  442  		case CIFS_IOC_SET_INTEGRITY:
b3152e2c7aa9ad fs/cifs/ioctl.c       Steve French     2015-06-24  443  			if (pSMBFile == NULL)
b3152e2c7aa9ad fs/cifs/ioctl.c       Steve French     2015-06-24  444  				break;
b3152e2c7aa9ad fs/cifs/ioctl.c       Steve French     2015-06-24  445  			tcon = tlink_tcon(pSMBFile->tlink);
b3152e2c7aa9ad fs/cifs/ioctl.c       Steve French     2015-06-24  446  			if (tcon->ses->server->ops->set_integrity)
b3152e2c7aa9ad fs/cifs/ioctl.c       Steve French     2015-06-24  447  				rc = tcon->ses->server->ops->set_integrity(xid,
b3152e2c7aa9ad fs/cifs/ioctl.c       Steve French     2015-06-24  448  						tcon, pSMBFile);
b3152e2c7aa9ad fs/cifs/ioctl.c       Steve French     2015-06-24  449  			else
b3152e2c7aa9ad fs/cifs/ioctl.c       Steve French     2015-06-24  450  				rc = -EOPNOTSUPP;
b3152e2c7aa9ad fs/cifs/ioctl.c       Steve French     2015-06-24  451  			break;
0de1f4c6f6c028 fs/cifs/ioctl.c       Steve French     2015-07-04  452  		case CIFS_IOC_GET_MNT_INFO:
d8a6e505d6bba2 fs/cifs/ioctl.c       David Disseldorp 2017-05-04  453  			if (pSMBFile == NULL)
d8a6e505d6bba2 fs/cifs/ioctl.c       David Disseldorp 2017-05-04  454  				break;
0de1f4c6f6c028 fs/cifs/ioctl.c       Steve French     2015-07-04  455  			tcon = tlink_tcon(pSMBFile->tlink);
0de1f4c6f6c028 fs/cifs/ioctl.c       Steve French     2015-07-04  456  			rc = smb_mnt_get_fsinfo(xid, tcon, (void __user *)arg);
0de1f4c6f6c028 fs/cifs/ioctl.c       Steve French     2015-07-04  457  			break;
de4eceab578ead fs/smb/client/ioctl.c Steve French     2023-11-09  458  		case CIFS_IOC_GET_TCON_INFO:
de4eceab578ead fs/smb/client/ioctl.c Steve French     2023-11-09  459  			cifs_sb = CIFS_SB(inode->i_sb);
de4eceab578ead fs/smb/client/ioctl.c Steve French     2023-11-09  460  			tlink = cifs_sb_tlink(cifs_sb);
de4eceab578ead fs/smb/client/ioctl.c Steve French     2023-11-09  461  			if (IS_ERR(tlink)) {
de4eceab578ead fs/smb/client/ioctl.c Steve French     2023-11-09  462  				rc = PTR_ERR(tlink);
de4eceab578ead fs/smb/client/ioctl.c Steve French     2023-11-09  463  				break;
de4eceab578ead fs/smb/client/ioctl.c Steve French     2023-11-09  464  			}
de4eceab578ead fs/smb/client/ioctl.c Steve French     2023-11-09  465  			tcon = tlink_tcon(tlink);
de4eceab578ead fs/smb/client/ioctl.c Steve French     2023-11-09  466  			rc = smb_mnt_get_tcon_info(tcon, (void __user *)arg);
de4eceab578ead fs/smb/client/ioctl.c Steve French     2023-11-09  467  			cifs_put_tlink(tlink);
de4eceab578ead fs/smb/client/ioctl.c Steve French     2023-11-09  468  			break;
834170c85978b0 fs/cifs/ioctl.c       Steve French     2016-09-30  469  		case CIFS_ENUMERATE_SNAPSHOTS:
6026685de33b0d fs/cifs/ioctl.c       David Disseldorp 2017-05-03  470  			if (pSMBFile == NULL)
6026685de33b0d fs/cifs/ioctl.c       David Disseldorp 2017-05-03  471  				break;
834170c85978b0 fs/cifs/ioctl.c       Steve French     2016-09-30  472  			if (arg == 0) {
834170c85978b0 fs/cifs/ioctl.c       Steve French     2016-09-30  473  				rc = -EINVAL;
834170c85978b0 fs/cifs/ioctl.c       Steve French     2016-09-30  474  				goto cifs_ioc_exit;
834170c85978b0 fs/cifs/ioctl.c       Steve French     2016-09-30  475  			}
834170c85978b0 fs/cifs/ioctl.c       Steve French     2016-09-30  476  			tcon = tlink_tcon(pSMBFile->tlink);
834170c85978b0 fs/cifs/ioctl.c       Steve French     2016-09-30  477  			if (tcon->ses->server->ops->enum_snapshots)
834170c85978b0 fs/cifs/ioctl.c       Steve French     2016-09-30  478  				rc = tcon->ses->server->ops->enum_snapshots(xid, tcon,
834170c85978b0 fs/cifs/ioctl.c       Steve French     2016-09-30  479  						pSMBFile, (void __user *)arg);
834170c85978b0 fs/cifs/ioctl.c       Steve French     2016-09-30  480  			else
834170c85978b0 fs/cifs/ioctl.c       Steve French     2016-09-30  481  				rc = -EOPNOTSUPP;
834170c85978b0 fs/cifs/ioctl.c       Steve French     2016-09-30  482  			break;
7e7db86c7e1088 fs/cifs/ioctl.c       Steve French     2019-09-19  483  		case CIFS_DUMP_KEY:
1bb56810677f26 fs/cifs/ioctl.c       Aurelien Aptel   2021-05-21  484  			/*
1bb56810677f26 fs/cifs/ioctl.c       Aurelien Aptel   2021-05-21  485  			 * Dump encryption keys. This is an old ioctl that only
1bb56810677f26 fs/cifs/ioctl.c       Aurelien Aptel   2021-05-21  486  			 * handles AES-128-{CCM,GCM}.
1bb56810677f26 fs/cifs/ioctl.c       Aurelien Aptel   2021-05-21  487  			 */
7e7db86c7e1088 fs/cifs/ioctl.c       Steve French     2019-09-19  488  			if (!capable(CAP_SYS_ADMIN)) {
7e7db86c7e1088 fs/cifs/ioctl.c       Steve French     2019-09-19  489  				rc = -EACCES;
7e7db86c7e1088 fs/cifs/ioctl.c       Steve French     2019-09-19  490  				break;
7e7db86c7e1088 fs/cifs/ioctl.c       Steve French     2019-09-19  491  			}
7e7db86c7e1088 fs/cifs/ioctl.c       Steve French     2019-09-19  492  
b3edef6b9cd0b8 fs/smb/client/ioctl.c Shyam Prasad N   2023-06-16  493  			cifs_sb = CIFS_SB(inode->i_sb);
b3edef6b9cd0b8 fs/smb/client/ioctl.c Shyam Prasad N   2023-06-16  494  			tlink = cifs_sb_tlink(cifs_sb);
b3edef6b9cd0b8 fs/smb/client/ioctl.c Shyam Prasad N   2023-06-16  495  			if (IS_ERR(tlink)) {
b3edef6b9cd0b8 fs/smb/client/ioctl.c Shyam Prasad N   2023-06-16  496  				rc = PTR_ERR(tlink);
b3edef6b9cd0b8 fs/smb/client/ioctl.c Shyam Prasad N   2023-06-16  497  				break;
b3edef6b9cd0b8 fs/smb/client/ioctl.c Shyam Prasad N   2023-06-16  498  			}
b3edef6b9cd0b8 fs/smb/client/ioctl.c Shyam Prasad N   2023-06-16  499  			tcon = tlink_tcon(tlink);
7e7db86c7e1088 fs/cifs/ioctl.c       Steve French     2019-09-19  500  			if (!smb3_encryption_required(tcon)) {
7e7db86c7e1088 fs/cifs/ioctl.c       Steve French     2019-09-19  501  				rc = -EOPNOTSUPP;
b3edef6b9cd0b8 fs/smb/client/ioctl.c Shyam Prasad N   2023-06-16  502  				cifs_put_tlink(tlink);
7e7db86c7e1088 fs/cifs/ioctl.c       Steve French     2019-09-19  503  				break;
7e7db86c7e1088 fs/cifs/ioctl.c       Steve French     2019-09-19  504  			}
7e7db86c7e1088 fs/cifs/ioctl.c       Steve French     2019-09-19  505  			pkey_inf.cipher_type =
7e7db86c7e1088 fs/cifs/ioctl.c       Steve French     2019-09-19  506  				le16_to_cpu(tcon->ses->server->cipher_type);
7e7db86c7e1088 fs/cifs/ioctl.c       Steve French     2019-09-19  507  			pkey_inf.Suid = tcon->ses->Suid;
7e7db86c7e1088 fs/cifs/ioctl.c       Steve French     2019-09-19  508  			memcpy(pkey_inf.auth_key, tcon->ses->auth_key.response,
27e9d5d021dbaa fs/smb/client/ioctl.c Bharath SM       2025-06-19  509  				  SMB2_NTLMV2_SESSKEY_SIZE);
7e7db86c7e1088 fs/cifs/ioctl.c       Steve French     2019-09-19  510  			memcpy(pkey_inf.smb3decryptionkey,
7e7db86c7e1088 fs/cifs/ioctl.c       Steve French     2019-09-19  511  			      tcon->ses->smb3decryptionkey, SMB3_SIGN_KEY_SIZE);
7e7db86c7e1088 fs/cifs/ioctl.c       Steve French     2019-09-19  512  			memcpy(pkey_inf.smb3encryptionkey,
7e7db86c7e1088 fs/cifs/ioctl.c       Steve French     2019-09-19  513  			      tcon->ses->smb3encryptionkey, SMB3_SIGN_KEY_SIZE);
7e7db86c7e1088 fs/cifs/ioctl.c       Steve French     2019-09-19  514  			if (copy_to_user((void __user *)arg, &pkey_inf,
7e7db86c7e1088 fs/cifs/ioctl.c       Steve French     2019-09-19  515  					sizeof(struct smb3_key_debug_info)))
7e7db86c7e1088 fs/cifs/ioctl.c       Steve French     2019-09-19  516  				rc = -EFAULT;
7e7db86c7e1088 fs/cifs/ioctl.c       Steve French     2019-09-19  517  			else
7e7db86c7e1088 fs/cifs/ioctl.c       Steve French     2019-09-19  518  				rc = 0;
b3edef6b9cd0b8 fs/smb/client/ioctl.c Shyam Prasad N   2023-06-16  519  			cifs_put_tlink(tlink);
7e7db86c7e1088 fs/cifs/ioctl.c       Steve French     2019-09-19  520  			break;
1bb56810677f26 fs/cifs/ioctl.c       Aurelien Aptel   2021-05-21  521  		case CIFS_DUMP_FULL_KEY:
aa22ebc3826be2 fs/cifs/ioctl.c       Steve French     2021-04-30  522  			/*
1bb56810677f26 fs/cifs/ioctl.c       Aurelien Aptel   2021-05-21  523  			 * Dump encryption keys (handles any key sizes)
aa22ebc3826be2 fs/cifs/ioctl.c       Steve French     2021-04-30  524  			 */
aa22ebc3826be2 fs/cifs/ioctl.c       Steve French     2021-04-30  525  			if (pSMBFile == NULL)
aa22ebc3826be2 fs/cifs/ioctl.c       Steve French     2021-04-30  526  				break;
aa22ebc3826be2 fs/cifs/ioctl.c       Steve French     2021-04-30  527  			if (!capable(CAP_SYS_ADMIN)) {
aa22ebc3826be2 fs/cifs/ioctl.c       Steve French     2021-04-30  528  				rc = -EACCES;
aa22ebc3826be2 fs/cifs/ioctl.c       Steve French     2021-04-30  529  				break;
aa22ebc3826be2 fs/cifs/ioctl.c       Steve French     2021-04-30  530  			}
b3edef6b9cd0b8 fs/smb/client/ioctl.c Shyam Prasad N   2023-06-16  531  			cifs_sb = CIFS_SB(inode->i_sb);
b3edef6b9cd0b8 fs/smb/client/ioctl.c Shyam Prasad N   2023-06-16  532  			tlink = cifs_sb_tlink(cifs_sb);
a171eb5cac427f fs/smb/client/ioctl.c Shyam Prasad N   2023-07-26  533  			if (IS_ERR(tlink)) {
a171eb5cac427f fs/smb/client/ioctl.c Shyam Prasad N   2023-07-26  534  				rc = PTR_ERR(tlink);
a171eb5cac427f fs/smb/client/ioctl.c Shyam Prasad N   2023-07-26  535  				break;
a171eb5cac427f fs/smb/client/ioctl.c Shyam Prasad N   2023-07-26  536  			}
a171eb5cac427f fs/smb/client/ioctl.c Shyam Prasad N   2023-07-26  537  
b3edef6b9cd0b8 fs/smb/client/ioctl.c Shyam Prasad N   2023-06-16  538  			tcon = tlink_tcon(tlink);
1bb56810677f26 fs/cifs/ioctl.c       Aurelien Aptel   2021-05-21  539  			rc = cifs_dump_full_key(tcon, (void __user *)arg);
b3edef6b9cd0b8 fs/smb/client/ioctl.c Shyam Prasad N   2023-06-16  540  			cifs_put_tlink(tlink);
aa22ebc3826be2 fs/cifs/ioctl.c       Steve French     2021-04-30  541  			break;
d26c2ddd335696 fs/cifs/ioctl.c       Steve French     2020-02-06  542  		case CIFS_IOC_NOTIFY:
d26c2ddd335696 fs/cifs/ioctl.c       Steve French     2020-02-06  543  			if (!S_ISDIR(inode->i_mode)) {
d26c2ddd335696 fs/cifs/ioctl.c       Steve French     2020-02-06  544  				/* Notify can only be done on directories */
d26c2ddd335696 fs/cifs/ioctl.c       Steve French     2020-02-06  545  				rc = -EOPNOTSUPP;
d26c2ddd335696 fs/cifs/ioctl.c       Steve French     2020-02-06  546  				break;
d26c2ddd335696 fs/cifs/ioctl.c       Steve French     2020-02-06  547  			}
d26c2ddd335696 fs/cifs/ioctl.c       Steve French     2020-02-06  548  			cifs_sb = CIFS_SB(inode->i_sb);
a77592a70081ed fs/cifs/ioctl.c       Ronnie Sahlberg  2020-07-09  549  			tlink = cifs_sb_tlink(cifs_sb);
a77592a70081ed fs/cifs/ioctl.c       Ronnie Sahlberg  2020-07-09  550  			if (IS_ERR(tlink)) {
a77592a70081ed fs/cifs/ioctl.c       Ronnie Sahlberg  2020-07-09  551  				rc = PTR_ERR(tlink);
a77592a70081ed fs/cifs/ioctl.c       Ronnie Sahlberg  2020-07-09  552  				break;
a77592a70081ed fs/cifs/ioctl.c       Ronnie Sahlberg  2020-07-09  553  			}
a77592a70081ed fs/cifs/ioctl.c       Ronnie Sahlberg  2020-07-09  554  			tcon = tlink_tcon(tlink);
d26c2ddd335696 fs/cifs/ioctl.c       Steve French     2020-02-06  555  			if (tcon && tcon->ses->server->ops->notify) {
d26c2ddd335696 fs/cifs/ioctl.c       Steve French     2020-02-06  556  				rc = tcon->ses->server->ops->notify(xid,
e3e9463414f610 fs/cifs/ioctl.c       Steve French     2022-10-15  557  						filep, (void __user *)arg,
e3e9463414f610 fs/cifs/ioctl.c       Steve French     2022-10-15  558  						false /* no ret data */);
d26c2ddd335696 fs/cifs/ioctl.c       Steve French     2020-02-06  559  				cifs_dbg(FYI, "ioctl notify rc %d\n", rc);
d26c2ddd335696 fs/cifs/ioctl.c       Steve French     2020-02-06  560  			} else
d26c2ddd335696 fs/cifs/ioctl.c       Steve French     2020-02-06  561  				rc = -EOPNOTSUPP;
a77592a70081ed fs/cifs/ioctl.c       Ronnie Sahlberg  2020-07-09  562  			cifs_put_tlink(tlink);
d26c2ddd335696 fs/cifs/ioctl.c       Steve French     2020-02-06  563  			break;
e3e9463414f610 fs/cifs/ioctl.c       Steve French     2022-10-15  564  		case CIFS_IOC_NOTIFY_INFO:
e3e9463414f610 fs/cifs/ioctl.c       Steve French     2022-10-15  565  			if (!S_ISDIR(inode->i_mode)) {
e3e9463414f610 fs/cifs/ioctl.c       Steve French     2022-10-15  566  				/* Notify can only be done on directories */
e3e9463414f610 fs/cifs/ioctl.c       Steve French     2022-10-15  567  				rc = -EOPNOTSUPP;
e3e9463414f610 fs/cifs/ioctl.c       Steve French     2022-10-15  568  				break;
e3e9463414f610 fs/cifs/ioctl.c       Steve French     2022-10-15  569  			}
e3e9463414f610 fs/cifs/ioctl.c       Steve French     2022-10-15  570  			cifs_sb = CIFS_SB(inode->i_sb);
e3e9463414f610 fs/cifs/ioctl.c       Steve French     2022-10-15  571  			tlink = cifs_sb_tlink(cifs_sb);
e3e9463414f610 fs/cifs/ioctl.c       Steve French     2022-10-15  572  			if (IS_ERR(tlink)) {
e3e9463414f610 fs/cifs/ioctl.c       Steve French     2022-10-15  573  				rc = PTR_ERR(tlink);
e3e9463414f610 fs/cifs/ioctl.c       Steve French     2022-10-15  574  				break;
e3e9463414f610 fs/cifs/ioctl.c       Steve French     2022-10-15  575  			}
e3e9463414f610 fs/cifs/ioctl.c       Steve French     2022-10-15  576  			tcon = tlink_tcon(tlink);
e3e9463414f610 fs/cifs/ioctl.c       Steve French     2022-10-15  577  			if (tcon && tcon->ses->server->ops->notify) {
e3e9463414f610 fs/cifs/ioctl.c       Steve French     2022-10-15  578  				rc = tcon->ses->server->ops->notify(xid,
e3e9463414f610 fs/cifs/ioctl.c       Steve French     2022-10-15  579  						filep, (void __user *)arg,
e3e9463414f610 fs/cifs/ioctl.c       Steve French     2022-10-15  580  						true /* return details */);
e3e9463414f610 fs/cifs/ioctl.c       Steve French     2022-10-15  581  				cifs_dbg(FYI, "ioctl notify info rc %d\n", rc);
e3e9463414f610 fs/cifs/ioctl.c       Steve French     2022-10-15  582  			} else
e3e9463414f610 fs/cifs/ioctl.c       Steve French     2022-10-15  583  				rc = -EOPNOTSUPP;
e3e9463414f610 fs/cifs/ioctl.c       Steve French     2022-10-15  584  			cifs_put_tlink(tlink);
e3e9463414f610 fs/cifs/ioctl.c       Steve French     2022-10-15  585  			break;
087f757b012985 fs/cifs/ioctl.c       Steve French     2021-04-29  586  		case CIFS_IOC_SHUTDOWN:
087f757b012985 fs/cifs/ioctl.c       Steve French     2021-04-29  587  			rc = cifs_shutdown(inode->i_sb, arg);
087f757b012985 fs/cifs/ioctl.c       Steve French     2021-04-29  588  			break;
^1da177e4c3f41 fs/cifs/ioctl.c       Linus Torvalds   2005-04-16  589  		default:
f96637be081141 fs/cifs/ioctl.c       Joe Perches      2013-05-04  590  			cifs_dbg(FYI, "unsupported ioctl\n");
145c9513b5b462 fs/smb/client/ioctl.c Steve French     2025-12-27 @591  			trace_smb3_unsupported_ioctl(xid, pSMBFile->fid.persistent_fid,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
