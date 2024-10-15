Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDAB47F7FC
	for <oe-kbuild@lists.linux.dev>; Tue, 15 Oct 2024 09:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728986027; cv=none; b=o+pC95U1PnANM4U8QonPG3png26jSIeLth/xN1Ae1cz6oaDJgEjmvvMFCbHXInP2aClz2kXditS5q0jVc5Y2hkanBc7mwCWPHg4/++Ac9W55tOnsCbUsBxxauBy+siBha0OpkIKdjjT+e4mTzFjfTCoEVtTl2W/PG7mkYlpPaIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728986027; c=relaxed/simple;
	bh=AMOzPV+4rf8XKcQiDmHi4pevZInczb3qfTf1m5r/Hrw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ael+DVwaRSxbKsC+mRZwC46yOTMIJ3X2bW8i8raqUiSbZ+VFCYEgiaK7p4NV8pF66324hJ4y3nmTSUakM0OTDHBuIQDGmcaoPW14buApg0z/uG/0XQSy3bZW1+3Lg/DG6++a9EsK7Y2FwXg2YtzzeFtqjG+k7ah7J5tZRMPItxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lwUzNX+0; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lwUzNX+0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728986025; x=1760522025;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AMOzPV+4rf8XKcQiDmHi4pevZInczb3qfTf1m5r/Hrw=;
  b=lwUzNX+0+OxfDqO5JaemSYm+vfquN+9cF8a0GqQp8h9HnQWMBzEK9pFn
   NYCg/GkC2w8CpnBoHVFTqsmu4rI1N56ialpw/UfClC0F8OTMchqthB/2h
   d07RCCaFYfYsSKnM60wWJyXoEdW0mG3u3OKRg72HV9UZkCZMM+m5d4htB
   +oC4JGT8gxO+D0M6lhjgayb2Talx1fbPmKk3qJF/NHUk2RRTclVZfFFPR
   PjjvjOcqYhIn9zre6Ocy/TXGguEDlLXAjXxGBzy4bt4DYk5YfxViwM6Ph
   0tsgb1lHCdtqqQ6K2qMYKFhD7EZAzqg4THTOceRT7fRePr+ydyza5J+i2
   Q==;
X-CSE-ConnectionGUID: tQKjNEYhQuWItkaFY7J/Qg==
X-CSE-MsgGUID: CeOMj0LXRxKK+2kcR6PSNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="28468850"
X-IronPort-AV: E=Sophos;i="6.11,204,1725346800"; 
   d="scan'208";a="28468850"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2024 02:53:44 -0700
X-CSE-ConnectionGUID: vgPBlfN0SKCYEBNQyesLrg==
X-CSE-MsgGUID: AbHlnLb7Rlu4e1gm6w3gEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,204,1725346800"; 
   d="scan'208";a="77853845"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 15 Oct 2024 02:53:42 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t0eFI-000Htz-0y;
	Tue, 15 Oct 2024 09:53:40 +0000
Date: Tue, 15 Oct 2024 17:52:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v1 3/3] pinctrl: th1520: Factor out casts
Message-ID: <202410151731.MnWrd9PX-lkp@intel.com>
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
In-Reply-To: <20241011144826.381104-4-emil.renner.berthing@canonical.com>
References: <20241011144826.381104-4-emil.renner.berthing@canonical.com>
TO: Emil Renner Berthing <emil.renner.berthing@canonical.com>

Hi Emil,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linusw-pinctrl/devel]
[also build test WARNING on linusw-pinctrl/for-next next-20241015]
[cannot apply to linus/master v6.12-rc3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Emil-Renner-Berthing/pinctrl-th1520-Fix-pinconf-return-values/20241011-224939
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
patch link:    https://lore.kernel.org/r/20241011144826.381104-4-emil.renner.berthing%40canonical.com
patch subject: [PATCH v1 3/3] pinctrl: th1520: Factor out casts
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: csky-randconfig-r073-20241015 (https://download.01.org/0day-ci/archive/20241015/202410151731.MnWrd9PX-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410151731.MnWrd9PX-lkp@intel.com/

smatch warnings:
drivers/pinctrl/pinctrl-th1520.c:808 th1520_pinmux_set_mux() warn: variable dereferenced before check 'func' (see line 806)

vim +/func +808 drivers/pinctrl/pinctrl-th1520.c

bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  800  
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  801  static int th1520_pinmux_set_mux(struct pinctrl_dev *pctldev,
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  802  				 unsigned int fsel, unsigned int gsel)
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  803  {
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  804  	struct th1520_pinctrl *thp = pinctrl_dev_get_drvdata(pctldev);
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  805  	const struct function_desc *func = pinmux_generic_get_function(pctldev, fsel);
3d7cbbc97d4a47 Emil Renner Berthing 2024-10-11 @806  	enum th1520_muxtype muxtype = (uintptr_t)func->data;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  807  
d01240b22abf28 clingfei             2024-10-03 @808  	if (!func)
d01240b22abf28 clingfei             2024-10-03  809  		return -EINVAL;
3d7cbbc97d4a47 Emil Renner Berthing 2024-10-11  810  
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  811  	return th1520_pinmux_set(thp, thp->desc.pins[gsel].number,
3d7cbbc97d4a47 Emil Renner Berthing 2024-10-11  812  				 th1520_pad_muxdata(thp->desc.pins[gsel].drv_data),
3d7cbbc97d4a47 Emil Renner Berthing 2024-10-11  813  				 muxtype);
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  814  }
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  815  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
