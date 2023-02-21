Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B396B1878
	for <oe-kbuild@lists.linux.dev>; Tue, 21 Feb 2023 09:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676971739; x=1708507739;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=PwEcfDVtE23iag4E+nBnVidQy6S4t+Y9km5RfIQWGKM=;
  b=NAo7oL4BEYL2OylyL+a6rsBDgsK6S1nAGlkqhF+YRbCIAGDtT8J11oEw
   pmop+H572f4L9NCqHgUXTI7AZLH8yg5BgVzdePl/QWobSuY2i4FiKOwHV
   wVcI3vwbKXIa+leUydLJ9KxZx2mevRzE7wUVXQ1Idz6J2rwhevGD8cU2t
   FUUPLYh+3EkKLNwtYwShUmnVqbZNFv690HatzXVYEgVQ3Cg9K3bfPr/9Z
   Hs8MHuy+TJz+fmoEOJjsnlgS5Tz9A2fpGHoblAzu7CmM1ydxPMR3PlMkG
   SS0pNM/OLhQAEauXapZ50BokYojoptNQ2mxy8ZP6NORLJjpeEbGFzSrkQ
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="334782270"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; 
   d="scan'208";a="334782270"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2023 01:28:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="780937586"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; 
   d="scan'208";a="780937586"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 21 Feb 2023 01:28:54 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pUOxB-000EcZ-2X;
	Tue, 21 Feb 2023 09:28:53 +0000
Date: Tue, 21 Feb 2023 17:28:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 488/13664]
 drivers/gpu/drm/i915/display/intel_color.c:1400 intel_color_prepare_commit()
 warn: ignoring unreachable code.
Message-ID: <202302211707.9malP4N2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: "Ville Syrjälä" <ville.syrjala@linux.intel.com>
CC: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
CC: Uma Shankar <uma.shankar@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   465461cf48465b8a0a54025db5ae2b3df7a04577
commit: 2487ae0bcb53a7d4180c551c02b1f318ea590c84 [488/13664] drm/i915: Disable DSB usage specifically for LUTs
:::::: branch date: 3 hours ago
:::::: commit date: 2 months ago
config: x86_64-randconfig-m001-20230213 (https://download.01.org/0day-ci/archive/20230221/202302211707.9malP4N2-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202302211707.9malP4N2-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/i915/display/intel_color.c:1400 intel_color_prepare_commit() warn: ignoring unreachable code.

Old smatch warnings:
drivers/gpu/drm/i915/display/intel_color.c:2579 i9xx_read_lut_10() error: uninitialized symbol 'ldw'.
drivers/gpu/drm/i915/display/intel_color.c:2579 i9xx_read_lut_10() error: uninitialized symbol 'udw'.

vim +1400 drivers/gpu/drm/i915/display/intel_color.c

4d8ed54c044703 drivers/gpu/drm/i915/intel_color.c         Ville Syrjälä 2019-02-05  1392  
efb2b57edf20c3 drivers/gpu/drm/i915/display/intel_color.c Ville Syrjälä 2022-11-23  1393  void intel_color_prepare_commit(struct intel_crtc_state *crtc_state)
efb2b57edf20c3 drivers/gpu/drm/i915/display/intel_color.c Ville Syrjälä 2022-11-23  1394  {
b358c3b98813b1 drivers/gpu/drm/i915/display/intel_color.c Ville Syrjälä 2022-11-23  1395  	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
b358c3b98813b1 drivers/gpu/drm/i915/display/intel_color.c Ville Syrjälä 2022-11-23  1396  
2487ae0bcb53a7 drivers/gpu/drm/i915/display/intel_color.c Ville Syrjälä 2022-11-23  1397  	/* FIXME DSB has issues loading LUTs, disable it for now */
2487ae0bcb53a7 drivers/gpu/drm/i915/display/intel_color.c Ville Syrjälä 2022-11-23  1398  	return;
2487ae0bcb53a7 drivers/gpu/drm/i915/display/intel_color.c Ville Syrjälä 2022-11-23  1399  
b358c3b98813b1 drivers/gpu/drm/i915/display/intel_color.c Ville Syrjälä 2022-11-23 @1400  	crtc_state->dsb = intel_dsb_prepare(crtc);
efb2b57edf20c3 drivers/gpu/drm/i915/display/intel_color.c Ville Syrjälä 2022-11-23  1401  }
efb2b57edf20c3 drivers/gpu/drm/i915/display/intel_color.c Ville Syrjälä 2022-11-23  1402  

:::::: The code at line 1400 was first introduced by commit
:::::: b358c3b98813b1557588a11c894b22915251a2ce drm/i915: Make DSB lower level

:::::: TO: Ville Syrjälä <ville.syrjala@linux.intel.com>
:::::: CC: Ville Syrjälä <ville.syrjala@linux.intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
