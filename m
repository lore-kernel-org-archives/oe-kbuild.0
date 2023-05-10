Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F2D3D60
	for <oe-kbuild@lists.linux.dev>; Wed, 10 May 2023 17:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683741222; x=1715277222;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=n3qdUwe9OCrB+EbhkL6vZ+tF16vzu9Ia6OspB7DeyuU=;
  b=cAsrgd0FPWmwQnjg+87q+KGq/EqHHmTLsCdSUru4G0kO7B5aCV6mhP1t
   cqX9ToYnW5RFgGYxJbBZbtQp+AUCaBs4ExMgUEXcQXo0m0vzgI+gvSZg0
   v+SilNDOXt/kwP2Q0Pu364GRcLgPR3mMRWMjvz5MClIaCqZYfdOJ5Bukb
   LwNFquafGcS++0I4LvGek3Ks1y4k+2sJ3xB3WtpCd8W+KDKJ9iEdI8CaB
   f2eNzjhBv3chetG8Zx8E0FL949Ox//m7IN8wc6hFX2hUXEiHxe8rcnQiu
   GkEvOP55NpfnNU9GN8vkZ7fAPtbIUoRQmlRoNVXq9flELnsHZwcH3o8jq
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="352472915"
X-IronPort-AV: E=Sophos;i="5.99,265,1677571200"; 
   d="scan'208";a="352472915"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2023 10:53:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="730025415"
X-IronPort-AV: E=Sophos;i="5.99,265,1677571200"; 
   d="scan'208";a="730025415"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 10 May 2023 10:53:41 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pwo0S-0003Tw-2S;
	Wed, 10 May 2023 17:53:40 +0000
Date: Thu, 11 May 2023 01:53:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [chrome-os:chromeos-6.1 143/178]
 drivers/gpu/drm/evdi/evdi_drm_drv.h: drm/drm_framebuffer.h is included more
 than once.
Message-ID: <202305110112.95KTySvg-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com
TO: Guenter Roeck <groeck@google.com>

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   37520013015c5abd86224a7a19588e6cbea39072
commit: 4c84ca78d36c41b436f7586426a05ae274ad7e53 [143/178] CHROMIUM: drm/evdi: Port evdi from github.com/DisplayLink/evdi.git
:::::: branch date: 20 hours ago
:::::: commit date: 2 days ago
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202305110112.95KTySvg-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/evdi/evdi_drm_drv.h: drm/drm_framebuffer.h is included more than once.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
