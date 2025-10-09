Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 800A917A310
	for <oe-kbuild@lists.linux.dev>; Thu,  9 Oct 2025 19:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760036973; cv=none; b=s+ppbziU3ruWxslq1Fl6hqPqUr5ci3mn6Fscm/kfniZ6I1Va2JFX/xpr4e0pUrveh/6U0PgBH7wK6l2RCu4KQBxXmcfnbi0/qnIgFBa0u+W6INV+9jvKfM0qbOS94mmUGgIVwhWVdSSBfinfdOIhISIw8pd5cty3UFqlkYyhOrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760036973; c=relaxed/simple;
	bh=XuW8JfrFIOEVVJrIcBFcw+pjoubzVJQAnzLVZ5FoWQY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aele3VOLnjuGnK99HZS4NVnUluJ2gIgytG83RjPEAjoDgDDMuuEyOVKPHtVAqGy4h/R6OA3lc8EDVMLnJlQxtZzP+Zj9IoleEW2Buo+AHktTPx1duCaQ5Lm4feMUBdfbjlfJYuSBUr53lhPwR56XUMd7YWwqFQBsKqFcspI3j+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XwY7skQG; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XwY7skQG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760036972; x=1791572972;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XuW8JfrFIOEVVJrIcBFcw+pjoubzVJQAnzLVZ5FoWQY=;
  b=XwY7skQGFKj4KV++PbgnDdITQIH1HBWxcz3tm3MOXNckN4JKUbRuX8ri
   YAbCutRfradaL3RSzTh70MudMYELXJxOeYB0gs3glnYL47YokXyK487XE
   WLXiBVoxPoZkFojQdqXoVHaYi6aqaendPzhDueaHsyL9Vca+7uXVPXTd1
   f01VxxH+IvHI8XnUVP/k39EbsCgmF5Tu29F/X/hYP+pPpM8PEkVaZeA+x
   CHJKGpf1TaUu4/qQxQqB4BnhEzCvbrhnrbIPT4Nf65KEQ7H7qLrsRqU+p
   vAV2B9tHvn+yQJLB80hvzdln2SiNf3UeFdZS0CsZZ/OBvmYl71Q8yav0N
   w==;
X-CSE-ConnectionGUID: 3+y2PscOREG7jFee8FnfZA==
X-CSE-MsgGUID: i4crFq3ySFugUpR2/ifzWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="73603024"
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; 
   d="scan'208";a="73603024"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 12:09:31 -0700
X-CSE-ConnectionGUID: elL9oqx1RAyafRNpcVkfuQ==
X-CSE-MsgGUID: xzHJ/S4UQLSBO7BeIrSdPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; 
   d="scan'208";a="179898927"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 09 Oct 2025 12:09:29 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v6w10-0001GN-1O;
	Thu, 09 Oct 2025 19:09:26 +0000
Date: Fri, 10 Oct 2025 03:08:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 13403/13588] fs/smb/client/smb2ops.c:3128
 get_smb2_acl_by_path() error: uninitialized symbol 'rc'.
Message-ID: <202510100324.hSCnBCWb-lkp@intel.com>
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
TO: Markus Elfring <elfring@users.sourceforge.net>
CC: Steve French <stfrench@microsoft.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0b2f041c47acb45db82b4e847af6e17eb66cd32d
commit: e3699346828bf78aaacdae52356c69c1ab0f8cd6 [13403/13588] smb: client: Simplify a return statement in get_smb2_acl_by_path()
:::::: branch date: 7 hours ago
:::::: commit date: 19 hours ago
config: i386-randconfig-141-20251009 (https://download.01.org/0day-ci/archive/20251010/202510100324.hSCnBCWb-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202510100324.hSCnBCWb-lkp@intel.com/

New smatch warnings:
fs/smb/client/smb2ops.c:3128 get_smb2_acl_by_path() error: uninitialized symbol 'rc'.

Old smatch warnings:
fs/smb/client/smb2ops.c:2233 smb3_enum_snapshots() warn: potential user controlled sizeof overflow 'snapshot_in.snapshot_array_size + 12' '0-u32max + 12'
fs/smb/client/smb2ops.c:2235 smb3_enum_snapshots() warn: potential user controlled sizeof overflow 'snapshot_in.snapshot_array_size + 12' '0-u32max + 12'

vim +/rc +3128 fs/smb/client/smb2ops.c

2f1afe25997fc2 fs/cifs/smb2ops.c       Shirish Pargaonkar 2017-06-22  3104  
3651487607ae77 fs/smb/client/smb2ops.c ChenXiaoSong       2024-08-22  3105  static struct smb_ntsd *
2f1afe25997fc2 fs/cifs/smb2ops.c       Shirish Pargaonkar 2017-06-22  3106  get_smb2_acl_by_path(struct cifs_sb_info *cifs_sb,
3970acf7ddb9aa fs/cifs/smb2ops.c       Boris Protopopov   2020-12-18  3107  		     const char *path, u32 *pacllen, u32 info)
2f1afe25997fc2 fs/cifs/smb2ops.c       Shirish Pargaonkar 2017-06-22  3108  {
3651487607ae77 fs/smb/client/smb2ops.c ChenXiaoSong       2024-08-22  3109  	struct smb_ntsd *pntsd = NULL;
2f1afe25997fc2 fs/cifs/smb2ops.c       Shirish Pargaonkar 2017-06-22  3110  	u8 oplock = SMB2_OPLOCK_LEVEL_NONE;
2f1afe25997fc2 fs/cifs/smb2ops.c       Shirish Pargaonkar 2017-06-22  3111  	unsigned int xid;
2f1afe25997fc2 fs/cifs/smb2ops.c       Shirish Pargaonkar 2017-06-22  3112  	int rc;
2f1afe25997fc2 fs/cifs/smb2ops.c       Shirish Pargaonkar 2017-06-22  3113  	struct cifs_tcon *tcon;
2f1afe25997fc2 fs/cifs/smb2ops.c       Shirish Pargaonkar 2017-06-22  3114  	struct tcon_link *tlink = cifs_sb_tlink(cifs_sb);
2f1afe25997fc2 fs/cifs/smb2ops.c       Shirish Pargaonkar 2017-06-22  3115  	struct cifs_fid fid;
2f1afe25997fc2 fs/cifs/smb2ops.c       Shirish Pargaonkar 2017-06-22  3116  	struct cifs_open_parms oparms;
2f1afe25997fc2 fs/cifs/smb2ops.c       Shirish Pargaonkar 2017-06-22  3117  	__le16 *utf16_path;
2f1afe25997fc2 fs/cifs/smb2ops.c       Shirish Pargaonkar 2017-06-22  3118  
2f1afe25997fc2 fs/cifs/smb2ops.c       Shirish Pargaonkar 2017-06-22  3119  	cifs_dbg(FYI, "get smb3 acl for path %s\n", path);
2f1afe25997fc2 fs/cifs/smb2ops.c       Shirish Pargaonkar 2017-06-22  3120  	if (IS_ERR(tlink))
2f1afe25997fc2 fs/cifs/smb2ops.c       Shirish Pargaonkar 2017-06-22  3121  		return ERR_CAST(tlink);
2f1afe25997fc2 fs/cifs/smb2ops.c       Shirish Pargaonkar 2017-06-22  3122  
2f1afe25997fc2 fs/cifs/smb2ops.c       Shirish Pargaonkar 2017-06-22  3123  	tcon = tlink_tcon(tlink);
2f1afe25997fc2 fs/cifs/smb2ops.c       Shirish Pargaonkar 2017-06-22  3124  	xid = get_xid();
2f1afe25997fc2 fs/cifs/smb2ops.c       Shirish Pargaonkar 2017-06-22  3125  
2f1afe25997fc2 fs/cifs/smb2ops.c       Shirish Pargaonkar 2017-06-22  3126  	utf16_path = cifs_convert_path_to_utf16(path, cifs_sb);
cfe89091644c44 fs/cifs/smb2ops.c       Steve French       2018-05-19  3127  	if (!utf16_path) {
cfe89091644c44 fs/cifs/smb2ops.c       Steve French       2018-05-19 @3128  		free_xid(xid);
e3699346828bf7 fs/smb/client/smb2ops.c Markus Elfring     2025-10-08  3129  		return ERR_PTR(-ENOMEM);
cfe89091644c44 fs/cifs/smb2ops.c       Steve French       2018-05-19  3130  	}
2f1afe25997fc2 fs/cifs/smb2ops.c       Shirish Pargaonkar 2017-06-22  3131  
de036dcaca65cf fs/cifs/smb2ops.c       Volker Lendecke    2023-01-11  3132  	oparms = (struct cifs_open_parms) {
de036dcaca65cf fs/cifs/smb2ops.c       Volker Lendecke    2023-01-11  3133  		.tcon = tcon,
fddc6ccc487e5d fs/cifs/smb2ops.c       Shyam Prasad N     2023-03-17  3134  		.path = path,
de036dcaca65cf fs/cifs/smb2ops.c       Volker Lendecke    2023-01-11  3135  		.desired_access = READ_CONTROL,
de036dcaca65cf fs/cifs/smb2ops.c       Volker Lendecke    2023-01-11  3136  		.disposition = FILE_OPEN,
3c3317daef0afa fs/cifs/smb2ops.c       Steve French       2020-10-21  3137  		/*
de036dcaca65cf fs/cifs/smb2ops.c       Volker Lendecke    2023-01-11  3138  		 * When querying an ACL, even if the file is a symlink
de036dcaca65cf fs/cifs/smb2ops.c       Volker Lendecke    2023-01-11  3139  		 * we want to open the source not the target, and so
de036dcaca65cf fs/cifs/smb2ops.c       Volker Lendecke    2023-01-11  3140  		 * the protocol requires that the client specify this
de036dcaca65cf fs/cifs/smb2ops.c       Volker Lendecke    2023-01-11  3141  		 * flag when opening a reparse point
3c3317daef0afa fs/cifs/smb2ops.c       Steve French       2020-10-21  3142  		 */
de036dcaca65cf fs/cifs/smb2ops.c       Volker Lendecke    2023-01-11  3143  		.create_options = cifs_create_options(cifs_sb, 0) |
de036dcaca65cf fs/cifs/smb2ops.c       Volker Lendecke    2023-01-11  3144  				  OPEN_REPARSE_POINT,
de036dcaca65cf fs/cifs/smb2ops.c       Volker Lendecke    2023-01-11  3145  		.fid = &fid,
de036dcaca65cf fs/cifs/smb2ops.c       Volker Lendecke    2023-01-11  3146  	};
2f1afe25997fc2 fs/cifs/smb2ops.c       Shirish Pargaonkar 2017-06-22  3147  
3970acf7ddb9aa fs/cifs/smb2ops.c       Boris Protopopov   2020-12-18  3148  	if (info & SACL_SECINFO)
3970acf7ddb9aa fs/cifs/smb2ops.c       Boris Protopopov   2020-12-18  3149  		oparms.desired_access |= SYSTEM_SECURITY;
3970acf7ddb9aa fs/cifs/smb2ops.c       Boris Protopopov   2020-12-18  3150  
69dda3059e7a4d fs/cifs/smb2ops.c       Aurelien Aptel     2020-03-02  3151  	rc = SMB2_open(xid, &oparms, utf16_path, &oplock, NULL, NULL, NULL,
69dda3059e7a4d fs/cifs/smb2ops.c       Aurelien Aptel     2020-03-02  3152  		       NULL);
2f1afe25997fc2 fs/cifs/smb2ops.c       Shirish Pargaonkar 2017-06-22  3153  	kfree(utf16_path);
2f1afe25997fc2 fs/cifs/smb2ops.c       Shirish Pargaonkar 2017-06-22  3154  	if (!rc) {
2f1afe25997fc2 fs/cifs/smb2ops.c       Shirish Pargaonkar 2017-06-22  3155  		rc = SMB2_query_acl(xid, tlink_tcon(tlink), fid.persistent_fid,
3970acf7ddb9aa fs/cifs/smb2ops.c       Boris Protopopov   2020-12-18  3156  				    fid.volatile_fid, (void **)&pntsd, pacllen,
3970acf7ddb9aa fs/cifs/smb2ops.c       Boris Protopopov   2020-12-18  3157  				    info);
2f1afe25997fc2 fs/cifs/smb2ops.c       Shirish Pargaonkar 2017-06-22  3158  		SMB2_close(xid, tcon, fid.persistent_fid, fid.volatile_fid);
2f1afe25997fc2 fs/cifs/smb2ops.c       Shirish Pargaonkar 2017-06-22  3159  	}
2f1afe25997fc2 fs/cifs/smb2ops.c       Shirish Pargaonkar 2017-06-22  3160  
2f1afe25997fc2 fs/cifs/smb2ops.c       Shirish Pargaonkar 2017-06-22  3161  	cifs_put_tlink(tlink);
2f1afe25997fc2 fs/cifs/smb2ops.c       Shirish Pargaonkar 2017-06-22  3162  	free_xid(xid);
2f1afe25997fc2 fs/cifs/smb2ops.c       Shirish Pargaonkar 2017-06-22  3163  
2f1afe25997fc2 fs/cifs/smb2ops.c       Shirish Pargaonkar 2017-06-22  3164  	cifs_dbg(FYI, "%s: rc = %d ACL len %d\n", __func__, rc, *pacllen);
2f1afe25997fc2 fs/cifs/smb2ops.c       Shirish Pargaonkar 2017-06-22  3165  	if (rc)
2f1afe25997fc2 fs/cifs/smb2ops.c       Shirish Pargaonkar 2017-06-22  3166  		return ERR_PTR(rc);
2f1afe25997fc2 fs/cifs/smb2ops.c       Shirish Pargaonkar 2017-06-22  3167  	return pntsd;
2f1afe25997fc2 fs/cifs/smb2ops.c       Shirish Pargaonkar 2017-06-22  3168  }
2f1afe25997fc2 fs/cifs/smb2ops.c       Shirish Pargaonkar 2017-06-22  3169  

:::::: The code at line 3128 was first introduced by commit
:::::: cfe89091644c441a1ade6dae6d2e47b715648615 smb3: fix various xid leaks

:::::: TO: Steve French <stfrench@microsoft.com>
:::::: CC: Steve French <stfrench@microsoft.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
