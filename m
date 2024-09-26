Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD51F1885BB
	for <oe-kbuild@lists.linux.dev>; Thu, 26 Sep 2024 21:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727386426; cv=none; b=UuKumZGQDP/oPJBAGd4O5YUvzyTKEEt4Om8uwDvl8muPLJyt5cJq/IDENTmdS69ankbkV29Vijsv2PYVKfVXz0ElsBeaF5EBXwEJkFboAuiKJ50zSxdaYLnHw6LRv3aJ5vJmVSw7EYUY3JLAcFjmYOsxKaJfJq8bnFtCNgo9N7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727386426; c=relaxed/simple;
	bh=YBC4sRIXjvQ2RvMp20KpHJYHaLdfGHPgQIrRN/idMAo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cyU+6E/WJFA/9ont04rEFH003FffNOdpNMkZJ8gQ/u6gBm6dhlt4WS5BUJ6mQ93d/RhJZZXqtrBtuyvO5OlVvWa2Y0s6qbQY3ydeKNZtSsYIO/cj/4MW7GGPDbcaNacikEJHRAKdv4Rg4MBLuE9dLizzdGBOfnLjD2rkwo5rFQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aPy+hkdY; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aPy+hkdY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727386425; x=1758922425;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YBC4sRIXjvQ2RvMp20KpHJYHaLdfGHPgQIrRN/idMAo=;
  b=aPy+hkdY5FtIOrUb05lBJXq6rUjgjYoNW/4SlpoEsgz37iIaHY0L1bmX
   ChnOkdHOo6iwVyadxlJhmKlo7Wd9UUmNVK+hyFwqXf3947Sl6XM0vvfbv
   a8G+qxJ8sObAMi8eM9Kr1OKQzDNbHy+D5kRAtpWvbH3pw2Fvwd6E1ALRV
   SREfThk2c0pQfY5ipwh74ztCAOEUiPfT2iR1sIZBrlMlfgDiLFzoNtnJq
   pm7IycZbAUhE+GYPl/h/rGrP+gdfHwvdAqpvogp1rFlbEZJU5kYyA+Xvx
   /f15UbbUaay5QkKhXSR7etP9JsZ9M8KDgkm5IM0iaNWb/OBgagiE6kVd/
   g==;
X-CSE-ConnectionGUID: ZItq1SEtRT2n2Mj9t/4eXA==
X-CSE-MsgGUID: QMqTz6FWQ36unqYJWqqyNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="26386665"
X-IronPort-AV: E=Sophos;i="6.11,156,1725346800"; 
   d="scan'208";a="26386665"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2024 14:33:44 -0700
X-CSE-ConnectionGUID: d5HSLFFRQtqvvygT66B1fQ==
X-CSE-MsgGUID: hJzGRpj0TPiRgLWRN5t42Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,156,1725346800"; 
   d="scan'208";a="95648168"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 26 Sep 2024 14:33:43 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1stw7J-000LDY-0R;
	Thu, 26 Sep 2024 21:33:41 +0000
Date: Fri, 27 Sep 2024 05:33:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [cip:linux-4.19.y-cip 7151/30000]
 drivers/gpu/drm/rcar-du/rcar_lvds.c:849:43: warning:
 'rcar_lvds_r8a77995_info' defined but not used
Message-ID: <202409270547.73Ncq3pp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "cip tree"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>

Hi Laurent,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-4.19.y-cip
head:   95b722b3ebb739e01ce712254a92789f843917e3
commit: 973babadc01000cf32944e4b17adc41cbb66bcb2 [7151/30000] drm: rcar-du: lvds: Add API to enable/disable clock output
:::::: branch date: 3 days ago
:::::: commit date: 5 years ago
config: i386-buildonly-randconfig-003-20240927 (https://download.01.org/0day-ci/archive/20240927/202409270547.73Ncq3pp-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240927/202409270547.73Ncq3pp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202409270547.73Ncq3pp-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/rcar-du/rcar_lvds.c:849:43: warning: 'rcar_lvds_r8a77995_info' defined but not used [-Wunused-const-variable=]
     849 | static const struct rcar_lvds_device_info rcar_lvds_r8a77995_info = {
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~


vim +/rcar_lvds_r8a77995_info +849 drivers/gpu/drm/rcar-du/rcar_lvds.c

44ead813e2d7621 Laurent Pinchart 2019-10-01  848  
44ead813e2d7621 Laurent Pinchart 2019-10-01 @849  static const struct rcar_lvds_device_info rcar_lvds_r8a77995_info = {
44ead813e2d7621 Laurent Pinchart 2019-10-01  850  	.gen = 3,
44ead813e2d7621 Laurent Pinchart 2019-10-01  851  	.quirks = RCAR_LVDS_QUIRK_GEN3_LVEN | RCAR_LVDS_QUIRK_PWD
44ead813e2d7621 Laurent Pinchart 2019-10-01  852  		| RCAR_LVDS_QUIRK_EXT_PLL | RCAR_LVDS_QUIRK_DUAL_LINK,
44ead813e2d7621 Laurent Pinchart 2019-10-01  853  	.pll_setup = rcar_lvds_pll_setup_d3_e3,
b6eb7102ad6dc7a Sergei Shtylyov  2018-03-01  854  };
b6eb7102ad6dc7a Sergei Shtylyov  2018-03-01  855  

:::::: The code at line 849 was first introduced by commit
:::::: 44ead813e2d76216d7bdf1d479bbe7e0271a3d22 drm: rcar-du: lvds: D3/E3 support

:::::: TO: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
:::::: CC: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
