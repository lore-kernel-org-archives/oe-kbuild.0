Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6804C2019C
	for <oe-kbuild@lists.linux.dev>; Tue, 22 Aug 2023 22:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692743916; x=1724279916;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Tzl40kahYhUfeXkQhs+UQFBk8FBOX5rzT1C8w131QoA=;
  b=GV0/ikv2qHJuN0JsXBY7FCTXrvTrayuV8pCnvC3E7x1KjxFw/tdk2DiE
   rV0PtaJcTBqa2Q947SU6srymLmSdTs5UYL3hNh2CBom158wELx9S43osV
   c36ibcXWLOUydZqDBk2WkZvDVA9WBor2nTZ7xHxfrg8jy0jerBJkVLVvU
   xImQ2RJRbt7ZRn8RWf+ji39D/8q7SQC/6g+ALD64zD5WUj2Il0aU0JdTQ
   /g/uf1q23TBxaYUs6qFpoaPQuQWeiU2Nh3cDIKHnvyGRR+BMA6XaQusu9
   Md+KLzc5sJHzuOJgf+Ru3rl9g1M6kGeT09x6BvFGqcuB1f/Eavy+b7sJ4
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="373985977"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="373985977"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2023 15:38:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="686208682"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="686208682"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 22 Aug 2023 15:38:33 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYa1A-0000ag-0y;
	Tue, 22 Aug 2023 22:38:32 +0000
Date: Wed, 23 Aug 2023 06:37:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v3 2/7] drm/vkms: Support multiple DRM objects (crtcs,
 etc.) per VKMS device
Message-ID: <202308230626.WnEgGJr0-lkp@intel.com>
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
In-Reply-To: <20230818073411.3414628-4-brpol@chromium.org>
References: <20230818073411.3414628-4-brpol@chromium.org>
TO: Brandon Pollack <brpol@chromium.org>
TO: marius.vlad@collabora.com
TO: jshargo@chromium.org
CC: hamohammed.sa@gmail.com
CC: rodrigosiqueiramelo@gmail.com
CC: linux-doc@vger.kernel.org
CC: hirono@chromium.org
CC: mduggan@chromium.org
CC: corbet@lwn.net
CC: linux-kernel@vger.kernel.org
CC: dri-devel@lists.freedesktop.org
CC: melissa.srw@gmail.com
CC: mairacanal@riseup.net
CC: mripard@kernel.org
CC: tzimmermann@suse.de
CC: Brandon Pollack <brpol@chromium.org>

Hi Brandon,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on next-20230822]
[cannot apply to linus/master v6.5-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Brandon-Pollack/drm-vkms-Support-multiple-DRM-objects-crtcs-etc-per-VKMS-device/20230818-162937
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230818073411.3414628-4-brpol%40chromium.org
patch subject: [PATCH v3 2/7] drm/vkms: Support multiple DRM objects (crtcs, etc.) per VKMS device
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: nios2-randconfig-r081-20230822 (https://download.01.org/0day-ci/archive/20230823/202308230626.WnEgGJr0-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230823/202308230626.WnEgGJr0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202308230626.WnEgGJr0-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/vkms/vkms_writeback.c:136 vkms_wb_atomic_commit() warn: variable dereferenced before check 'connector_state' (see line 126)

vim +/connector_state +136 drivers/gpu/drm/vkms/vkms_writeback.c

dbd9d80c1b2e03 Rodrigo Siqueira 2020-08-30  119  
dbd9d80c1b2e03 Rodrigo Siqueira 2020-08-30  120  static void vkms_wb_atomic_commit(struct drm_connector *conn,
eca22edb37d29f Maxime Ripard    2020-11-18  121  				  struct drm_atomic_state *state)
dbd9d80c1b2e03 Rodrigo Siqueira 2020-08-30  122  {
eca22edb37d29f Maxime Ripard    2020-11-18  123  	struct drm_connector_state *connector_state = drm_atomic_get_new_connector_state(state,
eca22edb37d29f Maxime Ripard    2020-11-18  124  											 conn);
d527102c7511ce Jim Shargo       2023-08-18  125  	struct vkms_crtc *vkms_crtc =
d527102c7511ce Jim Shargo       2023-08-18 @126  		drm_crtc_to_vkms_crtc(connector_state->crtc);
d527102c7511ce Jim Shargo       2023-08-18  127  	struct drm_writeback_connector *wb_conn = &vkms_crtc->wb_connector;
d527102c7511ce Jim Shargo       2023-08-18  128  	struct vkms_crtc_state *crtc_state = vkms_crtc->composer_state;
bbdf7b2a0b0e69 Igor Torrente    2022-09-05  129  	struct drm_framebuffer *fb = connector_state->writeback_job->fb;
bc0d7fdefec62e Igor Torrente    2022-09-05  130  	u16 crtc_height = crtc_state->base.crtc->mode.vdisplay;
bc0d7fdefec62e Igor Torrente    2022-09-05  131  	u16 crtc_width = crtc_state->base.crtc->mode.hdisplay;
bbdf7b2a0b0e69 Igor Torrente    2022-09-05  132  	struct vkms_writeback_job *active_wb;
bbdf7b2a0b0e69 Igor Torrente    2022-09-05  133  	struct vkms_frame_info *wb_frame_info;
8ba1648567e289 Igor Torrente    2022-09-05  134  	u32 wb_format = fb->format->format;
dbd9d80c1b2e03 Rodrigo Siqueira 2020-08-30  135  
d527102c7511ce Jim Shargo       2023-08-18 @136  	if (!connector_state)
dbd9d80c1b2e03 Rodrigo Siqueira 2020-08-30  137  		return;
dbd9d80c1b2e03 Rodrigo Siqueira 2020-08-30  138  
d527102c7511ce Jim Shargo       2023-08-18  139  	vkms_set_composer(vkms_crtc, true);
dbd9d80c1b2e03 Rodrigo Siqueira 2020-08-30  140  
d527102c7511ce Jim Shargo       2023-08-18  141  	active_wb = connector_state->writeback_job->priv;
bbdf7b2a0b0e69 Igor Torrente    2022-09-05  142  	wb_frame_info = &active_wb->wb_frame_info;
bbdf7b2a0b0e69 Igor Torrente    2022-09-05  143  
d527102c7511ce Jim Shargo       2023-08-18  144  	spin_lock_irq(&vkms_crtc->composer_lock);
bbdf7b2a0b0e69 Igor Torrente    2022-09-05  145  	crtc_state->active_writeback = active_wb;
6c494ca6fd820c Maíra Canal      2023-05-15  146  	crtc_state->wb_pending = true;
d527102c7511ce Jim Shargo       2023-08-18  147  	spin_unlock_irq(&vkms_crtc->composer_lock);
6c494ca6fd820c Maíra Canal      2023-05-15  148  
bbdf7b2a0b0e69 Igor Torrente    2022-09-05  149  	wb_frame_info->offset = fb->offsets[0];
bbdf7b2a0b0e69 Igor Torrente    2022-09-05  150  	wb_frame_info->pitch = fb->pitches[0];
bbdf7b2a0b0e69 Igor Torrente    2022-09-05  151  	wb_frame_info->cpp = fb->format->cpp[0];
6c494ca6fd820c Maíra Canal      2023-05-15  152  
d527102c7511ce Jim Shargo       2023-08-18  153  	crtc_state->wb_pending = true;
d527102c7511ce Jim Shargo       2023-08-18  154  	spin_unlock_irq(&vkms_crtc->composer_lock);
eca22edb37d29f Maxime Ripard    2020-11-18  155  	drm_writeback_queue_job(wb_conn, connector_state);
cc4fd2934d41a6 Maíra Canal      2023-05-09  156  	active_wb->pixel_write = get_pixel_write_function(wb_format);
bc0d7fdefec62e Igor Torrente    2022-09-05  157  	drm_rect_init(&wb_frame_info->src, 0, 0, crtc_width, crtc_height);
bc0d7fdefec62e Igor Torrente    2022-09-05  158  	drm_rect_init(&wb_frame_info->dst, 0, 0, crtc_width, crtc_height);
dbd9d80c1b2e03 Rodrigo Siqueira 2020-08-30  159  }
dbd9d80c1b2e03 Rodrigo Siqueira 2020-08-30  160  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
