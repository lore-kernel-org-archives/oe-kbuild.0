Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06DED1871
	for <oe-kbuild@lists.linux.dev>; Wed, 30 Aug 2023 08:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693383121; x=1724919121;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DWsLH4RsEISG0qPxZle0FoOvPS3i3Y13Zym9zGnalr8=;
  b=a24MIhMHgPdeCs3STFLV/H25YykWKnfbDMdw76x7SfELclx6lJ7u1zBE
   Wwlr21pEam/yjmcxF+AGL3vj/svAwJ+noQoaViJ1dcC/fzQnw9eOSMm/G
   /GGWP1muK95u/IilnPd7c/SDGf4XAn9Z/n3M+McQ1TSvB1zKdYMuSOP2x
   Pykdl1Tp9aSGIk7qAExaSHPXqXpN6hYNsVmoKeSQMvzQeP5g1pKp9bKTj
   ywAXkwsgo/vdUYTlnuHOHx0IoaMVkstFKyRowdsAwTR1BD8i5g5FmezEO
   /eQZNR+bAdhP+Mo9CoXo6e1zEZfRN6aVPKxtBLnmH8Kv5zy49TteVRV0N
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="441941423"
X-IronPort-AV: E=Sophos;i="6.02,213,1688454000"; 
   d="scan'208";a="441941423"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2023 01:12:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="804429525"
X-IronPort-AV: E=Sophos;i="6.02,213,1688454000"; 
   d="scan'208";a="804429525"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 30 Aug 2023 01:12:00 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbGIx-0009bR-1Y;
	Wed, 30 Aug 2023 08:11:59 +0000
Date: Wed, 30 Aug 2023 16:11:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [RFC PATCH] drm/ssd130x: Allocate buffer in the CRTC's
 .atomic_check() callback
Message-ID: <202308301645.bMtYLYr9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "git am base is a link in commit message"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20230830062546.720679-1-javierm@redhat.com>
References: <20230830062546.720679-1-javierm@redhat.com>
TO: Javier Martinez Canillas <javierm@redhat.com>

Hi Javier,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on linux-next/master]
[cannot apply to linus/master v6.5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Javier-Martinez-Canillas/drm-ssd130x-Allocate-buffer-in-the-CRTC-s-atomic_check-callback/20230830-142757
base:   linux-next/master
patch link:    https://lore.kernel.org/r/20230830062546.720679-1-javierm%40redhat.com
patch subject: [RFC PATCH] drm/ssd130x: Allocate buffer in the CRTC's .atomic_check() callback
:::::: branch date: 2 hours ago
:::::: commit date: 2 hours ago
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230830/202308301645.bMtYLYr9-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230830/202308301645.bMtYLYr9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202308301645.bMtYLYr9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/solomon/ssd130x.c:774:5: warning: no previous prototype for 'ssd130x_crtc_helper_atomic_check' [-Wmissing-prototypes]
     774 | int ssd130x_crtc_helper_atomic_check(struct drm_crtc *crtc, struct drm_atomic_state *state)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/ssd130x_crtc_helper_atomic_check +774 drivers/gpu/drm/solomon/ssd130x.c

a61732e808672c Javier Martinez Canillas 2022-02-14  773  
61df7954abc151 Javier Martinez Canillas 2023-08-30 @774  int ssd130x_crtc_helper_atomic_check(struct drm_crtc *crtc, struct drm_atomic_state *state)
61df7954abc151 Javier Martinez Canillas 2023-08-30  775  {
61df7954abc151 Javier Martinez Canillas 2023-08-30  776  	struct drm_device *drm = crtc->dev;
61df7954abc151 Javier Martinez Canillas 2023-08-30  777  	struct ssd130x_device *ssd130x = drm_to_ssd130x(drm);
61df7954abc151 Javier Martinez Canillas 2023-08-30  778  	struct drm_plane *plane = crtc->primary;
61df7954abc151 Javier Martinez Canillas 2023-08-30  779  	struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(state, plane);
61df7954abc151 Javier Martinez Canillas 2023-08-30  780  	struct ssd130x_plane_state *ssd130x_state = to_ssd130x_plane_state(plane_state);
61df7954abc151 Javier Martinez Canillas 2023-08-30  781  	unsigned int page_height = ssd130x->device_info->page_height;
61df7954abc151 Javier Martinez Canillas 2023-08-30  782  	unsigned int pages = DIV_ROUND_UP(ssd130x->height, page_height);
61df7954abc151 Javier Martinez Canillas 2023-08-30  783  	const struct drm_format_info *fi;
61df7954abc151 Javier Martinez Canillas 2023-08-30  784  	unsigned int pitch;
61df7954abc151 Javier Martinez Canillas 2023-08-30  785  	int ret;
61df7954abc151 Javier Martinez Canillas 2023-08-30  786  
61df7954abc151 Javier Martinez Canillas 2023-08-30  787  	ret = drm_crtc_helper_atomic_check(crtc, state);
61df7954abc151 Javier Martinez Canillas 2023-08-30  788  	if (ret)
61df7954abc151 Javier Martinez Canillas 2023-08-30  789  		return ret;
61df7954abc151 Javier Martinez Canillas 2023-08-30  790  
61df7954abc151 Javier Martinez Canillas 2023-08-30  791  	ssd130x_state->data_array = kcalloc(ssd130x->width, pages, GFP_KERNEL);
61df7954abc151 Javier Martinez Canillas 2023-08-30  792  	if (!ssd130x_state->data_array)
61df7954abc151 Javier Martinez Canillas 2023-08-30  793  		return -ENOMEM;
61df7954abc151 Javier Martinez Canillas 2023-08-30  794  
61df7954abc151 Javier Martinez Canillas 2023-08-30  795  	if (plane_state->fb->format->format != DRM_FORMAT_R1) {
61df7954abc151 Javier Martinez Canillas 2023-08-30  796  		fi = drm_format_info(DRM_FORMAT_R1);
61df7954abc151 Javier Martinez Canillas 2023-08-30  797  		if (!fi)
61df7954abc151 Javier Martinez Canillas 2023-08-30  798  			return -EINVAL;
61df7954abc151 Javier Martinez Canillas 2023-08-30  799  
61df7954abc151 Javier Martinez Canillas 2023-08-30  800  		pitch = drm_format_info_min_pitch(fi, 0, ssd130x->width);
61df7954abc151 Javier Martinez Canillas 2023-08-30  801  
61df7954abc151 Javier Martinez Canillas 2023-08-30  802  		ssd130x_state->buffer = kcalloc(pitch, ssd130x->height, GFP_KERNEL);
61df7954abc151 Javier Martinez Canillas 2023-08-30  803  		if (!ssd130x_state->buffer) {
61df7954abc151 Javier Martinez Canillas 2023-08-30  804  			kfree(ssd130x_state->data_array);
61df7954abc151 Javier Martinez Canillas 2023-08-30  805  			/* Set to prevent a double free in .atomic_destroy_state() */
61df7954abc151 Javier Martinez Canillas 2023-08-30  806  			ssd130x_state->data_array = NULL;
61df7954abc151 Javier Martinez Canillas 2023-08-30  807  			return -ENOMEM;
61df7954abc151 Javier Martinez Canillas 2023-08-30  808  		}
61df7954abc151 Javier Martinez Canillas 2023-08-30  809  	}
61df7954abc151 Javier Martinez Canillas 2023-08-30  810  
61df7954abc151 Javier Martinez Canillas 2023-08-30  811  	return 0;
61df7954abc151 Javier Martinez Canillas 2023-08-30  812  }
61df7954abc151 Javier Martinez Canillas 2023-08-30  813  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
