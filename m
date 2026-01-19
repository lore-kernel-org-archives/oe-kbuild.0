Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F2202777FC
	for <oe-kbuild@lists.linux.dev>; Mon, 19 Jan 2026 06:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768805959; cv=none; b=UB8J97MYVui91zfeYEMVYIktyqanUsQ1c1iD8BOk+lEk+JBXp8jbkNVZ0G5BTojdzBR03ZJVDAx7KS1UC8gwYVGOUz9vlaWkHDV9VohcLO/GoXZHWf/BtHsataFMGY7yPlMrWYk+gvD25NVB1uq+7p/zkxt177zsN5T+PPb8BJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768805959; c=relaxed/simple;
	bh=vU/mU+V3aRASyXZsliAMedwb7A2NYuJ7VcuyB+U4MlY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Ef6kQM+uIoI+jrqSOJFq2+4PVrWvPFq3Yf143KuJScIkKE0OY9MbGU4tTHmpMg7DcVEVoRNmvIzbjeFH3jS/s5OvMbTdWL/o4/+kDvaDjB1BQ16ufrTpKjbehZZN0LcNFTKaLmrIA6SdaJ94YIbcArgrSJWo0rnQdY5yQPLdrOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tn4HQplj; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tn4HQplj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768805957; x=1800341957;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=vU/mU+V3aRASyXZsliAMedwb7A2NYuJ7VcuyB+U4MlY=;
  b=Tn4HQpljOGtaT3K8dS5IJwnT5Za/ukfoe/TJ7TH0SYxshXQUWveOWsq0
   jEf2AtetoprWPbki2lW393YMONnJ+hK/1c0wOENaIP5WNP1CIuNzwZjmP
   NyKhvy/eZeipb+Q9M/gMkvE1kX2LCmTCyBS2VSK1TqcFxMnImViezTVVS
   3blDh9uZtOLT4PVKXqaRC9ECYpSB4Tbul09+9q3sIvGYkiXI5Jw+POycu
   NdwfK4McZSZ6D+58ZxMxWL5BFIoUNYHvNUpncJ1nGm3RkY4ynZFklij7d
   UJX4bhh8oH4P7s8TSYGFxxBh6kEZxOnKT0MRq88MIMrUf5LxOTEVAfxOY
   Q==;
X-CSE-ConnectionGUID: GkVsemaATUa1ftMA953EVg==
X-CSE-MsgGUID: ValpsH6rT+qWqEzhHfncTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="80311775"
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; 
   d="scan'208";a="80311775"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2026 22:59:17 -0800
X-CSE-ConnectionGUID: LGze/nVVQqiLgSJBnFoIgQ==
X-CSE-MsgGUID: yd70rARYTA2VuYZB3QrjVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; 
   d="scan'208";a="204938706"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 18 Jan 2026 22:59:16 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhjEH-00000000NXt-1WJb;
	Mon, 19 Jan 2026 06:59:13 +0000
Date: Mon, 19 Jan 2026 14:58:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 1582/6849]
 drivers/gpu/drm/xe/xe_guc_ads.c:411:9: sparse: sparse: Trying to use reserved
 word 'return' as identifier
Message-ID: <202601191408.NFGKnKfR-lkp@intel.com>
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
TO: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   46fe65a2c28ecf5df1a7475aba1f08ccf4c0ac1b
commit: 09af64eba63ece2d928295e61ab1d56ae264447c [1582/6849] drm/xe/guc: In=
troduce GUC_FIRMWARE_VER_AT_LEAST helper
:::::: branch date: 3 days ago
:::::: commit date: 5 weeks ago
config: i386-randconfig-062-20260119 (https://download.01.org/0day-ci/archi=
ve/20260119/202601191408.NFGKnKfR-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260119/202601191408.NFGKnKfR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601191408.NFGKnKfR-lkp@intel.com/

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
dd08ebf6c3525a Matthew Brost    2023-03-30  398  	ads->regset_size =3D calc=
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

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
