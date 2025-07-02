Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50EF24C62
	for <oe-kbuild@lists.linux.dev>; Wed,  2 Jul 2025 03:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751426770; cv=none; b=Ej2ls0Y1yCofrKhXQGiouGk9XTz0scg+p0eQpmWbbh2GEYlqE78DkL1ouzS1I2uF7bK7NYAyTBpkIMVAGU2j5QCr6PhzxJlBxg+ofP49cNY8JTVjb55aVk2yILKqre6RcHe5xvXJtHFyhv6AX4PTJaVe3mCa5OPDfnS/9QlOqlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751426770; c=relaxed/simple;
	bh=0+UkF8FEtqFGRzce332bALflI8G5BYpkuqZhJ3Scdqs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=vF+W/kYYfu4oJdojq6KX4OB+iRMf+BqOPg/+y7K6hOyv8zE4S3b7cm0S2POZZ6hhASytf2Oi7LnMXqbBuEPmVgKNcHW2lT91pE5sOxL7/Bbh6bMO+a1StADGMHKBsN/HSFeKXYbBOTduW7ZMXaUODoOZJRWVtJpbw6Ccj5Szgps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bXvxN6p1; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bXvxN6p1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751426768; x=1782962768;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0+UkF8FEtqFGRzce332bALflI8G5BYpkuqZhJ3Scdqs=;
  b=bXvxN6p17BJBgO96tGC6X0W6MGbjNrxOTCof+NoCQ0KuHPbpcD/xg9oE
   XY7KiCLvdXMh26ikNSWKbedmOz0Z0x2edSuARMTZiiAEKfdF5MpV5nlWB
   kTnD+vGUE1eivqiuSIvueooKuKbpIG3AYkKIcaZjNFc+YvJ7UjFxzj5li
   x5mn61WT5XLdQPyY6s7VOe1BlWh/tlXyEHLjt93sMl5k/DkCKAkPd5F+2
   kunkZcEwKdYg6QDDz3Mt8uwsaRS8D9/kUdnHjwrU+j7M++u7dzIop7WPL
   C7S29vdAh6NpxPlPw18kqbAsytqMuZb6HiGSy5hN2Rq/QJdeJfK4Gn/aY
   g==;
X-CSE-ConnectionGUID: GuiAvVdnSmGJHQOLGleMVQ==
X-CSE-MsgGUID: ++5b/1AmQQW8xwLfY+3ktg==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="57517193"
X-IronPort-AV: E=Sophos;i="6.16,280,1744095600"; 
   d="scan'208";a="57517193"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 20:26:07 -0700
X-CSE-ConnectionGUID: ZCz7xhTrTbyNknFQpEBmzw==
X-CSE-MsgGUID: SArs8e47ShOQw50FSoRE+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,280,1744095600"; 
   d="scan'208";a="153720055"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 01 Jul 2025 20:26:06 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWo6l-00006Z-29;
	Wed, 02 Jul 2025 03:26:03 +0000
Date: Wed, 2 Jul 2025 11:25:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 2/2] smb: invalidate and close cached directory when
 creating child entries
Message-ID: <202507021119.3IUZ9mSr-lkp@intel.com>
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
In-Reply-To: <20250630185303.12087-1-bharathsm@microsoft.com>
References: <20250630185303.12087-1-bharathsm@microsoft.com>
TO: Bharath SM <bharathsm.hsk@gmail.com>
TO: linux-cifs@vger.kernel.org
TO: smfrench@gmail.com
TO: pc@manguebit.com
TO: sprasad@microsoft.com
TO: paul@darkrain42.org
TO: henrique.carvalho@suse.com
CC: Bharath SM <bharathsm@microsoft.com>

Hi Bharath,

kernel test robot noticed the following build warnings:

[auto build test WARNING on cifs/for-next]
[also build test WARNING on linus/master v6.16-rc4]
[cannot apply to next-20250701]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bharath-SM/smb-invalidate-and-close-cached-directory-when-creating-child-entries/20250701-025420
base:   git://git.samba.org/sfrench/cifs-2.6.git for-next
patch link:    https://lore.kernel.org/r/20250630185303.12087-1-bharathsm%40microsoft.com
patch subject: [PATCH 2/2] smb: invalidate and close cached directory when creating child entries
:::::: branch date: 32 hours ago
:::::: commit date: 32 hours ago
config: i386-randconfig-141-20250702 (https://download.01.org/0day-ci/archive/20250702/202507021119.3IUZ9mSr-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202507021119.3IUZ9mSr-lkp@intel.com/

smatch warnings:
fs/smb/client/dir.c:361 cifs_do_create() warn: iterator used outside loop: 'parent_cfid'

vim +/parent_cfid +361 fs/smb/client/dir.c

d2c127197dfc0b fs/cifs/dir.c       Miklos Szeredi    2012-06-05  281  
253641388a4925 fs/cifs/dir.c       Pavel Shilovsky   2012-09-18  282  	desired_access = 0;
608712fe860949 fs/cifs/dir.c       Jeff Layton       2010-10-15  283  	if (OPEN_FMODE(oflags) & FMODE_READ)
253641388a4925 fs/cifs/dir.c       Pavel Shilovsky   2012-09-18  284  		desired_access |= GENERIC_READ; /* is this too little? */
608712fe860949 fs/cifs/dir.c       Jeff Layton       2010-10-15  285  	if (OPEN_FMODE(oflags) & FMODE_WRITE)
253641388a4925 fs/cifs/dir.c       Pavel Shilovsky   2012-09-18  286  		desired_access |= GENERIC_WRITE;
e9e62243a3e232 fs/smb/client/dir.c David Howells     2024-04-02  287  	if (rdwr_for_fscache == 1)
e9e62243a3e232 fs/smb/client/dir.c David Howells     2024-04-02  288  		desired_access |= GENERIC_READ;
^1da177e4c3f41 fs/cifs/dir.c       Linus Torvalds    2005-04-16  289  
d2c127197dfc0b fs/cifs/dir.c       Miklos Szeredi    2012-06-05  290  	disposition = FILE_OVERWRITE_IF;
e08fc0457af28f fs/cifs/dir.c       Miklos Szeredi    2005-09-06  291  	if ((oflags & (O_CREAT | O_EXCL)) == (O_CREAT | O_EXCL))
^1da177e4c3f41 fs/cifs/dir.c       Linus Torvalds    2005-04-16  292  		disposition = FILE_CREATE;
e08fc0457af28f fs/cifs/dir.c       Miklos Szeredi    2005-09-06  293  	else if ((oflags & (O_CREAT | O_TRUNC)) == (O_CREAT | O_TRUNC))
^1da177e4c3f41 fs/cifs/dir.c       Linus Torvalds    2005-04-16  294  		disposition = FILE_OVERWRITE_IF;
e08fc0457af28f fs/cifs/dir.c       Miklos Szeredi    2005-09-06  295  	else if ((oflags & O_CREAT) == O_CREAT)
^1da177e4c3f41 fs/cifs/dir.c       Linus Torvalds    2005-04-16  296  		disposition = FILE_OPEN_IF;
ad7a2926b9e53c fs/cifs/dir.c       Steve French      2008-02-07  297  	else
f96637be081141 fs/cifs/dir.c       Joe Perches       2013-05-04  298  		cifs_dbg(FYI, "Create flag not set in create function\n");
^1da177e4c3f41 fs/cifs/dir.c       Linus Torvalds    2005-04-16  299  
253641388a4925 fs/cifs/dir.c       Pavel Shilovsky   2012-09-18  300  	/*
253641388a4925 fs/cifs/dir.c       Pavel Shilovsky   2012-09-18  301  	 * BB add processing to set equivalent of mode - e.g. via CreateX with
253641388a4925 fs/cifs/dir.c       Pavel Shilovsky   2012-09-18  302  	 * ACLs
253641388a4925 fs/cifs/dir.c       Pavel Shilovsky   2012-09-18  303  	 */
253641388a4925 fs/cifs/dir.c       Pavel Shilovsky   2012-09-18  304  
253641388a4925 fs/cifs/dir.c       Pavel Shilovsky   2012-09-18  305  	if (!server->ops->open) {
253641388a4925 fs/cifs/dir.c       Pavel Shilovsky   2012-09-18  306  		rc = -ENOSYS;
253641388a4925 fs/cifs/dir.c       Pavel Shilovsky   2012-09-18  307  		goto out;
253641388a4925 fs/cifs/dir.c       Pavel Shilovsky   2012-09-18  308  	}
^1da177e4c3f41 fs/cifs/dir.c       Linus Torvalds    2005-04-16  309  
67750fb9e07940 fs/cifs/dir.c       Jeff Layton       2008-05-09  310  	/*
67750fb9e07940 fs/cifs/dir.c       Jeff Layton       2008-05-09  311  	 * if we're not using unix extensions, see if we need to set
67750fb9e07940 fs/cifs/dir.c       Jeff Layton       2008-05-09  312  	 * ATTR_READONLY on the create call
67750fb9e07940 fs/cifs/dir.c       Jeff Layton       2008-05-09  313  	 */
f818dd55c4a8b3 fs/cifs/dir.c       Steve French      2009-01-19  314  	if (!tcon->unix_ext && (mode & S_IWUGO) == 0)
67750fb9e07940 fs/cifs/dir.c       Jeff Layton       2008-05-09  315  		create_options |= CREATE_OPTION_READONLY;
67750fb9e07940 fs/cifs/dir.c       Jeff Layton       2008-05-09  316  
129f2ba6d160a9 fs/smb/client/dir.c Bharath SM        2025-07-01  317  
e9e62243a3e232 fs/smb/client/dir.c David Howells     2024-04-02  318  retry_open:
037e1bae588eac fs/smb/client/dir.c Henrique Carvalho 2025-05-28  319  	if (tcon->cfids && direntry->d_parent && server->dialect >= SMB30_PROT_ID) {
129f2ba6d160a9 fs/smb/client/dir.c Bharath SM        2025-07-01  320  		parent_cfid = NULL;
037e1bae588eac fs/smb/client/dir.c Henrique Carvalho 2025-05-28  321  		spin_lock(&tcon->cfids->cfid_list_lock);
037e1bae588eac fs/smb/client/dir.c Henrique Carvalho 2025-05-28  322  		list_for_each_entry(parent_cfid, &tcon->cfids->entries, entry) {
037e1bae588eac fs/smb/client/dir.c Henrique Carvalho 2025-05-28  323  			if (parent_cfid->dentry == direntry->d_parent) {
037e1bae588eac fs/smb/client/dir.c Henrique Carvalho 2025-05-28  324  				cifs_dbg(FYI, "found a parent cached file handle\n");
037e1bae588eac fs/smb/client/dir.c Henrique Carvalho 2025-05-28  325  				if (parent_cfid->has_lease && parent_cfid->time) {
037e1bae588eac fs/smb/client/dir.c Henrique Carvalho 2025-05-28  326  					lease_flags
037e1bae588eac fs/smb/client/dir.c Henrique Carvalho 2025-05-28  327  						|= SMB2_LEASE_FLAG_PARENT_LEASE_KEY_SET_LE;
037e1bae588eac fs/smb/client/dir.c Henrique Carvalho 2025-05-28  328  					memcpy(fid->parent_lease_key,
037e1bae588eac fs/smb/client/dir.c Henrique Carvalho 2025-05-28  329  					       parent_cfid->fid.lease_key,
037e1bae588eac fs/smb/client/dir.c Henrique Carvalho 2025-05-28  330  					       SMB2_LEASE_KEY_SIZE);
129f2ba6d160a9 fs/smb/client/dir.c Bharath SM        2025-07-01  331  					parent_cfid->dirents.is_valid = false;
037e1bae588eac fs/smb/client/dir.c Henrique Carvalho 2025-05-28  332  				}
037e1bae588eac fs/smb/client/dir.c Henrique Carvalho 2025-05-28  333  				break;
037e1bae588eac fs/smb/client/dir.c Henrique Carvalho 2025-05-28  334  			}
037e1bae588eac fs/smb/client/dir.c Henrique Carvalho 2025-05-28  335  		}
037e1bae588eac fs/smb/client/dir.c Henrique Carvalho 2025-05-28  336  		spin_unlock(&tcon->cfids->cfid_list_lock);
037e1bae588eac fs/smb/client/dir.c Henrique Carvalho 2025-05-28  337  	}
037e1bae588eac fs/smb/client/dir.c Henrique Carvalho 2025-05-28  338  
de036dcaca65cf fs/cifs/dir.c       Volker Lendecke   2023-01-11  339  	oparms = (struct cifs_open_parms) {
de036dcaca65cf fs/cifs/dir.c       Volker Lendecke   2023-01-11  340  		.tcon = tcon,
de036dcaca65cf fs/cifs/dir.c       Volker Lendecke   2023-01-11  341  		.cifs_sb = cifs_sb,
de036dcaca65cf fs/cifs/dir.c       Volker Lendecke   2023-01-11  342  		.desired_access = desired_access,
de036dcaca65cf fs/cifs/dir.c       Volker Lendecke   2023-01-11  343  		.create_options = cifs_create_options(cifs_sb, create_options),
de036dcaca65cf fs/cifs/dir.c       Volker Lendecke   2023-01-11  344  		.disposition = disposition,
de036dcaca65cf fs/cifs/dir.c       Volker Lendecke   2023-01-11  345  		.path = full_path,
de036dcaca65cf fs/cifs/dir.c       Volker Lendecke   2023-01-11  346  		.fid = fid,
037e1bae588eac fs/smb/client/dir.c Henrique Carvalho 2025-05-28  347  		.lease_flags = lease_flags,
de036dcaca65cf fs/cifs/dir.c       Volker Lendecke   2023-01-11  348  		.mode = mode,
de036dcaca65cf fs/cifs/dir.c       Volker Lendecke   2023-01-11  349  	};
226730b4d8adae fs/cifs/dir.c       Pavel Shilovsky   2013-07-05  350  	rc = server->ops->open(xid, &oparms, oplock, buf);
^1da177e4c3f41 fs/cifs/dir.c       Linus Torvalds    2005-04-16  351  	if (rc) {
f96637be081141 fs/cifs/dir.c       Joe Perches       2013-05-04  352  		cifs_dbg(FYI, "cifs_create returned 0x%x\n", rc);
e9e62243a3e232 fs/smb/client/dir.c David Howells     2024-04-02  353  		if (rc == -EACCES && rdwr_for_fscache == 1) {
e9e62243a3e232 fs/smb/client/dir.c David Howells     2024-04-02  354  			desired_access &= ~GENERIC_READ;
e9e62243a3e232 fs/smb/client/dir.c David Howells     2024-04-02  355  			rdwr_for_fscache = 2;
e9e62243a3e232 fs/smb/client/dir.c David Howells     2024-04-02  356  			goto retry_open;
e9e62243a3e232 fs/smb/client/dir.c David Howells     2024-04-02  357  		}
d2c127197dfc0b fs/cifs/dir.c       Miklos Szeredi    2012-06-05  358  		goto out;
c3b2a0c640bff7 fs/cifs/dir.c       Steve French      2009-02-20  359  	}
129f2ba6d160a9 fs/smb/client/dir.c Bharath SM        2025-07-01  360  
129f2ba6d160a9 fs/smb/client/dir.c Bharath SM        2025-07-01 @361  	if (parent_cfid && !parent_cfid->dirents.is_valid)
129f2ba6d160a9 fs/smb/client/dir.c Bharath SM        2025-07-01  362  		close_cached_dir(parent_cfid);
129f2ba6d160a9 fs/smb/client/dir.c Bharath SM        2025-07-01  363  
e9e62243a3e232 fs/smb/client/dir.c David Howells     2024-04-02  364  	if (rdwr_for_fscache == 2)
e9e62243a3e232 fs/smb/client/dir.c David Howells     2024-04-02  365  		cifs_invalidate_cache(inode, FSCACHE_INVAL_DIO_WRITE);
c3b2a0c640bff7 fs/cifs/dir.c       Steve French      2009-02-20  366  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
