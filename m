Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C510B28A72F
	for <oe-kbuild@lists.linux.dev>; Wed, 11 Feb 2026 09:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770801325; cv=none; b=hbDKKgln9qag7cPWt0/zOqolYZXCBfSdx9qQ8F66//Sd39lb/atrq/DvVaBvjJOR0GBC5B4hZ0s/kkZXuCh5tQvII5yEPxKqALV8qfzKdxCsHyEwV25xUiZ+67B+1JZ1j/jBZKPHtU9HqXJvcOMY1fI1EWHwXBAshwg2YHzckl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770801325; c=relaxed/simple;
	bh=JUJfwLWZ12BQB+XbauQbqcV1xQ05l7oyQIemrlAldlg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Nfp+rnCes275sqQ+QTgRIByhjv2/rmUdxM8wQk5LWD35fJIzF5gqOJJT1W3nzfJknCa2DfFEVTaSQcySklg4NFgoghYPnTrBVRvH8TiGHHY6U5HlgvL3tCGSAUL363RG44HMEMTAhQErJQ3rx7H2CCOnizJcVly43MN+9euanCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TwjU4e3/; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TwjU4e3/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770801323; x=1802337323;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JUJfwLWZ12BQB+XbauQbqcV1xQ05l7oyQIemrlAldlg=;
  b=TwjU4e3/CF+ARXKlDmt2ZmWLpcFnBHQ0qO7UBAqyCYrPPecA+e7bKUrZ
   /JXOMHSdCO5Zg+pEmOSfLi38nD8T3+E17AylC2/YUtlTC3lfk3qqKuiih
   tZvxpftO6wGpLporKziKwMZOu8upIu58gD+MsrI8YiyJhOYt0o/yLG6J5
   dPkDOuIJu185Y/I2ayDgt5sRreCAynnu0Exqg4joCZEaf+kClQPyjDRVX
   7a4SM374uU7wYTZfDT+hAOZVgE1CCE6Fr8yxnZ6P8EVW/nXYQn1wwTfWl
   iS390OG6Uyb1EJX1UN5tEvPa4IIbbIo//O08RJIjOAYFc6pD5kiv9LBq9
   g==;
X-CSE-ConnectionGUID: YbH+1j/bTZOabqicIKNL8Q==
X-CSE-MsgGUID: klQyuDprQp+4GHwHIZ+Tpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="83045355"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="83045355"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2026 01:15:23 -0800
X-CSE-ConnectionGUID: wjmvkCoGQiOujBGAu0sXNQ==
X-CSE-MsgGUID: ItwjlbLEQ2Gq3KmJZW4osw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="216485710"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 11 Feb 2026 01:15:22 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vq6Jc-00000000pqy-0C4e;
	Wed, 11 Feb 2026 09:15:20 +0000
Date: Wed, 11 Feb 2026 17:15:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 1/2] fat: Add FS_IOC_GETFSLABEL ioctl
Message-ID: <202602111747.QIBXIwpw-lkp@intel.com>
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
In-Reply-To: <20260210222310.357755-2-ethan.ferguson@zetier.com>
References: <20260210222310.357755-2-ethan.ferguson@zetier.com>
TO: Ethan Ferguson <ethan.ferguson@zetier.com>
TO: hirofumi@mail.parknet.co.jp
CC: linux-fsdevel@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Ethan Ferguson <ethan.ferguson@zetier.com>

Hi Ethan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 9f2693489ef8558240d9e80bfad103650daed0af]

url:    https://github.com/intel-lab-lkp/linux/commits/Ethan-Ferguson/fat-Add-FS_IOC_GETFSLABEL-ioctl/20260211-062606
base:   9f2693489ef8558240d9e80bfad103650daed0af
patch link:    https://lore.kernel.org/r/20260210222310.357755-2-ethan.ferguson%40zetier.com
patch subject: [PATCH 1/2] fat: Add FS_IOC_GETFSLABEL ioctl
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: riscv-randconfig-r071-20260211 (https://download.01.org/0day-ci/archive/20260211/202602111747.QIBXIwpw-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 9.5.0
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202602111747.QIBXIwpw-lkp@intel.com/

smatch warnings:
fs/fat/file.c:160 fat_ioctl_get_volume_label() warn: maybe return -EFAULT instead of the bytes remaining?

vim +160 fs/fat/file.c

f663b5b38fffeb Wentao Wang    2018-08-21  155  
5fc1746d68b8fb Ethan Ferguson 2026-02-10  156  static int fat_ioctl_get_volume_label(struct inode *inode, char __user *arg)
5fc1746d68b8fb Ethan Ferguson 2026-02-10  157  {
5fc1746d68b8fb Ethan Ferguson 2026-02-10  158  	struct msdos_sb_info *sbi = MSDOS_SB(inode->i_sb);
5fc1746d68b8fb Ethan Ferguson 2026-02-10  159  
5fc1746d68b8fb Ethan Ferguson 2026-02-10 @160  	return copy_to_user(arg, sbi->vol_label, MSDOS_NAME);
5fc1746d68b8fb Ethan Ferguson 2026-02-10  161  }
5fc1746d68b8fb Ethan Ferguson 2026-02-10  162  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
