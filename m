Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C62345FFD9
	for <oe-kbuild@lists.linux.dev>; Tue,  4 Aug 2026 16:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785860338; cv=none; b=E5Cl0GhmFI/5ZHwZoOBab7RN0zoPcF4Hcau51ytDF3KanQ4eLLDyMOwXgcDNLTrBqXvg15vYRFL+4JHnmwCdI6MYxdVM05pDAHjJ0x+0TBtLXRBeKrM1SSqOtAExuZ3iG1Nd2fppT0XA2g35yUkmau+8XETjW8ZSHFQqZWu6TnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785860338; c=relaxed/simple;
	bh=T9BYyau1j2BIhbAGex1vSWRFKQcLeSHE9xHtKJwC6H8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=si0U+VbOnd33Hu7bCJOoMKiSwI53E4+sFgdLIRhQgW0PaKZUOLphIeb6r/OOY7R1XwZrwJwxnd9xiOj1iwzZ+PhQ6uKKL23x2Jy7pkWrec5flGgL022tOa9GVE6MASGFPCxhqBM3uBXgacvayXLl7BS9F+htdHsZjbqKDjm+ytQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UCTZ0EEP; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UCTZ0EEP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785860338; x=1817396338;
  h=date:from:to:cc:subject:message-id;
  bh=T9BYyau1j2BIhbAGex1vSWRFKQcLeSHE9xHtKJwC6H8=;
  b=UCTZ0EEPrevlVWmVpkggQ5238kjtsS4JjkxP8oSWCmIC+61YX72PMP8s
   m45gZ4/YqJ7+ViCiwm4wCw/ELxuqz1V7G10M6mp6QG4MU0isOPZazrBrW
   FOWkk7Cqg37ZKPY5yvRpZU3izngvhhIlj1ecVx71zUBDHYQuutyD81ThF
   dZDf2LDvQ8i+1WzFsDibrqfU4Y4SKY1isdKh3rh+3ciMILtIDldiAFgye
   bMrsS+aaqRY+XMVJ5GV6MHPxO+niXY+G8YifcbtGuu6UqW8OqVoEfWevs
   4SviPDB5GOgMbJr5r6SovK8YtCOuJx0WCpAcU4OGTYQkdtuXJKSATJwuk
   g==;
X-CSE-ConnectionGUID: 9IZ41/rSSEqnt6T9MiDlUw==
X-CSE-MsgGUID: b/Hz2HP8SYi1MotA2SbHUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="109208797"
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; 
   d="scan'208";a="109208797"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 09:18:54 -0700
X-CSE-ConnectionGUID: konr14gXSGyPW7rTMuzXyg==
X-CSE-MsgGUID: iPl2i9IEQjyapOevmvwkGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; 
   d="scan'208";a="266670243"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 04 Aug 2026 09:18:53 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wrHqs-00000000ACY-2gIH;
	Tue, 04 Aug 2026 16:18:50 +0000
Date: Wed, 05 Aug 2026 00:17:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: fs/smb/server/notify.c:31:17: sparse: sparse: cast to
 restricted __le64
Message-ID: <202608050004.jivZisje-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/ChenXiaoSong/smb-server-add-debug-type-for-change-notify/20260804-042542, commit: 49313fc18740a41a57f427351f2c72f6e59b0ecc"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: ChenXiaoSong <chenxiaosong@kylinos.cn>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/ChenXiaoSong/smb-server-add-debug-type-for-change-notify/20260804-042542
head:   e565b2925fa6dedcac7d1796a4b55d7ebf79db96
commit: 49313fc18740a41a57f427351f2c72f6e59b0ecc smb/server: validate notify requests
date:   20 hours ago
:::::: branch date: 20 hours ago
:::::: commit date: 20 hours ago
config: m68k-randconfig-r112-20260804 (https://download.01.org/0day-ci/archive/20260805/202608050004.jivZisje-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260805/202608050004.jivZisje-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608050004.jivZisje-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/smb/server/notify.c:31:17: sparse: sparse: cast to restricted __le64
>> fs/smb/server/notify.c:31:17: sparse: sparse: cast to restricted __le64
>> fs/smb/server/notify.c:31:17: sparse: sparse: cast to restricted __le64
>> fs/smb/server/notify.c:31:17: sparse: sparse: cast to restricted __le64
>> fs/smb/server/notify.c:31:17: sparse: sparse: cast to restricted __le64
>> fs/smb/server/notify.c:31:17: sparse: sparse: cast to restricted __le64
>> fs/smb/server/notify.c:31:17: sparse: sparse: cast to restricted __le64
>> fs/smb/server/notify.c:31:17: sparse: sparse: cast to restricted __le64
>> fs/smb/server/notify.c:31:17: sparse: sparse: cast to restricted __le64
>> fs/smb/server/notify.c:31:17: sparse: sparse: cast to restricted __le64
>> fs/smb/server/notify.c:31:17: sparse: sparse: cast to restricted __le64
>> fs/smb/server/notify.c:31:17: sparse: sparse: cast to restricted __le64
>> fs/smb/server/notify.c:31:17: sparse: sparse: cast to restricted __le64
>> fs/smb/server/notify.c:31:17: sparse: sparse: cast to restricted __le64
>> fs/smb/server/notify.c:31:17: sparse: sparse: cast to restricted __le64
>> fs/smb/server/notify.c:31:17: sparse: sparse: cast to restricted __le64
>> fs/smb/server/notify.c:31:17: sparse: sparse: cast to restricted __le64
>> fs/smb/server/notify.c:31:17: sparse: sparse: cast to restricted __le64
>> fs/smb/server/notify.c:31:17: sparse: sparse: cast to restricted __le64
>> fs/smb/server/notify.c:31:17: sparse: sparse: cast to restricted __le64

vim +31 fs/smb/server/notify.c

49313fc18740a4 ChenXiaoSong 2026-07-23  19  
49313fc18740a4 ChenXiaoSong 2026-07-23  20  static struct ksmbd_file *
49313fc18740a4 ChenXiaoSong 2026-07-23  21  ksmbd_notify_validate_req(struct ksmbd_work *work,
49313fc18740a4 ChenXiaoSong 2026-07-23  22  			  struct smb2_change_notify_req *req,
49313fc18740a4 ChenXiaoSong 2026-07-23  23  			  struct smb2_change_notify_rsp *rsp)
49313fc18740a4 ChenXiaoSong 2026-07-23  24  {
49313fc18740a4 ChenXiaoSong 2026-07-23  25  	struct ksmbd_file *fp;
49313fc18740a4 ChenXiaoSong 2026-07-23  26  	int err;
49313fc18740a4 ChenXiaoSong 2026-07-23  27  
49313fc18740a4 ChenXiaoSong 2026-07-23  28  	fp = ksmbd_lookup_fd_slow(work, req->VolatileFileId,
49313fc18740a4 ChenXiaoSong 2026-07-23  29  				  req->PersistentFileId);
49313fc18740a4 ChenXiaoSong 2026-07-23  30  	if (!fp) {
49313fc18740a4 ChenXiaoSong 2026-07-23 @31  		pr_err("Invalid file id for notify, fid %llu:%llu\n",
49313fc18740a4 ChenXiaoSong 2026-07-23  32  		       le64_to_cpu(req->PersistentFileId),
49313fc18740a4 ChenXiaoSong 2026-07-23  33  		       le64_to_cpu(req->VolatileFileId));
49313fc18740a4 ChenXiaoSong 2026-07-23  34  		rsp->hdr.Status = STATUS_FILE_CLOSED;
49313fc18740a4 ChenXiaoSong 2026-07-23  35  		return ERR_PTR(-ENOENT);
49313fc18740a4 ChenXiaoSong 2026-07-23  36  	}
49313fc18740a4 ChenXiaoSong 2026-07-23  37  
49313fc18740a4 ChenXiaoSong 2026-07-23  38  	ksmbd_debug(NOTIFY,
49313fc18740a4 ChenXiaoSong 2026-07-23  39  		    "fid %llu:%llu, handle notify request, filter 0x%x, flags 0x%x\n",
49313fc18740a4 ChenXiaoSong 2026-07-23  40  		    fp->persistent_id, fp->volatile_id,
49313fc18740a4 ChenXiaoSong 2026-07-23  41  		    le32_to_cpu(req->CompletionFilter), le16_to_cpu(req->Flags));
49313fc18740a4 ChenXiaoSong 2026-07-23  42  
49313fc18740a4 ChenXiaoSong 2026-07-23  43  	if (!S_ISDIR(file_inode(fp->filp)->i_mode)) {
49313fc18740a4 ChenXiaoSong 2026-07-23  44  		pr_err("Notify file id is not a directory, fid %llu:%llu\n",
49313fc18740a4 ChenXiaoSong 2026-07-23  45  		       fp->persistent_id, fp->volatile_id);
49313fc18740a4 ChenXiaoSong 2026-07-23  46  		rsp->hdr.Status = STATUS_NOT_A_DIRECTORY;
49313fc18740a4 ChenXiaoSong 2026-07-23  47  		err = -ENOTDIR;
49313fc18740a4 ChenXiaoSong 2026-07-23  48  		goto err_put_fp;
49313fc18740a4 ChenXiaoSong 2026-07-23  49  	}
49313fc18740a4 ChenXiaoSong 2026-07-23  50  
49313fc18740a4 ChenXiaoSong 2026-07-23  51  	if (!(fp->daccess & FILE_LIST_DIRECTORY_LE)) {
49313fc18740a4 ChenXiaoSong 2026-07-23  52  		pr_err("No permission to monitor directory, fid %llu:%llu\n",
49313fc18740a4 ChenXiaoSong 2026-07-23  53  		       fp->persistent_id, fp->volatile_id);
49313fc18740a4 ChenXiaoSong 2026-07-23  54  		rsp->hdr.Status = STATUS_ACCESS_DENIED;
49313fc18740a4 ChenXiaoSong 2026-07-23  55  		err = -EACCES;
49313fc18740a4 ChenXiaoSong 2026-07-23  56  		goto err_put_fp;
49313fc18740a4 ChenXiaoSong 2026-07-23  57  	}
49313fc18740a4 ChenXiaoSong 2026-07-23  58  
49313fc18740a4 ChenXiaoSong 2026-07-23  59  	if (le32_to_cpu(req->OutputBufferLength) >
49313fc18740a4 ChenXiaoSong 2026-07-23  60  	    work->conn->vals->max_trans_size) {
49313fc18740a4 ChenXiaoSong 2026-07-23  61  		pr_err("Notify output buffer length %u exceeds maximum %u\n",
49313fc18740a4 ChenXiaoSong 2026-07-23  62  		       le32_to_cpu(req->OutputBufferLength),
49313fc18740a4 ChenXiaoSong 2026-07-23  63  		       work->conn->vals->max_trans_size);
49313fc18740a4 ChenXiaoSong 2026-07-23  64  		rsp->hdr.Status = STATUS_INVALID_PARAMETER;
49313fc18740a4 ChenXiaoSong 2026-07-23  65  		err = -EINVAL;
49313fc18740a4 ChenXiaoSong 2026-07-23  66  		goto err_put_fp;
49313fc18740a4 ChenXiaoSong 2026-07-23  67  	}
49313fc18740a4 ChenXiaoSong 2026-07-23  68  
49313fc18740a4 ChenXiaoSong 2026-07-23  69  	return fp;
49313fc18740a4 ChenXiaoSong 2026-07-23  70  
49313fc18740a4 ChenXiaoSong 2026-07-23  71  err_put_fp:
49313fc18740a4 ChenXiaoSong 2026-07-23  72  	ksmbd_fd_put(work, fp);
49313fc18740a4 ChenXiaoSong 2026-07-23  73  	return ERR_PTR(err);
49313fc18740a4 ChenXiaoSong 2026-07-23  74  }
49313fc18740a4 ChenXiaoSong 2026-07-23  75  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
