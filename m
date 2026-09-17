Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 868E737DAAE
	for <oe-kbuild@lists.linux.dev>; Thu, 17 Sep 2026 05:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789623052; cv=none; b=AaR91nZJwt3ENHJlZJkhM3O2w/ZTru3MEcGRnhjpAxc5sE3sANzeTqgar9T8LKG3EwHBuBMPtF7LanH59XSv8pTg2gcv5TY6zyCah/FYVJ9Nf8auVwuMdrbS5hhpOG/mRZTiTmGOBNyWpeE6G6mPksg1fgw7LgjNFQhK+jhuveQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789623052; c=relaxed/simple;
	bh=T4q2KvxwxcA3rawB0Tv0g1WvlHdkCtvhOLZlQOibD+c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=hkoGbCxrQEdE5y93EcIha23OFUb/NMkBK+4t32TDow/UXWWkXz0C/7N+2zSRxQsgRFXyEXMYkgoygVjUPBcNQ3io5omfAs3PqIqMT/s6VhSwyob8Dm0JnUx+CQJAVCYMuYj4WjRka3O/87IFKPMpqJEPt9h8bSg7SvWYZXpoxvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X3WXw960; arc=none smtp.client-ip=192.198.163.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X3WXw960"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789623049; x=1821159049;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=T4q2KvxwxcA3rawB0Tv0g1WvlHdkCtvhOLZlQOibD+c=;
  b=X3WXw960SLrrqMNA0PrPip+14ByyTzXRADU7bQIAdXzRixiHaGWWuTF4
   mAWbRu/Bs1zIWZ8lglzG+8McEc1Wvd9T8bw3TP/AEkC1sXW37/KnB04lX
   wrng33YgMwYfrb8YSdJKfRlRyHz9WP54In3gRtPFQcNY1czbmAzSwPj8G
   esi/H/bvAS4k/A03PJvkiViz96Lm6fPijsoivdKGE+9TsXXIxzJ5pFj79
   fTzuquh9CT52W782oD29ccO/5Wsl3UE7+DklhbARFxQqRUuwCC8kVxobX
   XjQ6SesWJViO7tNnAzxGrKzimN6xkmTHSEq0tJOpgnzpu/63peRKTZlz4
   Q==;
X-CSE-ConnectionGUID: x6zxBSAhQ0qFVX30RiDvSg==
X-CSE-MsgGUID: WxdeiigvSS+u1XJ/YxnXpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="517837"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="517837"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa114.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 22:30:49 -0700
X-CSE-ConnectionGUID: zsJN3opJR/+8bHhHbG0mSw==
X-CSE-MsgGUID: 2eqByZIySe26CPOcSvDJCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="297069070"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 16 Sep 2026 22:30:48 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x74hp-0000000079P-2VIj;
	Thu, 17 Sep 2026 05:30:45 +0000
Date: Thu, 17 Sep 2026 13:30:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/gpu/drm/xe/xe_guc_ads.c:411:9: sparse: sparse:
 Trying to use reserved word 'return' as identifier
Message-ID: <202609171355.t2au95fP-lkp@intel.com>
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
:::::: Manual check reason: "low confidence static check warning: drivers/g=
pu/drm/xe/xe_guc_ads.c:411:9: sparse: sparse: Trying to use reserved word '=
return' as identifier"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   9b87fdc9af2fbfcdb5c24a64139685ef80f6573f
commit: 09af64eba63ece2d928295e61ab1d56ae264447c drm/xe/guc: Introduce GUC_=
FIRMWARE_VER_AT_LEAST helper
date:   9 months ago
:::::: branch date: 34 hours ago
:::::: commit date: 9 months ago
config: powerpc-randconfig-r1308-20260917 (https://download.01.org/0day-ci/=
archive/20260917/202609171355.t2au95fP-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 148=
ee2b266b73a49f1f31d0bd17d4818b91bee9f)
sparse: v0.6.5-rc1
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260917/202609171355.t2au95fP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: 09af64eba63e ("drm/xe/guc: Introduce GUC_FIRMWARE_VER_AT_LEAST hel=
per")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609171355.t2au95fP-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/gpu/drm/xe/xe_guc_ads.c:373:9: sparse: sparse: Expected ) in nes=
ted declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:373:9: sparse: sparse: got {
   drivers/gpu/drm/xe/xe_guc_ads.c:373:9: sparse: sparse: Expected ) in fun=
ction declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:373:9: sparse: sparse: got (
   drivers/gpu/drm/xe/xe_guc_ads.c:373:9: sparse: sparse: Trying to use res=
erved word 'if' as identifier
   drivers/gpu/drm/xe/xe_guc_ads.c:373:9: sparse: sparse: Expected ; at the=
 end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:373:9: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:373:9: sparse: sparse: Expected ) in fun=
ction declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:373:9: sparse: sparse: got !
   drivers/gpu/drm/xe/xe_guc_ads.c:373:9: sparse: sparse: Trying to use res=
erved word 'if' as identifier
   drivers/gpu/drm/xe/xe_guc_ads.c:373:9: sparse: sparse: Expected ; at the=
 end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:373:9: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:373:9: sparse: sparse: Trying to use res=
erved word 'do' as identifier
   drivers/gpu/drm/xe/xe_guc_ads.c:373:9: sparse: sparse: Expected ; at end=
 of declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:373:9: sparse: sparse: got {
   drivers/gpu/drm/xe/xe_guc_ads.c:373:9: sparse: sparse: Expected ; at the=
 end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:373:9: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:373:9: sparse: sparse: Expected ; at the=
 end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:373:9: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:373:9: sparse: sparse: Expected ; at the=
 end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:373:9: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:373:9: sparse: sparse: Expected ; at the=
 end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:373:9: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:373:9: sparse: sparse: Expected ; at the=
 end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:373:9: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:374:9: sparse: sparse: Expected ) in nes=
ted declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:374:9: sparse: sparse: got {
   drivers/gpu/drm/xe/xe_guc_ads.c:374:9: sparse: sparse: Expected ) in nes=
ted declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:374:9: sparse: sparse: got {
   drivers/gpu/drm/xe/xe_guc_ads.c:374:9: sparse: sparse: Expected ) in nes=
ted declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:374:9: sparse: sparse: got {
   drivers/gpu/drm/xe/xe_guc_ads.c:374:9: sparse: sparse: Expected ) in fun=
ction declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:374:9: sparse: sparse: got (
   drivers/gpu/drm/xe/xe_guc_ads.c:374:9: sparse: sparse: Trying to use res=
erved word 'if' as identifier
   drivers/gpu/drm/xe/xe_guc_ads.c:374:9: sparse: sparse: Expected ; at the=
 end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:374:9: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:374:9: sparse: sparse: Expected ) in fun=
ction declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:374:9: sparse: sparse: got !
   drivers/gpu/drm/xe/xe_guc_ads.c:374:9: sparse: sparse: Trying to use res=
erved word 'if' as identifier
   drivers/gpu/drm/xe/xe_guc_ads.c:374:9: sparse: sparse: Expected ; at the=
 end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:374:9: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:374:9: sparse: sparse: Trying to use res=
erved word 'do' as identifier
   drivers/gpu/drm/xe/xe_guc_ads.c:374:9: sparse: sparse: Expected ; at end=
 of declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:374:9: sparse: sparse: got {
   drivers/gpu/drm/xe/xe_guc_ads.c:374:9: sparse: sparse: Expected ; at the=
 end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:374:9: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:374:9: sparse: sparse: Expected ; at the=
 end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:374:9: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:374:9: sparse: sparse: Expected ; at the=
 end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:374:9: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:374:9: sparse: sparse: Expected ; at the=
 end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:374:9: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:374:9: sparse: sparse: Expected ; at the=
 end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:374:9: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:375:9: sparse: sparse: Expected ) in nes=
ted declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:375:9: sparse: sparse: got {
   drivers/gpu/drm/xe/xe_guc_ads.c:375:9: sparse: sparse: Expected ) in nes=
ted declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:375:9: sparse: sparse: got {
   drivers/gpu/drm/xe/xe_guc_ads.c:375:9: sparse: sparse: Expected ) in nes=
ted declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:375:9: sparse: sparse: got {
   drivers/gpu/drm/xe/xe_guc_ads.c:375:9: sparse: sparse: Expected ) in fun=
ction declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:375:9: sparse: sparse: got (
   drivers/gpu/drm/xe/xe_guc_ads.c:375:9: sparse: sparse: Trying to use res=
erved word 'if' as identifier
   drivers/gpu/drm/xe/xe_guc_ads.c:375:9: sparse: sparse: Expected ; at the=
 end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:375:9: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:375:9: sparse: sparse: Expected ) in fun=
ction declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:375:9: sparse: sparse: got !
   drivers/gpu/drm/xe/xe_guc_ads.c:375:9: sparse: sparse: Trying to use res=
erved word 'if' as identifier
   drivers/gpu/drm/xe/xe_guc_ads.c:375:9: sparse: sparse: Expected ; at the=
 end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:375:9: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:375:9: sparse: sparse: Trying to use res=
erved word 'do' as identifier
   drivers/gpu/drm/xe/xe_guc_ads.c:375:9: sparse: sparse: Expected ; at end=
 of declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:375:9: sparse: sparse: got {
   drivers/gpu/drm/xe/xe_guc_ads.c:375:9: sparse: sparse: Expected ; at the=
 end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:375:9: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:375:9: sparse: sparse: Expected ; at the=
 end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:375:9: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:375:9: sparse: sparse: Expected ; at the=
 end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:375:9: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:375:9: sparse: sparse: Expected ; at the=
 end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:375:9: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:375:9: sparse: sparse: Expected ; at the=
 end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:375:9: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:376:1: sparse: sparse: Expected ; at the=
 end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:376:1: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:385:1: sparse: sparse: Expected ; at the=
 end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:385:1: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:396:12: sparse: sparse: Expected ; at en=
d of declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:396:12: sparse: sparse: got ->
   drivers/gpu/drm/xe/xe_guc_ads.c:397:12: sparse: sparse: Expected ; at en=
d of declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:397:12: sparse: sparse: got ->
   drivers/gpu/drm/xe/xe_guc_ads.c:398:12: sparse: sparse: Expected ; at en=
d of declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:398:12: sparse: sparse: got ->
   drivers/gpu/drm/xe/xe_guc_ads.c:399:12: sparse: sparse: Expected ; at en=
d of declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:399:12: sparse: sparse: got ->
   drivers/gpu/drm/xe/xe_guc_ads.c:406:19: sparse: sparse: Expected ) in fu=
nction declarator
   drivers/gpu/drm/xe/xe_guc_ads.c:406:19: sparse: sparse: got (
   drivers/gpu/drm/xe/xe_guc_ads.c:406:9: sparse: sparse: Trying to use res=
erved word 'if' as identifier
   drivers/gpu/drm/xe/xe_guc_ads.c:409:12: sparse: sparse: Expected ; at en=
d of declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:409:12: sparse: sparse: got ->
>> drivers/gpu/drm/xe/xe_guc_ads.c:411:9: sparse: sparse: Trying to use res=
erved word 'return' as identifier
   drivers/gpu/drm/xe/xe_guc_ads.c:411:16: sparse: sparse: Expected ; at en=
d of declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:411:16: sparse: sparse: got 0
   drivers/gpu/drm/xe/xe_guc_ads.c:412:1: sparse: sparse: Expected ; at the=
 end of type declaration
   drivers/gpu/drm/xe/xe_guc_ads.c:412:1: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_ads.c:350:13: sparse: sparse: undefined identi=
fier '__VA_OPT__'
   drivers/gpu/drm/xe/xe_guc_ads.c:350:63: sparse: sparse: undefined identi=
fier '__gt'
   drivers/gpu/drm/xe/xe_guc_ads.c:353:63: sparse: sparse: undefined identi=
fier '__xe'
   drivers/gpu/drm/xe/xe_guc_ads.c:358:17: sparse: sparse: symbol 'guc_wakl=
v_enable' redeclared with different type (incompatible argument 1 (differen=
t base types)):
   drivers/gpu/drm/xe/xe_guc_ads.c:358:17: sparse:    int static [signed] [=
toplevel] guc_waklv_enable( ... )
   drivers/gpu/drm/xe/xe_guc_ads.c:287:13: sparse: note: previously declare=
d as:
   drivers/gpu/drm/xe/xe_guc_ads.c:287:13: sparse:    void static [toplevel=
] guc_waklv_enable( ... )
   drivers/gpu/drm/xe/xe_guc_ads.c:362:13: sparse: sparse: undefined identi=
fier '__xe'
   drivers/gpu/drm/xe/xe_guc_ads.c:366:35: sparse: sparse: undefined identi=
fier 'ads'
   drivers/gpu/drm/xe/xe_guc_ads.c:366:42: sparse: sparse: undefined identi=
fier 'remain'
   drivers/gpu/drm/xe/xe_guc_ads.c:370:39: sparse: sparse: undefined identi=
fier 'ads'
   drivers/gpu/drm/xe/xe_guc_ads.c:371:37: sparse: sparse: undefined identi=
fier 'ads'
   drivers/gpu/drm/xe/xe_guc_ads.c:392:38: sparse: sparse: undefined identi=
fier 'ads'
   drivers/gpu/drm/xe/xe_guc_ads.c:401:43: sparse: sparse: undefined identi=
fier 'xe'
   drivers/gpu/drm/xe/xe_guc_ads.c:401:9: sparse: sparse: symbol 'bo' redec=
lared with different type (different base types):
   drivers/gpu/drm/xe/xe_guc_ads.c:401:9: sparse:    int [addressable] [top=
level] bo
   drivers/gpu/drm/xe/xe_guc_ads.c:394:22: sparse: note: previously declare=
d as:
   drivers/gpu/drm/xe/xe_guc_ads.c:394:22: sparse:    struct xe_bo *[addres=
sable] [toplevel] bo

vim +/return +411 drivers/gpu/drm/xe/xe_guc_ads.c

dd08ebf6c3525a Matthew Brost    2023-03-30  388 =20
dd08ebf6c3525a Matthew Brost    2023-03-30  389  int xe_guc_ads_init(struct=
 xe_guc_ads *ads)
dd08ebf6c3525a Matthew Brost    2023-03-30  390  {
dd08ebf6c3525a Matthew Brost    2023-03-30  391  	struct xe_device *xe =3D =
ads_to_xe(ads);
dd08ebf6c3525a Matthew Brost    2023-03-30  392  	struct xe_gt *gt =3D ads_=
to_gt(ads);
876611c2b75689 Matt Roper       2023-06-01  393  	struct xe_tile *tile =3D =
gt_to_tile(gt);
dd08ebf6c3525a Matthew Brost    2023-03-30  394  	struct xe_bo *bo;
dd08ebf6c3525a Matthew Brost    2023-03-30  395 =20
dd08ebf6c3525a Matthew Brost    2023-03-30  396  	ads->golden_lrc_size =3D =
calculate_golden_lrc_size(ads);
9c8c7a7e6f1f55 Zhanjun Dong     2024-10-04  397  	ads->capture_size =3D xe_=
guc_capture_ads_input_worst_size(ads_to_guc(ads));
dd08ebf6c3525a Matthew Brost    2023-03-30 @398  	ads->regset_size =3D calc=
ulate_regset_size(gt);
d6da81a4785ca6 Badal Nilawar    2024-04-05  399  	ads->ads_waklv_size =3D c=
alculate_waklv_size(ads);
dd08ebf6c3525a Matthew Brost    2023-03-30  400 =20
0e1a47fcabc8ff Micha=C5=82 Winiarski 2023-12-05  401  	bo =3D xe_managed_bo=
_create_pin_map(xe, tile, guc_ads_size(ads) + MAX_GOLDEN_LRC_SIZE,
62742d12663145 Lucas De Marchi  2024-03-22  402  					  XE_BO_FLAG_SYSTEM |
62742d12663145 Lucas De Marchi  2024-03-22  403  					  XE_BO_FLAG_GGTT |
045448da87bfb1 Matthew Brost    2025-04-03  404  					  XE_BO_FLAG_GGTT_INV=
ALIDATE |
045448da87bfb1 Matthew Brost    2025-04-03  405  					  XE_BO_FLAG_PINNED_N=
ORESTORE);
dd08ebf6c3525a Matthew Brost    2023-03-30  406  	if (IS_ERR(bo))
dd08ebf6c3525a Matthew Brost    2023-03-30  407  		return PTR_ERR(bo);
dd08ebf6c3525a Matthew Brost    2023-03-30  408 =20
dd08ebf6c3525a Matthew Brost    2023-03-30  409  	ads->bo =3D bo;
dd08ebf6c3525a Matthew Brost    2023-03-30  410 =20
dd08ebf6c3525a Matthew Brost    2023-03-30 @411  	return 0;
dd08ebf6c3525a Matthew Brost    2023-03-30  412  }
91b2c42c214f57 Francois Dugast  2024-09-27  413  ALLOW_ERROR_INJECTION(xe_g=
uc_ads_init, ERRNO); /* See xe_pci_probe() */
dd08ebf6c3525a Matthew Brost    2023-03-30  414 =20

:::::: The code at line 411 was first introduced by commit
:::::: dd08ebf6c3525a7ea2186e636df064ea47281987 drm/xe: Introduce a new DRM=
 driver for Intel GPUs

:::::: TO: Matthew Brost <matthew.brost@intel.com>
:::::: CC: Rodrigo Vivi <rodrigo.vivi@intel.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
