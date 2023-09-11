Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B8AF9F4
	for <oe-kbuild@lists.linux.dev>; Mon, 11 Sep 2023 13:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694439319; x=1725975319;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Jl6NEkvPzrFHkvxbpmC1bhM06a1hP2H7V3XUsI4WqaE=;
  b=EoY3za1ch3J3j5cChHKmk95ZW/4fkhurUVAhYzjIphvDNKpSz5Pcwty/
   clBPrJz3AD6fa5DVNTS/AmvA9lgh+F8Rm8eJnZEI7wAST3iRt6j8pca0R
   ZS3fVI0iZWKRCKGrM6/B1oI+kyFZLJiUa73WsfBImsh8AVYvQYvQ/dPwD
   rMOQYFs9eoWrtD4gMpk7neQzLg5tdcHGaBHPBf3RB5qUo3nT4mDpil3+K
   PieMD67gTQ/KBPF00aeWGQzyGBsUa7sBpHUwys6E7bvpQdq/vD5kzsUpT
   dUFEX247MtD6PQjoSFLd0zjbggBqScmfJPHfvu7u5V4csCha5YaHGGU3l
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="377994452"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; 
   d="scan'208";a="377994452"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2023 06:35:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="866949526"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; 
   d="scan'208";a="866949526"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 11 Sep 2023 06:35:12 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qfh4I-0006Gq-14;
	Mon, 11 Sep 2023 13:35:10 +0000
Date: Mon, 11 Sep 2023 21:34:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [drm-intel:drm-intel-next 1/1]
 drivers/gpu/drm/i915/display/intel_psr.c:3185 i915_psr_sink_status_show()
 error: uninitialized symbol 'error_status'.
Message-ID: <202309112118.aNleOG6b-lkp@intel.com>
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
CC: intel-gfx@lists.freedesktop.org
CC: dri-devel@lists.freedesktop.org
TO: "Jouni Högander" <jouni.hogander@intel.com>
CC: Animesh Manna <animesh.manna@intel.com>

tree:   git://anongit.freedesktop.org/drm-intel drm-intel-next
head:   da1bc5cc3b55af2d785c6dd02c3b461f89f51adf
commit: a3f84a67c79146ef2d86743529f8d9670519a170 [1/1] drm/i915/psr: Add psr sink error status into sink status debugfs
:::::: branch date: 3 days ago
:::::: commit date: 5 days ago
config: i386-randconfig-141-20230911 (https://download.01.org/0day-ci/archive/20230911/202309112118.aNleOG6b-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20230911/202309112118.aNleOG6b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202309112118.aNleOG6b-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/i915/display/intel_psr.c:3185 i915_psr_sink_status_show() error: uninitialized symbol 'error_status'.

Old smatch warnings:
drivers/gpu/drm/i915/display/intel_psr.c:913 tgl_dc3co_exitline_compute_config() warn: ignoring unreachable code.
drivers/gpu/drm/i915/display/intel_psr.c:2828 intel_psr_short_pulse() error: uninitialized symbol 'error_status'.
drivers/gpu/drm/i915/display/intel_psr.c:2833 intel_psr_short_pulse() error: uninitialized symbol 'error_status'.

vim +/error_status +3185 drivers/gpu/drm/i915/display/intel_psr.c

5cc0de45674971 Jani Nikula    2023-03-17  3146  
5cc0de45674971 Jani Nikula    2023-03-17  3147  static int i915_psr_sink_status_show(struct seq_file *m, void *data)
5cc0de45674971 Jani Nikula    2023-03-17  3148  {
09b9851776b57f Jani Nikula    2023-03-17  3149  	struct intel_connector *connector = m->private;
09b9851776b57f Jani Nikula    2023-03-17  3150  	struct intel_dp *intel_dp = intel_attached_dp(connector);
5cc0de45674971 Jani Nikula    2023-03-17  3151  	static const char * const sink_status[] = {
5cc0de45674971 Jani Nikula    2023-03-17  3152  		"inactive",
5cc0de45674971 Jani Nikula    2023-03-17  3153  		"transition to active, capture and display",
5cc0de45674971 Jani Nikula    2023-03-17  3154  		"active, display from RFB",
5cc0de45674971 Jani Nikula    2023-03-17  3155  		"active, capture and display on sink device timings",
5cc0de45674971 Jani Nikula    2023-03-17  3156  		"transition to inactive, capture and display, timing re-sync",
5cc0de45674971 Jani Nikula    2023-03-17  3157  		"reserved",
5cc0de45674971 Jani Nikula    2023-03-17  3158  		"reserved",
5cc0de45674971 Jani Nikula    2023-03-17  3159  		"sink internal error",
5cc0de45674971 Jani Nikula    2023-03-17  3160  	};
e1435b67afaef7 Jani Nikula    2023-03-17  3161  	const char *str;
5cc0de45674971 Jani Nikula    2023-03-17  3162  	int ret;
a3f84a67c79146 Jouni Högander 2023-08-28  3163  	u8 status, error_status;
5cc0de45674971 Jani Nikula    2023-03-17  3164  
5cc0de45674971 Jani Nikula    2023-03-17  3165  	if (!CAN_PSR(intel_dp)) {
5cc0de45674971 Jani Nikula    2023-03-17  3166  		seq_puts(m, "PSR Unsupported\n");
5cc0de45674971 Jani Nikula    2023-03-17  3167  		return -ENODEV;
5cc0de45674971 Jani Nikula    2023-03-17  3168  	}
5cc0de45674971 Jani Nikula    2023-03-17  3169  
09b9851776b57f Jani Nikula    2023-03-17  3170  	if (connector->base.status != connector_status_connected)
5cc0de45674971 Jani Nikula    2023-03-17  3171  		return -ENODEV;
5cc0de45674971 Jani Nikula    2023-03-17  3172  
a3f84a67c79146 Jouni Högander 2023-08-28  3173  	ret = psr_get_status_and_error_status(intel_dp, &status, &error_status);
a3f84a67c79146 Jouni Högander 2023-08-28  3174  	if (ret)
a3f84a67c79146 Jouni Högander 2023-08-28  3175  		return ret;
5cc0de45674971 Jani Nikula    2023-03-17  3176  
a3f84a67c79146 Jouni Högander 2023-08-28  3177  	status &= DP_PSR_SINK_STATE_MASK;
a3f84a67c79146 Jouni Högander 2023-08-28  3178  	if (status < ARRAY_SIZE(sink_status))
a3f84a67c79146 Jouni Högander 2023-08-28  3179  		str = sink_status[status];
e1435b67afaef7 Jani Nikula    2023-03-17  3180  	else
e1435b67afaef7 Jani Nikula    2023-03-17  3181  		str = "unknown";
e1435b67afaef7 Jani Nikula    2023-03-17  3182  
a3f84a67c79146 Jouni Högander 2023-08-28  3183  	seq_printf(m, "Sink PSR status: 0x%x [%s]\n", status, str);
5cc0de45674971 Jani Nikula    2023-03-17  3184  
a3f84a67c79146 Jouni Högander 2023-08-28 @3185  	seq_printf(m, "Sink PSR error status: 0x%x", error_status);
a3f84a67c79146 Jouni Högander 2023-08-28  3186  
a3f84a67c79146 Jouni Högander 2023-08-28  3187  	if (error_status & (DP_PSR_RFB_STORAGE_ERROR |
a3f84a67c79146 Jouni Högander 2023-08-28  3188  			    DP_PSR_VSC_SDP_UNCORRECTABLE_ERROR |
a3f84a67c79146 Jouni Högander 2023-08-28  3189  			    DP_PSR_LINK_CRC_ERROR))
a3f84a67c79146 Jouni Högander 2023-08-28  3190  		seq_puts(m, ":\n");
a3f84a67c79146 Jouni Högander 2023-08-28  3191  	else
a3f84a67c79146 Jouni Högander 2023-08-28  3192  		seq_puts(m, "\n");
a3f84a67c79146 Jouni Högander 2023-08-28  3193  	if (error_status & DP_PSR_RFB_STORAGE_ERROR)
a3f84a67c79146 Jouni Högander 2023-08-28  3194  		seq_puts(m, "\tPSR RFB storage error\n");
a3f84a67c79146 Jouni Högander 2023-08-28  3195  	if (error_status & DP_PSR_VSC_SDP_UNCORRECTABLE_ERROR)
a3f84a67c79146 Jouni Högander 2023-08-28  3196  		seq_puts(m, "\tPSR VSC SDP uncorrectable error\n");
a3f84a67c79146 Jouni Högander 2023-08-28  3197  	if (error_status & DP_PSR_LINK_CRC_ERROR)
a3f84a67c79146 Jouni Högander 2023-08-28  3198  		seq_puts(m, "\tPSR Link CRC error\n");
a3f84a67c79146 Jouni Högander 2023-08-28  3199  
a3f84a67c79146 Jouni Högander 2023-08-28  3200  	return ret;
5cc0de45674971 Jani Nikula    2023-03-17  3201  }
5cc0de45674971 Jani Nikula    2023-03-17  3202  DEFINE_SHOW_ATTRIBUTE(i915_psr_sink_status);
5cc0de45674971 Jani Nikula    2023-03-17  3203  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
