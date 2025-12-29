Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED5C013B58A
	for <oe-kbuild@lists.linux.dev>; Mon, 29 Dec 2025 02:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766975202; cv=none; b=geTAg/fl8Hc3cGn4kM7Ff6oCQyRaY6S64GZr/Qqa8SF0Cs0dgd3/C9MyPD6f0xZ0tAlq2IoYXeHPfwNShVVgNbHFCJN3l4wqsv6KHteKekz7LI867ETboubMdwwWWkWTfHR3ZxjC+f/5Z2EQQsFh0K0rjFZ3guc/Z0pdDFbt+iY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766975202; c=relaxed/simple;
	bh=Y7T+K+GSrsoPZi0YnVX4hTpl4hXpUjp36aU0jGY6P/k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=UNdf0w3mJxavB4D1eASG6ncF6IB1X1QDDrKpq2/soZxav3gYxAyFw2Lr2jttS1tis2bWQkYMpcVAUdmbqlJNsau8dqDjwSUhuPGypCPXuGCj/5xhnyR3pMezmqL5JIJFvi/whVXGKZQxxYGuczGjQyRAajw+HpBk4pY4FayU2kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L5oheJv0; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L5oheJv0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766975200; x=1798511200;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Y7T+K+GSrsoPZi0YnVX4hTpl4hXpUjp36aU0jGY6P/k=;
  b=L5oheJv0JB74N3eQ6YilDTckgJynhAbW0BdUDtgqHQ92s2/dAQIo9BMQ
   DOHbYZzIr/A77iUsIlCpgA9uKmQifiO5uOgRUN9iKLF1ERobNlf10VeDD
   qWQ1GCrePWFUcP5OdPuyWNOQbEXA5regiGIxCeFVLT6adMDbr3UdvzcN8
   z2FH8kQhRdvYUSlx8c9ZGETG+xawbcQLeo1t5VcikEBqvYU2z6XG8ryFt
   1WApjHIlbjI9ARWOUWL+BdxI8k6qos26wrlVzdrTReKfvHqYqucjDBz36
   R+GynElQjWWrxR3NloDlq1ukEBXEkhCDDyd6AVRHzu22cistqI9UPjAZ7
   A==;
X-CSE-ConnectionGUID: EULZevBhTI2yteUkpn192Q==
X-CSE-MsgGUID: 8Dq6YxMsRfu9MZp4ECjEew==
X-IronPort-AV: E=McAfee;i="6800,10657,11655"; a="79959973"
X-IronPort-AV: E=Sophos;i="6.21,184,1763452800"; 
   d="scan'208";a="79959973"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2025 18:26:39 -0800
X-CSE-ConnectionGUID: sOidJ/ZcSkGGMvO6u0rYzQ==
X-CSE-MsgGUID: pfjFOjtgRgWEDE20al6/NA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,184,1763452800"; 
   d="scan'208";a="204943650"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 28 Dec 2025 18:26:38 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1va2xv-000000006qf-36gJ;
	Mon, 29 Dec 2025 02:26:35 +0000
Date: Mon, 29 Dec 2025 10:26:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: 
 drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c:1210
 isst_if_get_perf_level_fabric_info() warn: potential spectre issue
 'power_domain_info->perf_levels' [r] (local cap)
Message-ID: <202512291058.b3lfuI2W-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
CC: "Ilpo J=C3=A4rvinen" <ilpo.jarvinen@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   f8f9c1f4d0c7a64600e2ca312dec824a0bc2f1da
commit: d6644d737bec473a38dbd44a71553cacd636a920 platform/x86: ISST: Suppor=
t SST-PP revision 2
date:   8 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 8 months ago
config: x86_64-randconfig-161-20251229 (https://download.01.org/0day-ci/arc=
hive/20251229/202512291058.b3lfuI2W-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512291058.b3lfuI2W-lkp@intel.com/

New smatch warnings:
drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c:1210 isst_if_ge=
t_perf_level_fabric_info() warn: potential spectre issue 'power_domain_info=
->perf_levels' [r] (local cap)

Old smatch warnings:
drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c:747 isst_if_clo=
s_assoc() warn: potential spectre issue 'sst_inst->power_domain_info[part]'=
 [r] (local cap)
drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c:1100 isst_if_ge=
t_perf_level_info() warn: potential spectre issue 'power_domain_info->perf_=
levels' [r] (local cap)
drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c:1255 isst_if_ge=
t_perf_level_mask() warn: potential spectre issue 'power_domain_info->perf_=
levels' [r]
drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c:1300 isst_if_ge=
t_base_freq_info() warn: potential spectre issue 'power_domain_info->perf_l=
evels' [r] (local cap)
drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c:1336 isst_if_ge=
t_base_freq_mask() warn: potential spectre issue 'power_domain_info->perf_l=
evels' [r]
drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c:1435 isst_if_ge=
t_turbo_freq_info() warn: potential spectre issue 'power_domain_info->perf_=
levels' [r] (local cap)

vim +1210 drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c

ea009e4769fa3b Srinivas Pandruvada 2023-03-07  1179 =20
d6644d737bec47 Srinivas Pandruvada 2025-05-06  1180  static int isst_if_get=
_perf_level_fabric_info(void __user *argp)
d6644d737bec47 Srinivas Pandruvada 2025-05-06  1181  {
d6644d737bec47 Srinivas Pandruvada 2025-05-06  1182  	struct isst_perf_leve=
l_fabric_info perf_level_fabric;
d6644d737bec47 Srinivas Pandruvada 2025-05-06  1183  	struct tpmi_per_power=
_domain_info *power_domain_info;
d6644d737bec47 Srinivas Pandruvada 2025-05-06  1184  	int start =3D SST_PP_=
CORE_RATIO_P0_FABRIC_START;
d6644d737bec47 Srinivas Pandruvada 2025-05-06  1185  	int width =3D SST_PP_=
CORE_RATIO_P0_FABRIC_WIDTH;
d6644d737bec47 Srinivas Pandruvada 2025-05-06  1186  	int offset =3D SST_PP=
_INFO_11_OFFSET;
d6644d737bec47 Srinivas Pandruvada 2025-05-06  1187  	int i;
d6644d737bec47 Srinivas Pandruvada 2025-05-06  1188 =20
d6644d737bec47 Srinivas Pandruvada 2025-05-06  1189  	if (copy_from_user(&p=
erf_level_fabric, argp, sizeof(perf_level_fabric)))
d6644d737bec47 Srinivas Pandruvada 2025-05-06  1190  		return -EFAULT;
d6644d737bec47 Srinivas Pandruvada 2025-05-06  1191 =20
d6644d737bec47 Srinivas Pandruvada 2025-05-06  1192  	power_domain_info =3D =
get_instance(perf_level_fabric.socket_id,
d6644d737bec47 Srinivas Pandruvada 2025-05-06  1193  					 perf_level_fabri=
c.power_domain_id);
d6644d737bec47 Srinivas Pandruvada 2025-05-06  1194  	if (!power_domain_inf=
o)
d6644d737bec47 Srinivas Pandruvada 2025-05-06  1195  		return -EINVAL;
d6644d737bec47 Srinivas Pandruvada 2025-05-06  1196 =20
d6644d737bec47 Srinivas Pandruvada 2025-05-06  1197  	if (perf_level_fabric=
.level > power_domain_info->max_level)
d6644d737bec47 Srinivas Pandruvada 2025-05-06  1198  		return -EINVAL;
d6644d737bec47 Srinivas Pandruvada 2025-05-06  1199 =20
d6644d737bec47 Srinivas Pandruvada 2025-05-06  1200  	if (power_domain_info=
->pp_header.feature_rev < 2)
d6644d737bec47 Srinivas Pandruvada 2025-05-06  1201  		return -EINVAL;
d6644d737bec47 Srinivas Pandruvada 2025-05-06  1202 =20
d6644d737bec47 Srinivas Pandruvada 2025-05-06  1203  	if (!(power_domain_in=
fo->pp_header.level_en_mask & BIT(perf_level_fabric.level)))
d6644d737bec47 Srinivas Pandruvada 2025-05-06  1204  		return -EINVAL;
d6644d737bec47 Srinivas Pandruvada 2025-05-06  1205 =20
d6644d737bec47 Srinivas Pandruvada 2025-05-06  1206  	/* For revision 2, ma=
ximum number of fabrics is 2 */
d6644d737bec47 Srinivas Pandruvada 2025-05-06  1207  	perf_level_fabric.max=
_fabrics =3D 2;
d6644d737bec47 Srinivas Pandruvada 2025-05-06  1208 =20
d6644d737bec47 Srinivas Pandruvada 2025-05-06  1209  	for (i =3D 0; i < per=
f_level_fabric.max_fabrics; i++) {
d6644d737bec47 Srinivas Pandruvada 2025-05-06 @1210  		_read_pp_level_info(=
"p0_fabric_freq_mhz", perf_level_fabric.p0_fabric_freq_mhz[i],
d6644d737bec47 Srinivas Pandruvada 2025-05-06  1211  				    perf_level_fab=
ric.level, offset, start, width,
d6644d737bec47 Srinivas Pandruvada 2025-05-06  1212  				    SST_MUL_FACTOR=
_FREQ)
d6644d737bec47 Srinivas Pandruvada 2025-05-06  1213  		start +=3D width;
d6644d737bec47 Srinivas Pandruvada 2025-05-06  1214 =20
d6644d737bec47 Srinivas Pandruvada 2025-05-06  1215  		_read_pp_level_info(=
"p1_fabric_freq_mhz", perf_level_fabric.p1_fabric_freq_mhz[i],
d6644d737bec47 Srinivas Pandruvada 2025-05-06  1216  				    perf_level_fab=
ric.level, offset, start, width,
d6644d737bec47 Srinivas Pandruvada 2025-05-06  1217  				    SST_MUL_FACTOR=
_FREQ)
d6644d737bec47 Srinivas Pandruvada 2025-05-06  1218  		start +=3D width;
d6644d737bec47 Srinivas Pandruvada 2025-05-06  1219 =20
d6644d737bec47 Srinivas Pandruvada 2025-05-06  1220  		_read_pp_level_info(=
"pm_fabric_freq_mhz", perf_level_fabric.pm_fabric_freq_mhz[i],
d6644d737bec47 Srinivas Pandruvada 2025-05-06  1221  				    perf_level_fab=
ric.level, offset, start, width,
d6644d737bec47 Srinivas Pandruvada 2025-05-06  1222  				    SST_MUL_FACTOR=
_FREQ)
d6644d737bec47 Srinivas Pandruvada 2025-05-06  1223  		offset =3D SST_PP_IN=
FO_12_OFFSET;
d6644d737bec47 Srinivas Pandruvada 2025-05-06  1224  		start =3D SST_PP_COR=
E_RATIO_P0_FABRIC_1_START;
d6644d737bec47 Srinivas Pandruvada 2025-05-06  1225  	}
d6644d737bec47 Srinivas Pandruvada 2025-05-06  1226 =20
d6644d737bec47 Srinivas Pandruvada 2025-05-06  1227  	if (copy_to_user(argp=
, &perf_level_fabric, sizeof(perf_level_fabric)))
d6644d737bec47 Srinivas Pandruvada 2025-05-06  1228  		return -EFAULT;
d6644d737bec47 Srinivas Pandruvada 2025-05-06  1229 =20
d6644d737bec47 Srinivas Pandruvada 2025-05-06  1230  	return 0;
d6644d737bec47 Srinivas Pandruvada 2025-05-06  1231  }
d6644d737bec47 Srinivas Pandruvada 2025-05-06  1232 =20

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
