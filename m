Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46BAB356757
	for <oe-kbuild@lists.linux.dev>; Tue,  4 Aug 2026 23:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785885761; cv=none; b=nKLtm0SFZWfNfsnry9jpZh8CBi0B+E/FKOXMoS8NMFXrfbWgyg/e1Ho4PCae2wdyojxSuRMQuhpCZb4fpAiWpxOAGXtuuspDpJZ/4oGmoV2B8tQxMbiewUKbRmMZowqHysotQtfuGyAkF+f/wNXVmm+w5EC6eVuIjN/nP3KupyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785885761; c=relaxed/simple;
	bh=1esHGe6W0cREqcl4WZYgWAcsCxrvC4OaSHPC4Y7R7js=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Kf9i4KEujdXfn6Idme3ayCzbyM169+4XqGKEUobDQ/Il0VjR7pb2k0bBNNoFf4yud0lLxzjI4dzSzCHOZnKBT+sjJ7D5f3OWZv1qxFnyv+f4TcWIKk7sEusMN4V6MCW5dVdrbuXaKUQs9NybGfOqBSmp4TPID50lwzYe5EbsTy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KWJv6WbF; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KWJv6WbF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785885759; x=1817421759;
  h=date:from:to:cc:subject:message-id;
  bh=1esHGe6W0cREqcl4WZYgWAcsCxrvC4OaSHPC4Y7R7js=;
  b=KWJv6WbFiAZhArVUy8UgcyriW5sijLPyazU42vJhUZN3Osbejhumo5vs
   mbsVb/uXdPKkwAT6NLQTNsanxtRbtODcFCROxpE3QWvQlvyAOnd2AKcwX
   U9cZ/Je3Lu8CdNBDNYVVw8kYGkOePTnnLugS2H6B7Nm2XHhROq4Qi2pWI
   1s1svGt1gJT5cx8QpB9RcOntBmZaF8nhPtMu7d9G4VTIhYrMF787XxakR
   6CqjqQppM2gv+EcDUd6KCQY9HKGTX3D56tmIxRQQ5rPLjobTEVqMLM3Ww
   OoJYVarqRiZfU2wdxR2Tnviou11Ct9thnzIGiUqd8DMo7mXZMZGJ8Giys
   Q==;
X-CSE-ConnectionGUID: 3+HPP8j3SHaRCxNitdlEPQ==
X-CSE-MsgGUID: 5UqKOY34SF6UwKFnfo6nZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="103852551"
X-IronPort-AV: E=Sophos;i="6.25,205,1779174000"; 
   d="scan'208";a="103852551"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 16:22:38 -0700
X-CSE-ConnectionGUID: c5JYtjq5Rt6rQ1hKCUx89w==
X-CSE-MsgGUID: 7L0WovbKQs6g0eUXuG9wbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,205,1779174000"; 
   d="scan'208";a="266762737"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 04 Aug 2026 16:22:37 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wrOSx-00000000Awl-0Vpd;
	Tue, 04 Aug 2026 23:22:35 +0000
Date: Wed, 05 Aug 2026 07:21:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/ext4/ioctl.c:1576 ext4_ioctl_set_lufid() warn: impossible
 condition '(lufid_args.esl_name_len > 255) => (1-255 > 255)'
Message-ID: <202608050733.wWV0zqak-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Artem Blagodarenko <artem.blagodarenko@gmail.com>
CC: 0day robot <lkp@intel.com>
CC: Andreas Dilger <adilger@dilger.ca>

tree:   https://github.com/intel-lab-lkp/linux/commits/Artem-Blagodarenko/ext4-validate-count-against-limit-in-ext4_dx_csum_verify-_set/20260804-043122
head:   9865af268fb3a85241b9a3ee14a37281da3a4885
commit: 9865af268fb3a85241b9a3ee14a37281da3a4885 ext4: Add EXT4_IOC_SET_LUFID ioctl for setting LUFID on directory entries
date:   27 hours ago
:::::: branch date: 27 hours ago
:::::: commit date: 27 hours ago
config: i386-randconfig-141 (https://download.01.org/0day-ci/archive/20260805/202608050733.wWV0zqak-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202608050733.wWV0zqak-lkp@intel.com/

smatch warnings:
fs/ext4/ioctl.c:1576 ext4_ioctl_set_lufid() warn: impossible condition '(lufid_args.esl_name_len > 255) => (1-255 > 255)'
fs/ext4/namei.c:2465 add_dirent_to_buf() error: we previously assumed 'de' could be null (see line 2441)

vim +1576 fs/ext4/ioctl.c

04a91570ac6776 Theodore Ts'o      2025-09-16  1537  
9865af268fb3a8 Artem Blagodarenko 2026-07-31  1538  /*
9865af268fb3a8 Artem Blagodarenko 2026-07-31  1539   * ext4_ioctl_set_lufid() - Set LUFID on a directory entry
9865af268fb3a8 Artem Blagodarenko 2026-07-31  1540   * @filp:	file pointer (parent directory)
9865af268fb3a8 Artem Blagodarenko 2026-07-31  1541   * @arg:	pointer to ext4_set_lufid structure with filename and LUFID data
9865af268fb3a8 Artem Blagodarenko 2026-07-31  1542   *
9865af268fb3a8 Artem Blagodarenko 2026-07-31  1543   * This ioctl allows setting LUFID data on an existing
9865af268fb3a8 Artem Blagodarenko 2026-07-31  1544   * directory entry. It is called on the parent directory with a filename and
9865af268fb3a8 Artem Blagodarenko 2026-07-31  1545   * LUFID data.
9865af268fb3a8 Artem Blagodarenko 2026-07-31  1546   */
9865af268fb3a8 Artem Blagodarenko 2026-07-31  1547  static long ext4_ioctl_set_lufid(struct file *filp, unsigned long arg)
9865af268fb3a8 Artem Blagodarenko 2026-07-31  1548  {
9865af268fb3a8 Artem Blagodarenko 2026-07-31  1549  	struct inode *dir = file_inode(filp);
9865af268fb3a8 Artem Blagodarenko 2026-07-31  1550  	struct mnt_idmap *idmap = file_mnt_idmap(filp);
9865af268fb3a8 Artem Blagodarenko 2026-07-31  1551  	struct ext4_set_lufid lufid_args;
9865af268fb3a8 Artem Blagodarenko 2026-07-31  1552  	struct {
9865af268fb3a8 Artem Blagodarenko 2026-07-31  1553  		__u32 edp_magic;
9865af268fb3a8 Artem Blagodarenko 2026-07-31  1554  		struct ext4_dirent_data_header df_header;
9865af268fb3a8 Artem Blagodarenko 2026-07-31  1555  		char df_fid[255];
9865af268fb3a8 Artem Blagodarenko 2026-07-31  1556  	} edp;
9865af268fb3a8 Artem Blagodarenko 2026-07-31  1557  	int err;
9865af268fb3a8 Artem Blagodarenko 2026-07-31  1558  
9865af268fb3a8 Artem Blagodarenko 2026-07-31  1559  	/* Check if parent is a directory */
9865af268fb3a8 Artem Blagodarenko 2026-07-31  1560  	if (!S_ISDIR(dir->i_mode))
9865af268fb3a8 Artem Blagodarenko 2026-07-31  1561  		return -ENOTDIR;
9865af268fb3a8 Artem Blagodarenko 2026-07-31  1562  
9865af268fb3a8 Artem Blagodarenko 2026-07-31  1563  	/* This ioctl mutates directory entries; merely having the directory
9865af268fb3a8 Artem Blagodarenko 2026-07-31  1564  	 * open (which only ever requires read access) is not enough.
9865af268fb3a8 Artem Blagodarenko 2026-07-31  1565  	 * MAY_EXEC is required for entry lookup; MAY_WRITE for modification. */
9865af268fb3a8 Artem Blagodarenko 2026-07-31  1566  	err = inode_permission(idmap, dir, MAY_WRITE | MAY_EXEC);
9865af268fb3a8 Artem Blagodarenko 2026-07-31  1567  	if (err)
9865af268fb3a8 Artem Blagodarenko 2026-07-31  1568  		return err;
9865af268fb3a8 Artem Blagodarenko 2026-07-31  1569  
9865af268fb3a8 Artem Blagodarenko 2026-07-31  1570  	/* Copy arguments from user space */
9865af268fb3a8 Artem Blagodarenko 2026-07-31  1571  	if (copy_from_user(&lufid_args, (struct ext4_set_lufid __user *)arg,
9865af268fb3a8 Artem Blagodarenko 2026-07-31  1572  			   sizeof(lufid_args)))
9865af268fb3a8 Artem Blagodarenko 2026-07-31  1573  		return -EFAULT;
9865af268fb3a8 Artem Blagodarenko 2026-07-31  1574  
9865af268fb3a8 Artem Blagodarenko 2026-07-31  1575  	/* Validate parameters.  esl_name_len is NUL-excluded length (1-255). */
9865af268fb3a8 Artem Blagodarenko 2026-07-31 @1576  	if (lufid_args.esl_name_len == 0 || lufid_args.esl_name_len > EXT4_NAME_LEN)
9865af268fb3a8 Artem Blagodarenko 2026-07-31  1577  		return -EINVAL;
9865af268fb3a8 Artem Blagodarenko 2026-07-31  1578  
9865af268fb3a8 Artem Blagodarenko 2026-07-31  1579  	/* ddh_length (esl_data_len + the header byte below) must itself fit
9865af268fb3a8 Artem Blagodarenko 2026-07-31  1580  	 * in the __u8 ddh_length field without wrapping */
9865af268fb3a8 Artem Blagodarenko 2026-07-31  1581  	if (lufid_args.esl_data_len == 0 ||
9865af268fb3a8 Artem Blagodarenko 2026-07-31  1582  	    lufid_args.esl_data_len > 255 - sizeof(edp.df_header))
9865af268fb3a8 Artem Blagodarenko 2026-07-31  1583  		return -EINVAL;
9865af268fb3a8 Artem Blagodarenko 2026-07-31  1584  
9865af268fb3a8 Artem Blagodarenko 2026-07-31  1585  	/* Ensure filename is NUL-terminated at exactly esl_name_len */
9865af268fb3a8 Artem Blagodarenko 2026-07-31  1586  	if (lufid_args.esl_name[lufid_args.esl_name_len] != '\0')
9865af268fb3a8 Artem Blagodarenko 2026-07-31  1587  		return -EINVAL;
9865af268fb3a8 Artem Blagodarenko 2026-07-31  1588  
9865af268fb3a8 Artem Blagodarenko 2026-07-31  1589  	/* '.' and '..' are not ordinary entries -- they must stay the first
9865af268fb3a8 Artem Blagodarenko 2026-07-31  1590  	 * two entries in the directory's first block, so they can't go
9865af268fb3a8 Artem Blagodarenko 2026-07-31  1591  	 * through the general delete+re-add path this ioctl uses */
9865af268fb3a8 Artem Blagodarenko 2026-07-31  1592  	if (!strcmp(lufid_args.esl_name, ".") || !strcmp(lufid_args.esl_name, ".."))
9865af268fb3a8 Artem Blagodarenko 2026-07-31  1593  		return -EINVAL;
9865af268fb3a8 Artem Blagodarenko 2026-07-31  1594  
9865af268fb3a8 Artem Blagodarenko 2026-07-31  1595  	/* Prepare the dentry param struct with LUFID data. ddh_length is
9865af268fb3a8 Artem Blagodarenko 2026-07-31  1596  	 * documented (see struct ext4_dirent_data_header) as the length of
9865af268fb3a8 Artem Blagodarenko 2026-07-31  1597  	 * the header plus the whole data blob -- include the header here so
9865af268fb3a8 Artem Blagodarenko 2026-07-31  1598  	 * every dirdata reader/writer that takes ddh_length at face value
9865af268fb3a8 Artem Blagodarenko 2026-07-31  1599  	 * (e.g. ext4_dirdata_set()'s memcpy) copies the full LUFID payload
9865af268fb3a8 Artem Blagodarenko 2026-07-31  1600  	 * instead of silently dropping its last byte. */
9865af268fb3a8 Artem Blagodarenko 2026-07-31  1601  	edp.edp_magic = EXT4_LUFID_MAGIC;
9865af268fb3a8 Artem Blagodarenko 2026-07-31  1602  	edp.df_header.ddh_length = lufid_args.esl_data_len +
9865af268fb3a8 Artem Blagodarenko 2026-07-31  1603  				    sizeof(edp.df_header);
9865af268fb3a8 Artem Blagodarenko 2026-07-31  1604  	memcpy(edp.df_fid, lufid_args.esl_data, lufid_args.esl_data_len);
9865af268fb3a8 Artem Blagodarenko 2026-07-31  1605  
9865af268fb3a8 Artem Blagodarenko 2026-07-31  1606  	/* Want write access */
9865af268fb3a8 Artem Blagodarenko 2026-07-31  1607  	err = mnt_want_write_file(filp);
9865af268fb3a8 Artem Blagodarenko 2026-07-31  1608  	if (err)
9865af268fb3a8 Artem Blagodarenko 2026-07-31  1609  		return err;
9865af268fb3a8 Artem Blagodarenko 2026-07-31  1610  
9865af268fb3a8 Artem Blagodarenko 2026-07-31  1611  	/* Call the helper function to do the actual work */
9865af268fb3a8 Artem Blagodarenko 2026-07-31  1612  	err = ext4_dirdata_set_lufid(idmap, dir, lufid_args.esl_name,
9865af268fb3a8 Artem Blagodarenko 2026-07-31  1613  				    lufid_args.esl_name_len,
9865af268fb3a8 Artem Blagodarenko 2026-07-31  1614  				    (struct ext4_dentry_param *)&edp);
9865af268fb3a8 Artem Blagodarenko 2026-07-31  1615  
9865af268fb3a8 Artem Blagodarenko 2026-07-31  1616  	mnt_drop_write_file(filp);
9865af268fb3a8 Artem Blagodarenko 2026-07-31  1617  	return err;
9865af268fb3a8 Artem Blagodarenko 2026-07-31  1618  }
9865af268fb3a8 Artem Blagodarenko 2026-07-31  1619  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
