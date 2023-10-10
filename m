Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92B387F0
	for <oe-kbuild@lists.linux.dev>; Tue, 10 Oct 2023 05:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aKTglmR8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696914255; x=1728450255;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2h5MbJvu6uJjgmfqa7arDVmuj54AHHCQvuYe/KwDxzc=;
  b=aKTglmR8DKd4Y2acIsYQMJIjdyCX4ikwDbhxYhxWzkb7AiEHtLSrmcNT
   GIQmbbL8bc+nXNkxPcCM1ZeDN9tWFLOQ8m3kQm7gVNZsvdj14MMvtd3Gj
   dsVYgxYNvBzDT+KprviC2nevEia1VH6nWuzLHPJrFiifBdD82VPD2egi1
   Iy35N/SVxZiTse2/3ucyH0h6HCdtWKHsdFQlwwNqEi7d66r2fsunloaEh
   rSaqxUNw1JJv1m4MoSTH5y1k/zpyXA51OWYZ3+ZiGxnvsB4pYi3EOYW2M
   UIdJMoaGyrwejoTB/MH7ewOPPBlQP4DK7m96/XVPdtdaPEcd0xocRAcnn
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="387148117"
X-IronPort-AV: E=Sophos;i="6.03,211,1694761200"; 
   d="scan'208";a="387148117"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2023 22:04:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="788436023"
X-IronPort-AV: E=Sophos;i="6.03,211,1694761200"; 
   d="scan'208";a="788436023"
Received: from lkp-server02.sh.intel.com (HELO 4ed589823ba4) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 09 Oct 2023 22:04:13 -0700
Received: from kbuild by 4ed589823ba4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qq4uh-00018i-0l;
	Tue, 10 Oct 2023 05:04:11 +0000
Date: Tue, 10 Oct 2023 13:03:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [norov:unload-bitmap 6/8] include/linux/bitmap.h:667:37: sparse:
 sparse: shift too big (32) for type unsigned long
Message-ID: <202310101203.Hgvebl8Z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: include/linux/bitmap.h:667:37: sparse: sparse: shift too big (32) for type unsigned long"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Yury Norov <yury.norov@gmail.com>

tree:   https://github.com/norov/linux unload-bitmap
head:   d12b2cd2f2cace0c68638a2c474e4d0a32b533e5
commit: fe8066a1c1d802a28b2a805e80e908daea9a6ffe [6/8] lib/bitmap: add bitmap_{read,write}()
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: i386-randconfig-061-20231010 (https://download.01.org/0day-ci/archive/20231010/202310101203.Hgvebl8Z-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231010/202310101203.Hgvebl8Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202310101203.Hgvebl8Z-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   lib/test_bitmap.c: note: in included file:
>> include/linux/bitmap.h:667:37: sparse: sparse: shift too big (32) for type unsigned long

vim +667 include/linux/bitmap.h

169c474fb22d8a William Breathitt Gray 2019-12-04  632  
fe8066a1c1d802 Syed Nayyar Waris      2023-10-06  633  /**
fe8066a1c1d802 Syed Nayyar Waris      2023-10-06  634   * bitmap_write - write n-bit value within a memory region
fe8066a1c1d802 Syed Nayyar Waris      2023-10-06  635   * @map: address to the bitmap memory region
fe8066a1c1d802 Syed Nayyar Waris      2023-10-06  636   * @value: value to write, clamped to nbits
fe8066a1c1d802 Syed Nayyar Waris      2023-10-06  637   * @start: bit offset of the n-bit value
fe8066a1c1d802 Syed Nayyar Waris      2023-10-06  638   * @nbits: size of value in bits, nonzero, up to BITS_PER_LONG.
fe8066a1c1d802 Syed Nayyar Waris      2023-10-06  639   *
fe8066a1c1d802 Syed Nayyar Waris      2023-10-06  640   * bitmap_write() behaves similarly to @nbits calls of assign_bit(), i.e. bits
fe8066a1c1d802 Syed Nayyar Waris      2023-10-06  641   * beyond @nbits are ignored:
fe8066a1c1d802 Syed Nayyar Waris      2023-10-06  642   *
fe8066a1c1d802 Syed Nayyar Waris      2023-10-06  643   *   for (bit = 0; bit < nbits; bit++)
fe8066a1c1d802 Syed Nayyar Waris      2023-10-06  644   *           assign_bit(start + bit, bitmap, val & BIT(bit));
fe8066a1c1d802 Syed Nayyar Waris      2023-10-06  645   */
fe8066a1c1d802 Syed Nayyar Waris      2023-10-06  646  static inline void bitmap_write(unsigned long *map,
fe8066a1c1d802 Syed Nayyar Waris      2023-10-06  647  				unsigned long value,
fe8066a1c1d802 Syed Nayyar Waris      2023-10-06  648  				unsigned long start, unsigned long nbits)
fe8066a1c1d802 Syed Nayyar Waris      2023-10-06  649  {
fe8066a1c1d802 Syed Nayyar Waris      2023-10-06  650  	size_t index = BIT_WORD(start);
fe8066a1c1d802 Syed Nayyar Waris      2023-10-06  651  	unsigned long offset = start % BITS_PER_LONG;
fe8066a1c1d802 Syed Nayyar Waris      2023-10-06  652  	unsigned long space = BITS_PER_LONG - offset;
fe8066a1c1d802 Syed Nayyar Waris      2023-10-06  653  	unsigned long mask;
fe8066a1c1d802 Syed Nayyar Waris      2023-10-06  654  
fe8066a1c1d802 Syed Nayyar Waris      2023-10-06  655  	if (unlikely(!nbits))
fe8066a1c1d802 Syed Nayyar Waris      2023-10-06  656  		return;
fe8066a1c1d802 Syed Nayyar Waris      2023-10-06  657  	mask = BITMAP_LAST_WORD_MASK(nbits);
fe8066a1c1d802 Syed Nayyar Waris      2023-10-06  658  	value &= mask;
fe8066a1c1d802 Syed Nayyar Waris      2023-10-06  659  	if (space >= nbits) {
fe8066a1c1d802 Syed Nayyar Waris      2023-10-06  660  		map[index] &= ~(mask << offset);
fe8066a1c1d802 Syed Nayyar Waris      2023-10-06  661  		map[index] |= value << offset;
fe8066a1c1d802 Syed Nayyar Waris      2023-10-06  662  		return;
fe8066a1c1d802 Syed Nayyar Waris      2023-10-06  663  	}
fe8066a1c1d802 Syed Nayyar Waris      2023-10-06  664  	map[index] &= ~BITMAP_FIRST_WORD_MASK(start);
fe8066a1c1d802 Syed Nayyar Waris      2023-10-06  665  	map[index] |= value << offset;
fe8066a1c1d802 Syed Nayyar Waris      2023-10-06  666  	map[index + 1] &= ~BITMAP_LAST_WORD_MASK(start + nbits);
fe8066a1c1d802 Syed Nayyar Waris      2023-10-06 @667  	map[index + 1] |= (value >> space);
fe8066a1c1d802 Syed Nayyar Waris      2023-10-06  668  }
fe8066a1c1d802 Syed Nayyar Waris      2023-10-06  669  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
