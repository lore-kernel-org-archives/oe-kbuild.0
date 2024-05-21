Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D49E41CD20
	for <oe-kbuild@lists.linux.dev>; Tue, 21 May 2024 12:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716293825; cv=none; b=OQS32S/lwMPQGnF+X4h//eGQizamNKD4F7J3IIl3l6JlyZ9idTJkv5bsVPX2AuoIY3RGouRaI0/0bzBRzgL8PzGMzEbi9Mx5wavWAABr+liu1yNHYVwWDQHEi8CX815SSkHuR9SBLI10qFnsKraq76H4PttYFXpd7iO5QEojoHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716293825; c=relaxed/simple;
	bh=H8XmQWNo+9So7u0l9PDpctzclELE5fE3jVQRD+7Utuw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jQKVFBoguRqExsCdvQC7FkSpG4mqbzDP/ImxuJkYhiSJVKjBvQre+BgIHwzIxIz1pbj4d2fp0+1UH3DQ610tA+o+Dh8/AuH+MjFFYYXv5Avie5FGE13/6DpUd+m4J5+CT5S9IwTp5v+ctmbHc9l7DzLQLWBn6goCvhmuHsM7UDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TqA9OXKL; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TqA9OXKL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716293824; x=1747829824;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=H8XmQWNo+9So7u0l9PDpctzclELE5fE3jVQRD+7Utuw=;
  b=TqA9OXKLAeqy2+iVpcSrrMg3DL+PT5L7gr80dbYIhqsGHbFJfJb6kWHx
   /mVYJx/+vY+Rd4fY67B3anBl97dLm0++vtcXK+rnzKuGddOaSIY/6Izlg
   Tk56+HfFJ9iXzowVout+Rlz7WVh8u8FDsPRBWfNkfljGlKtD0WGHrqSSj
   wTBOmbOotbnc0+xqxbLQKBJpyk7bG2ookuiTfIFrM2xGKb/xzlN+028BZ
   dqPvemHpYQ9HNzwvtEiszuOfAoev3MliLOwrBkt+o9NDDv3ivJnivrxo3
   nCVjJJBgDotLukeycamw1fpSF4WwTFBe3AX6/VaThEDPZJboWnrMtRL9B
   g==;
X-CSE-ConnectionGUID: OHkuXQflRWeNlm+/FiNgag==
X-CSE-MsgGUID: WqniRfW1QDWNXzGe6fGJBA==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="12595354"
X-IronPort-AV: E=Sophos;i="6.08,177,1712646000"; 
   d="scan'208";a="12595354"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2024 05:17:03 -0700
X-CSE-ConnectionGUID: Z9dcr10zT8yUZgqTLFWMhw==
X-CSE-MsgGUID: L5P4uSfOTNSUY7oQd12d0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,177,1712646000"; 
   d="scan'208";a="63734397"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 21 May 2024 05:17:02 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s9OQM-0006MW-1l;
	Tue, 21 May 2024 12:16:58 +0000
Date: Tue, 21 May 2024 20:16:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH RFC] fhandle: expose u64 mount id to name_to_handle_at(2)
Message-ID: <202405211900.ZcYOJf1E-lkp@intel.com>
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
In-Reply-To: <20240520-exportfs-u64-mount-id-v1-1-f55fd9215b8e@cyphar.com>
References: <20240520-exportfs-u64-mount-id-v1-1-f55fd9215b8e@cyphar.com>
TO: Aleksa Sarai <cyphar@cyphar.com>

Hi Aleksa,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 584bbf439d0fa83d728ec49f3a38c581bdc828b4]

url:    https://github.com/intel-lab-lkp/linux/commits/Aleksa-Sarai/fhandle-expose-u64-mount-id-to-name_to_handle_at-2/20240521-053815
base:   584bbf439d0fa83d728ec49f3a38c581bdc828b4
patch link:    https://lore.kernel.org/r/20240520-exportfs-u64-mount-id-v1-1-f55fd9215b8e%40cyphar.com
patch subject: [PATCH RFC] fhandle: expose u64 mount id to name_to_handle_at(2)
:::::: branch date: 14 hours ago
:::::: commit date: 14 hours ago
config: x86_64-randconfig-161-20240521 (https://download.01.org/0day-ci/archive/20240521/202405211900.ZcYOJf1E-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202405211900.ZcYOJf1E-lkp@intel.com/

smatch warnings:
fs/fhandle.c:84 do_sys_name_to_handle() warn: maybe return -EFAULT instead of the bytes remaining?

vim +84 fs/fhandle.c

990d6c2d7aee92 Aneesh Kumar K.V    2011-01-29  16  
6ccaaf59c335a8 Al Viro             2022-08-04  17  static long do_sys_name_to_handle(const struct path *path,
990d6c2d7aee92 Aneesh Kumar K.V    2011-01-29  18  				  struct file_handle __user *ufh,
1702d25fd14170 Aleksa Sarai        2024-05-20  19  				  void __user *mnt_id, bool unique_mntid,
1702d25fd14170 Aleksa Sarai        2024-05-20  20  				  int fh_flags)
990d6c2d7aee92 Aneesh Kumar K.V    2011-01-29  21  {
990d6c2d7aee92 Aneesh Kumar K.V    2011-01-29  22  	long retval;
990d6c2d7aee92 Aneesh Kumar K.V    2011-01-29  23  	struct file_handle f_handle;
990d6c2d7aee92 Aneesh Kumar K.V    2011-01-29  24  	int handle_dwords, handle_bytes;
990d6c2d7aee92 Aneesh Kumar K.V    2011-01-29  25  	struct file_handle *handle = NULL;
990d6c2d7aee92 Aneesh Kumar K.V    2011-01-29  26  
990d6c2d7aee92 Aneesh Kumar K.V    2011-01-29  27  	/*
96b2b072ee62be Amir Goldstein      2023-05-02  28  	 * We need to make sure whether the file system support decoding of
96b2b072ee62be Amir Goldstein      2023-05-02  29  	 * the file handle if decodeable file handle was requested.
990d6c2d7aee92 Aneesh Kumar K.V    2011-01-29  30  	 */
66c62769bcf6aa Amir Goldstein      2023-10-23  31  	if (!exportfs_can_encode_fh(path->dentry->d_sb->s_export_op, fh_flags))
990d6c2d7aee92 Aneesh Kumar K.V    2011-01-29  32  		return -EOPNOTSUPP;
990d6c2d7aee92 Aneesh Kumar K.V    2011-01-29  33  
990d6c2d7aee92 Aneesh Kumar K.V    2011-01-29  34  	if (copy_from_user(&f_handle, ufh, sizeof(struct file_handle)))
990d6c2d7aee92 Aneesh Kumar K.V    2011-01-29  35  		return -EFAULT;
990d6c2d7aee92 Aneesh Kumar K.V    2011-01-29  36  
990d6c2d7aee92 Aneesh Kumar K.V    2011-01-29  37  	if (f_handle.handle_bytes > MAX_HANDLE_SZ)
990d6c2d7aee92 Aneesh Kumar K.V    2011-01-29  38  		return -EINVAL;
990d6c2d7aee92 Aneesh Kumar K.V    2011-01-29  39  
68d6f4f3fbd9b1 Gustavo A. R. Silva 2024-03-25  40  	handle = kzalloc(struct_size(handle, f_handle, f_handle.handle_bytes),
990d6c2d7aee92 Aneesh Kumar K.V    2011-01-29  41  			 GFP_KERNEL);
990d6c2d7aee92 Aneesh Kumar K.V    2011-01-29  42  	if (!handle)
990d6c2d7aee92 Aneesh Kumar K.V    2011-01-29  43  		return -ENOMEM;
990d6c2d7aee92 Aneesh Kumar K.V    2011-01-29  44  
990d6c2d7aee92 Aneesh Kumar K.V    2011-01-29  45  	/* convert handle size to multiple of sizeof(u32) */
990d6c2d7aee92 Aneesh Kumar K.V    2011-01-29  46  	handle_dwords = f_handle.handle_bytes >> 2;
990d6c2d7aee92 Aneesh Kumar K.V    2011-01-29  47  
96b2b072ee62be Amir Goldstein      2023-05-02  48  	/* we ask for a non connectable maybe decodeable file handle */
990d6c2d7aee92 Aneesh Kumar K.V    2011-01-29  49  	retval = exportfs_encode_fh(path->dentry,
990d6c2d7aee92 Aneesh Kumar K.V    2011-01-29  50  				    (struct fid *)handle->f_handle,
96b2b072ee62be Amir Goldstein      2023-05-02  51  				    &handle_dwords, fh_flags);
990d6c2d7aee92 Aneesh Kumar K.V    2011-01-29  52  	handle->handle_type = retval;
990d6c2d7aee92 Aneesh Kumar K.V    2011-01-29  53  	/* convert handle size to bytes */
990d6c2d7aee92 Aneesh Kumar K.V    2011-01-29  54  	handle_bytes = handle_dwords * sizeof(u32);
990d6c2d7aee92 Aneesh Kumar K.V    2011-01-29  55  	handle->handle_bytes = handle_bytes;
990d6c2d7aee92 Aneesh Kumar K.V    2011-01-29  56  	if ((handle->handle_bytes > f_handle.handle_bytes) ||
7cdafe6cc4a6ee Amir Goldstein      2023-05-24  57  	    (retval == FILEID_INVALID) || (retval < 0)) {
990d6c2d7aee92 Aneesh Kumar K.V    2011-01-29  58  		/* As per old exportfs_encode_fh documentation
990d6c2d7aee92 Aneesh Kumar K.V    2011-01-29  59  		 * we could return ENOSPC to indicate overflow
990d6c2d7aee92 Aneesh Kumar K.V    2011-01-29  60  		 * But file system returned 255 always. So handle
990d6c2d7aee92 Aneesh Kumar K.V    2011-01-29  61  		 * both the values
990d6c2d7aee92 Aneesh Kumar K.V    2011-01-29  62  		 */
7cdafe6cc4a6ee Amir Goldstein      2023-05-24  63  		if (retval == FILEID_INVALID || retval == -ENOSPC)
7cdafe6cc4a6ee Amir Goldstein      2023-05-24  64  			retval = -EOVERFLOW;
990d6c2d7aee92 Aneesh Kumar K.V    2011-01-29  65  		/*
990d6c2d7aee92 Aneesh Kumar K.V    2011-01-29  66  		 * set the handle size to zero so we copy only
990d6c2d7aee92 Aneesh Kumar K.V    2011-01-29  67  		 * non variable part of the file_handle
990d6c2d7aee92 Aneesh Kumar K.V    2011-01-29  68  		 */
990d6c2d7aee92 Aneesh Kumar K.V    2011-01-29  69  		handle_bytes = 0;
990d6c2d7aee92 Aneesh Kumar K.V    2011-01-29  70  	} else
990d6c2d7aee92 Aneesh Kumar K.V    2011-01-29  71  		retval = 0;
990d6c2d7aee92 Aneesh Kumar K.V    2011-01-29  72  	/* copy the mount id */
1702d25fd14170 Aleksa Sarai        2024-05-20  73  	if (unique_mntid)
1702d25fd14170 Aleksa Sarai        2024-05-20  74  		retval = put_user(real_mount(path->mnt)->mnt_id_unique,
1702d25fd14170 Aleksa Sarai        2024-05-20  75  				  (u64 __user *) mnt_id);
1702d25fd14170 Aleksa Sarai        2024-05-20  76  	else
1702d25fd14170 Aleksa Sarai        2024-05-20  77  		retval = put_user(real_mount(path->mnt)->mnt_id,
1702d25fd14170 Aleksa Sarai        2024-05-20  78  				  (int __user *) mnt_id);
1702d25fd14170 Aleksa Sarai        2024-05-20  79  	/* copy the handle */
1702d25fd14170 Aleksa Sarai        2024-05-20  80  	if (!retval)
1702d25fd14170 Aleksa Sarai        2024-05-20  81  		retval = copy_to_user(ufh, handle,
1702d25fd14170 Aleksa Sarai        2024-05-20  82  				struct_size(handle, f_handle, handle_bytes));
990d6c2d7aee92 Aneesh Kumar K.V    2011-01-29  83  	kfree(handle);
990d6c2d7aee92 Aneesh Kumar K.V    2011-01-29 @84  	return retval;
990d6c2d7aee92 Aneesh Kumar K.V    2011-01-29  85  }
990d6c2d7aee92 Aneesh Kumar K.V    2011-01-29  86  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
