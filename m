Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 022173F4DD2
	for <oe-kbuild@lists.linux.dev>; Wed, 23 Sep 2026 07:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790148563; cv=none; b=j6oJAaiU2lhBgcYTHLj5TcHKGeYUVCH0v2LZ2YHp+EjfSLWVDTIwaIJSTyFCJZn8AnNeFWgnl9qpx2SbZcIYPgawtaOugcj2gg6MW5sCsiiq5NLbRzYhgS+LKlwyQjGysDcnSBB0W1worUSN5Arl97Oe1m66n6BtoC7zcJPY9Ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790148563; c=relaxed/simple;
	bh=5VKoIiz4y/KFEXSJrLFaMVlPsxySY8h5+AiYRiUotuU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=FSFHzYvjgEcuk2gGsUwL896vDuWPqQ0y3AdV2Jvlm+MeyYprR+g6Y2siuNf1jEN/Ysn6N+zhOnaswb3X8PX9dbfD83AqdKPH9XciRlWfbHUBD2PsXgojxGy1DOvvKPivHCDb/+hFgI3NGAPN2FxfXSaocRtXx55maV8KZM3NnLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gdcwSEP0; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gdcwSEP0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790148562; x=1821684562;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=5VKoIiz4y/KFEXSJrLFaMVlPsxySY8h5+AiYRiUotuU=;
  b=gdcwSEP0xqqQm/WEGDbqyCRxCQBzD+U1pmYF1cN5abvhE79CkbFPZIi1
   Fw7hQ0Igt75nWKDEzZXSPFo7gOe9Pryu25T9E2FVct+j2PK1Q+Mzr7+cs
   PhEywpFYJDTFpyHASvPQnZaUYwEdya3YO6Rjv44SmtT45cKzWh4Zk1oCR
   nf7Uhcexr3GIFVRDe3xPd8jQRu0+CMqhy5SR7FN2pjjmfZ0iu9SF+eGPl
   GtzP7mPgkcK2FGv96FWEeZ6+sMIaUT+waE2Q8PJ5kE9PCv8QGRh+kc3ey
   /TZE8W8/ODlJ0e6Lr0ivN1DgTAM5pD6EDZ9CB0XsA9MQaiegpduu2UtoZ
   g==;
X-CSE-ConnectionGUID: Tpmod+UcTD+0Z0mYpEJCnw==
X-CSE-MsgGUID: oKsvPne9QZ26/R1m3fvbBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="108314228"
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="108314228"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 00:29:21 -0700
X-CSE-ConnectionGUID: x852znemQhuOwFivwBlQCA==
X-CSE-MsgGUID: 2EQi01ejRj6iHp5J5LHQGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="4778504"
Received: from igk-lkp-server01.igk.intel.com (HELO 1bbc298b9a73) ([10.211.93.152])
  by fmviesa013.fm.intel.com with ESMTP; 23 Sep 2026 00:29:19 -0700
Received: from kbuild by 1bbc298b9a73 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9HPo-000000000ZL-28Gk;
	Wed, 23 Sep 2026 07:29:16 +0000
Date: Wed, 23 Sep 2026 09:28:39 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [jimc:m10 35/44] lib/dynamic_debug.c:854
 param_set_dyndbg_module_classes() error: we previously assumed 'map' could be
 null (see line 841)
Message-ID: <202609230952.6jFrseQb-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Jim Cromie <jim.cromie@gmail.com>
TO: "=C5=81ukasz Bartosik" <ukaszb@chromium.org>

tree:   https://github.com/jimc/linux.git m10
head:   f95e4f1e4ce035c9b5f8da68c66d83f2452d92d5
commit: feb8ec0044ac67921562346a4a6b831204667ea9 [35/44] dyndbg: resolve "p=
rotection" of class'd pr_debug
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: x86_64-randconfig-2200-20260923 (https://download.01.org/0day-ci/ar=
chive/20260923/202609230952.6jFrseQb-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202609230952.6jFrseQb-lkp@intel.com/

smatch warnings:
lib/dynamic_debug.c:854 param_set_dyndbg_module_classes() error: we previou=
sly assumed 'map' could be null (see line 841)

vim +/map +854 lib/dynamic_debug.c

d88925c4b39c80 Jim Cromie 2025-11-18  819 =20
d88925c4b39c80 Jim Cromie 2025-11-18  820  /**
d88925c4b39c80 Jim Cromie 2025-11-18  821   * param_set_dyndbg_classes - cl=
ass FOO >control
d88925c4b39c80 Jim Cromie 2025-11-18  822   * @instr: string echo>d to sysf=
s, input depends on map_type
d88925c4b39c80 Jim Cromie 2025-11-18  823   * @kp:    kp->arg has state: bi=
ts/lvl, map, map_type
d88925c4b39c80 Jim Cromie 2025-11-18  824   * @mod_name: module name or nul=
l for all modules with the classes
d88925c4b39c80 Jim Cromie 2025-11-18  825   *
d88925c4b39c80 Jim Cromie 2025-11-18  826   * Enable/disable prdbgs by thei=
r class, as given in the arguments to
d88925c4b39c80 Jim Cromie 2025-11-18  827   * DECLARE_DYNDBG_CLASSMAP.  For=
 LEVEL map-types, enforce relative
d88925c4b39c80 Jim Cromie 2025-11-18  828   * levels by bitpos.
d88925c4b39c80 Jim Cromie 2025-11-18  829   *
d88925c4b39c80 Jim Cromie 2025-11-18  830   * Returns: 0 or <0 if error.
b9400852c0801a Jim Cromie 2022-09-04  831   */
7f10c4fc568572 Jim Cromie 2025-11-18  832  static int param_set_dyndbg_modu=
le_classes(const char *instr,
7f10c4fc568572 Jim Cromie 2025-11-18  833  					   const struct kernel_para=
m *kp,
7f10c4fc568572 Jim Cromie 2025-11-18  834  					   const char *mod_name)
b9400852c0801a Jim Cromie 2022-09-04  835  {
feb8ec0044ac67 Jim Cromie 2025-11-18  836  	struct ddebug_class_param *dcp =
=3D kp->arg;
feb8ec0044ac67 Jim Cromie 2025-11-18  837  	struct ddebug_class_map *map =
=3D dcp->map;
62b32b2a95ef1c Jim Cromie 2025-11-18  838  	u32 inrep, new_bits, old_bits, =
old_val;
b9400852c0801a Jim Cromie 2022-09-04  839  	int rc, totct =3D 0;
b9400852c0801a Jim Cromie 2022-09-04  840 =20
feb8ec0044ac67 Jim Cromie 2025-11-18 @841  	if (map && !map->controlling_pa=
ram)
feb8ec0044ac67 Jim Cromie 2025-11-18  842  		map->controlling_param =3D dcp;
feb8ec0044ac67 Jim Cromie 2025-11-18  843 =20
62b32b2a95ef1c Jim Cromie 2025-11-18  844  	rc =3D kstrtou32(instr, 0, &inr=
ep);
b9400852c0801a Jim Cromie 2022-09-04  845  	if (rc) {
cec8bafd130370 Jim Cromie 2025-11-18  846  		int len =3D strcspn(instr, "\n=
");
cec8bafd130370 Jim Cromie 2025-11-18  847 =20
cec8bafd130370 Jim Cromie 2025-11-18  848  		pr_err("expecting numeric inpu=
t, not: %.*s > %s\n",
cec8bafd130370 Jim Cromie 2025-11-18  849  		       len, instr, KP_NAME(kp)=
);
b9400852c0801a Jim Cromie 2022-09-04  850  		return -EINVAL;
b9400852c0801a Jim Cromie 2022-09-04  851  	}
d88925c4b39c80 Jim Cromie 2025-11-18  852  	ddebug_class_param_clamp_input(=
&inrep, kp);
b9400852c0801a Jim Cromie 2022-09-04  853 =20
b9400852c0801a Jim Cromie 2022-09-04 @854  	switch (map->map_type) {
b9400852c0801a Jim Cromie 2022-09-04  855  	case DD_CLASS_TYPE_DISJOINT_BIT=
S:
7f10c4fc568572 Jim Cromie 2025-11-18  856  		old_val =3D READ_ONCE(*dcp->bi=
ts);
62b32b2a95ef1c Jim Cromie 2025-11-18  857  		v2pr_info("bits:0x%x > %s.%s\n=
", inrep, mod_name ?: "*", KP_NAME(kp));
a62837264de615 Jim Cromie 2025-11-18  858  		totct +=3D ddebug_apply_class_=
bitmap(dcp, &inrep, old_val, mod_name);
7f10c4fc568572 Jim Cromie 2025-11-18  859  		WRITE_ONCE(*dcp->bits, inrep);
b9400852c0801a Jim Cromie 2022-09-04  860  		break;
b9400852c0801a Jim Cromie 2022-09-04  861  	case DD_CLASS_TYPE_LEVEL_NUM:
7f10c4fc568572 Jim Cromie 2025-11-18  862  		old_val =3D READ_ONCE(*dcp->lv=
l);
7f10c4fc568572 Jim Cromie 2025-11-18  863  		old_bits =3D CLASSMAP_BITMASK(=
old_val);
b9400852c0801a Jim Cromie 2022-09-04  864  		new_bits =3D CLASSMAP_BITMASK(=
inrep);
62b32b2a95ef1c Jim Cromie 2025-11-18  865  		v2pr_info("lvl:%u bits:0x%x > =
%s\n", inrep, new_bits, KP_NAME(kp));
a62837264de615 Jim Cromie 2025-11-18  866  		totct +=3D ddebug_apply_class_=
bitmap(dcp, &new_bits, old_bits, mod_name);
7f10c4fc568572 Jim Cromie 2025-11-18  867  		WRITE_ONCE(*dcp->lvl, inrep);
b9400852c0801a Jim Cromie 2022-09-04  868  		break;
b9400852c0801a Jim Cromie 2022-09-04  869  	default:
b9400852c0801a Jim Cromie 2022-09-04  870  		pr_warn("%s: bad map type: %d\=
n", KP_NAME(kp), map->map_type);
cec8bafd130370 Jim Cromie 2025-11-18  871  		return -EINVAL;
b9400852c0801a Jim Cromie 2022-09-04  872  	}
b9400852c0801a Jim Cromie 2022-09-04  873  	vpr_info("%s: total matches: %d=
\n", KP_NAME(kp), totct);
b9400852c0801a Jim Cromie 2022-09-04  874  	return 0;
b9400852c0801a Jim Cromie 2022-09-04  875  }
7f10c4fc568572 Jim Cromie 2025-11-18  876 =20

:::::: The code at line 854 was first introduced by commit
:::::: b9400852c0801aebee4fc8b62e6b7cc69c7fcbda dyndbg: add drm.debug style=
 (drm/parameters/debug) bitmap support

:::::: TO: Jim Cromie <jim.cromie@gmail.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
