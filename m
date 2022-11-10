Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E680D36E
	for <oe-kbuild@lists.linux.dev>; Thu, 10 Nov 2022 05:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668059532; x=1699595532;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZHgTcitK9MLGtybyIcuj+oFOxacEaL0NeA6XT5FCslc=;
  b=MayDDGQWIf8R2HpWCEYDw8wdYYbrmN+FFFa+Y2HHOVzufoxhu59/th11
   Zkl4LCMWK3X9Oz415wOUMHaIeIjbLfl9E/3jxQbEks8CMVUa8rBIVHF0P
   bTOCFAIHJk84D4OssoCpKx0jXF7PZxIoljC7VHNEDLJ8mJcAXvbZW7MTQ
   FpfpOQNvw/sHrqAVUu8UAxWOfUZfc9lNoNPOCA5k4FjpavvqkxG3YCz1l
   5YAeKcQ+pxakVHRuyz+VtJgl44c5eaZXSAGH+53MEAC/L+Y4TV2u7Nvjw
   CvuEPhF07/GslTJ5nfviIF7E+0M/Y0qecNcbt90sjYgWV9TW0H1ydJ7EO
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10526"; a="294564942"
X-IronPort-AV: E=Sophos;i="5.96,152,1665471600"; 
   d="scan'208";a="294564942"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2022 21:52:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10526"; a="882221811"
X-IronPort-AV: E=Sophos;i="5.96,152,1665471600"; 
   d="scan'208";a="882221811"
Received: from lkp-server01.sh.intel.com (HELO e783503266e8) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 09 Nov 2022 21:52:11 -0800
Received: from kbuild by e783503266e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ot0Ty-0002US-1Q;
	Thu, 10 Nov 2022 05:52:10 +0000
Date: Thu, 10 Nov 2022 13:51:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [drm:drm-next 741/803]
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.c: chid.h is included more
 than once.
Message-ID: <202211101350.LUO6xigl-lkp@intel.com>
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
CC: dri-devel@lists.freedesktop.org
TO: Ben Skeggs <bskeggs@redhat.com>
CC: Lyude Paul <lyude@redhat.com>

tree:   git://anongit.freedesktop.org/drm/drm drm-next
head:   a143bc517bf31c4575191efbaac216a11ec016e0
commit: 67059b9fb8997f3d4515d72052c331503b00274b [741/803] drm/nouveau/fifo: add chan start()/stop()
:::::: branch date: 28 hours ago
:::::: commit date: 29 hours ago
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

includecheck warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.c: chid.h is included more than once.

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
