Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D912C11D5
	for <oe-kbuild@lists.linux.dev>; Fri, 10 Apr 2026 23:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775864065; cv=none; b=OELOPQevr4CbH66+gqrxU8NZqxJr2Huerlk9npuH4gvI4F8JJwrFjQHgJo8KSa9MTc1BX/aOw1mFMMETFXOVoKPEi6/a8yNdyl22CPgAhVufbkoh14oqUJVScaI7Jx/acJfhuXFBR39H/wmrHaK50xDtjjy609/aWJE5VXdVM2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775864065; c=relaxed/simple;
	bh=9xNhB8HuEFTCEMg8gDU0J2DUFCWSC3QToNAPRqQJHdg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=B3ADWF/93bnQJ+E6TmO0LoEcKKrRVCQLoQxMGsgFLPuYfdr9rppR0F0W35fPJz8OXxkOyvEZa7R7aL3Sf+y4rUWcuTSfB87jGIOOqsmQMNTEAZ/4QgaqJ/XOiiLRhuXfg5vK/k18fpcUEbM67dCyyqM4YnkjE7zroOak7+HuWF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fKeH66t3; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fKeH66t3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775864064; x=1807400064;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=9xNhB8HuEFTCEMg8gDU0J2DUFCWSC3QToNAPRqQJHdg=;
  b=fKeH66t3mRgchNC7Hn0Je+TBBqcfO3qBjnPf7bR1TLTK5bBs4oNzr2qo
   M0ll55mO49uROOtwjqCsr6cNmRDdr9uMJOjNaTNUiPImkgQd9b0gHnA5E
   8bkqt/NTcUJyRCvXcs5ynpgP0IT3T+vNt5bZWLoixKZ2pcL2fUy1LPQP3
   OUQ51ZNwRWFUBhhGCEDolfFwLnsxKGjJT4nrDUDmeFeqvDsRu5VL6lAxF
   yXBvjYArFJdEV8jO2kVbuzgkrzg0wk+ACLJMcI9yYKho+mQ+io/Wigf6n
   qApsNYr+C8bNjhxJvo6ZMrMazN1eNpSAUd9DdHQFJsYXAikEIPTyUh5Bv
   g==;
X-CSE-ConnectionGUID: 2lm3UAKlT7SKDXv39iggkg==
X-CSE-MsgGUID: BZsMidllQCmPMx4/XfQUOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="94281536"
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; 
   d="scan'208";a="94281536"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 16:34:23 -0700
X-CSE-ConnectionGUID: h45QuHlITWuH68/M+vn28w==
X-CSE-MsgGUID: BW/+3Sk+QtKF2O1OEcFG0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; 
   d="scan'208";a="222744605"
Received: from lkp-server01.sh.intel.com (HELO 3eaaf1a74b89) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 10 Apr 2026 16:34:22 -0700
Received: from kbuild by 3eaaf1a74b89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBLMh-000000000NV-3XI2;
	Fri, 10 Apr 2026 23:34:19 +0000
Date: Sat, 11 Apr 2026 07:33:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: 
 drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c:1210
 isst_if_get_perf_level_fabric_info() warn: potential spectre issue
 'power_domain_info->perf_levels' [r] (local cap)
Message-ID: <202604110726.zQnOKLLP-lkp@intel.com>
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
head:   7c6c4ed80b874f721bc7c2c937e098c56e37d2f0
commit: d6644d737bec473a38dbd44a71553cacd636a920 platform/x86: ISST: Suppor=
t SST-PP revision 2
date:   11 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 11 months ago
config: x86_64-randconfig-161-20260411 (https://download.01.org/0day-ci/arc=
hive/20260411/202604110726.zQnOKLLP-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: d6644d737bec ("platform/x86: ISST: Support SST-PP revision 2")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202604110726.zQnOKLLP-lkp@intel.com/

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
