Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEBD310F6
	for <oe-kbuild@lists.linux.dev>; Tue, 21 Feb 2023 05:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676957448; x=1708493448;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=tIpWPfD7DJy+1C31TkEgFT1dpaat8GVB4SRs+wmCuR8=;
  b=BFKAyLmBGzgH8rQTcxQcfkvaYJak7jJWa1WrY23EFtT1xGTy51om6mok
   Kpysh6PULDgWk4ebznDVx9CjE8Cqph60Bh/pfVF3FiYxd0Q7//zHUPWlZ
   lLIWnhVrglnmMpLE8RF2CFlChyBShvCO6E7Nw6RAIMos4i1JNstjh6ovn
   SoxP3n546d3yavkR7Gckhm8H0XexAnaMFEVUC3Tpob5ezSqeX68hJ5CJ9
   BUT3GxNKHDkiVhd0JAdEa0Y0x12yPZyVi4p/HCHXoqJ/ghlBOWzJ/cGaz
   VnwQjgz8wqsk7W89IJHo+sLLWp1wxm8fzuK5C9y5z0LaNv6X9ubE0IGOI
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="312919474"
X-IronPort-AV: E=Sophos;i="5.97,314,1669104000"; 
   d="scan'208";a="312919474"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2023 21:30:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="760391135"
X-IronPort-AV: E=Sophos;i="5.97,314,1669104000"; 
   d="scan'208";a="760391135"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 20 Feb 2023 21:30:46 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pULEk-000EUE-0S;
	Tue, 21 Feb 2023 05:30:46 +0000
Date: Tue, 21 Feb 2023 13:30:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 441/13681]
 drivers/gpu/drm/i915/display/intel_pps.c:1538 intel_pps_init() error:
 uninitialized symbol 'ret'.
Message-ID: <202302211337.O4uSKJZn-lkp@intel.com>
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
CC: Animesh Manna <animesh.manna@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d2af0fa4bfa4ec29d03b449ccd43fee39501112d
commit: ba21bb24810f8b49b83ee3f49b60953445e79f8f [441/13681] drm/i915: Reject unusable power sequencers
:::::: branch date: 24 hours ago
:::::: commit date: 2 months ago
config: x86_64-randconfig-m001-20230213 (https://download.01.org/0day-ci/archive/20230221/202302211337.O4uSKJZn-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202302211337.O4uSKJZn-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/i915/display/intel_pps.c:1538 intel_pps_init() error: uninitialized symbol 'ret'.

vim +/ret +1538 drivers/gpu/drm/i915/display/intel_pps.c

73bb78b5ba681f Jani Nikula   2021-01-08  1519  
ba21bb24810f8b Ville Syrjälä 2022-11-25  1520  bool intel_pps_init(struct intel_dp *intel_dp)
c520869ac4ef1a Jani Nikula   2021-01-08  1521  {
8e75e8f573e1ff Ville Syrjälä 2022-05-10  1522  	intel_wakeref_t wakeref;
ba21bb24810f8b Ville Syrjälä 2022-11-25  1523  	bool ret;
8e75e8f573e1ff Ville Syrjälä 2022-05-10  1524  
50759c13735dab Ville Syrjälä 2022-05-10  1525  	intel_dp->pps.initializing = true;
45f8a8ceb9aff5 Jani Nikula   2021-01-20  1526  	INIT_DELAYED_WORK(&intel_dp->pps.panel_vdd_work, edp_panel_vdd_work);
c520869ac4ef1a Jani Nikula   2021-01-08  1527  
d70920adf9f29a Jani Nikula   2021-01-08  1528  	pps_init_timestamps(intel_dp);
97b70144b2502a Jani Nikula   2021-01-20  1529  
8e75e8f573e1ff Ville Syrjälä 2022-05-10  1530  	with_intel_pps_lock(intel_dp, wakeref) {
ba21bb24810f8b Ville Syrjälä 2022-11-25  1531  		ret = pps_initial_setup(intel_dp);
8e75e8f573e1ff Ville Syrjälä 2022-05-10  1532  
8e75e8f573e1ff Ville Syrjälä 2022-05-10  1533  		pps_init_delays(intel_dp);
8e75e8f573e1ff Ville Syrjälä 2022-05-10  1534  		pps_init_registers(intel_dp, false);
8e75e8f573e1ff Ville Syrjälä 2022-05-10  1535  		pps_vdd_init(intel_dp);
8e75e8f573e1ff Ville Syrjälä 2022-05-10  1536  	}
ba21bb24810f8b Ville Syrjälä 2022-11-25  1537  
ba21bb24810f8b Ville Syrjälä 2022-11-25 @1538  	return ret;
8e75e8f573e1ff Ville Syrjälä 2022-05-10  1539  }
8e75e8f573e1ff Ville Syrjälä 2022-05-10  1540  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
