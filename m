Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E66041A4E8
	for <oe-kbuild@lists.linux.dev>; Wed, 23 Sep 2026 09:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790156906; cv=none; b=uaZ85TQM9W8tYqE78P1s46ZXdN4JSPvZUbed6S0bpzKLl3hb9+kK6nUcxq7qkt232vpC+38ZxuSqCJ5c7zY9mIa/Hi+5fmwYh/4SwGtZyYzv3bu8x1t/hhCq6Q8KaJHJetquaUffADhA4s6Jt7jeR/cSZrfNBJ44FDAHKVSW+mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790156906; c=relaxed/simple;
	bh=MVzXFpHpFIo3s/12QNgC+TmQP68tCCtJ/SglJIrktrY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=YsI+htchS48GYgy5Nj/3J18SlOiRZ/9s11w8P//w6Jo8bUmx6PLmSjBuNjqKDoBM0Klx5NEWW1Q5sYa/W4uzZ+9UumrQg3fZE03iRIa6lMzW9Jiz5VQAqRG6Im9Ds/uIrGlPttqMISpzi6yAteHReRq3EbFv/DSiMmMZsGVH+Qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MY1XSGDC; arc=none smtp.client-ip=192.198.163.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MY1XSGDC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790156905; x=1821692905;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=MVzXFpHpFIo3s/12QNgC+TmQP68tCCtJ/SglJIrktrY=;
  b=MY1XSGDC4KFxc+s3od9eo4gH2/Cjj3lEgc/xNDrftwb27Ki5GK4EP3nH
   YpAwcKMUATy+3lrPTGcoQFISUsHig69qOxI4/BcDYYypHpzNwen/t0oRd
   wBrhQjEix3dWofuEP46OGarkiBvCS5Bmwtg1s5gXGq3opMvymsu+fEiJ5
   hYZ7YT4mteZY3K/vxYQCR1/VkLbyJkBSZYkgODvQCJkdY+P2v1CoOuVCa
   cG8N5v3yzbnCEcE2atoYMX0vujoi3mFPDeLPq2iBiifLsqTCuHc2BsnfZ
   ldQEDqPMElChMN/qUVK3r6AQx5AKIWF3FV+IDe+ip6B7SlCtFjldIGOa9
   A==;
X-CSE-ConnectionGUID: nXNaQyg1T3SyuGmSRDH3qw==
X-CSE-MsgGUID: 3uqjrMqMTwun7fWM1D8Ouw==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="1328293"
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="1328293"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa116.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 02:48:24 -0700
X-CSE-ConnectionGUID: zl2nIKmNQNeU1Y/ggJBNUA==
X-CSE-MsgGUID: knI1M1dWRyCMp4Q8/jFVBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="4811492"
Received: from igk-lkp-server01.igk.intel.com (HELO 1bbc298b9a73) ([10.211.93.152])
  by fmviesa013.fm.intel.com with ESMTP; 23 Sep 2026 02:48:23 -0700
Received: from kbuild by 1bbc298b9a73 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9JaP-000000000be-0V6n;
	Wed, 23 Sep 2026 09:48:21 +0000
Date: Wed, 23 Sep 2026 11:47:20 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [jimc:dyndbg-maple-clean 45/45] lib/dynamic_debug.c:1962
 ddebug_reconstruct_site_map() error: double free of 'decompressed_sites'
 (line 1940)
Message-ID: <202609231115.ZePNk5fP-lkp@intel.com>
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

tree:   https://github.com/jimc/linux.git dyndbg-maple-clean
head:   66849149b0a8cab7cdac143b22fd88b3df05636b
commit: 66849149b0a8cab7cdac143b22fd88b3df05636b [45/45] dyndbg: Compress s=
ite-data with zstd and reclaim trees via shrinker
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: x86_64-randconfig-2200-20260923 (https://download.01.org/0day-ci/ar=
chive/20260923/202609231115.ZePNk5fP-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202609231115.ZePNk5fP-lkp@intel.com/

New smatch warnings:
lib/dynamic_debug.c:1962 ddebug_reconstruct_site_map() error: double free o=
f 'decompressed_sites' (line 1940)

Old smatch warnings:
lib/dynamic_debug.c:965 param_set_dyndbg_module_classes() error: we previou=
sly assumed 'map' could be null (see line 952)

vim +/decompressed_sites +1962 lib/dynamic_debug.c

66849149b0a8ca Jim Cromie 2026-07-08  1913 =20
66849149b0a8ca Jim Cromie 2026-07-08  1914  static int ddebug_reconstruct_s=
ite_map(void)
66849149b0a8ca Jim Cromie 2026-07-08  1915  {
66849149b0a8ca Jim Cromie 2026-07-08  1916  	struct ddebug_table *dt;
66849149b0a8ca Jim Cromie 2026-07-08  1917  	struct _ddebug_info di;
66849149b0a8ca Jim Cromie 2026-07-08  1918  	struct _ddebug_site *decompres=
sed_sites =3D NULL;
66849149b0a8ca Jim Cromie 2026-07-08  1919  	int ret;
66849149b0a8ca Jim Cromie 2026-07-08  1920 =20
66849149b0a8ca Jim Cromie 2026-07-08  1921  	if (!mtree_empty(&dd_site_map))
66849149b0a8ca Jim Cromie 2026-07-08  1922  		return 0;
66849149b0a8ca Jim Cromie 2026-07-08  1923 =20
66849149b0a8ca Jim Cromie 2026-07-08  1924  	/* 1. Reconstruct built-in sit=
e map */
66849149b0a8ca Jim Cromie 2026-07-08  1925  	if (dd_builtin_compressed_site=
s) {
66849149b0a8ca Jim Cromie 2026-07-08  1926  		unsigned int count =3D __stop=
___dyndbg_descs - __start___dyndbg_descs;
66849149b0a8ca Jim Cromie 2026-07-08  1927 =20
66849149b0a8ca Jim Cromie 2026-07-08  1928  		ret =3D ddebug_decompress_sit=
es(dd_builtin_compressed_sites,
66849149b0a8ca Jim Cromie 2026-07-08  1929  					      dd_builtin_compresse=
d_len,
66849149b0a8ca Jim Cromie 2026-07-08  1930  					      &decompressed_sites,=
 count);
66849149b0a8ca Jim Cromie 2026-07-08  1931  		if (ret)
66849149b0a8ca Jim Cromie 2026-07-08  1932  			return ret;
66849149b0a8ca Jim Cromie 2026-07-08  1933 =20
66849149b0a8ca Jim Cromie 2026-07-08  1934  		di.descs.start =3D __start___=
dyndbg_descs;
66849149b0a8ca Jim Cromie 2026-07-08  1935  		di.descs.len =3D count;
66849149b0a8ca Jim Cromie 2026-07-08  1936  		di.sites.start =3D decompress=
ed_sites;
66849149b0a8ca Jim Cromie 2026-07-08  1937  		di.sites.len =3D count;
66849149b0a8ca Jim Cromie 2026-07-08  1938 =20
66849149b0a8ca Jim Cromie 2026-07-08  1939  		ddebug_condense_sites(&di);
66849149b0a8ca Jim Cromie 2026-07-08 @1940  		kvfree(decompressed_sites);
66849149b0a8ca Jim Cromie 2026-07-08  1941  	}
66849149b0a8ca Jim Cromie 2026-07-08  1942 =20
66849149b0a8ca Jim Cromie 2026-07-08  1943  	/* 2. Reconstruct loadable mod=
ule site maps */
66849149b0a8ca Jim Cromie 2026-07-08  1944  	list_for_each_entry(dt, &ddebu=
g_tables, link) {
66849149b0a8ca Jim Cromie 2026-07-08  1945  		if (dt->info.descs.start >=3D =
__start___dyndbg_descs &&
66849149b0a8ca Jim Cromie 2026-07-08  1946  		    dt->info.descs.start < __=
stop___dyndbg_descs)
66849149b0a8ca Jim Cromie 2026-07-08  1947  			continue;
66849149b0a8ca Jim Cromie 2026-07-08  1948 =20
66849149b0a8ca Jim Cromie 2026-07-08  1949  		if (dt->compressed_sites) {
66849149b0a8ca Jim Cromie 2026-07-08  1950  			ret =3D ddebug_decompress_si=
tes(dt->compressed_sites,
66849149b0a8ca Jim Cromie 2026-07-08  1951  						      dt->compressed_len,
66849149b0a8ca Jim Cromie 2026-07-08  1952  						      &decompressed_sites,
66849149b0a8ca Jim Cromie 2026-07-08  1953  						      dt->info.descs.len);
66849149b0a8ca Jim Cromie 2026-07-08  1954  			if (ret)
66849149b0a8ca Jim Cromie 2026-07-08  1955  				continue;
66849149b0a8ca Jim Cromie 2026-07-08  1956 =20
66849149b0a8ca Jim Cromie 2026-07-08  1957  			di =3D dt->info;
66849149b0a8ca Jim Cromie 2026-07-08  1958  			di.sites.start =3D decompres=
sed_sites;
66849149b0a8ca Jim Cromie 2026-07-08  1959  			di.sites.len =3D dt->info.de=
scs.len;
66849149b0a8ca Jim Cromie 2026-07-08  1960 =20
66849149b0a8ca Jim Cromie 2026-07-08  1961  			ddebug_condense_sites(&di);
66849149b0a8ca Jim Cromie 2026-07-08 @1962  			kvfree(decompressed_sites);
66849149b0a8ca Jim Cromie 2026-07-08  1963  		}
66849149b0a8ca Jim Cromie 2026-07-08  1964  	}
66849149b0a8ca Jim Cromie 2026-07-08  1965 =20
66849149b0a8ca Jim Cromie 2026-07-08  1966  	return 0;
66849149b0a8ca Jim Cromie 2026-07-08  1967  }
a07d3696825a7a Jim Cromie 2026-09-06  1968  static void ddebug_condense_sit=
es(struct _ddebug_info *di)
a07d3696825a7a Jim Cromie 2026-09-06  1969  {
a07d3696825a7a Jim Cromie 2026-09-06  1970  	int funcs =3D 0, files =3D 0, =
mods =3D 0;
a07d3696825a7a Jim Cromie 2026-09-06  1971 =20
a07d3696825a7a Jim Cromie 2026-09-06  1972  	if (!di->sites.len)
a07d3696825a7a Jim Cromie 2026-09-06  1973  		return;
a07d3696825a7a Jim Cromie 2026-09-06  1974 =20
a07d3696825a7a Jim Cromie 2026-09-06  1975  	if (WARN_ON(di->descs.len !=3D =
di->sites.len))
a07d3696825a7a Jim Cromie 2026-09-06  1976  		return;
a07d3696825a7a Jim Cromie 2026-09-06  1977 =20
a07d3696825a7a Jim Cromie 2026-09-06  1978  	funcs =3D ddebug_grow_tree(di,=
 &dd_site_map,
a07d3696825a7a Jim Cromie 2026-09-06  1979  				 "func", ddebug_get_functio=
n, DD_TAG_FUNC);
a07d3696825a7a Jim Cromie 2026-09-06  1980  	files =3D ddebug_grow_tree(di,=
 &dd_site_map,
a07d3696825a7a Jim Cromie 2026-09-06  1981  				 "file", ddebug_get_filenam=
e, DD_TAG_FILE);
a07d3696825a7a Jim Cromie 2026-09-06  1982  	mods =3D ddebug_grow_tree(di, =
&dd_site_map,
a07d3696825a7a Jim Cromie 2026-09-06  1983  				"mod", ddebug_get_modname, =
DD_TAG_MOD);
a07d3696825a7a Jim Cromie 2026-09-06  1984 =20
a07d3696825a7a Jim Cromie 2026-09-06  1985  	ddebug_log_compression_stats(d=
i->descs.len, mods, files, funcs);
a07d3696825a7a Jim Cromie 2026-09-06  1986  	di->sites.len =3D 0;
a07d3696825a7a Jim Cromie 2026-09-06  1987  }
a07d3696825a7a Jim Cromie 2026-09-06  1988 =20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
