Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 156982567
	for <oe-kbuild@lists.linux.dev>; Sat, 27 May 2023 18:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685213295; x=1716749295;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=c1CgJnjm13esUqcH4hVWlk4ofnX/K68hgu7k8QHZQ90=;
  b=VqzxCaSmbvqIdsT3u4w2QEeYd1H4849A5r/vGOTNWmB10eVXCzf7wnkr
   1scfze/Nq8IT3B+LA73iIkNpcj1x0vfdiWmd1PY6Jtk4ZUQ2kQVLinuC4
   3BMRhbulFSpb7zUBLmabiLEK6TOXo1TH9uh0V6UXYD4+nxF8fup0+1NJh
   vnimsGCXIFeGaRMNzUAS/MYAv/appG8CHpjJYOoOHqjDibE/vCbbtRyfI
   7Kq89xEqzq3ztyujXgt+YxVAVh+u2YhzWCUN1SxcDpYrzwALweEPsjgcS
   JCJGc+AyXY2rJeP14mQrfRuMv0uNPpeT9MDZlebZeJUmufJnOqGzr2TKO
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10723"; a="440788448"
X-IronPort-AV: E=Sophos;i="6.00,197,1681196400"; 
   d="scan'208";a="440788448"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2023 11:48:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10723"; a="817912809"
X-IronPort-AV: E=Sophos;i="6.00,197,1681196400"; 
   d="scan'208";a="817912809"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 27 May 2023 11:48:12 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q2yxY-000K8x-13;
	Sat, 27 May 2023 18:48:12 +0000
Date: Sun, 28 May 2023 02:48:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [Intel-gfx] [PATCH v8 6/7] drm/i915/mtl: find the best QGV point
 for the SAGV configuration
Message-ID: <202305280253.Ab8bRV2w-lkp@intel.com>
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
In-Reply-To: <20230526125055.39886-7-vinod.govindapillai@intel.com>
References: <20230526125055.39886-7-vinod.govindapillai@intel.com>
TO: Vinod Govindapillai <vinod.govindapillai@intel.com>
TO: intel-gfx@lists.freedesktop.org
CC: ville.syrjala@intel.com

Hi Vinod,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-tip/drm-tip]

url:    https://github.com/intel-lab-lkp/linux/commits/Vinod-Govindapillai/drm-i915-fix-the-derating-percentage-for-MTL/20230526-205305
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
patch link:    https://lore.kernel.org/r/20230526125055.39886-7-vinod.govindapillai%40intel.com
patch subject: [Intel-gfx] [PATCH v8 6/7] drm/i915/mtl: find the best QGV point for the SAGV configuration
:::::: branch date: 30 hours ago
:::::: commit date: 30 hours ago
config: i386-randconfig-m021-20230526 (https://download.01.org/0day-ci/archive/20230528/202305280253.Ab8bRV2w-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202305280253.Ab8bRV2w-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/i915/display/intel_bw.c:845 mtl_find_qgv_points() error: buffer overflow 'i915->display.bw.max' 6 <= 6

Old smatch warnings:
drivers/gpu/drm/i915/display/intel_bw.c:852 mtl_find_qgv_points() error: buffer overflow 'i915->display.bw.max' 6 <= 6

vim +845 drivers/gpu/drm/i915/display/intel_bw.c

366b6200f76e0f Jani Nikula         2019-08-06  805  
a10fe26325bd3a Vinod Govindapillai 2023-05-26  806  static int mtl_find_qgv_points(struct drm_i915_private *i915,
a10fe26325bd3a Vinod Govindapillai 2023-05-26  807  			       unsigned int data_rate,
a10fe26325bd3a Vinod Govindapillai 2023-05-26  808  			       unsigned int num_active_planes,
a10fe26325bd3a Vinod Govindapillai 2023-05-26  809  			       const struct intel_bw_state *old_bw_state,
a10fe26325bd3a Vinod Govindapillai 2023-05-26  810  			       struct intel_bw_state *new_bw_state)
a10fe26325bd3a Vinod Govindapillai 2023-05-26  811  {
a10fe26325bd3a Vinod Govindapillai 2023-05-26  812  	unsigned int best_rate = UINT_MAX;
a10fe26325bd3a Vinod Govindapillai 2023-05-26  813  	unsigned int num_qgv_points = i915->display.bw.max[0].num_qgv_points;
a10fe26325bd3a Vinod Govindapillai 2023-05-26  814  	unsigned int qgv_peak_bw  = 0;
a10fe26325bd3a Vinod Govindapillai 2023-05-26  815  	int i;
a10fe26325bd3a Vinod Govindapillai 2023-05-26  816  	int ret;
a10fe26325bd3a Vinod Govindapillai 2023-05-26  817  
a10fe26325bd3a Vinod Govindapillai 2023-05-26  818  	ret = intel_atomic_lock_global_state(&new_bw_state->base);
a10fe26325bd3a Vinod Govindapillai 2023-05-26  819  	if (ret)
a10fe26325bd3a Vinod Govindapillai 2023-05-26  820  		return ret;
a10fe26325bd3a Vinod Govindapillai 2023-05-26  821  
a10fe26325bd3a Vinod Govindapillai 2023-05-26  822  	/*
a10fe26325bd3a Vinod Govindapillai 2023-05-26  823  	 * If SAGV cannot be enabled, disable the pcode SAGV by passing all 1's
a10fe26325bd3a Vinod Govindapillai 2023-05-26  824  	 * for qgv peak bw in PM Demand request. So assign UINT_MAX if SAGV is
a10fe26325bd3a Vinod Govindapillai 2023-05-26  825  	 * not enabled. PM Demand code will clamp the value for the register
a10fe26325bd3a Vinod Govindapillai 2023-05-26  826  	 */
a10fe26325bd3a Vinod Govindapillai 2023-05-26  827  	if (!intel_can_enable_sagv(i915, new_bw_state)) {
a10fe26325bd3a Vinod Govindapillai 2023-05-26  828  		new_bw_state->qgv_point_peakbw = UINT_MAX;
a10fe26325bd3a Vinod Govindapillai 2023-05-26  829  		drm_dbg_kms(&i915->drm, "No SAGV, use UINT_MAX as peak bw.");
a10fe26325bd3a Vinod Govindapillai 2023-05-26  830  		goto out;
a10fe26325bd3a Vinod Govindapillai 2023-05-26  831  	}
a10fe26325bd3a Vinod Govindapillai 2023-05-26  832  
a10fe26325bd3a Vinod Govindapillai 2023-05-26  833  	/*
a10fe26325bd3a Vinod Govindapillai 2023-05-26  834  	 * Find the best QGV point by comparing the data_rate with max data rate
a10fe26325bd3a Vinod Govindapillai 2023-05-26  835  	 * offered per plane group
a10fe26325bd3a Vinod Govindapillai 2023-05-26  836  	 */
a10fe26325bd3a Vinod Govindapillai 2023-05-26  837  	for (i = 0; i < num_qgv_points; i++) {
a10fe26325bd3a Vinod Govindapillai 2023-05-26  838  		unsigned int bw_index =
a10fe26325bd3a Vinod Govindapillai 2023-05-26  839  			tgl_max_bw_index(i915, num_active_planes, i);
a10fe26325bd3a Vinod Govindapillai 2023-05-26  840  		unsigned int max_data_rate;
a10fe26325bd3a Vinod Govindapillai 2023-05-26  841  
a10fe26325bd3a Vinod Govindapillai 2023-05-26  842  		if (bw_index > ARRAY_SIZE(i915->display.bw.max))
a10fe26325bd3a Vinod Govindapillai 2023-05-26  843  			continue;
a10fe26325bd3a Vinod Govindapillai 2023-05-26  844  
a10fe26325bd3a Vinod Govindapillai 2023-05-26 @845  		max_data_rate = i915->display.bw.max[bw_index].deratedbw[i];
a10fe26325bd3a Vinod Govindapillai 2023-05-26  846  
a10fe26325bd3a Vinod Govindapillai 2023-05-26  847  		if (max_data_rate < data_rate)
a10fe26325bd3a Vinod Govindapillai 2023-05-26  848  			continue;
a10fe26325bd3a Vinod Govindapillai 2023-05-26  849  
a10fe26325bd3a Vinod Govindapillai 2023-05-26  850  		if (max_data_rate - data_rate < best_rate) {
a10fe26325bd3a Vinod Govindapillai 2023-05-26  851  			best_rate = max_data_rate - data_rate;
a10fe26325bd3a Vinod Govindapillai 2023-05-26  852  			qgv_peak_bw = i915->display.bw.max[bw_index].peakbw[i];
a10fe26325bd3a Vinod Govindapillai 2023-05-26  853  		}
a10fe26325bd3a Vinod Govindapillai 2023-05-26  854  
a10fe26325bd3a Vinod Govindapillai 2023-05-26  855  		drm_dbg_kms(&i915->drm, "QGV point %d: max bw %d required %d qgv_peak_bw: %d\n",
a10fe26325bd3a Vinod Govindapillai 2023-05-26  856  			    i, max_data_rate, data_rate, qgv_peak_bw);
a10fe26325bd3a Vinod Govindapillai 2023-05-26  857  	}
a10fe26325bd3a Vinod Govindapillai 2023-05-26  858  
a10fe26325bd3a Vinod Govindapillai 2023-05-26  859  	drm_dbg_kms(&i915->drm, "Matching peaks QGV bw: %d for required data rate: %d\n",
a10fe26325bd3a Vinod Govindapillai 2023-05-26  860  		    qgv_peak_bw, data_rate);
a10fe26325bd3a Vinod Govindapillai 2023-05-26  861  
a10fe26325bd3a Vinod Govindapillai 2023-05-26  862  	/*
a10fe26325bd3a Vinod Govindapillai 2023-05-26  863  	 * The display configuration cannot be supported if no QGV point
a10fe26325bd3a Vinod Govindapillai 2023-05-26  864  	 * satisfying the required data rate is found
a10fe26325bd3a Vinod Govindapillai 2023-05-26  865  	 */
a10fe26325bd3a Vinod Govindapillai 2023-05-26  866  	if (qgv_peak_bw == 0) {
a10fe26325bd3a Vinod Govindapillai 2023-05-26  867  		drm_dbg_kms(&i915->drm, "No QGV points for bw %d for display configuration(%d active planes).\n",
a10fe26325bd3a Vinod Govindapillai 2023-05-26  868  			    data_rate, num_active_planes);
a10fe26325bd3a Vinod Govindapillai 2023-05-26  869  		return -EINVAL;
a10fe26325bd3a Vinod Govindapillai 2023-05-26  870  	}
a10fe26325bd3a Vinod Govindapillai 2023-05-26  871  
a10fe26325bd3a Vinod Govindapillai 2023-05-26  872  	/* MTL PM DEMAND expects QGV BW parameter in multiples of 100 mbps */
a10fe26325bd3a Vinod Govindapillai 2023-05-26  873  	new_bw_state->qgv_point_peakbw = DIV_ROUND_CLOSEST(qgv_peak_bw, 100);
a10fe26325bd3a Vinod Govindapillai 2023-05-26  874  
a10fe26325bd3a Vinod Govindapillai 2023-05-26  875  out:
a10fe26325bd3a Vinod Govindapillai 2023-05-26  876  	if (new_bw_state->qgv_point_peakbw != old_bw_state->qgv_point_peakbw)  {
a10fe26325bd3a Vinod Govindapillai 2023-05-26  877  		ret = intel_atomic_serialize_global_state(&new_bw_state->base);
a10fe26325bd3a Vinod Govindapillai 2023-05-26  878  		if (ret)
a10fe26325bd3a Vinod Govindapillai 2023-05-26  879  			return ret;
a10fe26325bd3a Vinod Govindapillai 2023-05-26  880  	}
a10fe26325bd3a Vinod Govindapillai 2023-05-26  881  
a10fe26325bd3a Vinod Govindapillai 2023-05-26  882  	return 0;
a10fe26325bd3a Vinod Govindapillai 2023-05-26  883  }
a10fe26325bd3a Vinod Govindapillai 2023-05-26  884  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
