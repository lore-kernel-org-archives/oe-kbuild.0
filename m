Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E5CA1C11
	for <oe-kbuild@lists.linux.dev>; Sun, 12 Feb 2023 13:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676208286; x=1707744286;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=313yl8oTZjr4+qfeOk8JsPFK2wwgmg7T8Bq5G4bjdp4=;
  b=ACgAFpr/V2CGUZ2Vw41zzC/ba+F1t7tlk+fsn0SJ1B7JKCAV19isGmSL
   UWashjkIYMsQSUEfMFGARN4ruAZAz9twZx9L3jqlxYeLxrhvvAuqAyNx1
   +8tuYhyhHA+lLoW4W0JBrfDC/KJD3hQSD+9I8dVc1dvtIZV7Qhip0IC2p
   kOqW8Ul6T1ZoUsheLEehFnfW+hU+5W2VeVknv/6FtlwauiCXvHUlTQr0R
   dWANOLQ/oiRxY2d44KxGrn0SSsmgTm0c4uKV/POChI2pwcHDgFYbB1ceS
   jKUMOIVSBulduryIn8F8aTcwG2nNw6On+/YxRRDGC6XN2yGJfepN2ZuhB
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10618"; a="393116832"
X-IronPort-AV: E=Sophos;i="5.97,291,1669104000"; 
   d="scan'208";a="393116832"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2023 05:24:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10618"; a="737222974"
X-IronPort-AV: E=Sophos;i="5.97,291,1669104000"; 
   d="scan'208";a="737222974"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 12 Feb 2023 05:24:44 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pRCLU-0007Dx-0E;
	Sun, 12 Feb 2023 13:24:44 +0000
Date: Sun, 12 Feb 2023 21:23:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v5 2/2] drm/imx/lcdc: Implement DRM driver for imx25
Message-ID: <202302122146.3fEMhin0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20230210180014.173379-3-u.kleine-koenig@pengutronix.de>
References: <20230210180014.173379-3-u.kleine-koenig@pengutronix.de>
TO: "Uwe Kleine-König" <u.kleine-koenig@pengutronix.de>
TO: David Airlie <airlied@gmail.com>
TO: Daniel Vetter <daniel@ffwll.ch>
TO: Shawn Guo <shawnguo@kernel.org>
TO: Sascha Hauer <s.hauer@pengutronix.de>
TO: Philipp Zabel <p.zabel@pengutronix.de>
TO: Sam Ravnborg <sam@ravnborg.org>
TO: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
TO: Danilo Krummrich <dakr@redhat.com>
TO: Liu Ying <victor.liu@nxp.com>
CC: linux-arm-kernel@lists.infradead.org
CC: dri-devel@lists.freedesktop.org
CC: NXP Linux Team <linux-imx@nxp.com>
CC: Pengutronix Kernel Team <kernel@pengutronix.de>

Hi Uwe,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on 2591939e881cf728b6ac45971eeec2f58051c101]

url:    https://github.com/intel-lab-lkp/linux/commits/Uwe-Kleine-K-nig/dt-bindings-display-imx-Describe-drm-binding-for-fsl-imx-lcdc/20230211-020147
base:   2591939e881cf728b6ac45971eeec2f58051c101
patch link:    https://lore.kernel.org/r/20230210180014.173379-3-u.kleine-koenig%40pengutronix.de
patch subject: [PATCH v5 2/2] drm/imx/lcdc: Implement DRM driver for imx25
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202302122146.3fEMhin0-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/imx/lcdc/imx-lcdc.c: drm/drm_fourcc.h is included more than once.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
