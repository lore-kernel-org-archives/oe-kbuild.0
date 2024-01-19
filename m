Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7BF71F60B
	for <oe-kbuild@lists.linux.dev>; Fri, 19 Jan 2024 17:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705685241; cv=none; b=F5LysiD2nkR+Imbd04XuuphK08U5gHVWa+P8sDJ93vib8rhOevPgF3zeJPlfsxGyfn01M6cLA6DXGCamiiS6PcaIjMbMsIDOrg9gKlO0E4bq/n7ggL6ETbRV7S1qOQlNk9IPvAGW0xnpu0SR6R62nWMlwKpCahid6c/zRPsX/sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705685241; c=relaxed/simple;
	bh=bn7HND8zKBnkLvMEkkbsTcmAd1t8WFcwQ1lAMXQp9dI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=N9W7ftC9muNy4VDcoqzaleFx/BTKV+rSq03ITcU+0FPx5peCtPjDaIj44TTqD6sqZIfaIIBpV3TMCACMGDNRikfzMrhX9oC5sfShJivRGB/QFN77dN2CcSalvMAeD01O/TC4eP9RJdmCJ8FKcheJ8DjGcZp+X+up+2va9Oyk7qQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X7AULDQD; arc=none smtp.client-ip=192.55.52.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X7AULDQD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705685239; x=1737221239;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bn7HND8zKBnkLvMEkkbsTcmAd1t8WFcwQ1lAMXQp9dI=;
  b=X7AULDQDTCUke0ddqcgW4sb0y1XmGbtDP/mhAFqQw3d9a3PLnXDhIToY
   ro+S1fFrG1MoBYGgA6vCRPj/cecBQkUP/M7WF2ueDod7ySE7XqOY4bS/j
   H3rP2Q5liVoPnLSJfFHwmOhcDhtWU9rDfgEK2zbAfbeCueBROWs147Kf5
   V3o+McJ6123O7AuwJn4xRKWJyuaYBdw3eEWRWDD0MGVj9pAKDjtkr0CUx
   PkD3XuCbGgUuS6z1u0yswzKAetLguX7xu3STLghQ2458/KEoQSGE41m+s
   LmSpv9BEy7HijOoNvEvBNbeZsODmHrIC/34GB93qt5uPQMFhSfUsMVvoj
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="399667087"
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; 
   d="scan'208";a="399667087"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2024 09:27:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; 
   d="scan'208";a="635003"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 19 Jan 2024 09:27:12 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rQse4-0004JM-33;
	Fri, 19 Jan 2024 17:27:08 +0000
Date: Sat, 20 Jan 2024 01:27:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/usb/typec/tipd/core.c:1159:17-18: WARNING opportunity for
 min()
Message-ID: <202401200150.XOjrMEhu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Javier Carrasco <javier.carrasco@wolfvision.net>
CC: Heikki Krogerus <heikki.krogerus@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9d1694dc91ce7b80bc96d6d8eaf1a1eca668d847
commit: 4c3ea81aa8e11400f24e5541bf46c2cadb4202e9 usb: typec: tipd: add patch update support for tps6598x
date:   2 weeks ago
:::::: branch date: 15 hours ago
:::::: commit date: 2 weeks ago
config: i386-randconfig-053-20240118 (https://download.01.org/0day-ci/archive/20240120/202401200150.XOjrMEhu-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202401200150.XOjrMEhu-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/usb/typec/tipd/core.c:1159:17-18: WARNING opportunity for min()

vim +1159 drivers/usb/typec/tipd/core.c

7e7a3c815d22170 Abdel Alkuor    2023-10-03  1127  
4c3ea81aa8e1140 Javier Carrasco 2023-12-14  1128  static int tps6598x_apply_patch(struct tps6598x *tps)
4c3ea81aa8e1140 Javier Carrasco 2023-12-14  1129  {
4c3ea81aa8e1140 Javier Carrasco 2023-12-14  1130  	u8 in = TPS_PTCS_CONTENT_DEV | TPS_PTCS_CONTENT_APP;
4c3ea81aa8e1140 Javier Carrasco 2023-12-14  1131  	u8 out[TPS_MAX_LEN] = {0};
4c3ea81aa8e1140 Javier Carrasco 2023-12-14  1132  	size_t in_len = sizeof(in);
4c3ea81aa8e1140 Javier Carrasco 2023-12-14  1133  	size_t copied_bytes = 0;
4c3ea81aa8e1140 Javier Carrasco 2023-12-14  1134  	size_t bytes_left;
4c3ea81aa8e1140 Javier Carrasco 2023-12-14  1135  	const struct firmware *fw;
4c3ea81aa8e1140 Javier Carrasco 2023-12-14  1136  	const char *firmware_name;
4c3ea81aa8e1140 Javier Carrasco 2023-12-14  1137  	int ret;
4c3ea81aa8e1140 Javier Carrasco 2023-12-14  1138  
4c3ea81aa8e1140 Javier Carrasco 2023-12-14  1139  	ret = device_property_read_string(tps->dev, "firmware-name",
4c3ea81aa8e1140 Javier Carrasco 2023-12-14  1140  					  &firmware_name);
4c3ea81aa8e1140 Javier Carrasco 2023-12-14  1141  	if (ret)
4c3ea81aa8e1140 Javier Carrasco 2023-12-14  1142  		return ret;
4c3ea81aa8e1140 Javier Carrasco 2023-12-14  1143  
4c3ea81aa8e1140 Javier Carrasco 2023-12-14  1144  	ret = tps_request_firmware(tps, &fw);
4c3ea81aa8e1140 Javier Carrasco 2023-12-14  1145  	if (ret)
4c3ea81aa8e1140 Javier Carrasco 2023-12-14  1146  		return ret;
4c3ea81aa8e1140 Javier Carrasco 2023-12-14  1147  
4c3ea81aa8e1140 Javier Carrasco 2023-12-14  1148  	ret = tps6598x_exec_cmd(tps, "PTCs", in_len, &in,
4c3ea81aa8e1140 Javier Carrasco 2023-12-14  1149  				TPS_PTCS_OUT_BYTES, out);
4c3ea81aa8e1140 Javier Carrasco 2023-12-14  1150  	if (ret || out[TPS_PTCS_STATUS] == TPS_PTCS_STATUS_FAIL) {
4c3ea81aa8e1140 Javier Carrasco 2023-12-14  1151  		if (!ret)
4c3ea81aa8e1140 Javier Carrasco 2023-12-14  1152  			ret = -EBUSY;
4c3ea81aa8e1140 Javier Carrasco 2023-12-14  1153  		dev_err(tps->dev, "Update start failed (%d)\n", ret);
4c3ea81aa8e1140 Javier Carrasco 2023-12-14  1154  		goto release_fw;
4c3ea81aa8e1140 Javier Carrasco 2023-12-14  1155  	}
4c3ea81aa8e1140 Javier Carrasco 2023-12-14  1156  
4c3ea81aa8e1140 Javier Carrasco 2023-12-14  1157  	bytes_left = fw->size;
4c3ea81aa8e1140 Javier Carrasco 2023-12-14  1158  	while (bytes_left) {
4c3ea81aa8e1140 Javier Carrasco 2023-12-14 @1159  		if (bytes_left < TPS_MAX_LEN)
4c3ea81aa8e1140 Javier Carrasco 2023-12-14  1160  			in_len = bytes_left;
4c3ea81aa8e1140 Javier Carrasco 2023-12-14  1161  		else
4c3ea81aa8e1140 Javier Carrasco 2023-12-14  1162  			in_len = TPS_MAX_LEN;
4c3ea81aa8e1140 Javier Carrasco 2023-12-14  1163  		ret = tps6598x_exec_cmd(tps, "PTCd", in_len,
4c3ea81aa8e1140 Javier Carrasco 2023-12-14  1164  					fw->data + copied_bytes,
4c3ea81aa8e1140 Javier Carrasco 2023-12-14  1165  					TPS_PTCD_OUT_BYTES, out);
4c3ea81aa8e1140 Javier Carrasco 2023-12-14  1166  		if (ret || out[TPS_PTCD_TRANSFER_STATUS] ||
4c3ea81aa8e1140 Javier Carrasco 2023-12-14  1167  		    out[TPS_PTCD_LOADING_STATE] == TPS_PTCD_LOAD_ERR) {
4c3ea81aa8e1140 Javier Carrasco 2023-12-14  1168  			if (!ret)
4c3ea81aa8e1140 Javier Carrasco 2023-12-14  1169  				ret = -EBUSY;
4c3ea81aa8e1140 Javier Carrasco 2023-12-14  1170  			dev_err(tps->dev, "Patch download failed (%d)\n", ret);
4c3ea81aa8e1140 Javier Carrasco 2023-12-14  1171  			goto release_fw;
4c3ea81aa8e1140 Javier Carrasco 2023-12-14  1172  		}
4c3ea81aa8e1140 Javier Carrasco 2023-12-14  1173  		copied_bytes += in_len;
4c3ea81aa8e1140 Javier Carrasco 2023-12-14  1174  		bytes_left -= in_len;
4c3ea81aa8e1140 Javier Carrasco 2023-12-14  1175  	}
4c3ea81aa8e1140 Javier Carrasco 2023-12-14  1176  
4c3ea81aa8e1140 Javier Carrasco 2023-12-14  1177  	ret = tps6598x_exec_cmd(tps, "PTCc", 0, NULL, TPS_PTCC_OUT_BYTES, out);
4c3ea81aa8e1140 Javier Carrasco 2023-12-14  1178  	if (ret || out[TPS_PTCC_DEV] || out[TPS_PTCC_APP]) {
4c3ea81aa8e1140 Javier Carrasco 2023-12-14  1179  		if (!ret)
4c3ea81aa8e1140 Javier Carrasco 2023-12-14  1180  			ret = -EBUSY;
4c3ea81aa8e1140 Javier Carrasco 2023-12-14  1181  		dev_err(tps->dev, "Update completion failed (%d)\n", ret);
4c3ea81aa8e1140 Javier Carrasco 2023-12-14  1182  		goto release_fw;
4c3ea81aa8e1140 Javier Carrasco 2023-12-14  1183  	}
4c3ea81aa8e1140 Javier Carrasco 2023-12-14  1184  	msleep(TPS_SETUP_MS);
4c3ea81aa8e1140 Javier Carrasco 2023-12-14  1185  	dev_info(tps->dev, "Firmware update succeeded\n");
4c3ea81aa8e1140 Javier Carrasco 2023-12-14  1186  
4c3ea81aa8e1140 Javier Carrasco 2023-12-14  1187  release_fw:
4c3ea81aa8e1140 Javier Carrasco 2023-12-14  1188  	release_firmware(fw);
4c3ea81aa8e1140 Javier Carrasco 2023-12-14  1189  
4c3ea81aa8e1140 Javier Carrasco 2023-12-14  1190  	return ret;
4c3ea81aa8e1140 Javier Carrasco 2023-12-14  1191  };
4c3ea81aa8e1140 Javier Carrasco 2023-12-14  1192  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
