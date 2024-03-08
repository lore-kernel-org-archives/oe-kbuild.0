Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2AF71D529
	for <oe-kbuild@lists.linux.dev>; Fri,  8 Mar 2024 03:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709867076; cv=none; b=PuRxUF2A6Cr9JwnHdXru1fSaAFUYjnh6i0sm7VMPlwRI7aKY+Cc7qSdQCzSDE6Bqc4iL+k99fbCMssjN9vgQ/qTU46bSpiY6Tf9a5JpXL/E282iZknWbYGpXB35njUELYCzBVGeJi0Hm9frN8G9mjd+DVLxQt0wu3MrhHTDJXEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709867076; c=relaxed/simple;
	bh=Wk5qkQsg3Nqx/aZQjXfbmOmSZh+7/6Aw7tGWNeVQK/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pSQkaJ00tTknr+58HiIYXeM5t9vRmWZGrzhIrRsYVRwR3z/8/DddoY6hgjAOIf36EeUEbcO12DfI3lv9umExxOljVHS8HxIZzvaDKXhjBFFsY0rbC6GXgn7Hnt+anwLs/h4RxF8/76rnbtPcvWSlHs79WrjvD3nTGU00hsum9MY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nIA/QrX0; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nIA/QrX0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709867074; x=1741403074;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Wk5qkQsg3Nqx/aZQjXfbmOmSZh+7/6Aw7tGWNeVQK/Y=;
  b=nIA/QrX0Z1dCo1iDibQpJUAPAJenjOFLHPlcu1Oe1ciJl9O80yugyRa0
   JpyxePVfAWLyl8505cw513bOOuN0wFTZ+TDN6G6GP/BTts6G7XbdU6cxh
   +F7I9UjwRauo9RhKtkZSulYB6hDG1Vdv1ib9OBXsUlly/Stsvzyyp7558
   Qfbtxku14d9ipmiX0viJ8vY3syVPEumGoFI4iR03BPdQ7C79ZHcmWJXwN
   ErehWLogPROGFcuf2PXRCVc5V4ewGEAsa+0DtjqsPjl+1CC2+fi+1BDyi
   CS6S6UKrEkFVs9tRHaIBkINRogxBCNNGlWXm9GmmEW4bL0EmnjvxeZeCG
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="22027628"
X-IronPort-AV: E=Sophos;i="6.07,108,1708416000"; 
   d="scan'208";a="22027628"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2024 19:04:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,108,1708416000"; 
   d="scan'208";a="10422000"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 07 Mar 2024 19:04:31 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1riQX7-0005xN-2p;
	Fri, 08 Mar 2024 03:04:29 +0000
Date: Fri, 8 Mar 2024 11:04:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [amir73il:fsnotify-perf 9/13] fs/notify/mark.c:588
 fsnotify_attach_info_to_sb() warn: possible memory leak of 'sbinfo'
Message-ID: <202403081047.n85P68Nh-lkp@intel.com>
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
TO: Amir Goldstein <amir73il@gmail.com>

tree:   https://github.com/amir73il/linux fsnotify-perf
head:   7e45fb51e82f697e956a67fe60939867f4437635
commit: 8c7adb172311fa05c785dc2d15dd2f76dfa5e3a6 [9/13] fsnotify: lazy attach fsnotify_sb_info state to sb
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-141-20240307 (https://download.01.org/0day-ci/archive/20240308/202403081047.n85P68Nh-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202403081047.n85P68Nh-lkp@intel.com/

smatch warnings:
fs/notify/mark.c:588 fsnotify_attach_info_to_sb() warn: possible memory leak of 'sbinfo'

vim +/sbinfo +588 fs/notify/mark.c

8edc6e1688fc8f Jan Kara       2014-11-13  570  
8c7adb172311fa Amir Goldstein 2024-03-06  571  static int fsnotify_attach_info_to_sb(struct super_block *sb)
8c7adb172311fa Amir Goldstein 2024-03-06  572  {
8c7adb172311fa Amir Goldstein 2024-03-06  573  	struct fsnotify_sb_info *sbinfo;
8c7adb172311fa Amir Goldstein 2024-03-06  574  
8c7adb172311fa Amir Goldstein 2024-03-06  575  	/* sb info is freed on fsnotify_sb_delete() */
8c7adb172311fa Amir Goldstein 2024-03-06  576  	sbinfo = kzalloc(sizeof(*sbinfo), GFP_KERNEL);
8c7adb172311fa Amir Goldstein 2024-03-06  577  	if (!sbinfo)
8c7adb172311fa Amir Goldstein 2024-03-06  578  		return -ENOMEM;
8c7adb172311fa Amir Goldstein 2024-03-06  579  
8c7adb172311fa Amir Goldstein 2024-03-06  580  	/*
8c7adb172311fa Amir Goldstein 2024-03-06  581  	 * cmpxchg() provides the barrier so that callers of fsnotify_sb_info()
8c7adb172311fa Amir Goldstein 2024-03-06  582  	 * will observe an initialized structure
8c7adb172311fa Amir Goldstein 2024-03-06  583  	 */
8c7adb172311fa Amir Goldstein 2024-03-06  584  	if (cmpxchg(&sb->s_fsnotify_info, NULL, sbinfo)) {
8c7adb172311fa Amir Goldstein 2024-03-06  585  		/* Someone else created sbinfo for us */
8c7adb172311fa Amir Goldstein 2024-03-06  586  		kfree(sbinfo);
8c7adb172311fa Amir Goldstein 2024-03-06  587  	}
8c7adb172311fa Amir Goldstein 2024-03-06 @588  	return 0;
8c7adb172311fa Amir Goldstein 2024-03-06  589  }
8c7adb172311fa Amir Goldstein 2024-03-06  590  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
