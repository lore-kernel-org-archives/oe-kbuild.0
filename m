Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0334735960
	for <oe-kbuild@lists.linux.dev>; Sat, 28 Dec 2024 06:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735367244; cv=none; b=NaQggzkY4xu/4b/zInOM1v8BOdYRmZqPFxaw+fDuwIlNtz/9UFtGNcJ3mi6B11l78CdroDHTizcU1sO+EhBYJ6kB1fheaTqUbDBLVHIafnTdVAE7PPBHx6XC0TQpRsJ4SJtYPxtweuZ/BvJz1YnMF/34YehWYddn3YqSPE2a714=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735367244; c=relaxed/simple;
	bh=0ckL0QRar5B7+i0cqK4zH6cRmjkLjOlrqQpelvwzal0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=S4er+kUD+3ot6AJ1Mbu/WTOxFlETqmshUng+wCmKF9LaGyR5S2XutyfHouC8Aef4VgZqJ8jJLcUGBMzxOBQ1+aX2usMg6W39i8zyIoJ6LreaP5Y/+FUM/jxtyxg0nPN6hRHsz5ku17RhPMAJehiR4QiSi9qT03ZwttLhb0416No=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iFYvIpbA; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iFYvIpbA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735367242; x=1766903242;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=0ckL0QRar5B7+i0cqK4zH6cRmjkLjOlrqQpelvwzal0=;
  b=iFYvIpbAFW5/+7vXd1ZZgU9hesHfNFnALktmPAGsYaIaGh+n4UxxLpIS
   B2DoZO2j/piP8+EG0kmYG6UAf4YC5qLLPX6XqJkTU4Gw3SqsRrUO9gjte
   beJwXJLXM3GPiBgOhm7pDabbBiyxKEduyAL0lZ2Tm19tf5LGZk/8XPBiW
   ASLjE/t6PNpq/ZE8pW+CAMylU95Rk/c1YUx22u7Zq6CfEjLvLtJVLhrNZ
   YNIAENYRCtACoO1a5L45ExKfatCL0oi3P/2dPRWVJuIQN8P00wtx79Fcn
   kxkIBAQ2wfNi/z94yOza2VpL0HFCEIER552Sd4btsWrkrmkA3Ka8FlXpx
   A==;
X-CSE-ConnectionGUID: Cu7qG91URAulMtaMutVBFQ==
X-CSE-MsgGUID: PIiTPEofTAqTh0dJHqeUIw==
X-IronPort-AV: E=McAfee;i="6700,10204,11298"; a="35055116"
X-IronPort-AV: E=Sophos;i="6.12,271,1728975600"; 
   d="scan'208";a="35055116"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2024 22:27:21 -0800
X-CSE-ConnectionGUID: D01GUX3hRLWGISd5mHOcww==
X-CSE-MsgGUID: 9MszkYvvQrmk9JCWhUUamg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="100800609"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 27 Dec 2024 22:27:20 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRQI9-0003uO-2i;
	Sat, 28 Dec 2024 06:27:17 +0000
Date: Sat, 28 Dec 2024 14:26:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [pali:cifs 20/48] fs/smb/client/cifsacl.c:1514 set_cifs_acl() error:
 uninitialized symbol 'access_flags'.
Message-ID: <202412281410.msF9yv6K-lkp@intel.com>
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
TO: "Pali Rohár" <pali@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pali/linux.git cifs
head:   cc26137de51202e7210b058f6696393f1e006d46
commit: ce9f9c0511bbb913daa982afed5859ab68adf0e8 [20/48] cifs: Fix getting and setting SACLs over SMB1
:::::: branch date: 14 hours ago
:::::: commit date: 4 days ago
config: riscv-randconfig-r072-20241228 (https://download.01.org/0day-ci/archive/20241228/202412281410.msF9yv6K-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412281410.msF9yv6K-lkp@intel.com/

smatch warnings:
fs/smb/client/cifsacl.c:1514 set_cifs_acl() error: uninitialized symbol 'access_flags'.

vim +/access_flags +1514 fs/smb/client/cifsacl.c

1bf4072da67c14 fs/cifs/cifsacl.c       Christoph Hellwig  2009-05-27  1484  
a5ff376966c079 fs/cifs/cifsacl.c       Shirish Pargaonkar 2011-10-13  1485   /* Set an ACL on the server */
3651487607ae77 fs/smb/client/cifsacl.c ChenXiaoSong       2024-08-22  1486  int set_cifs_acl(struct smb_ntsd *pnntsd, __u32 acllen,
a5ff376966c079 fs/cifs/cifsacl.c       Shirish Pargaonkar 2011-10-13  1487  			struct inode *inode, const char *path, int aclflag)
b96d31a62f7145 fs/cifs/cifsacl.c       Christoph Hellwig  2009-05-27  1488  {
b96d31a62f7145 fs/cifs/cifsacl.c       Christoph Hellwig  2009-05-27  1489  	int oplock = 0;
6d5786a34d98bf fs/cifs/cifsacl.c       Pavel Shilovsky    2012-06-20  1490  	unsigned int xid;
0f060936e490c6 fs/cifs/cifsacl.c       Amir Goldstein     2020-02-03  1491  	int rc, access_flags;
96daf2b09178d8 fs/cifs/cifsacl.c       Steve French       2011-05-27  1492  	struct cifs_tcon *tcon;
a5ff376966c079 fs/cifs/cifsacl.c       Shirish Pargaonkar 2011-10-13  1493  	struct cifs_sb_info *cifs_sb = CIFS_SB(inode->i_sb);
7ffec372458d16 fs/cifs/cifsacl.c       Jeff Layton        2010-09-29  1494  	struct tcon_link *tlink = cifs_sb_tlink(cifs_sb);
d81b8a40e2ece0 fs/cifs/cifsacl.c       Pavel Shilovsky    2014-01-16  1495  	struct cifs_fid fid;
d81b8a40e2ece0 fs/cifs/cifsacl.c       Pavel Shilovsky    2014-01-16  1496  	struct cifs_open_parms oparms;
7ffec372458d16 fs/cifs/cifsacl.c       Jeff Layton        2010-09-29  1497  
7ffec372458d16 fs/cifs/cifsacl.c       Jeff Layton        2010-09-29  1498  	if (IS_ERR(tlink))
7ffec372458d16 fs/cifs/cifsacl.c       Jeff Layton        2010-09-29  1499  		return PTR_ERR(tlink);
97837582bc1e19 fs/cifs/cifsacl.c       Steve French       2007-12-31  1500  
7ffec372458d16 fs/cifs/cifsacl.c       Jeff Layton        2010-09-29  1501  	tcon = tlink_tcon(tlink);
6d5786a34d98bf fs/cifs/cifsacl.c       Pavel Shilovsky    2012-06-20  1502  	xid = get_xid();
97837582bc1e19 fs/cifs/cifsacl.c       Steve French       2007-12-31  1503  
ce9f9c0511bbb9 fs/smb/client/cifsacl.c Pali Rohár         2024-10-14  1504  	if (aclflag & CIFS_ACL_OWNER || aclflag & CIFS_ACL_GROUP)
ce9f9c0511bbb9 fs/smb/client/cifsacl.c Pali Rohár         2024-10-14  1505  		access_flags |= WRITE_OWNER;
ce9f9c0511bbb9 fs/smb/client/cifsacl.c Pali Rohár         2024-10-14  1506  	if (aclflag & CIFS_ACL_SACL)
ce9f9c0511bbb9 fs/smb/client/cifsacl.c Pali Rohár         2024-10-14  1507  		access_flags |= SYSTEM_SECURITY;
ce9f9c0511bbb9 fs/smb/client/cifsacl.c Pali Rohár         2024-10-14  1508  	if (aclflag & CIFS_ACL_DACL)
ce9f9c0511bbb9 fs/smb/client/cifsacl.c Pali Rohár         2024-10-14  1509  		access_flags |= WRITE_DAC;
a5ff376966c079 fs/cifs/cifsacl.c       Shirish Pargaonkar 2011-10-13  1510  
de036dcaca65cf fs/cifs/cifsacl.c       Volker Lendecke    2023-01-11  1511  	oparms = (struct cifs_open_parms) {
de036dcaca65cf fs/cifs/cifsacl.c       Volker Lendecke    2023-01-11  1512  		.tcon = tcon,
de036dcaca65cf fs/cifs/cifsacl.c       Volker Lendecke    2023-01-11  1513  		.cifs_sb = cifs_sb,
de036dcaca65cf fs/cifs/cifsacl.c       Volker Lendecke    2023-01-11 @1514  		.desired_access = access_flags,
de036dcaca65cf fs/cifs/cifsacl.c       Volker Lendecke    2023-01-11  1515  		.create_options = cifs_create_options(cifs_sb, 0),
de036dcaca65cf fs/cifs/cifsacl.c       Volker Lendecke    2023-01-11  1516  		.disposition = FILE_OPEN,
de036dcaca65cf fs/cifs/cifsacl.c       Volker Lendecke    2023-01-11  1517  		.path = path,
de036dcaca65cf fs/cifs/cifsacl.c       Volker Lendecke    2023-01-11  1518  		.fid = &fid,
de036dcaca65cf fs/cifs/cifsacl.c       Volker Lendecke    2023-01-11  1519  	};
d81b8a40e2ece0 fs/cifs/cifsacl.c       Pavel Shilovsky    2014-01-16  1520  
d81b8a40e2ece0 fs/cifs/cifsacl.c       Pavel Shilovsky    2014-01-16  1521  	rc = CIFS_open(xid, &oparms, &oplock, NULL);
b96d31a62f7145 fs/cifs/cifsacl.c       Christoph Hellwig  2009-05-27  1522  	if (rc) {
f96637be081141 fs/cifs/cifsacl.c       Joe Perches        2013-05-04  1523  		cifs_dbg(VFS, "Unable to open file to set ACL\n");
b96d31a62f7145 fs/cifs/cifsacl.c       Christoph Hellwig  2009-05-27  1524  		goto out;
97837582bc1e19 fs/cifs/cifsacl.c       Steve French       2007-12-31  1525  	}
97837582bc1e19 fs/cifs/cifsacl.c       Steve French       2007-12-31  1526  
d81b8a40e2ece0 fs/cifs/cifsacl.c       Pavel Shilovsky    2014-01-16  1527  	rc = CIFSSMBSetCIFSACL(xid, tcon, fid.netfid, pnntsd, acllen, aclflag);
f96637be081141 fs/cifs/cifsacl.c       Joe Perches        2013-05-04  1528  	cifs_dbg(NOISY, "SetCIFSACL rc = %d\n", rc);
97837582bc1e19 fs/cifs/cifsacl.c       Steve French       2007-12-31  1529  
d81b8a40e2ece0 fs/cifs/cifsacl.c       Pavel Shilovsky    2014-01-16  1530  	CIFSSMBClose(xid, tcon, fid.netfid);
b96d31a62f7145 fs/cifs/cifsacl.c       Christoph Hellwig  2009-05-27  1531  out:
6d5786a34d98bf fs/cifs/cifsacl.c       Pavel Shilovsky    2012-06-20  1532  	free_xid(xid);
7ffec372458d16 fs/cifs/cifsacl.c       Jeff Layton        2010-09-29  1533  	cifs_put_tlink(tlink);
b96d31a62f7145 fs/cifs/cifsacl.c       Christoph Hellwig  2009-05-27  1534  	return rc;
b96d31a62f7145 fs/cifs/cifsacl.c       Christoph Hellwig  2009-05-27  1535  }
fb157ed226d225 fs/cifs/cifsacl.c       Steve French       2022-08-01  1536  #endif /* CONFIG_CIFS_ALLOW_INSECURE_LEGACY */
97837582bc1e19 fs/cifs/cifsacl.c       Steve French       2007-12-31  1537  

:::::: The code at line 1514 was first introduced by commit
:::::: de036dcaca65cf94bf7ff09c571c077f02bc92b4 cifs: Fix uninitialized memory reads for oparms.mode

:::::: TO: Volker Lendecke <vl@samba.org>
:::::: CC: Steve French <stfrench@microsoft.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
