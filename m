Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B54C16435
	for <oe-kbuild@lists.linux.dev>; Wed, 31 May 2023 18:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685559231; x=1717095231;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=X1eTrvZFNWkOWdxL6GERA5JoJaXvgRg7ozWNsGONEKU=;
  b=KaOePqMuSK0/rtSBUbO+2kieLlGp3kptmMOCHooMqvF5wl4Qe99yukgr
   7/UMOi+ld8IY9rrJ+672Nv7UkpYsoKFjwfntYXVFg4kLvNKj8mHzaOhGX
   rj3WnpBb1E/MdiBbeg+SY3vesgQrIoTPoncV9aNPKCaoTbN2i0rIYX2t/
   2m8n5TMcLB/JvbIggiokCaaYFBcJIoRmQzCp7ZPSGXs/9SSECPx2M1AVx
   c0+7D/oaJAkfeDnaxZyuRoTSdRDP1KhO8rc1Je6v+gkkDvoraKHX0P3UG
   hpWjFW3qoAlYVn3Trx0MRmZuj+w4QkUL+Lws8ynyHncsBEzH4rXtYJkF9
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="339923417"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; 
   d="scan'208";a="339923417"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2023 11:53:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="684499376"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; 
   d="scan'208";a="684499376"
Received: from lkp-server01.sh.intel.com (HELO fb1ced2c09fb) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 31 May 2023 11:53:36 -0700
Received: from kbuild by fb1ced2c09fb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q4Qwx-0001Y1-2W;
	Wed, 31 May 2023 18:53:35 +0000
Date: Thu, 1 Jun 2023 02:52:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: Re: [Intel-gfx] [PATCH v2 2/7] drm/i915: Introduce device info
 port_mask
Message-ID: <202306010218.sIuz2Og6-lkp@intel.com>
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
In-Reply-To: <20230531134806.23065-3-ville.syrjala@linux.intel.com>
References: <20230531134806.23065-3-ville.syrjala@linux.intel.com>
TO: Ville Syrjala <ville.syrjala@linux.intel.com>

Hi Ville,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-tip/drm-tip]

url:    https://github.com/intel-lab-lkp/linux/commits/Ville-Syrjala/drm-i915-Remove-bogus-DDI-F-from-hsw-bdw-output-init/20230531-215041
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
patch link:    https://lore.kernel.org/r/20230531134806.23065-3-ville.syrjala%40linux.intel.com
patch subject: [Intel-gfx] [PATCH v2 2/7] drm/i915: Introduce device info port_mask
:::::: branch date: 5 hours ago
:::::: commit date: 5 hours ago
config: x86_64-randconfig-c002-20230531 (https://download.01.org/0day-ci/archive/20230601/202306010218.sIuz2Og6-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202306010218.sIuz2Og6-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/i915/display/intel_display_device.c:595:66-79: duplicated argument to & or |

vim +595 drivers/gpu/drm/i915/display/intel_display_device.c

69d439818fe501e Matt Roper    2023-05-23  547  
69d439818fe501e Matt Roper    2023-05-23  548  #define XE_D_DISPLAY \
69d439818fe501e Matt Roper    2023-05-23  549  	.abox_mask = GENMASK(2, 1), \
69d439818fe501e Matt Roper    2023-05-23  550  	.dbuf.size = 2048, \
69d439818fe501e Matt Roper    2023-05-23  551  	.dbuf.slice_mask = BIT(DBUF_S1) | BIT(DBUF_S2), \
69d439818fe501e Matt Roper    2023-05-23  552  	.has_ddi = 1, \
69d439818fe501e Matt Roper    2023-05-23  553  	.has_dp_mst = 1, \
69d439818fe501e Matt Roper    2023-05-23  554  	.has_dsb = 1, \
69d439818fe501e Matt Roper    2023-05-23  555  	.has_fpga_dbg = 1, \
69d439818fe501e Matt Roper    2023-05-23  556  	.has_hotplug = 1, \
69d439818fe501e Matt Roper    2023-05-23  557  	.has_ipc = 1, \
69d439818fe501e Matt Roper    2023-05-23  558  	.has_psr = 1, \
69d439818fe501e Matt Roper    2023-05-23  559  	.has_psr_hw_tracking = 1, \
69d439818fe501e Matt Roper    2023-05-23  560  	.pipe_offsets = { \
69d439818fe501e Matt Roper    2023-05-23  561  		[TRANSCODER_A] = PIPE_A_OFFSET, \
69d439818fe501e Matt Roper    2023-05-23  562  		[TRANSCODER_B] = PIPE_B_OFFSET, \
69d439818fe501e Matt Roper    2023-05-23  563  		[TRANSCODER_C] = PIPE_C_OFFSET, \
69d439818fe501e Matt Roper    2023-05-23  564  		[TRANSCODER_D] = PIPE_D_OFFSET, \
69d439818fe501e Matt Roper    2023-05-23  565  		[TRANSCODER_DSI_0] = PIPE_DSI0_OFFSET, \
69d439818fe501e Matt Roper    2023-05-23  566  		[TRANSCODER_DSI_1] = PIPE_DSI1_OFFSET, \
69d439818fe501e Matt Roper    2023-05-23  567  	}, \
69d439818fe501e Matt Roper    2023-05-23  568  	.trans_offsets = { \
69d439818fe501e Matt Roper    2023-05-23  569  		[TRANSCODER_A] = TRANSCODER_A_OFFSET, \
69d439818fe501e Matt Roper    2023-05-23  570  		[TRANSCODER_B] = TRANSCODER_B_OFFSET, \
69d439818fe501e Matt Roper    2023-05-23  571  		[TRANSCODER_C] = TRANSCODER_C_OFFSET, \
69d439818fe501e Matt Roper    2023-05-23  572  		[TRANSCODER_D] = TRANSCODER_D_OFFSET, \
69d439818fe501e Matt Roper    2023-05-23  573  		[TRANSCODER_DSI_0] = TRANSCODER_DSI0_OFFSET, \
69d439818fe501e Matt Roper    2023-05-23  574  		[TRANSCODER_DSI_1] = TRANSCODER_DSI1_OFFSET, \
69d439818fe501e Matt Roper    2023-05-23  575  	}, \
69d439818fe501e Matt Roper    2023-05-23  576  	TGL_CURSOR_OFFSETS, \
69d439818fe501e Matt Roper    2023-05-23  577  	ICL_COLORS, \
69d439818fe501e Matt Roper    2023-05-23  578  	\
69d439818fe501e Matt Roper    2023-05-23  579  	.__runtime_defaults.ip.ver = 12, \
69d439818fe501e Matt Roper    2023-05-23  580  	.__runtime_defaults.has_dmc = 1, \
69d439818fe501e Matt Roper    2023-05-23  581  	.__runtime_defaults.has_dsc = 1, \
69d439818fe501e Matt Roper    2023-05-23  582  	.__runtime_defaults.has_hdcp = 1, \
69d439818fe501e Matt Roper    2023-05-23  583  	.__runtime_defaults.pipe_mask = \
69d439818fe501e Matt Roper    2023-05-23  584  		BIT(PIPE_A) | BIT(PIPE_B) | BIT(PIPE_C) | BIT(PIPE_D), \
69d439818fe501e Matt Roper    2023-05-23  585  	.__runtime_defaults.cpu_transcoder_mask = \
69d439818fe501e Matt Roper    2023-05-23  586  		BIT(TRANSCODER_A) | BIT(TRANSCODER_B) | \
69d439818fe501e Matt Roper    2023-05-23  587  		BIT(TRANSCODER_C) | BIT(TRANSCODER_D) | \
69d439818fe501e Matt Roper    2023-05-23  588  		BIT(TRANSCODER_DSI_0) | BIT(TRANSCODER_DSI_1), \
69d439818fe501e Matt Roper    2023-05-23  589  	.__runtime_defaults.fbc_mask = BIT(INTEL_FBC_A)
69d439818fe501e Matt Roper    2023-05-23  590  
69d439818fe501e Matt Roper    2023-05-23  591  static const struct intel_display_device_info tgl_display = {
69d439818fe501e Matt Roper    2023-05-23  592  	XE_D_DISPLAY,
767eda155e618b7 Ville Syrjälä 2023-05-31  593  
767eda155e618b7 Ville Syrjälä 2023-05-31  594  	.__runtime_defaults.port_mask = BIT(PORT_A) | BIT(PORT_B) | BIT(PORT_C) |
767eda155e618b7 Ville Syrjälä 2023-05-31 @595  		BIT(PORT_TC1) | BIT(PORT_TC2) | BIT(PORT_TC3) | BIT(PORT_TC4) | BIT(PORT_TC5) | BIT(PORT_TC5),
767eda155e618b7 Ville Syrjälä 2023-05-31  596  };
767eda155e618b7 Ville Syrjälä 2023-05-31  597  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
