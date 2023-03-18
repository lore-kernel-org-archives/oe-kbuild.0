Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 251382F28
	for <oe-kbuild@lists.linux.dev>; Sat, 18 Mar 2023 16:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679157831; x=1710693831;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hRbzre6uChrGIb0TbAAYY2V1Kk5qySPVoih6AfPXDdg=;
  b=Q4EOUC3Soj4j7keygy1xM6eleHJV4rxVc2Q7YcyVtXMwcwjrP5TuZ1XI
   xYjl7IIIiLh8cIy9LPq51+3xgiATRKv1epVoZbHBEv09zzie68sAbghKS
   ISJP8BcE3Q+8+P8wKRPlzvNy6uEy5T6EX5X4rPvlNB7wFVc+eH2IjzLvm
   fZp89NDuXsFDh6ecL8W/NTR4vqnAd+BNdH+NZXsx8jE9AR5O5r/AreNPd
   I6L5kQuzoqLN/9WWDrEAqaVXxoSLfr2vtZmWHVR2d5Ga6p69ifp5nh9Jv
   pBucaLhP0AOb5taritF67jWSIrrxTbwEepevIbzeSp6kblwnuu7rUhsYM
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10653"; a="318847148"
X-IronPort-AV: E=Sophos;i="5.98,271,1673942400"; 
   d="scan'208";a="318847148"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2023 09:43:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10653"; a="749614599"
X-IronPort-AV: E=Sophos;i="5.98,271,1673942400"; 
   d="scan'208";a="749614599"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 18 Mar 2023 09:43:49 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pdZen-000AAI-03;
	Sat, 18 Mar 2023 16:43:49 +0000
Date: Sun, 19 Mar 2023 00:42:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [Intel-gfx] [PATCH 1/4] drm/i915/mtl: Squashed Phy Support
Message-ID: <202303190009.oi4k4EK9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20230318005852.2303937-2-radhakrishna.sripada@intel.com>
References: <20230318005852.2303937-2-radhakrishna.sripada@intel.com>
TO: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
TO: intel-gfx@lists.freedesktop.org

Hi Radhakrishna,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm-tip/drm-tip]

url:    https://github.com/intel-lab-lkp/linux/commits/Radhakrishna-Sripada/drm-i915-mtl-Squashed-Phy-Support/20230318-090025
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
patch link:    https://lore.kernel.org/r/20230318005852.2303937-2-radhakrishna.sripada%40intel.com
patch subject: [Intel-gfx] [PATCH 1/4] drm/i915/mtl: Squashed Phy Support
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303190009.oi4k4EK9-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/i915/display/intel_cx0_phy.c: intel_tc.h is included more than once.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
