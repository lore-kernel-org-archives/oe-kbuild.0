Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89AF23D60
	for <oe-kbuild@lists.linux.dev>; Sun,  5 Mar 2023 22:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678055871; x=1709591871;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+f6ZSFpJFZemH3MmI3nP2VJTsJxfhcAUiE7oo52wvB0=;
  b=NyRaaGZDo7SnVrguib1dtJOXJ8Gb0OO1hcYUBXMLnQoeyZHYHlYHdYuW
   U6nWwf+KGmIfzQRzywB2mlWX7+MK+Hzu5NoKJeBfP5fXXL6OQmko68C/F
   s/KV510HdvvnIkYRTr5fa9EjavORXdmTa/OpNqlAQ4lPr+teMri01sswr
   qmvQQqll3LhCZe4bqF7+yv+WckVrtj9OuohzuZAWvNbZZpUYJHMcke3av
   RZXQdkW6XYskZ2F489Qwaxa74IDiB6iXScrxnZXuskfGS6EOGnzCmTQnQ
   8C6wFSwwi1M0xsO0+daySxTRq/zxZGOLaO2G7947ExE6lB3sP2G7NAxA/
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10640"; a="337747912"
X-IronPort-AV: E=Sophos;i="5.98,236,1673942400"; 
   d="scan'208";a="337747912"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2023 14:37:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10640"; a="819104267"
X-IronPort-AV: E=Sophos;i="5.98,236,1673942400"; 
   d="scan'208";a="819104267"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 05 Mar 2023 14:37:47 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pYwzD-00037x-0L;
	Sun, 05 Mar 2023 22:37:47 +0000
Date: Mon, 6 Mar 2023 06:37:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>,
	Elena Reshetova <elena.reshetova@intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/mtl: Extend Wa_14017073508 in
 suspend/resume flow
Message-ID: <202303060604.JmbyHTX7-lkp@intel.com>
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
In-Reply-To: <20230304161749.1420224-1-badal.nilawar@intel.com>
References: <20230304161749.1420224-1-badal.nilawar@intel.com>
TO: Badal Nilawar <badal.nilawar@intel.com>
TO: intel-gfx@lists.freedesktop.org
CC: rodrigo.vivi@intel.com

Hi Badal,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm-tip/drm-tip]

url:    https://github.com/intel-lab-lkp/linux/commits/Badal-Nilawar/drm-i915-mtl-Extend-Wa_14017073508-in-suspend-resume-flow/20230305-001604
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
patch link:    https://lore.kernel.org/r/20230304161749.1420224-1-badal.nilawar%40intel.com
patch subject: [Intel-gfx] [PATCH] drm/i915/mtl: Extend Wa_14017073508 in suspend/resume flow
:::::: branch date: 30 hours ago
:::::: commit date: 30 hours ago
config: x86_64-randconfig-c002 (https://download.01.org/0day-ci/archive/20230306/202303060604.JmbyHTX7-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Link: https://lore.kernel.org/r/202303060604.JmbyHTX7-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/i915/gt/intel_gt_pm.c:49:50-51: atomic_add_unless

vim +49 drivers/gpu/drm/i915/gt/intel_gt_pm.c

8f70f1ec587da0 Badal Nilawar 2022-11-04  42  
e49da7f17006c4 Badal Nilawar 2023-03-04  43  void mtl_media_idle(struct intel_gt *gt)
8f70f1ec587da0 Badal Nilawar 2022-11-04  44  {
8f70f1ec587da0 Badal Nilawar 2022-11-04  45  	/* Wa_14017073508: mtl */
e49da7f17006c4 Badal Nilawar 2023-03-04  46  	if (gt && IS_MTL_GRAPHICS_STEP(gt->i915, P, STEP_A0, STEP_B0) &&
e49da7f17006c4 Badal Nilawar 2023-03-04  47  	    gt->type == GT_MEDIA) {
e49da7f17006c4 Badal Nilawar 2023-03-04  48  		WARN_ON(atomic_read(&gt->media_wakeref) <= 0);
e49da7f17006c4 Badal Nilawar 2023-03-04 @49  		if (!atomic_add_unless(&gt->media_wakeref, -1, 1)) {
e49da7f17006c4 Badal Nilawar 2023-03-04  50  			drm_err(&gt->i915->drm, "Media idle\n");
8f70f1ec587da0 Badal Nilawar 2022-11-04  51  			snb_pcode_write_p(gt->uncore, PCODE_MBOX_GT_STATE,
8f70f1ec587da0 Badal Nilawar 2022-11-04  52  					  PCODE_MBOX_GT_STATE_MEDIA_NOT_BUSY,
8f70f1ec587da0 Badal Nilawar 2022-11-04  53  					  PCODE_MBOX_GT_STATE_DOMAIN_MEDIA, 0);
e49da7f17006c4 Badal Nilawar 2023-03-04  54  			atomic_dec(&gt->media_wakeref);
e49da7f17006c4 Badal Nilawar 2023-03-04  55  		}
e49da7f17006c4 Badal Nilawar 2023-03-04  56  	}
8f70f1ec587da0 Badal Nilawar 2022-11-04  57  }
8f70f1ec587da0 Badal Nilawar 2022-11-04  58  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
