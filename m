Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95FCFDDD7
	for <oe-kbuild@lists.linux.dev>; Tue,  5 Sep 2023 23:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693954888; x=1725490888;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cdBz9k8k/QEC7FpPSG8qsD2Y4wC3vAkGGLDAGTeaebA=;
  b=Ne0vzkD03N+BbgTJWl+IGt5OrFfjRkva7OQqujFoTwIN53XhS+IOSP/R
   ZFD63GN0dJxFsYs1PbxyIfwLWM3edfpEv8SrO8Uc0CRw83Dxve0I1RQxP
   asuVbcKK9W19CK+zhvQnCNXvXFt1VvrdbER8FKOLxOyzbARF+wVCAeKG8
   ib+NTgmjezOBGND/pNbjWr8zxWG7FxCGZ6BOV+v5e0SFrX4/E4kJi8EPe
   McSZkdPpTPa7GgEr10ShIpABppHay9Ng6o0KrzzG5Sb52fck/ecAWPa0W
   vsVWUWAh9WoS8/oewQtXBb81Zp3hcPRxxP+m/r0vykIah4evyO1jOzab9
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="379639737"
X-IronPort-AV: E=Sophos;i="6.02,230,1688454000"; 
   d="scan'208";a="379639737"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2023 16:01:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="831413789"
X-IronPort-AV: E=Sophos;i="6.02,230,1688454000"; 
   d="scan'208";a="831413789"
Received: from lkp-server02.sh.intel.com (HELO e0b2ea88afd5) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 05 Sep 2023 16:01:26 -0700
Received: from kbuild by e0b2ea88afd5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qdf2y-0002BB-0V;
	Tue, 05 Sep 2023 23:01:24 +0000
Date: Wed, 6 Sep 2023 07:00:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [Intel-gfx] [PATCH v5 3/6] drm/i915/panelreplay: Initializaton
 and compute config for panel replay
Message-ID: <202309060644.uWp5zW4i-lkp@intel.com>
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
In-Reply-To: <20230905073551.958368-4-animesh.manna@intel.com>
References: <20230905073551.958368-4-animesh.manna@intel.com>
TO: Animesh Manna <animesh.manna@intel.com>
TO: intel-gfx@lists.freedesktop.org
TO: dri-devel@lists.freedesktop.org
CC: jani.nikula@intel.com

Hi Animesh,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-tip/drm-tip]

url:    https://github.com/intel-lab-lkp/linux/commits/Animesh-Manna/drm-panelreplay-dpcd-register-definition-for-panelreplay/20230905-154811
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
patch link:    https://lore.kernel.org/r/20230905073551.958368-4-animesh.manna%40intel.com
patch subject: [Intel-gfx] [PATCH v5 3/6] drm/i915/panelreplay: Initializaton and compute config for panel replay
:::::: branch date: 15 hours ago
:::::: commit date: 15 hours ago
config: i386-randconfig-141-20230906 (https://download.01.org/0day-ci/archive/20230906/202309060644.uWp5zW4i-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230906/202309060644.uWp5zW4i-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202309060644.uWp5zW4i-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/i915/display/intel_dp.c:3779 intel_dp_vsc_sdp_pack() warn: was && intended here instead of ||?

vim +3779 drivers/gpu/drm/i915/display/intel_dp.c

0c06fa156006c7 Gwan-gyeong Mun 2019-09-19  3754  
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3755  static ssize_t intel_dp_vsc_sdp_pack(const struct drm_dp_vsc_sdp *vsc,
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3756  				     struct dp_sdp *sdp, size_t size)
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3757  {
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3758  	size_t length = sizeof(struct dp_sdp);
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3759  
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3760  	if (size < length)
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3761  		return -ENOSPC;
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3762  
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3763  	memset(sdp, 0, size);
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3764  
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3765  	/*
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3766  	 * Prepare VSC Header for SU as per DP 1.4a spec, Table 2-119
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3767  	 * VSC SDP Header Bytes
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3768  	 */
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3769  	sdp->sdp_header.HB0 = 0; /* Secondary-Data Packet ID = 0 */
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3770  	sdp->sdp_header.HB1 = vsc->sdp_type; /* Secondary-data Packet Type */
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3771  	sdp->sdp_header.HB2 = vsc->revision; /* Revision Number */
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3772  	sdp->sdp_header.HB3 = vsc->length; /* Number of Valid Data Bytes */
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3773  
cafac5a9836199 Gwan-gyeong Mun 2020-05-14  3774  	/*
4dd2d4a2ffcae4 Animesh Manna   2023-09-05  3775  	 * Other than revision 0x5 which supports Pixel Encoding/Colorimetry
4dd2d4a2ffcae4 Animesh Manna   2023-09-05  3776  	 * Format as per DP 1.4a spec, revision 0x7 also supports Pixel
4dd2d4a2ffcae4 Animesh Manna   2023-09-05  3777  	 * Encoding/Colorimetry Format as per DP 2.0 spec.
cafac5a9836199 Gwan-gyeong Mun 2020-05-14  3778  	 */
4dd2d4a2ffcae4 Animesh Manna   2023-09-05 @3779  	if (vsc->revision != 0x5 || vsc->revision != 0x7)
cafac5a9836199 Gwan-gyeong Mun 2020-05-14  3780  		goto out;
cafac5a9836199 Gwan-gyeong Mun 2020-05-14  3781  
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3782  	/* VSC SDP Payload for DB16 through DB18 */
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3783  	/* Pixel Encoding and Colorimetry Formats  */
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3784  	sdp->db[16] = (vsc->pixelformat & 0xf) << 4; /* DB16[7:4] */
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3785  	sdp->db[16] |= vsc->colorimetry & 0xf; /* DB16[3:0] */
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3786  
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3787  	switch (vsc->bpc) {
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3788  	case 6:
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3789  		/* 6bpc: 0x0 */
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3790  		break;
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3791  	case 8:
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3792  		sdp->db[17] = 0x1; /* DB17[3:0] */
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3793  		break;
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3794  	case 10:
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3795  		sdp->db[17] = 0x2;
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3796  		break;
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3797  	case 12:
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3798  		sdp->db[17] = 0x3;
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3799  		break;
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3800  	case 16:
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3801  		sdp->db[17] = 0x4;
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3802  		break;
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3803  	default:
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3804  		MISSING_CASE(vsc->bpc);
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3805  		break;
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3806  	}
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3807  	/* Dynamic Range and Component Bit Depth */
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3808  	if (vsc->dynamic_range == DP_DYNAMIC_RANGE_CTA)
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3809  		sdp->db[17] |= 0x80;  /* DB17[7] */
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3810  
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3811  	/* Content Type */
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3812  	sdp->db[18] = vsc->content_type & 0x7;
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3813  
cafac5a9836199 Gwan-gyeong Mun 2020-05-14  3814  out:
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3815  	return length;
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3816  }
03c761b00c87d6 Gwan-gyeong Mun 2020-02-11  3817  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
