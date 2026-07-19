Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41FBE2D781B
	for <oe-kbuild@lists.linux.dev>; Sun, 19 Jul 2026 19:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784489856; cv=none; b=q17tkB8GIWNYguMALrUbCqvqwLdj6t0bPpCtDaqqrl2t1VOwnmGkLu4WutjuUjTWv/Y0uw+tZQM+b8tDByTH0osSQdwYIaGbOguU7/MbTrKMmcLGyIRPZts8v0j3LH1EzE1LwzmiO0sOqZNaLSMPc2pZepPEi+sud/03sgmXu/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784489856; c=relaxed/simple;
	bh=oaZIMQktyI1RKF8B6PbBEkFL5Qd2M+VgASgli1/KzkQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=fc6x/SSi9V/VwriSgtI2IQ9pcnbwF/A2dfp4DBIrB65nAYb0RMYwivmWps+gq1pO05Allj/5D6wF2I4YEJvpQ3XDCbZL3Av6yzXzIK08Kq1cMSZMFDr3JBjmtqIyIt44PXxnwsa8gI+WIxbh1gQbkbz0aW1swwivzjbT170N814=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W02ETCgV; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W02ETCgV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784489852; x=1816025852;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=oaZIMQktyI1RKF8B6PbBEkFL5Qd2M+VgASgli1/KzkQ=;
  b=W02ETCgVE4OGcn8yXrJQDWwWpUN/BZ1yxUny7nHN0NyIq34Cu5aEKHA4
   6pbV73UWPDf3LnCfp2/U4EwN26ibTixI+3Jo7uAQOY6g5JImFP7wvseQ8
   xrZNw1wlhoYh+n1ZxSDGQ2QGANlT8KSbuKJEC+EUJRoQ+6lGYhV2rp7mA
   IuaeVG+tMV65df8spVh2+76ui/MTrKXrJyJo1YaxXv+/OKH9GIHBGXBOl
   cveBTPXo+U5tEbKZCdq47uzRMAT5YCRumSLTDNnNmNztPjD1z9tQWRWF6
   0IjNBj2roupDWNChH2v3VKIuLtnxJ0jd9SCbp00rM0xdTVvUDWAyfizwh
   Q==;
X-CSE-ConnectionGUID: rsdkQvTLTaWFrSq8R28MKQ==
X-CSE-MsgGUID: 5n6bZg7xRCGBKgMbpXx2tQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11851"; a="95438286"
X-IronPort-AV: E=Sophos;i="6.25,173,1779174000"; 
   d="scan'208";a="95438286"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2026 12:37:31 -0700
X-CSE-ConnectionGUID: NYE1evibQGCc2IOh4TQE6w==
X-CSE-MsgGUID: IkoQksxfTOC3Urj8AqrkgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,173,1779174000"; 
   d="scan'208";a="253864030"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 19 Jul 2026 12:37:30 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wlXK4-00000000VgL-36Gg;
	Sun, 19 Jul 2026 19:37:15 +0000
Date: Mon, 20 Jul 2026 03:37:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/iio/adc/ad7949.c:286:3: error: call to
 '__compiletime_assert_579' declared with 'error' attribute: FIELD_PREP: value
 too large for the field
Message-ID: <202607200308.Uv3wKdFB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

::::::=20
:::::: Manual check reason: "__compiletime_assert_NNN"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Thomas Wei=C3=9Fschuh" <thomas.weissschuh@linutronix.de>
CC: Shuah Khan <skhan@linuxfoundation.org>
CC: Johannes Berg <johannes@sipsolutions.net>
CC: David Gow <davidgow@google.com>

Hi Thomas,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   94515f3a7d4256a5062176b7d6ed0471938cd51a
commit: 031cdd3bc3f369553933c1b0f4cb18000162c8ff kunit: Enable PCI on UML w=
ithout triggering WARN()
date:   10 months ago
:::::: branch date: 2 days ago
:::::: commit date: 10 months ago
config: um-randconfig-r113-20260719 (https://download.01.org/0day-ci/archiv=
e/20260720/202607200308.Uv3wKdFB-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 600970=
8b4367171ccdbf4b5905cb6a803753fe18)
sparse: v0.6.5-rc1
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260720/202607200308.Uv3wKdFB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: 031cdd3bc3f3 ("kunit: Enable PCI on UML without triggering WARN()")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607200308.Uv3wKdFB-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/iio/adc/ad7949.c:12:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:27:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:1175:55: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1175 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + p=
ort;
         |                                                   ~~~~~~~~~~ ^
>> drivers/iio/adc/ad7949.c:286:3: error: call to '__compiletime_assert_579=
' declared with 'error' attribute: FIELD_PREP: value too large for the field
     286 |                 FIELD_PREP(AD7949_CFG_MASK_INX, ad7949_adc->curr=
ent_channel) |
         |                 ^
   include/linux/bitfield.h:115:3: note: expanded from macro 'FIELD_PREP'
     115 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP:=
 ");    \
         |                 ^
   include/linux/bitfield.h:68:3: note: expanded from macro '__BF_FIELD_CHE=
CK'
      68 |                 BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?   =
        \
         |                 ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), =
msg)
         |                                     ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:560:2: note: expanded from macro '_compil=
etime_assert'
     560 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:553:4: note: expanded from macro '__compi=
letime_assert'
     553 |                         prefix ## suffix();                     =
        \
         |                         ^
   <scratch space>:15:1: note: expanded from here
      15 | __compiletime_assert_579
         | ^
   1 warning and 1 error generated.


vim +286 drivers/iio/adc/ad7949.c

7f40e0614317f2 Charles-Antoine Couret 2018-10-22  275 =20
7f40e0614317f2 Charles-Antoine Couret 2018-10-22  276  static int ad7949_sp=
i_init(struct ad7949_adc_chip *ad7949_adc)
7f40e0614317f2 Charles-Antoine Couret 2018-10-22  277  {
7f40e0614317f2 Charles-Antoine Couret 2018-10-22  278  	int ret;
7f40e0614317f2 Charles-Antoine Couret 2018-10-22  279  	int val;
595a0590f4fbcb Liam Beguin            2021-08-15  280  	u16 cfg;
7f40e0614317f2 Charles-Antoine Couret 2018-10-22  281 =20
7f40e0614317f2 Charles-Antoine Couret 2018-10-22  282  	ad7949_adc->current=
_channel =3D 0;
595a0590f4fbcb Liam Beguin            2021-08-15  283 =20
595a0590f4fbcb Liam Beguin            2021-08-15  284  	cfg =3D FIELD_PREP(=
AD7949_CFG_MASK_OVERWRITE, 1) |
595a0590f4fbcb Liam Beguin            2021-08-15  285  		FIELD_PREP(AD7949_=
CFG_MASK_INCC, AD7949_CFG_VAL_INCC_UNIPOLAR_GND) |
595a0590f4fbcb Liam Beguin            2021-08-15 @286  		FIELD_PREP(AD7949_=
CFG_MASK_INX, ad7949_adc->current_channel) |
595a0590f4fbcb Liam Beguin            2021-08-15  287  		FIELD_PREP(AD7949_=
CFG_MASK_BW_FULL, 1) |
37930650604982 Liam Beguin            2021-08-15  288  		FIELD_PREP(AD7949_=
CFG_MASK_REF, ad7949_adc->refsel) |
595a0590f4fbcb Liam Beguin            2021-08-15  289  		FIELD_PREP(AD7949_=
CFG_MASK_SEQ, 0x0) |
595a0590f4fbcb Liam Beguin            2021-08-15  290  		FIELD_PREP(AD7949_=
CFG_MASK_RBN, 1);
595a0590f4fbcb Liam Beguin            2021-08-15  291 =20
595a0590f4fbcb Liam Beguin            2021-08-15  292  	ret =3D ad7949_spi_=
write_cfg(ad7949_adc, cfg, AD7949_CFG_MASK_TOTAL);
7f40e0614317f2 Charles-Antoine Couret 2018-10-22  293 =20
7f40e0614317f2 Charles-Antoine Couret 2018-10-22  294  	/*
7f40e0614317f2 Charles-Antoine Couret 2018-10-22  295  	 * Do two dummy con=
versions to apply the first configuration setting.
7f40e0614317f2 Charles-Antoine Couret 2018-10-22  296  	 * Required only af=
ter the start up of the device.
7f40e0614317f2 Charles-Antoine Couret 2018-10-22  297  	 */
7f40e0614317f2 Charles-Antoine Couret 2018-10-22  298  	ad7949_spi_read_cha=
nnel(ad7949_adc, &val, ad7949_adc->current_channel);
7f40e0614317f2 Charles-Antoine Couret 2018-10-22  299  	ad7949_spi_read_cha=
nnel(ad7949_adc, &val, ad7949_adc->current_channel);
7f40e0614317f2 Charles-Antoine Couret 2018-10-22  300 =20
7f40e0614317f2 Charles-Antoine Couret 2018-10-22  301  	return ret;
7f40e0614317f2 Charles-Antoine Couret 2018-10-22  302  }
7f40e0614317f2 Charles-Antoine Couret 2018-10-22  303 =20

:::::: The code at line 286 was first introduced by commit
:::::: 595a0590f4fbcb39d73a7c55c79a7e7921ec1614 iio: adc: ad7949: define an=
d use bitfield names

:::::: TO: Liam Beguin <lvb@xiphos.com>
:::::: CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
