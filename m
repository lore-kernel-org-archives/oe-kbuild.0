Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795663294;
	b=SqduVb/VcaDzovz4U6606lWzEEsbcBqXecwHVQrLw3Ku7wQw6gSGxsBO+CCxub6GIfy8
	 KmEnGa2YVmm+Pt5N1lYJLJ4YEE8x8ZuRHLEmyTSXn27tsBBQKwEdlqWMOIYxlP+3dwQgg
	 II16ppMYW7kVvt27S9E/tMEDqI1ID2FZVNRSVHllZxX+0+9gc+0z8n5cRolMr6v3Z9qTH
	 9LUOFjej0oWgvNCNsgW52Fl9bMM9koQ/ak0u5g/uNoh+pFlvwxXriHG62pou2ys21W1h1
	 S3OtUjHQt+VjKkliWIXRWQBvrutLqws4Rlw+fVBs+Fyo082T4kXblqVy7Rn9FrtuRNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795663294;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=cALwtnzbVQ4Yq8famy4kRwnE2/BrKym3vO1yAaze6RI=;
	b=PM/DsyAjV+70mDep9pvxhl874oPvBAJzeEOig+Omhv+z4/n/iX90kYk/vkmQjitwzN3a
	 W1URRyPgHe86o65rDam7VTMz4qTjSipiW4DUI6HBN5uqIXduSgpeIMpGANeOubxWGVPZJ
	 C6ZJERCWy0HqvjKgroYqGhtjm8uunkR4fuEJshAT2U2IkeWZ0pX7UyCNZjOGJe1sQpsrR
	 BXnz3mHgJ98EkPjF0LHlI+4qKjjOOh75JbQMA3xGxOum+isoe0sGq0aiK//xzr1dofTYN
	 TlURpc4uy5pLlpKhb0zqu48R952FaZ1eBbdYYrNexGqFvZBkAAmeA+BrzhoBG0x6EFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nualnsm1;
	arc=none smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0C18606A32E
	for <oe-kbuild@lists.linux.dev>; Thu, 26 Nov 2026 03:21:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0C18606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nualnsm1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795663293; x=1827199293;
  h=date:from:to:cc:subject:message-id;
  bh=dufXcUC0gTajSrgDhq9qaoPBkgVo2emoKkNqaf+7t1M=;
  b=nualnsm1lFwz7hbOgkdGcWUAOJKL7uhEaGoY94MdXhuaq+IN6m5Mgwgm
   odcPeysaNOQ/kJneWRb0jmae4jMZof9DjPijZKwO9dH1SvK4lJHLPTfPz
   otVUa+pPchbgi3wzRtAd4nlN4BSTSovG4P1wjR7A9TnmFOeKAvacQjzpt
   /XG0rzVXUTJcyhSV5k7SAiUYge6nHmkqtMjJ81+R1l/ebIHHZXAU1jA9b
   Sgwu7mqR/wo230cr1DHjK+M2oTdv9p8nHKg8S/zTbhHW3mebRTh33UMJ6
   ii6DUbN+8v4Uf8+eh1d4B67D5MqyMG3bsV8EYy34Wyv68BvLIdVhW3wRr
   w==;
X-CSE-ConnectionGUID: qO331ST9SbKLLz7WGOliXg==
X-CSE-MsgGUID: W7PDvt4GRlqg3nJKH1AvbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4626498"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4626498"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 19:21:33 -0800
X-CSE-ConnectionGUID: dGuMLfCgQ1OnR2h1vCUsNw==
X-CSE-MsgGUID: PmXEOCWDT3qxlb1syfM7wA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="12271134"
Received: from igk-lkp-server01.igk.intel.com (HELO a03d4d989450) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 25 Nov 2026 19:21:32 -0800
Received: from kbuild by a03d4d989450 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xWQ38-000000000Dj-02fv;
	Thu, 26 Nov 2026 03:21:30 +0000
Date: Thu, 26 Nov 2026 04:21:17 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linkinjeon-smb:ksmbd-for-next 48/48]
 fs/smb/server/smbacl.c:793 parse_sec_desc() warn: missing error code? 'rc'
Message-ID: <20261126042013.QSoDDLPw-lkp@intel.com>
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
TO: Ian Bridges <icb@fastmail.org>
CC: Namjae Jeon <linkinjeon@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linkinjeon/smb.git ksmbd-for-next
head:   f9208b7a49196e36c0434637ab83e001f5800a1d
commit: f9208b7a49196e36c0434637ab83e001f5800a1d [48/48] ksmbd: use the security descriptor codec in callers
:::::: branch date: 5 hours ago
:::::: commit date: 5 hours ago
config: sparc-randconfig-2200-20261126 (https://download.01.org/0day-ci/archive/20261126/20261126042013.QSoDDLPw-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 13.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/20261126042013.QSoDDLPw-lkp@intel.com/

smatch warnings:
fs/smb/server/smbacl.c:793 parse_sec_desc() warn: missing error code? 'rc'

vim +/rc +793 fs/smb/server/smbacl.c

e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon               2021-03-16  766  
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon               2021-03-16  767  /* Convert CIFS ACL to POSIX form */
1923c1065fe94c fs/smb/server/smbacl.c Christian Brauner         2026-09-01  768  int parse_sec_desc(const struct mnt_idmap *idmap, struct smb_ntsd *pntsd,
f9208b7a49196e fs/smb/server/smbacl.c Ian Bridges               2026-11-26  769  		   int acl_len, struct smb_fattr *fattr, struct ksmbd_sd **psd)
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon               2021-03-16  770  {
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon               2021-03-16  771  	int rc = 0;
f9208b7a49196e fs/smb/server/smbacl.c Ian Bridges               2026-11-26  772  	const struct smb_sid *owner_sid_ptr = NULL, *group_sid_ptr = NULL;
f9208b7a49196e fs/smb/server/smbacl.c Ian Bridges               2026-11-26  773  	struct ksmbd_sd *sd __free(kvfree) = NULL;
548e9ad317393b fs/cifsd/smbacl.c      Namjae Jeon               2021-03-21  774  	int pntsd_type;
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon               2021-03-16  775  
64b39f4a2fd293 fs/cifsd/smbacl.c      Namjae Jeon               2021-03-30  776  	if (!pntsd)
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon               2021-03-16  777  		return -EIO;
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon               2021-03-16  778  
f9208b7a49196e fs/smb/server/smbacl.c Ian Bridges               2026-11-26  779  	if (acl_len < (int)sizeof(struct smb_ntsd))
8f77150c15f877 fs/ksmbd/smbacl.c      Hyunchul Lee              2021-09-24  780  		return -EINVAL;
8f77150c15f877 fs/ksmbd/smbacl.c      Hyunchul Lee              2021-09-24  781  
f9208b7a49196e fs/smb/server/smbacl.c Ian Bridges               2026-11-26  782  	/* Refuse an SD from a client if the decoder left a part out */
f9208b7a49196e fs/smb/server/smbacl.c Ian Bridges               2026-11-26  783  	rc = ksmbd_sd_decode((u8 *)pntsd, acl_len, &sd);
f9208b7a49196e fs/smb/server/smbacl.c Ian Bridges               2026-11-26  784  	if (rc == -EBADMSG || (!rc && sd->part_dropped))
f9208b7a49196e fs/smb/server/smbacl.c Ian Bridges               2026-11-26  785  		rc = -EINVAL;
f9208b7a49196e fs/smb/server/smbacl.c Ian Bridges               2026-11-26  786  	if (rc)
f9208b7a49196e fs/smb/server/smbacl.c Ian Bridges               2026-11-26  787  		return rc;
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon               2021-03-16  788  
f9208b7a49196e fs/smb/server/smbacl.c Ian Bridges               2026-11-26  789  	pntsd_type = sd->control;
f9208b7a49196e fs/smb/server/smbacl.c Ian Bridges               2026-11-26  790  	if (sd->dacl == KSMBD_ACL_ABSENT) {
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon               2021-03-16  791  		ksmbd_debug(SMB, "DACL_PRESENT in DACL type is not set\n");
f9208b7a49196e fs/smb/server/smbacl.c Ian Bridges               2026-11-26  792  		*psd = no_free_ptr(sd);
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon               2021-03-16 @793  		return rc;
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon               2021-03-16  794  	}
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon               2021-03-16  795  
f9208b7a49196e fs/smb/server/smbacl.c Ian Bridges               2026-11-26  796  	/* The stored SD keeps only the Control bits set below and no SACL */
f9208b7a49196e fs/smb/server/smbacl.c Ian Bridges               2026-11-26  797  	sd->control = 0;
f9208b7a49196e fs/smb/server/smbacl.c Ian Bridges               2026-11-26  798  	sd->sacl = KSMBD_ACL_ABSENT;
f9208b7a49196e fs/smb/server/smbacl.c Ian Bridges               2026-11-26  799  	sd->sacl_len = 0;
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon               2021-03-16  800  
f9208b7a49196e fs/smb/server/smbacl.c Ian Bridges               2026-11-26  801  	if (sd->owner) {
f9208b7a49196e fs/smb/server/smbacl.c Ian Bridges               2026-11-26  802  		owner_sid_ptr = sd->owner;
4d7ca4090184c1 fs/ksmbd/smbacl.c      Christian Brauner         2023-01-13  803  		rc = sid_to_id(idmap, owner_sid_ptr, SIDOWNER, fattr);
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon               2021-03-16  804  		if (rc) {
fbe0bb2b75eb3c fs/smb/server/smbacl.c Namjae Jeon               2026-07-01  805  			ksmbd_debug(SMB, "Owner SID has no Unix uid mapping\n");
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon               2021-03-16  806  			owner_sid_ptr = NULL;
fbe0bb2b75eb3c fs/smb/server/smbacl.c Namjae Jeon               2026-07-01  807  			rc = 0;
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon               2021-03-16  808  		}
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon               2021-03-16  809  	}
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon               2021-03-16  810  
f9208b7a49196e fs/smb/server/smbacl.c Ian Bridges               2026-11-26  811  	if (sd->group) {
f9208b7a49196e fs/smb/server/smbacl.c Ian Bridges               2026-11-26  812  		group_sid_ptr = sd->group;
4d7ca4090184c1 fs/ksmbd/smbacl.c      Christian Brauner         2023-01-13  813  		rc = sid_to_id(idmap, group_sid_ptr, SIDUNIX_GROUP, fattr);
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon               2021-03-16  814  		if (rc) {
fbe0bb2b75eb3c fs/smb/server/smbacl.c Namjae Jeon               2026-07-01  815  			ksmbd_debug(SMB, "Group SID has no Unix gid mapping\n");
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon               2021-03-16  816  			group_sid_ptr = NULL;
fbe0bb2b75eb3c fs/smb/server/smbacl.c Namjae Jeon               2026-07-01  817  			rc = 0;
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon               2021-03-16  818  		}
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon               2021-03-16  819  	}
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon               2021-03-16  820  
070fb21e5912b6 fs/cifsd/smbacl.c      Namjae Jeon               2021-05-26  821  	if ((pntsd_type & (DACL_AUTO_INHERITED | DACL_AUTO_INHERIT_REQ)) ==
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon               2021-03-16  822  	    (DACL_AUTO_INHERITED | DACL_AUTO_INHERIT_REQ))
f9208b7a49196e fs/smb/server/smbacl.c Ian Bridges               2026-11-26  823  		sd->control |= DACL_AUTO_INHERITED;
e2f34481b24db2 fs/cifsd/smbacl.c      Namjae Jeon               2021-03-16  824  	if (pntsd_type & DACL_PROTECTED)
f9208b7a49196e fs/smb/server/smbacl.c Ian Bridges               2026-11-26  825  		sd->control |= DACL_PROTECTED;
d6e13e19063db2 fs/smb/server/smbacl.c Namjae Jeon               2025-02-18  826  
f9208b7a49196e fs/smb/server/smbacl.c Ian Bridges               2026-11-26  827  	rc = parse_dacl(idmap, sd, owner_sid_ptr, group_sid_ptr, fattr);
c61dc7b1b4a323 fs/smb/server/smbacl.c Namjae Jeon               2026-08-25  828  	if (rc)
c61dc7b1b4a323 fs/smb/server/smbacl.c Namjae Jeon               2026-08-25  829  		return rc;
fda9522ed6afae fs/smb/server/smbacl.c Asim Viladi Oglu Manizada 2026-03-25  830  
f9208b7a49196e fs/smb/server/smbacl.c Ian Bridges               2026-11-26  831  	*psd = no_free_ptr(sd);
fda9522ed6afae fs/smb/server/smbacl.c Asim Viladi Oglu Manizada 2026-03-25  832  	return 0;
fda9522ed6afae fs/smb/server/smbacl.c Asim Viladi Oglu Manizada 2026-03-25  833  }
fda9522ed6afae fs/smb/server/smbacl.c Asim Viladi Oglu Manizada 2026-03-25  834  

:::::: The code at line 793 was first introduced by commit
:::::: e2f34481b24db2fd634b5edb0a5bd0e4d38cc6e9 cifsd: add server-side procedures for SMB3

:::::: TO: Namjae Jeon <namjae.jeon@samsung.com>
:::::: CC: Steve French <stfrench@microsoft.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
