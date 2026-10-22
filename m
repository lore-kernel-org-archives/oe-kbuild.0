Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792708047;
	b=VQJTnjyAe9mpVcW8ehJfTxdiYOio52C2LwbAMo1oSvf1VfC00U5WMhvXStg2L2VBRSzE
	 1nRHUgXddWHvT3/U+6mC9wPGcS3EqLFVs+17y4USjYqF1+t6Ct6Ln6B5xS8BZvGyx9Y4M
	 pUBNSJV8VGyU71n7dtFqZYLnQ2cp0BiXW/5A8GA9QNRze0qDNYRtWX64jXCZmpQB891Eh
	 Y+yDW/a4AdTQM33VHWTJhwDeXE3u3y+5+c6sa0i1QduLuQVdvc8CpamdrLYvtgHpG8WCk
	 RGKxUcrLszrbIZ0MwpEcNej8inBfaI74WFzLhveMWaAYZidgjLByanXC0UUsd4VLODw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792708047;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=F+ItRNl/SGhubpvgbe7nO517qBoLA8lRvcKztZRuYdc=;
	b=D/5nRPHx+RfG/ae8G9Ckr4MfT5pZHU1Hx4C9dHhKoJS076StyqxGyzI0codaKiNRpkzw
	 DpQpKmNR2McxVddPccEdPwfB2y0yOt1r5Z3FnjWikbQ9nBVw6nCgUG4qQ34bvGePbsDoB
	 UW+7inbPsD4MkH4QWcFY30i9uhMCMSyhsKH5trxF9fJt/sBhHv4ohCEHxbh4xKwiTpWkp
	 ARSdlc++0JUfKMbMUNhx+KvI1xwxxJKWo0VoyEY6XRcffLCHM5SVZIu37L6YomS5UIPpz
	 6JLzmEkCGjDgicVigXMpIlbwBPOLskcCE8Aq0qDnWzDMRi3OYULPPjIGguOWXT3IrJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=O79OHFfR;
	arc=none smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82869606A31A
	for <oe-kbuild@lists.linux.dev>; Thu, 22 Oct 2026 22:27:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82869606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=O79OHFfR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792708046; x=1824244046;
  h=date:from:to:cc:subject:message-id;
  bh=umdnyl5HUBRQEW2RGDnONucvphd2lm/c6C8SxfO2wGY=;
  b=O79OHFfRWYy/9DK77pkni47g7j/TEyPQPky309axtZqyFB45RKY976Es
   wFQtKFNkoODlQgqsE3zGdDXvAe7ajI72svdjUYJbonDjJNn1sXgOvv+p7
   ssKSxPJIJX4VxMFQHwdsoZsR2zb4jRwKaTbl/iEzXwD6v30TR0IjPWtN5
   A0YtYdqAbZu4YUdyPVJBKF1OSXYRjRlHwxjusmjZYz587+gl0WRe34z8z
   VILsBwZ20azd+GnJh9MpK+qWawZeb5qUHg7MWu7nx92D0B6e7sSK5pzCk
   BoibDmqPQICldAIMyaTsmAOKjUCuQPU5kCk2p8VuW1zd16iX6AoDM5CIX
   w==;
X-CSE-ConnectionGUID: 0zTHpwH9S4OWS6EU+QRieA==
X-CSE-MsgGUID: oE6On1WeRHKBQSUfCL03Qg==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1348510"
X-IronPort-AV: E=Sophos;i="6.27,173,1787036400"; 
   d="scan'208";a="1348510"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2026 15:27:25 -0700
X-CSE-ConnectionGUID: qJVySXvwTumuD3knYdVAVw==
X-CSE-MsgGUID: s0t1Kq3aSZy/cN/J7lOOaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,173,1787036400"; 
   d="scan'208";a="3412982"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 22 Oct 2026 15:27:23 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xK1Fk-000000000RP-45o7;
	Thu, 22 Oct 2026 22:27:16 +0000
Date: Fri, 23 Oct 2026 00:26:44 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android15-6.6 12/12]
 fs/smb/client/cifsacl.c:1601 id_mode_to_cifs_acl() warn: variable
 dereferenced before IS_ERR check 'tlink' (see line 1598)
Message-ID: <202610230008.zv5aQbKX-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   25ff308d0682f31e095c4a1d5fa5f2cfb081a7d3
commit: 5f36890d650ca9fb02072ea42f7699b8ffdff75e [12/12] fs/smb/client: implement chmod() for SMB3 POSIX Extensions
:::::: branch date: 11 hours ago
:::::: commit date: 1 year, 9 months ago
config: i386-randconfig-2200-20261022 (https://download.01.org/0day-ci/archive/20261023/202610230008.zv5aQbKX-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202610230008.zv5aQbKX-lkp@intel.com/

smatch warnings:
fs/smb/client/cifsacl.c:1601 id_mode_to_cifs_acl() warn: variable dereferenced before IS_ERR check 'tlink' (see line 1598)

vim +/tlink +1601 fs/smb/client/cifsacl.c

953f868138dbf4 fs/cifs/cifsacl.c       Steve French                    2007-10-31  1580  
7505e0525c914c fs/cifs/cifsacl.c       Steve French                    2007-11-01  1581  /* Convert mode bits to an ACL so we can update the ACL on the server */
a5ff376966c079 fs/cifs/cifsacl.c       Shirish Pargaonkar              2011-10-13  1582  int
0f22053e811ca5 fs/cifs/cifsacl.c       Shyam Prasad N                  2020-08-17  1583  id_mode_to_cifs_acl(struct inode *inode, const char *path, __u64 *pnmode,
8abf2775dd425e fs/cifs/cifsacl.c       Eric W. Biederman               2013-02-06  1584  			kuid_t uid, kgid_t gid)
953f868138dbf4 fs/cifs/cifsacl.c       Steve French                    2007-10-31  1585  {
953f868138dbf4 fs/cifs/cifsacl.c       Steve French                    2007-10-31  1586  	int rc = 0;
a5ff376966c079 fs/cifs/cifsacl.c       Shirish Pargaonkar              2011-10-13  1587  	int aclflag = CIFS_ACL_DACL; /* default flag to set */
cce246ee5f3c7f fs/cifs/cifsacl.c       Steve French                    2008-04-09  1588  	__u32 secdesclen = 0;
f5065508897a92 fs/cifs/cifsacl.c       Shyam Prasad N                  2021-02-12  1589  	__u32 nsecdesclen = 0;
f5065508897a92 fs/cifs/cifsacl.c       Shyam Prasad N                  2021-02-12  1590  	__u32 dacloffset = 0;
298e73ac323a2b fs/smb/client/cifsacl.c ChenXiaoSong                    2024-08-22  1591  	struct smb_acl *dacl_ptr = NULL;
386660bd303ec1 fs/smb/client/cifsacl.c ChenXiaoSong                    2024-08-22  1592  	struct smb_ntsd *pntsd = NULL; /* acl obtained from server */
386660bd303ec1 fs/smb/client/cifsacl.c ChenXiaoSong                    2024-08-22  1593  	struct smb_ntsd *pnntsd = NULL; /* modified acl to be sent to server */
83e3bc23ef9ce7 fs/cifs/cifsacl.c       Steve French                    2014-02-02  1594  	struct cifs_sb_info *cifs_sb = CIFS_SB(inode->i_sb);
83e3bc23ef9ce7 fs/cifs/cifsacl.c       Steve French                    2014-02-02  1595  	struct tcon_link *tlink = cifs_sb_tlink(cifs_sb);
ecdcf622eb74b5 fs/cifs/cifsacl.c       Joe Perches via samba-technical 2017-05-07  1596  	struct smb_version_operations *ops;
a6603398278480 fs/cifs/cifsacl.c       Steve French                    2020-06-12  1597  	bool mode_from_sid, id_from_sid;
5f36890d650ca9 fs/smb/client/cifsacl.c Ralph Boehme                    2024-11-14 @1598  	bool posix = tlink_tcon(tlink)->posix_extensions;
3970acf7ddb9aa fs/cifs/cifsacl.c       Boris Protopopov                2020-12-18  1599  	const u32 info = 0;
83e3bc23ef9ce7 fs/cifs/cifsacl.c       Steve French                    2014-02-02  1600  
83e3bc23ef9ce7 fs/cifs/cifsacl.c       Steve French                    2014-02-02 @1601  	if (IS_ERR(tlink))
83e3bc23ef9ce7 fs/cifs/cifsacl.c       Steve French                    2014-02-02  1602  		return PTR_ERR(tlink);
ecdcf622eb74b5 fs/cifs/cifsacl.c       Joe Perches via samba-technical 2017-05-07  1603  
ecdcf622eb74b5 fs/cifs/cifsacl.c       Joe Perches via samba-technical 2017-05-07  1604  	ops = tlink_tcon(tlink)->ses->server->ops;
953f868138dbf4 fs/cifs/cifsacl.c       Steve French                    2007-10-31  1605  
f96637be081141 fs/cifs/cifsacl.c       Joe Perches                     2013-05-04  1606  	cifs_dbg(NOISY, "set ACL from mode for %s\n", path);
953f868138dbf4 fs/cifs/cifsacl.c       Steve French                    2007-10-31  1607  
953f868138dbf4 fs/cifs/cifsacl.c       Steve French                    2007-10-31  1608  	/* Get the security descriptor */
83e3bc23ef9ce7 fs/cifs/cifsacl.c       Steve French                    2014-02-02  1609  
ecdcf622eb74b5 fs/cifs/cifsacl.c       Joe Perches via samba-technical 2017-05-07  1610  	if (ops->get_acl == NULL) {
83e3bc23ef9ce7 fs/cifs/cifsacl.c       Steve French                    2014-02-02  1611  		cifs_put_tlink(tlink);
83e3bc23ef9ce7 fs/cifs/cifsacl.c       Steve French                    2014-02-02  1612  		return -EOPNOTSUPP;
83e3bc23ef9ce7 fs/cifs/cifsacl.c       Steve French                    2014-02-02  1613  	}
83e3bc23ef9ce7 fs/cifs/cifsacl.c       Steve French                    2014-02-02  1614  
3970acf7ddb9aa fs/cifs/cifsacl.c       Boris Protopopov                2020-12-18  1615  	pntsd = ops->get_acl(cifs_sb, inode, path, &secdesclen, info);
987b21d7d91d03 fs/cifs/cifsacl.c       Shirish Pargaonkar              2010-11-10  1616  	if (IS_ERR(pntsd)) {
987b21d7d91d03 fs/cifs/cifsacl.c       Shirish Pargaonkar              2010-11-10  1617  		rc = PTR_ERR(pntsd);
f96637be081141 fs/cifs/cifsacl.c       Joe Perches                     2013-05-04  1618  		cifs_dbg(VFS, "%s: error %d getting sec desc\n", __func__, rc);
83e3bc23ef9ce7 fs/cifs/cifsacl.c       Steve French                    2014-02-02  1619  		cifs_put_tlink(tlink);
83e3bc23ef9ce7 fs/cifs/cifsacl.c       Steve French                    2014-02-02  1620  		return rc;
c78cd83805d431 fs/cifs/cifsacl.c       Jeff Layton                     2012-11-25  1621  	}
97837582bc1e19 fs/cifs/cifsacl.c       Steve French                    2007-12-31  1622  
f5065508897a92 fs/cifs/cifsacl.c       Shyam Prasad N                  2021-02-12  1623  	if (cifs_sb->mnt_cifs_flags & CIFS_MOUNT_MODE_FROM_SID)
f5065508897a92 fs/cifs/cifsacl.c       Shyam Prasad N                  2021-02-12  1624  		mode_from_sid = true;
f5065508897a92 fs/cifs/cifsacl.c       Shyam Prasad N                  2021-02-12  1625  	else
f5065508897a92 fs/cifs/cifsacl.c       Shyam Prasad N                  2021-02-12  1626  		mode_from_sid = false;
f5065508897a92 fs/cifs/cifsacl.c       Shyam Prasad N                  2021-02-12  1627  
f5065508897a92 fs/cifs/cifsacl.c       Shyam Prasad N                  2021-02-12  1628  	if (cifs_sb->mnt_cifs_flags & CIFS_MOUNT_UID_FROM_ACL)
f5065508897a92 fs/cifs/cifsacl.c       Shyam Prasad N                  2021-02-12  1629  		id_from_sid = true;
f5065508897a92 fs/cifs/cifsacl.c       Shyam Prasad N                  2021-02-12  1630  	else
f5065508897a92 fs/cifs/cifsacl.c       Shyam Prasad N                  2021-02-12  1631  		id_from_sid = false;
f5065508897a92 fs/cifs/cifsacl.c       Shyam Prasad N                  2021-02-12  1632  
f5065508897a92 fs/cifs/cifsacl.c       Shyam Prasad N                  2021-02-12  1633  	/* Potentially, five new ACEs can be added to the ACL for U,G,O mapping */
f5065508897a92 fs/cifs/cifsacl.c       Shyam Prasad N                  2021-02-12  1634  	if (pnmode && *pnmode != NO_CHANGE_64) { /* chmod */
5f36890d650ca9 fs/smb/client/cifsacl.c Ralph Boehme                    2024-11-14  1635  		if (posix)
5f36890d650ca9 fs/smb/client/cifsacl.c Ralph Boehme                    2024-11-14  1636  			nsecdesclen = 1 * sizeof(struct smb_ace);
5f36890d650ca9 fs/smb/client/cifsacl.c Ralph Boehme                    2024-11-14  1637  		else if (mode_from_sid)
5f36890d650ca9 fs/smb/client/cifsacl.c Ralph Boehme                    2024-11-14  1638  			nsecdesclen = secdesclen + (2 * sizeof(struct smb_ace));
f5065508897a92 fs/cifs/cifsacl.c       Shyam Prasad N                  2021-02-12  1639  		else /* cifsacl */
5f36890d650ca9 fs/smb/client/cifsacl.c Ralph Boehme                    2024-11-14  1640  			nsecdesclen = secdesclen + (5 * sizeof(struct smb_ace));
bc3e9dd9d104ca fs/cifs/cifsacl.c       Shyam Prasad N                  2021-02-18  1641  	} else { /* chown */
bc3e9dd9d104ca fs/cifs/cifsacl.c       Shyam Prasad N                  2021-02-18  1642  		/* When ownership changes, changes new owner sid length could be different */
46c22d37f69198 fs/smb/client/cifsacl.c ChenXiaoSong                    2024-08-22  1643  		nsecdesclen = sizeof(struct smb_ntsd) + (sizeof(struct smb_sid) * 2);
bc3e9dd9d104ca fs/cifs/cifsacl.c       Shyam Prasad N                  2021-02-18  1644  		dacloffset = le32_to_cpu(pntsd->dacloffset);
bc3e9dd9d104ca fs/cifs/cifsacl.c       Shyam Prasad N                  2021-02-18  1645  		if (dacloffset) {
298e73ac323a2b fs/smb/client/cifsacl.c ChenXiaoSong                    2024-08-22  1646  			dacl_ptr = (struct smb_acl *)((char *)pntsd + dacloffset);
bc3e9dd9d104ca fs/cifs/cifsacl.c       Shyam Prasad N                  2021-02-18  1647  			if (mode_from_sid)
bc3e9dd9d104ca fs/cifs/cifsacl.c       Shyam Prasad N                  2021-02-18  1648  				nsecdesclen +=
d64429042fef1d fs/smb/client/cifsacl.c ChenXiaoSong                    2024-08-22  1649  					le32_to_cpu(dacl_ptr->num_aces) * sizeof(struct smb_ace);
bc3e9dd9d104ca fs/cifs/cifsacl.c       Shyam Prasad N                  2021-02-18  1650  			else /* cifsacl */
bc3e9dd9d104ca fs/cifs/cifsacl.c       Shyam Prasad N                  2021-02-18  1651  				nsecdesclen += le16_to_cpu(dacl_ptr->size);
bc3e9dd9d104ca fs/cifs/cifsacl.c       Shyam Prasad N                  2021-02-18  1652  		}
f5065508897a92 fs/cifs/cifsacl.c       Shyam Prasad N                  2021-02-12  1653  	}
f5065508897a92 fs/cifs/cifsacl.c       Shyam Prasad N                  2021-02-12  1654  
c78cd83805d431 fs/cifs/cifsacl.c       Jeff Layton                     2012-11-25  1655  	/*
c78cd83805d431 fs/cifs/cifsacl.c       Jeff Layton                     2012-11-25  1656  	 * Add three ACEs for owner, group, everyone getting rid of other ACEs
c78cd83805d431 fs/cifs/cifsacl.c       Jeff Layton                     2012-11-25  1657  	 * as chmod disables ACEs and set the security descriptor. Allocate
c78cd83805d431 fs/cifs/cifsacl.c       Jeff Layton                     2012-11-25  1658  	 * memory for the smb header, set security descriptor request security
c45adff786b780 fs/cifs/cifsacl.c       jack1.li_cp                     2021-04-09  1659  	 * descriptor parameters, and security descriptor itself
c78cd83805d431 fs/cifs/cifsacl.c       Jeff Layton                     2012-11-25  1660  	 */
f5065508897a92 fs/cifs/cifsacl.c       Shyam Prasad N                  2021-02-12  1661  	nsecdesclen = max_t(u32, nsecdesclen, DEFAULT_SEC_DESC_LEN);
f5065508897a92 fs/cifs/cifsacl.c       Shyam Prasad N                  2021-02-12  1662  	pnntsd = kmalloc(nsecdesclen, GFP_KERNEL);
97837582bc1e19 fs/cifs/cifsacl.c       Steve French                    2007-12-31  1663  	if (!pnntsd) {
97837582bc1e19 fs/cifs/cifsacl.c       Steve French                    2007-12-31  1664  		kfree(pntsd);
83e3bc23ef9ce7 fs/cifs/cifsacl.c       Steve French                    2014-02-02  1665  		cifs_put_tlink(tlink);
ef571cadd516e7 fs/cifs/cifsacl.c       Shirish Pargaonkar              2008-07-24  1666  		return -ENOMEM;
97837582bc1e19 fs/cifs/cifsacl.c       Steve French                    2007-12-31  1667  	}
953f868138dbf4 fs/cifs/cifsacl.c       Steve French                    2007-10-31  1668  
f5065508897a92 fs/cifs/cifsacl.c       Shyam Prasad N                  2021-02-12  1669  	rc = build_sec_desc(pntsd, pnntsd, secdesclen, &nsecdesclen, pnmode, uid, gid,
5f36890d650ca9 fs/smb/client/cifsacl.c Ralph Boehme                    2024-11-14  1670  			    mode_from_sid, id_from_sid, posix, &aclflag);
7505e0525c914c fs/cifs/cifsacl.c       Steve French                    2007-11-01  1671  
f96637be081141 fs/cifs/cifsacl.c       Joe Perches                     2013-05-04  1672  	cifs_dbg(NOISY, "build_sec_desc rc: %d\n", rc);
97837582bc1e19 fs/cifs/cifsacl.c       Steve French                    2007-12-31  1673  
ecdcf622eb74b5 fs/cifs/cifsacl.c       Joe Perches via samba-technical 2017-05-07  1674  	if (ops->set_acl == NULL)
83e3bc23ef9ce7 fs/cifs/cifsacl.c       Steve French                    2014-02-02  1675  		rc = -EOPNOTSUPP;
83e3bc23ef9ce7 fs/cifs/cifsacl.c       Steve French                    2014-02-02  1676  
97837582bc1e19 fs/cifs/cifsacl.c       Steve French                    2007-12-31  1677  	if (!rc) {
97837582bc1e19 fs/cifs/cifsacl.c       Steve French                    2007-12-31  1678  		/* Set the security descriptor */
f5065508897a92 fs/cifs/cifsacl.c       Shyam Prasad N                  2021-02-12  1679  		rc = ops->set_acl(pnntsd, nsecdesclen, inode, path, aclflag);
f96637be081141 fs/cifs/cifsacl.c       Joe Perches                     2013-05-04  1680  		cifs_dbg(NOISY, "set_cifs_acl rc: %d\n", rc);
97837582bc1e19 fs/cifs/cifsacl.c       Steve French                    2007-12-31  1681  	}
83e3bc23ef9ce7 fs/cifs/cifsacl.c       Steve French                    2014-02-02  1682  	cifs_put_tlink(tlink);
97837582bc1e19 fs/cifs/cifsacl.c       Steve French                    2007-12-31  1683  
97837582bc1e19 fs/cifs/cifsacl.c       Steve French                    2007-12-31  1684  	kfree(pnntsd);
7505e0525c914c fs/cifs/cifsacl.c       Steve French                    2007-11-01  1685  	kfree(pntsd);
ef571cadd516e7 fs/cifs/cifsacl.c       Shirish Pargaonkar              2008-07-24  1686  	return rc;
953f868138dbf4 fs/cifs/cifsacl.c       Steve French                    2007-10-31  1687  }
bd9684b042dcbb fs/cifs/cifsacl.c       Christian Brauner               2022-09-22  1688  

:::::: The code at line 1601 was first introduced by commit
:::::: 83e3bc23ef9ce7c03b7b4e5d3d790246ea59db3e retrieving CIFS ACLs when mounted with SMB2 fails dropping session

:::::: TO: Steve French <smfrench@gmail.com>
:::::: CC: Steve French <smfrench@gmail.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
