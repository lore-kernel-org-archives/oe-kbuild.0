Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 585843208
	for <oe-kbuild@lists.linux.dev>; Wed, 14 Dec 2022 20:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1671048987; x=1702584987;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AzxJmSknbTz4AikvxBz91MJ3mqdNBMvPayvckfRPxcM=;
  b=Nrzmfa0I2JIp8+s+F9g7wZN6l2lImwnyJEwLWwzmmJFmurEDoDUTukkk
   XOStouQoKvRewmHpmS0DIz6WpxZ5JPAcTan0oRAnx+k9eNFnTdLU+c+Iu
   rZz7yoRar2U0BAMipGuFyXwt7TJpA8i0OFoBGz37qCS8p41/BWDBsZTvT
   mZfff2MuXwOLsIm+gTcWpAcwBnQp0+/ZlG3orH1g5ALxNMCrUY7utgnvv
   +fnJC8g1js/6Uyehq0gOMjGnj5e/ZJ4jmPZ3fASG0DWG2wNgnRQr0JT9b
   WKQ1kGxvmb2NMWzDGmwoCStinr6hgGdb0q94+g0m7cJf1nbx8lKHCNj8M
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10561"; a="318549157"
X-IronPort-AV: E=Sophos;i="5.96,245,1665471600"; 
   d="scan'208";a="318549157"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2022 12:16:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10561"; a="894451205"
X-IronPort-AV: E=Sophos;i="5.96,245,1665471600"; 
   d="scan'208";a="894451205"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 14 Dec 2022 12:16:25 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1p5YAz-0005m2-1A;
	Wed, 14 Dec 2022 20:16:25 +0000
Date: Thu, 15 Dec 2022 04:15:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [Intel-gfx] [PATCH v3 7/7] drm/i915/mtl: Add HDCP GSC interface
Message-ID: <202212150437.psXuPZMI-lkp@intel.com>
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
In-Reply-To: <20221214090758.3040356-8-suraj.kandpal@intel.com>
References: <20221214090758.3040356-8-suraj.kandpal@intel.com>
TO: Suraj Kandpal <suraj.kandpal@intel.com>
TO: intel-gfx@lists.freedesktop.org
CC: jani.nikula@intel.com
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: Tomas Winkler <tomas.winkler@intel.com>

Hi Suraj,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm-tip/drm-tip]

url:    https://github.com/intel-lab-lkp/linux/commits/Suraj-Kandpal/Enable-HDCP2-x-via-GSC-CS/20221214-171101
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
patch link:    https://lore.kernel.org/r/20221214090758.3040356-8-suraj.kandpal%40intel.com
patch subject: [Intel-gfx] [PATCH v3 7/7] drm/i915/mtl: Add HDCP GSC interface
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

includecheck warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/i915/display/intel_hdcp.c: intel_connector.h is included more than once.

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
