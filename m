Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 185C56FA9
	for <oe-kbuild@lists.linux.dev>; Thu,  3 Nov 2022 10:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667473092; x=1699009092;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3dX6MBJGZJt334TvOyJ/IsNQ7iKzX8NYQgtmZKAKpc4=;
  b=fM7RmRs0aA0JTNMGzUqRqxpeezzbtXAN89nHKcDJkrc0AOQhxeTcAOdu
   vipEESq9/LyG2i2HrY8/fiURNWZHUMMdYZK0haA6krH7Njb23eGTfwxRe
   YMFbgZXz/mvrzjYCySdPAQdnr+F0RtoKXgPxy6yhQOmcpgf6I6ifAv2Fo
   TqlxLy42vNn2Fcu022OENmXBSjVoJfL+c1PslWW66z8sUmKaL1julSgmp
   DTxzWAU8LsP/U0Ey/yWHIXK/XiDNEZO9XbkTXybwxKEIlTD+3OKm9TSYo
   evb81lRy5FddHVs8U/aDk4pI1ltFZnLGXRLqyYAsSkUBy/y/vdUwsnNwX
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10519"; a="336342573"
X-IronPort-AV: E=Sophos;i="5.95,235,1661842800"; 
   d="scan'208";a="336342573"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2022 03:58:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10519"; a="667926855"
X-IronPort-AV: E=Sophos;i="5.95,235,1661842800"; 
   d="scan'208";a="667926855"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 03 Nov 2022 03:58:09 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oqXvF-000Fqv-0k;
	Thu, 03 Nov 2022 10:58:09 +0000
Date: Thu, 3 Nov 2022 18:57:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH RFC] drm/i915: allow running mock selftests via Kunit
Message-ID: <202211031839.wos38S1H-lkp@intel.com>
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
In-Reply-To: <e7ace6f673b10898c8b5401aaca466e8105cbc1c.1667320524.git.mchehab@kernel.org>
References: <e7ace6f673b10898c8b5401aaca466e8105cbc1c.1667320524.git.mchehab@kernel.org>
TO: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media@vger.kernel.org

Hi Mauro,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on v6.1-rc3]
[also build test WARNING on linus/master next-20221103]
[cannot apply to drm-intel/for-linux-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mauro-Carvalho-Chehab/drm-i915-allow-running-mock-selftests-via-Kunit/20221102-004441
patch link:    https://lore.kernel.org/r/e7ace6f673b10898c8b5401aaca466e8105cbc1c.1667320524.git.mchehab%40kernel.org
patch subject: [PATCH RFC] drm/i915: allow running mock selftests via Kunit
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

includecheck warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/i915/selftests/i915_kunit.c: i915_mock_selftests.h is included more than once.

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
