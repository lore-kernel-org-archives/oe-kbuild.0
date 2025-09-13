Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60E192E8E0F
	for <oe-kbuild@lists.linux.dev>; Sat, 13 Sep 2025 09:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757757578; cv=none; b=PNmyJRmspy8Yhft4ij0Sse7ScFAbmnNqPPNqJ/9DEL8wKs+zQ+DoBtDHIDK07QJxMs7LjI2O/fNYRDjWYU8/5WPyUaHH5A+tygRm4p9hCKuyVdSVSP/bP2/tOnMcRuVT+Q6nPERNey0q+fUTzcDjiHaqbFuOb0qzaZoS1DZp9vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757757578; c=relaxed/simple;
	bh=JBG/aD0fd1rTK5mxsp5+q1vYobtV0oQVOswT1INEkBE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nPq+hw7RSYvXlMzDsqTnmTC6WWPLtZs2pNONZtmFs8Q3v4+MDra3tcYpshUp5cHhE905JUpZlDnN0iGKUh2X1/TpXZA3k6CIgoH+6poA6FrpBKk919uoYSMAG6kqsknrsjKfOBY7Z5+bwz7ZcLL7R8ULEKRTNO+yMAKCY6BwgGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SHmb0c1s; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SHmb0c1s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757757576; x=1789293576;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JBG/aD0fd1rTK5mxsp5+q1vYobtV0oQVOswT1INEkBE=;
  b=SHmb0c1sPGKmd9EGNtgtU0vscQYdi9WPZ6vydeDxI3Thb00LSjlydM1Z
   ZJbaAlUXF5KtIRd0LO/IzBNzEa+aeQ22ODEZITcpqRq9QHsRYWldirh4w
   z5ZqSWUuhON3yq/EL0rnSgkU/T5kXhjZAg8+bhspMSBUxH2niVUHJKJ0n
   Khb5z4LxbMza84r9dLua47fFGPscyWa3YOCOB7xzFCI6Vx4ffabqSvEsU
   R6Pt8wWzJmKzLgMX/EbsGzNmBOBJDA+nPVSlxK3AVHZD/LDKw4NiYtODH
   ZBrqn3i054/ZJNanf1upmAgMTlowurJSJvfRWsvtafwXLGo1i7mc9o7eS
   Q==;
X-CSE-ConnectionGUID: K0BrcJahRXap52dqm3EAyQ==
X-CSE-MsgGUID: bmzLLvd8Qs6ZHdQXc2kPMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11551"; a="59317226"
X-IronPort-AV: E=Sophos;i="6.18,261,1751266800"; 
   d="scan'208";a="59317226"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2025 02:59:34 -0700
X-CSE-ConnectionGUID: 4FejyHqHRVG2JEydAVELmA==
X-CSE-MsgGUID: BGPK5DhOSgmW3XnQEN7aaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,261,1751266800"; 
   d="scan'208";a="173485623"
Received: from lkp-server02.sh.intel.com (HELO eb5fdfb2a9b7) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 13 Sep 2025 02:59:32 -0700
Received: from kbuild by eb5fdfb2a9b7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uxN2Y-0001Rs-0M;
	Sat, 13 Sep 2025 09:59:30 +0000
Date: Sat, 13 Sep 2025 17:59:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [broonie-ci:20250912_sbinding_support_reading_subsystem_id_from_device_tree
 2/2] sound/soc/codecs/cs35l41.c:1163 cs35l41_get_system_name() warn: passing
 zero to 'PTR_ERR'
Message-ID: <202509131704.J6ztKjC1-lkp@intel.com>
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
TO: Stefan Binding <sbinding@opensource.cirrus.com>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git 20250912_sbinding_support_reading_subsystem_id_from_device_tree
head:   6a7fa83fafcf594a3d2454b15afbae4e09c804fc
commit: 6a7fa83fafcf594a3d2454b15afbae4e09c804fc [2/2] ASoC: cs35l41: Fallback to reading Subsystem ID property if not ACPI
:::::: branch date: 23 hours ago
:::::: commit date: 23 hours ago
config: i386-randconfig-141-20250913 (https://download.01.org/0day-ci/archive/20250913/202509131704.J6ztKjC1-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202509131704.J6ztKjC1-lkp@intel.com/

New smatch warnings:
sound/soc/codecs/cs35l41.c:1163 cs35l41_get_system_name() warn: passing zero to 'PTR_ERR'

Old smatch warnings:
sound/soc/codecs/cs35l41.c:1117 cs35l41_dsp_init() warn: missing error code 'ret'

vim +/PTR_ERR +1163 sound/soc/codecs/cs35l41.c

bae9e13fc55cbc David Rhodes   2021-10-29  1150  
6a7fa83fafcf59 Stefan Binding 2025-09-12  1151  static int cs35l41_get_system_name(struct cs35l41_private *cs35l41)
c1ad138822a1be Stefan Binding 2022-07-07  1152  {
1d44a30ae3f919 Stefan Binding 2025-02-05  1153  	struct acpi_device *adev = ACPI_COMPANION(cs35l41->dev);
6a7fa83fafcf59 Stefan Binding 2025-09-12  1154  	const char *sub = NULL;
6a7fa83fafcf59 Stefan Binding 2025-09-12  1155  	const char *tmp;
6a7fa83fafcf59 Stefan Binding 2025-09-12  1156  	int ret = 0;
c1ad138822a1be Stefan Binding 2022-07-07  1157  
6a7fa83fafcf59 Stefan Binding 2025-09-12  1158  	/* If there is no acpi_device, there is no ACPI for this system, skip checking ACPI */
6a7fa83fafcf59 Stefan Binding 2025-09-12  1159  	if (adev) {
6a7fa83fafcf59 Stefan Binding 2025-09-12  1160  		acpi_handle handle = acpi_device_handle(adev);
c1ad138822a1be Stefan Binding 2022-07-07  1161  
c1ad138822a1be Stefan Binding 2022-07-07  1162  		sub = acpi_get_subsystem_id(handle);
6a7fa83fafcf59 Stefan Binding 2025-09-12 @1163  		ret = PTR_ERR(sub);
6a7fa83fafcf59 Stefan Binding 2025-09-12  1164  		if (ret) {
6a7fa83fafcf59 Stefan Binding 2025-09-12  1165  			sub = NULL;
1d44a30ae3f919 Stefan Binding 2025-02-05  1166  			/* If no _SUB, fallback to _HID, otherwise fail */
6a7fa83fafcf59 Stefan Binding 2025-09-12  1167  			if (ret == -ENODATA) {
6a7fa83fafcf59 Stefan Binding 2025-09-12  1168  				tmp = acpi_device_hid(adev);
1d44a30ae3f919 Stefan Binding 2025-02-05  1169  				/* If dummy hid, return 0 and fallback to legacy firmware path */
6a7fa83fafcf59 Stefan Binding 2025-09-12  1170  				if (!strcmp(tmp, "device")) {
6a7fa83fafcf59 Stefan Binding 2025-09-12  1171  					ret = 0;
6a7fa83fafcf59 Stefan Binding 2025-09-12  1172  					goto err;
6a7fa83fafcf59 Stefan Binding 2025-09-12  1173  				}
6a7fa83fafcf59 Stefan Binding 2025-09-12  1174  				sub = kstrdup(tmp, GFP_KERNEL);
6a7fa83fafcf59 Stefan Binding 2025-09-12  1175  				if (!sub) {
6a7fa83fafcf59 Stefan Binding 2025-09-12  1176  					ret = -ENOMEM;
6a7fa83fafcf59 Stefan Binding 2025-09-12  1177  					goto err;
6a7fa83fafcf59 Stefan Binding 2025-09-12  1178  				}
6a7fa83fafcf59 Stefan Binding 2025-09-12  1179  			}
6a7fa83fafcf59 Stefan Binding 2025-09-12  1180  		}
6a7fa83fafcf59 Stefan Binding 2025-09-12  1181  	} else {
6a7fa83fafcf59 Stefan Binding 2025-09-12  1182  		if (!device_property_read_string(cs35l41->dev, "cirrus,subsystem-id", &tmp)) {
6a7fa83fafcf59 Stefan Binding 2025-09-12  1183  			sub = kstrdup(tmp, GFP_KERNEL);
6a7fa83fafcf59 Stefan Binding 2025-09-12  1184  			if (!sub) {
6a7fa83fafcf59 Stefan Binding 2025-09-12  1185  				ret = -ENOMEM;
6a7fa83fafcf59 Stefan Binding 2025-09-12  1186  				goto err;
6a7fa83fafcf59 Stefan Binding 2025-09-12  1187  			}
6a7fa83fafcf59 Stefan Binding 2025-09-12  1188  		}
c1ad138822a1be Stefan Binding 2022-07-07  1189  	}
c1ad138822a1be Stefan Binding 2022-07-07  1190  
6a7fa83fafcf59 Stefan Binding 2025-09-12  1191  err:
6a7fa83fafcf59 Stefan Binding 2025-09-12  1192  	if (sub) {
c1ad138822a1be Stefan Binding 2022-07-07  1193  		cs35l41->dsp.system_name = sub;
6a7fa83fafcf59 Stefan Binding 2025-09-12  1194  		dev_info(cs35l41->dev, "Subsystem ID: %s\n", cs35l41->dsp.system_name);
6a7fa83fafcf59 Stefan Binding 2025-09-12  1195  	} else
6a7fa83fafcf59 Stefan Binding 2025-09-12  1196  		dev_warn(cs35l41->dev, "Subsystem ID not found\n");
c1ad138822a1be Stefan Binding 2022-07-07  1197  
6a7fa83fafcf59 Stefan Binding 2025-09-12  1198  	return ret;
b19181638182d1 Stefan Binding 2025-02-10  1199  }
c1ad138822a1be Stefan Binding 2022-07-07  1200  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
