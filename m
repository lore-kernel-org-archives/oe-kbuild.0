Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D83A36167D
	for <oe-kbuild@lists.linux.dev>; Tue, 20 Jan 2026 17:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768929340; cv=none; b=Qj/Rs1ibLhelAaFpVP11tWVKp0YBhXtNIWG3FKWHQz2Pz4T07BXXS7GVXzPJu+oy74snajf9ehvgPQ/CztithnLQoH14cHXthI/gTtHYNfdlZqX189CRMXqfGYe1927dL1pZ00dBlF5jHVbuJSxmRxhm0C0GAiFRD8/HT5lETiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768929340; c=relaxed/simple;
	bh=EoOeDh9X5947WzdtLN+nQyddql0JAD51pHBqEEf1DN8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=WECDR7+PdYQMqyoHre1QohsT8LxWxVAl2aSb7pjvr2trDDiIOx+HLHiC4ceg/yqEcP3Ma3l+QC7mwULa2+CC7+bfQqgoMjJgpcUfWPZvhj98aSoBio3mQ9UEHAkGMuEOm+ZvL11NAV01pKqQZMvU+tL9JpnCNhfSM8O/nC3VEkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WoR9HWd2; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WoR9HWd2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768929338; x=1800465338;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=EoOeDh9X5947WzdtLN+nQyddql0JAD51pHBqEEf1DN8=;
  b=WoR9HWd2fXU5NHVKjfrYj6D3dFXG2ZGCwG+itf5bNBWt6FKqAVF0R4Hv
   3nlH1+7EGZpeK9mb9+y7NIIsoGrzfboWSt3Nr5/Yb7g3wCWkYuAr697h+
   2W16dvHtiw84L+3kC3EKKECKhmBi4mok0OQSez92cxqHRpolYoXGK2flN
   Y5JgwOnuwtPDwbkD26oXysnELkaVD3CrmddpQKvYS9Bkq0levH3WKNCDS
   gYGV8usonpWtXsJ3jbKCxZk+zhHAoHXSFAA1md4o6zHi/jYGhJj1JUuT2
   qABAuQP4KUV/UGwI0IGVB4oe9PZvWjxYC0V58BUzCVNad0ubhKRTL6xn0
   Q==;
X-CSE-ConnectionGUID: p2guAKy5SMyh4+1obrIhNg==
X-CSE-MsgGUID: H5CQGSdxTha0+Fjy/Ieuaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="70052071"
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; 
   d="scan'208";a="70052071"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 09:15:37 -0800
X-CSE-ConnectionGUID: 8zARKBv2T1anOMQyombtog==
X-CSE-MsgGUID: MYBz5O8aS3eXaQ2boBG2hA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; 
   d="scan'208";a="206426924"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 20 Jan 2026 09:15:36 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1viFKH-00000000PHh-3M7d;
	Tue, 20 Jan 2026 17:15:33 +0000
Date: Wed, 21 Jan 2026 01:15:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [mic:next 2/8] security/landlock/audit.c:264:34: sparse:
 sparse: unsigned value that used to be signed checked against zero?
Message-ID: <202601210155.zlTJBdjI-lkp@intel.com>
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
:::::: Manual check reason: "low confidence static check warning: security/=
landlock/audit.c:264:34: sparse: sparse: unsigned value that used to be sig=
ned checked against zero?"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "G=C3=BCnther Noack" <gnoack3000@gmail.com>
CC: "Micka=C3=ABl Sala=C3=BCn" <mic@digikod.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mic/linux.git next
head:   bdb672bf4c5d0833b9beacb9c2204168b92cc48d
commit: 1ebf8e8d3245f6c985ba1c2cdfa0a7d1cd74438f [2/8] landlock: Transpose =
the layer masks data structure
:::::: branch date: 20 hours ago
:::::: commit date: 20 hours ago
config: riscv-randconfig-r123-20260120 (https://download.01.org/0day-ci/arc=
hive/20260121/202601210155.zlTJBdjI-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 12.5.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260121/202601210155.zlTJBdjI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601210155.zlTJBdjI-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   WARNING: invalid argument to '-march': '_zacas_zabha'
>> security/landlock/audit.c:264:34: sparse: sparse: unsigned value that us=
ed to be signed checked against zero?
   security/landlock/audit.c:261:45: sparse: signed value source

vim +264 security/landlock/audit.c

2fc80c69df8236 Micka=C3=ABl Sala=C3=BCn 2025-03-20  243 =20
1ebf8e8d3245f6 G=C3=BCnther Noack  2025-12-30  244  /*
1ebf8e8d3245f6 G=C3=BCnther Noack  2025-12-30  245   * get_layer_from_fs_de=
ny_masks - get the layer which denied the access request
1ebf8e8d3245f6 G=C3=BCnther Noack  2025-12-30  246   *
1ebf8e8d3245f6 G=C3=BCnther Noack  2025-12-30  247   * As a side effect, st=
ores the denied access rights from that layer(!) in
1ebf8e8d3245f6 G=C3=BCnther Noack  2025-12-30  248   * *access_request.
1ebf8e8d3245f6 G=C3=BCnther Noack  2025-12-30  249   */
1ebf8e8d3245f6 G=C3=BCnther Noack  2025-12-30  250  static size_t get_layer=
_from_fs_deny_masks(access_mask_t *const access_request,
20fd2954945458 Micka=C3=ABl Sala=C3=BCn 2025-03-20  251  					   const deny=
_masks_t deny_masks)
20fd2954945458 Micka=C3=ABl Sala=C3=BCn 2025-03-20  252  {
1ebf8e8d3245f6 G=C3=BCnther Noack  2025-12-30  253  	const access_mask_t ac=
cess_req =3D *access_request;
20fd2954945458 Micka=C3=ABl Sala=C3=BCn 2025-03-20  254  	size_t youngest_l=
ayer =3D 0;
1ebf8e8d3245f6 G=C3=BCnther Noack  2025-12-30  255  	access_mask_t missing =
=3D 0;
20fd2954945458 Micka=C3=ABl Sala=C3=BCn 2025-03-20  256 =20
1ebf8e8d3245f6 G=C3=BCnther Noack  2025-12-30  257  	WARN_ON_ONCE((access_r=
eq | _LANDLOCK_ACCESS_FS_OPTIONAL) !=3D
1ebf8e8d3245f6 G=C3=BCnther Noack  2025-12-30  258  		     _LANDLOCK_ACCESS=
_FS_OPTIONAL);
1ebf8e8d3245f6 G=C3=BCnther Noack  2025-12-30  259 =20
1ebf8e8d3245f6 G=C3=BCnther Noack  2025-12-30  260  	if (access_req & LANDL=
OCK_ACCESS_FS_TRUNCATE) {
1ebf8e8d3245f6 G=C3=BCnther Noack  2025-12-30  261  		size_t layer =3D deny=
_masks & 0x0f;
1ebf8e8d3245f6 G=C3=BCnther Noack  2025-12-30  262 =20
1ebf8e8d3245f6 G=C3=BCnther Noack  2025-12-30  263  		missing |=3D LANDLOCK=
_ACCESS_FS_TRUNCATE;
1ebf8e8d3245f6 G=C3=BCnther Noack  2025-12-30 @264  		youngest_layer =3D ma=
x(youngest_layer, layer);
20fd2954945458 Micka=C3=ABl Sala=C3=BCn 2025-03-20  265  	}
1ebf8e8d3245f6 G=C3=BCnther Noack  2025-12-30  266  	if (access_req & LANDL=
OCK_ACCESS_FS_IOCTL_DEV) {
1ebf8e8d3245f6 G=C3=BCnther Noack  2025-12-30  267  		size_t layer =3D (den=
y_masks & 0xf0) >> 4;
1ebf8e8d3245f6 G=C3=BCnther Noack  2025-12-30  268 =20
1ebf8e8d3245f6 G=C3=BCnther Noack  2025-12-30  269  		if (layer > youngest_=
layer)
1ebf8e8d3245f6 G=C3=BCnther Noack  2025-12-30  270  			missing =3D 0;
20fd2954945458 Micka=C3=ABl Sala=C3=BCn 2025-03-20  271 =20
1ebf8e8d3245f6 G=C3=BCnther Noack  2025-12-30  272  		missing |=3D LANDLOCK=
_ACCESS_FS_IOCTL_DEV;
1ebf8e8d3245f6 G=C3=BCnther Noack  2025-12-30  273  		youngest_layer =3D ma=
x(youngest_layer, layer);
1ebf8e8d3245f6 G=C3=BCnther Noack  2025-12-30  274  	}
20fd2954945458 Micka=C3=ABl Sala=C3=BCn 2025-03-20  275  	*access_request =
=3D missing;
20fd2954945458 Micka=C3=ABl Sala=C3=BCn 2025-03-20  276  	return youngest_l=
ayer;
20fd2954945458 Micka=C3=ABl Sala=C3=BCn 2025-03-20  277  }
20fd2954945458 Micka=C3=ABl Sala=C3=BCn 2025-03-20  278 =20

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
