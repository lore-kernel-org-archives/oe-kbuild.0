Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6648C41C69
	for <oe-kbuild@lists.linux.dev>; Sun, 27 Oct 2024 08:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730018769; cv=none; b=McR1AZRC5u8RdCvJQiHpPfQ9GIvOYQEy/l4QM1sYz3764skZ7QAibtoRlEvExm7DJ9F/1v882E/un4s21gyue4ACFL98iJiEw1QQYRWOWaD+hptZqSQqekJBXBvYyFqdJ9kn+02GSPB/8EK/aU6EEs/vMecGqdTyF5z9EqyJgAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730018769; c=relaxed/simple;
	bh=jmjqLfTxt4AjlWI+nIEEPg6YhS3TwK/LQzucZa3bLVU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m9fOvYcuVmYACQDh4L/nEC5NdIBlugB0fAglZmN1EqppLDpYHjpahyy4g8A++o4Pw2XM7SZWBEQ5JKQyvarXasmiVnJKxe9pwxITUZMasWsG/CZZR2QG6xTwD8cJumeD25bE0UQOpz82tH9R+KN7Wdc+cXN7LdUXneCPEEnD94A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O/RCg1JH; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O/RCg1JH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730018766; x=1761554766;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jmjqLfTxt4AjlWI+nIEEPg6YhS3TwK/LQzucZa3bLVU=;
  b=O/RCg1JHKPOjjcYDS4de7P+S/LJDYc/+lA8xx3zIu4QpnRiH/yt3V/3O
   EBN+EVRgE0MHCrKcCdeW8HtrOBZ5o1KSZrVoh258i4B/YaHK+2yNdQplY
   rgWNVmg6Np/gF0lp97mmqoXoK4kmcl7pH84sLQRvsKHjAovyZ6d0+yxAb
   Z+4YkUCQ8DyAUh5B4JuNUEv1sdH44+6UMJvfyNoPALgIyhj2AMvTJCOwz
   W0Y2iOCRIHY9m57eXwmzEST7ENbg7TKHyAn588Zeatk1/TqEusthgUljD
   NbgpL/gfCTlVxDd4pObxyR5p0rKbRiW2wdFWaQL9ZHB7z1bAUNhyI7zAK
   A==;
X-CSE-ConnectionGUID: IExoEnr+S5eLFa5akWsa1A==
X-CSE-MsgGUID: aBgPYzarSjS57zVj2foBHw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="47096895"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="47096895"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2024 01:46:01 -0700
X-CSE-ConnectionGUID: MP8gsQBUTvecxRQ/5GchVg==
X-CSE-MsgGUID: B0Q5pdcITQaTF7mjLBZqdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,236,1725346800"; 
   d="scan'208";a="81443749"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 27 Oct 2024 01:46:00 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4yuL-000aYH-1Q;
	Sun, 27 Oct 2024 08:45:57 +0000
Date: Sun, 27 Oct 2024 16:45:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 1/2] [RFC] hwrng: fix khwrng lifecycle
Message-ID: <202410271650.hsa6hWLy-lkp@intel.com>
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
In-Reply-To: <20241024163121.246420-1-marex@denx.de>
References: <20241024163121.246420-1-marex@denx.de>
TO: Marek Vasut <marex@denx.de>

Hi Marek,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on char-misc/char-misc-testing]
[also build test WARNING on char-misc/char-misc-next char-misc/char-misc-linus herbert-cryptodev-2.6/master linus/master v6.12-rc4 next-20241025]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Marek-Vasut/hwrng-fix-khwrng-registration/20241025-003448
base:   char-misc/char-misc-testing
patch link:    https://lore.kernel.org/r/20241024163121.246420-1-marex%40denx.de
patch subject: [PATCH 1/2] [RFC] hwrng: fix khwrng lifecycle
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: i386-randconfig-141-20241027 (https://download.01.org/0day-ci/archive/20241027/202410271650.hsa6hWLy-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410271650.hsa6hWLy-lkp@intel.com/

smatch warnings:
drivers/char/hw_random/core.c:685 hwrng_modinit() error: double free of 'rng_buffer'

vim +/rng_buffer +685 drivers/char/hw_random/core.c

b58a36008bfa1a Stefan Wahren              2023-09-06  647  
ac3a497f13e42a Herbert Xu                 2014-12-23  648  static int __init hwrng_modinit(void)
ac3a497f13e42a Herbert Xu                 2014-12-23  649  {
78dd6dd163821d Marek Vasut                2024-10-24  650  	int ret = -ENOMEM;
58b022acac8dd4 PrasannaKumar Muralidharan 2016-09-07  651  
58b022acac8dd4 PrasannaKumar Muralidharan 2016-09-07  652  	/* kmalloc makes this safe for virt_to_page() in virtio_rng.c */
58b022acac8dd4 PrasannaKumar Muralidharan 2016-09-07  653  	rng_buffer = kmalloc(rng_buffer_size(), GFP_KERNEL);
58b022acac8dd4 PrasannaKumar Muralidharan 2016-09-07  654  	if (!rng_buffer)
58b022acac8dd4 PrasannaKumar Muralidharan 2016-09-07  655  		return -ENOMEM;
58b022acac8dd4 PrasannaKumar Muralidharan 2016-09-07  656  
58b022acac8dd4 PrasannaKumar Muralidharan 2016-09-07  657  	rng_fillbuf = kmalloc(rng_buffer_size(), GFP_KERNEL);
78dd6dd163821d Marek Vasut                2024-10-24  658  	if (!rng_fillbuf)
78dd6dd163821d Marek Vasut                2024-10-24  659  		goto err_fillbuf;
58b022acac8dd4 PrasannaKumar Muralidharan 2016-09-07  660  
df1e9791998a92 Masahiro Yamada            2024-07-06  661  	ret = misc_register(&rng_miscdev);
78dd6dd163821d Marek Vasut                2024-10-24  662  	if (ret)
78dd6dd163821d Marek Vasut                2024-10-24  663  		goto err_miscdev;
78dd6dd163821d Marek Vasut                2024-10-24  664  
78dd6dd163821d Marek Vasut                2024-10-24  665  	hwrng_fill = kthread_create(hwrng_fillfn, NULL, "hwrng");
78dd6dd163821d Marek Vasut                2024-10-24  666  	if (IS_ERR(hwrng_fill)) {
78dd6dd163821d Marek Vasut                2024-10-24  667  		ret = PTR_ERR(hwrng_fill);
78dd6dd163821d Marek Vasut                2024-10-24  668  		pr_err("hwrng_fill thread creation failed (%d)\n", ret);
78dd6dd163821d Marek Vasut                2024-10-24  669  		goto err_kthread;
58b022acac8dd4 PrasannaKumar Muralidharan 2016-09-07  670  	}
58b022acac8dd4 PrasannaKumar Muralidharan 2016-09-07  671  
78dd6dd163821d Marek Vasut                2024-10-24  672  	ret = kthread_park(hwrng_fill);
78dd6dd163821d Marek Vasut                2024-10-24  673  	if (ret)
78dd6dd163821d Marek Vasut                2024-10-24  674  		goto err_park;
78dd6dd163821d Marek Vasut                2024-10-24  675  
78dd6dd163821d Marek Vasut                2024-10-24  676  	return ret;
78dd6dd163821d Marek Vasut                2024-10-24  677  
78dd6dd163821d Marek Vasut                2024-10-24  678  err_park:
78dd6dd163821d Marek Vasut                2024-10-24  679  	kthread_stop(hwrng_fill);
78dd6dd163821d Marek Vasut                2024-10-24  680  err_kthread:
78dd6dd163821d Marek Vasut                2024-10-24  681  	misc_deregister(&rng_miscdev);
78dd6dd163821d Marek Vasut                2024-10-24  682  err_miscdev:
78dd6dd163821d Marek Vasut                2024-10-24  683  	kfree(rng_buffer);
78dd6dd163821d Marek Vasut                2024-10-24  684  err_fillbuf:
78dd6dd163821d Marek Vasut                2024-10-24 @685  	kfree(rng_buffer);
58b022acac8dd4 PrasannaKumar Muralidharan 2016-09-07  686  	return ret;
ac3a497f13e42a Herbert Xu                 2014-12-23  687  }
ac3a497f13e42a Herbert Xu                 2014-12-23  688  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
