Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44C2F4F4D05
	for <oe-kbuild@lists.linux.dev>; Thu, 17 Sep 2026 17:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789666499; cv=none; b=fmwcX8kqfknlqSKUFhdFaYrO9QgmtObb3Pim9IAT8KwUgqW0Od/tZ9yQWy7V/JsnCs43VdDLR6I0ozpFrmco14WsIZePpv7pgZvRNGyGKzvGQJ1qdXJrQl5zNe18gh95UYD39DcRssFRdaMFISQ4pRzc+PV3cR8NcRBJMjFyWjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789666499; c=relaxed/simple;
	bh=vl6ea7Rp41jJGBSkT6e4hK6iUUB7p739lIKJjOeV454=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=oJaR1v55A4pEfuyzB7KNcebYebzcADIOWsobJ+sB6fFuWK+ItKGCsroAhRX7kzpk4oPexNIdjCAKuv10Au28S+PcZN056AAQzwZTNACsa3WVk88/U8D8UilK6W2rPyEsDrAvlmbm0JAhhxpfQMVOA2NY776HuvguLY8ocP8ZpF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NWsYtl9r; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NWsYtl9r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789666496; x=1821202496;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=vl6ea7Rp41jJGBSkT6e4hK6iUUB7p739lIKJjOeV454=;
  b=NWsYtl9rDoKMHaLJky9cizmvG+kvAARZlFp+KAi9vQ+6hDFEsxqp0jNr
   rG6oUGRvf10b6rvLcRYolkXMe3VdoJVv2dYmeITmf4ydP4hrPb2sqx8T+
   xrC60DtW7XQyRA41CcZZNYAJ8cxFKirlw9OKv6hcblpm2zDBw66BKG5Aq
   ABf4pQLu0AT7smLkM1DB5e9r/Uu5GTcaSntJoj7dpa0nJgzE1LlJYMop/
   RuY/cuu29JQHJ0u9D5UL/McM3XVx7n+pdgVQETsc//fghsf7iyzZm+dlE
   yP/mbo+y4OdoTl/oc9tAoU+JqkSvgFbPDwxL3mfkffUmjaFZgbs4/VhVc
   w==;
X-CSE-ConnectionGUID: SlxWHYTpTtGBMh1Bj1dYYg==
X-CSE-MsgGUID: 19kFm/VZRZShe9mMOFoiYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="115651600"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="115651600"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 10:34:55 -0700
X-CSE-ConnectionGUID: SPGr08b7TWSYZnEJDCSnKQ==
X-CSE-MsgGUID: mJqTldvORQyG3wRrG0QrHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="270643003"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 17 Sep 2026 10:34:54 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x7G0Z-000000008Jb-3MkZ;
	Thu, 17 Sep 2026 17:34:51 +0000
Date: Fri, 18 Sep 2026 01:34:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/gpu/drm/xe/xe_guc_ads.c:411:9: sparse: sparse:
 Trying to use reserved word 'return' as identifier
Message-ID: <202609180145.hUJrT7zl-lkp@intel.com>
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
:::::: branch date: 2 days ago
:::::: commit date: 9 months ago
config: powerpc-randconfig-r1308-20260917 (https://download.01.org/0day-ci/=
archive/20260918/202609180145.hUJrT7zl-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 148=
ee2b266b73a49f1f31d0bd17d4818b91bee9f)
sparse: v0.6.5-rc1
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260918/202609180145.hUJrT7zl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: 09af64eba63e ("drm/xe/guc: Introduce GUC_FIRMWARE_VER_AT_LEAST hel=
per")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609180145.hUJrT7zl-lkp@intel.com/

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

dd08ebf6c3525a7 Matthew Brost    2023-03-30  388 =20
dd08ebf6c3525a7 Matthew Brost    2023-03-30  389  int xe_guc_ads_init(struc=
t xe_guc_ads *ads)
dd08ebf6c3525a7 Matthew Brost    2023-03-30  390  {
dd08ebf6c3525a7 Matthew Brost    2023-03-30  391  	struct xe_device *xe =3D =
ads_to_xe(ads);
dd08ebf6c3525a7 Matthew Brost    2023-03-30  392  	struct xe_gt *gt =3D ads=
_to_gt(ads);
876611c2b75689c Matt Roper       2023-06-01  393  	struct xe_tile *tile =3D =
gt_to_tile(gt);
dd08ebf6c3525a7 Matthew Brost    2023-03-30  394  	struct xe_bo *bo;
dd08ebf6c3525a7 Matthew Brost    2023-03-30  395 =20
dd08ebf6c3525a7 Matthew Brost    2023-03-30  396  	ads->golden_lrc_size =3D =
calculate_golden_lrc_size(ads);
9c8c7a7e6f1f55e Zhanjun Dong     2024-10-04  397  	ads->capture_size =3D xe=
_guc_capture_ads_input_worst_size(ads_to_guc(ads));
dd08ebf6c3525a7 Matthew Brost    2023-03-30  398  	ads->regset_size =3D cal=
culate_regset_size(gt);
d6da81a4785ca6e Badal Nilawar    2024-04-05  399  	ads->ads_waklv_size =3D =
calculate_waklv_size(ads);
dd08ebf6c3525a7 Matthew Brost    2023-03-30  400 =20
0e1a47fcabc8ffa Micha=C5=82 Winiarski 2023-12-05  401  	bo =3D xe_managed_b=
o_create_pin_map(xe, tile, guc_ads_size(ads) + MAX_GOLDEN_LRC_SIZE,
62742d126631451 Lucas De Marchi  2024-03-22  402  					  XE_BO_FLAG_SYSTEM |
62742d126631451 Lucas De Marchi  2024-03-22  403  					  XE_BO_FLAG_GGTT |
045448da87bfb15 Matthew Brost    2025-04-03  404  					  XE_BO_FLAG_GGTT_IN=
VALIDATE |
045448da87bfb15 Matthew Brost    2025-04-03  405  					  XE_BO_FLAG_PINNED_=
NORESTORE);
dd08ebf6c3525a7 Matthew Brost    2023-03-30  406  	if (IS_ERR(bo))
dd08ebf6c3525a7 Matthew Brost    2023-03-30  407  		return PTR_ERR(bo);
dd08ebf6c3525a7 Matthew Brost    2023-03-30  408 =20
dd08ebf6c3525a7 Matthew Brost    2023-03-30  409  	ads->bo =3D bo;
dd08ebf6c3525a7 Matthew Brost    2023-03-30  410 =20
dd08ebf6c3525a7 Matthew Brost    2023-03-30 @411  	return 0;
dd08ebf6c3525a7 Matthew Brost    2023-03-30  412  }
91b2c42c214f570 Francois Dugast  2024-09-27  413  ALLOW_ERROR_INJECTION(xe_=
guc_ads_init, ERRNO); /* See xe_pci_probe() */
dd08ebf6c3525a7 Matthew Brost    2023-03-30  414 =20

:::::: The code at line 411 was first introduced by commit
:::::: dd08ebf6c3525a7ea2186e636df064ea47281987 drm/xe: Introduce a new DRM=
 driver for Intel GPUs

:::::: TO: Matthew Brost <matthew.brost@intel.com>
:::::: CC: Rodrigo Vivi <rodrigo.vivi@intel.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
