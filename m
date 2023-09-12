Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 954121171C
	for <oe-kbuild@lists.linux.dev>; Tue, 12 Sep 2023 23:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694562441; x=1726098441;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Qn3IX9h0yjocNy0//NO/PtTRGvmLnIjxEeY4pCXwiKo=;
  b=EmqYfJy/Ikd9eApoLjlM2nBa1rPL2hIt0jefS8JS0B79RpXrtTuw4IDP
   DiO63Y+/tl0Ohj/SlYPcTJK8reoYD2Br3CrKmYrrMd8XsfDyQanLRTw3C
   +4zTUgLnXVEJXz4lQlf4HhvyMdRZPVgMqZivhFQk5WfC1OpR4B893ZQZT
   +VeuPce2ghOOIz+RwF3ef6T5C2N9xsDXyEunEADpF++Ff2CWZodXdmvN5
   a5vBkd0hWbnc1njIWrTcN8nMwMyO7J1eC6bDBKUKOxgfRR/GkUxQu+GmQ
   Sp2SHT7jUWi8wBejLYbZRyuBGdU4DmvmdVxzjdEjd82CM45HQH9gVMF65
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="375852984"
X-IronPort-AV: E=Sophos;i="6.02,141,1688454000"; 
   d="scan'208";a="375852984"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2023 16:47:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="867560545"
X-IronPort-AV: E=Sophos;i="6.02,141,1688454000"; 
   d="scan'208";a="867560545"
Received: from lkp-server02.sh.intel.com (HELO 47e905db7d2b) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 12 Sep 2023 16:47:16 -0700
Received: from kbuild by 47e905db7d2b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qgD6A-0000TZ-16;
	Tue, 12 Sep 2023 23:47:14 +0000
Date: Wed, 13 Sep 2023 07:46:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 878/4552]
 drivers/gpu/drm/i915/display/intel_psr.c:3185 i915_psr_sink_status_show()
 error: uninitialized symbol 'error_status'.
Message-ID: <202309130740.hhrbB5Io-lkp@intel.com>
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
TO: "Jouni Högander" <jouni.hogander@intel.com>
CC: Animesh Manna <animesh.manna@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3c13c772fc233a10342c8e1605ff0855dfdf0c89
commit: a3f84a67c79146ef2d86743529f8d9670519a170 [878/4552] drm/i915/psr: Add psr sink error status into sink status debugfs
:::::: branch date: 18 hours ago
:::::: commit date: 7 days ago
config: i386-randconfig-141-20230911 (https://download.01.org/0day-ci/archive/20230913/202309130740.hhrbB5Io-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20230913/202309130740.hhrbB5Io-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202309130740.hhrbB5Io-lkp@intel.com/

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
