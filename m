Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D7974C62
	for <oe-kbuild@lists.linux.dev>; Sun, 11 Aug 2024 00:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723335916; cv=none; b=fsMr/3d5GQhqYp0hPg0GyZGjz+H8B4ZUo5SsrG61Pfz+SmSPmPtU0bMi5uBoHJxyYxX2llsoZebYQ1TGm+VQFxPN4XMkW7bsaalhJ+vdyeTNazDdAfrSN2xz7E4oYmnJ+K09xhEP4Wo0LvO5SAptozqNojHf02aI6Ml78r6mD6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723335916; c=relaxed/simple;
	bh=aEfJGJzftTT0boNA2a9EUFPfbGgP/YAg1FhuCt+gzFw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eAKVLYpH9H4z4SowszB76zUk3t6sDtGr6iSgXL4mUTQhdTooTFwwawRCeUA9frMhrVwyttjLB9Ze+AWTfK6xJXJPnefr3ESKIW8v/TG3IkeE65omrQep+xUt9rI8pmfW3lsoUO4zEncolx5Vps3LwpZgM/GDmzBNexrGsRbbJkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FOXXHEFz; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FOXXHEFz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723335914; x=1754871914;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aEfJGJzftTT0boNA2a9EUFPfbGgP/YAg1FhuCt+gzFw=;
  b=FOXXHEFz06M5fnWqFU7GruskCL8YufwMI+Gd/9/gkeuYw0Rk0cr4rAie
   hqeFRu97OVt9MXbWzKelfg1Rg60vqSQCDnnzsEDt3manwO/cZ7Wrldq1R
   kqqMc5PJKve1Glnjso04zUNc9rf6+UvHbJrAPBFHOMIIbOQgDaAt754Te
   sPwn7AvnqF8gSq071a3MT4fTeSAT2fokxagyI7ynkNzvnMPDSynEtiK/z
   BNCCTAjktF9iwLYrjhnRIiumGhU3iVcfVBubcDaam/G2tkSPyc+zD9mlv
   DVmApaaL+lpQJibXG+FdGmOi7KzvK9QNyAbe4fuZanGmPycLVim++9Fju
   w==;
X-CSE-ConnectionGUID: Old9LSmwSXCMRLfO2hN4hQ==
X-CSE-MsgGUID: h/HbOrlET+Cg61D2E6QnHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11160"; a="24383119"
X-IronPort-AV: E=Sophos;i="6.09,280,1716274800"; 
   d="scan'208";a="24383119"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2024 17:25:14 -0700
X-CSE-ConnectionGUID: 0YVJksjdRsSnnXxLxdc5Ng==
X-CSE-MsgGUID: Go+LC/5mRiqaMQsJb5Ad3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,280,1716274800"; 
   d="scan'208";a="81133716"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 10 Aug 2024 17:25:12 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1scwOU-000AQH-20;
	Sun, 11 Aug 2024 00:25:10 +0000
Date: Sun, 11 Aug 2024 08:24:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 3779/3984] fs/dlm/main.c:57 init_dlm() warn:
 missing error code 'error'
Message-ID: <202408110800.OsoP8TB9-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Alexander Aring <aahringo@redhat.com>
CC: David Teigland <teigland@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   61c01d2e181adfba02fe09764f9fca1de2be0dbe
commit: 94e180d6255f5a765bb723e6e8b67f1438ce574b [3779/3984] dlm: async freeing of lockspace resources
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-161-20240810 (https://download.01.org/0day-ci/archive/20240811/202408110800.OsoP8TB9-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202408110800.OsoP8TB9-lkp@intel.com/

smatch warnings:
fs/dlm/main.c:57 init_dlm() warn: missing error code 'error'

vim +/error +57 fs/dlm/main.c

94e180d6255f5a Alexander Aring    2024-08-02  26  
e7fd41792fc0ee David Teigland     2006-01-18  27  static int __init init_dlm(void)
e7fd41792fc0ee David Teigland     2006-01-18  28  {
e7fd41792fc0ee David Teigland     2006-01-18  29  	int error;
e7fd41792fc0ee David Teigland     2006-01-18  30  
e7fd41792fc0ee David Teigland     2006-01-18  31  	error = dlm_memory_init();
e7fd41792fc0ee David Teigland     2006-01-18  32  	if (error)
e7fd41792fc0ee David Teigland     2006-01-18  33  		goto out;
e7fd41792fc0ee David Teigland     2006-01-18  34  
8b0188b0d60b6f Alexander Aring    2022-11-17  35  	dlm_midcomms_init();
8b0188b0d60b6f Alexander Aring    2022-11-17  36  
e7fd41792fc0ee David Teigland     2006-01-18  37  	error = dlm_lockspace_init();
e7fd41792fc0ee David Teigland     2006-01-18  38  	if (error)
e7fd41792fc0ee David Teigland     2006-01-18  39  		goto out_mem;
e7fd41792fc0ee David Teigland     2006-01-18  40  
e7fd41792fc0ee David Teigland     2006-01-18  41  	error = dlm_config_init();
e7fd41792fc0ee David Teigland     2006-01-18  42  	if (error)
e7fd41792fc0ee David Teigland     2006-01-18  43  		goto out_lockspace;
e7fd41792fc0ee David Teigland     2006-01-18  44  
a48f9721e6db74 Greg Kroah-Hartman 2019-06-12  45  	dlm_register_debugfs();
e7fd41792fc0ee David Teigland     2006-01-18  46  
597d0cae0f99f6 David Teigland     2006-07-12  47  	error = dlm_user_init();
597d0cae0f99f6 David Teigland     2006-07-12  48  	if (error)
ac33d071059557 Patrick Caulfield  2006-12-06  49  		goto out_debug;
597d0cae0f99f6 David Teigland     2006-07-12  50  
2402211a838928 David Teigland     2008-03-14  51  	error = dlm_plock_init();
2402211a838928 David Teigland     2008-03-14  52  	if (error)
01c7a597899320 Alexander Aring    2023-03-06  53  		goto out_user;
2402211a838928 David Teigland     2008-03-14  54  
94e180d6255f5a Alexander Aring    2024-08-02  55  	dlm_wq = alloc_workqueue("dlm_wq", 0, 0);
94e180d6255f5a Alexander Aring    2024-08-02  56  	if (!dlm_wq)
94e180d6255f5a Alexander Aring    2024-08-02 @57  		goto out_plock;
94e180d6255f5a Alexander Aring    2024-08-02  58  
75ce481e15911b Michal Marek       2011-04-01  59  	printk("DLM installed\n");
e7fd41792fc0ee David Teigland     2006-01-18  60  
e7fd41792fc0ee David Teigland     2006-01-18  61  	return 0;
e7fd41792fc0ee David Teigland     2006-01-18  62  
94e180d6255f5a Alexander Aring    2024-08-02  63   out_plock:
94e180d6255f5a Alexander Aring    2024-08-02  64  	dlm_plock_exit();
3ae1acf93a2151 David Teigland     2007-05-18  65   out_user:
3ae1acf93a2151 David Teigland     2007-05-18  66  	dlm_user_exit();
e7fd41792fc0ee David Teigland     2006-01-18  67   out_debug:
e7fd41792fc0ee David Teigland     2006-01-18  68  	dlm_unregister_debugfs();
e7fd41792fc0ee David Teigland     2006-01-18  69  	dlm_config_exit();
e7fd41792fc0ee David Teigland     2006-01-18  70   out_lockspace:
e7fd41792fc0ee David Teigland     2006-01-18  71  	dlm_lockspace_exit();
e7fd41792fc0ee David Teigland     2006-01-18  72   out_mem:
8b0188b0d60b6f Alexander Aring    2022-11-17  73  	dlm_midcomms_exit();
e7fd41792fc0ee David Teigland     2006-01-18  74  	dlm_memory_exit();
e7fd41792fc0ee David Teigland     2006-01-18  75   out:
e7fd41792fc0ee David Teigland     2006-01-18  76  	return error;
e7fd41792fc0ee David Teigland     2006-01-18  77  }
e7fd41792fc0ee David Teigland     2006-01-18  78  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
