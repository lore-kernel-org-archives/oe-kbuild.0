Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD0A922331
	for <oe-kbuild@lists.linux.dev>; Tue,  5 Nov 2024 00:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730768276; cv=none; b=WjwbwjfESMefWZqZGYtsulzI4ANuO44i1Y9U2aGIIY+ATjUvqevNWBgJF2iKX8m2RZZbNO901WuGzZ4UrlAVKVGrIkfb1lJiB/E+4L+m5EmmhXDfeGgsoIr7XH1hO3JSQXHIifqO/uKcKM6e2YWDM9839gZz2R3Kt4U3sGl4N8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730768276; c=relaxed/simple;
	bh=99fPFcXoODkTBtABnsRJxesYP2mAVVzQFAnIEesCIIU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FKIhjW8f4H0/WERdKQn3VoP6B6XesYoZWFuUwzAwgSvIldxaQ711yuTW154eYFZ51rdPYUkkA8lW0/Q/hzKvUjwXofPI2z0ICdOzCCEP3OCIFXIYt7rix2NXfvFNrUUNzMoOg1KslCU5k/xktimx+7KxP7ojTgxtYRInS4kJyYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fLA44rtN; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fLA44rtN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730768274; x=1762304274;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=99fPFcXoODkTBtABnsRJxesYP2mAVVzQFAnIEesCIIU=;
  b=fLA44rtN5mOCpfbGXVOsFNDBCSlL3pgXoJ6VOqnwEUgW6i3G1BKfYHDi
   aM2NRjsALZfiXV7+esvQ7KkImUxXcDZEVmoRDN6cfmm6ZzoFI5pAR0H/a
   16gR+jcrq13WXZGOGA8JQ6oO4OA2tJX+spqOj9k7GFScNCP0BH2NrJXmJ
   448FAWAD8rQwL6Eqra+lv/coBVjReVJQVPMkyjJZHJg2hmUiE2P1z/rtV
   7b0y0kxiLLEIqgEE3zZp8i6A17mqEkzvlQYqW5M1bLGL20aBWwUA9wsEM
   AEY6Vbh5FIKr6O0bo2HOatZ8Uj8XSMqX0dBsthDAFwE8IJ8b2gKSjtwSa
   w==;
X-CSE-ConnectionGUID: qSj08totRw+9ZaML5AOpHw==
X-CSE-MsgGUID: 9hwRFluYTgy92PWLq0kYmw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="34184219"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="34184219"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 16:57:54 -0800
X-CSE-ConnectionGUID: jN1JIhGcReGyYF+al1MZFQ==
X-CSE-MsgGUID: UZhaWKPPTHK7lsIWh4J/pA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,258,1725346800"; 
   d="scan'208";a="84639080"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 04 Nov 2024 16:57:53 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t87tH-000lSF-1B;
	Tue, 05 Nov 2024 00:57:51 +0000
Date: Tue, 5 Nov 2024 08:57:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: fs/bcachefs/super-io.c:813:10-27: opportunity for
 str_write_read(bio_data_dir ( bio ))
Message-ID: <202411050812.LzlSV6fr-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Kent Overstreet <kent.overstreet@linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   557329bcecc2f55e134db8974953b32b69db9d15
commit: 94119eeb02d114aa1f78dcfaabdca50b9b626790 bcachefs: Add IO error counts to bch_member
date:   1 year ago
:::::: branch date: 7 hours ago
:::::: commit date: 1 year ago
config: x86_64-randconfig-102-20241104 (https://download.01.org/0day-ci/archive/20241105/202411050812.LzlSV6fr-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202411050812.LzlSV6fr-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/bcachefs/super-io.c:813:10-27: opportunity for str_write_read(bio_data_dir ( bio ))

vim +813 fs/bcachefs/super-io.c

1c6fdbd8f2465d Kent Overstreet 2017-03-16  801  
1c6fdbd8f2465d Kent Overstreet 2017-03-16  802  static void write_super_endio(struct bio *bio)
1c6fdbd8f2465d Kent Overstreet 2017-03-16  803  {
1c6fdbd8f2465d Kent Overstreet 2017-03-16  804  	struct bch_dev *ca = bio->bi_private;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  805  
1c6fdbd8f2465d Kent Overstreet 2017-03-16  806  	/* XXX: return errors directly */
1c6fdbd8f2465d Kent Overstreet 2017-03-16  807  
94119eeb02d114 Kent Overstreet 2023-10-25  808  	if (bch2_dev_io_err_on(bio->bi_status, ca,
94119eeb02d114 Kent Overstreet 2023-10-25  809  			       bio_data_dir(bio)
94119eeb02d114 Kent Overstreet 2023-10-25  810  			       ? BCH_MEMBER_ERROR_write
94119eeb02d114 Kent Overstreet 2023-10-25  811  			       : BCH_MEMBER_ERROR_read,
94119eeb02d114 Kent Overstreet 2023-10-25  812  			       "superblock %s error: %s",
94119eeb02d114 Kent Overstreet 2023-10-25 @813  			       bio_data_dir(bio) ? "write" : "read",
63b214e75b1c94 Kent Overstreet 2020-07-21  814  			       bch2_blk_status_to_str(bio->bi_status)))
1c6fdbd8f2465d Kent Overstreet 2017-03-16  815  		ca->sb_write_error = 1;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  816  
1c6fdbd8f2465d Kent Overstreet 2017-03-16  817  	closure_put(&ca->fs->sb_write);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  818  	percpu_ref_put(&ca->io_ref);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  819  }
1c6fdbd8f2465d Kent Overstreet 2017-03-16  820  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
