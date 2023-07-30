Received: from mgamail.intel.com (unknown [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 076E8380
	for <oe-kbuild@lists.linux.dev>; Sun, 30 Jul 2023 02:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690682416; x=1722218416;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Wh4EtW8FbUswkU4BGipRtwSib+PHGMGJ6IyUfy6wc1E=;
  b=XsdvSO1PGl3F/HOMX+Fi3foHk4iud7cawZppf2LUT1hvuU320/iJScAc
   j7luaZZNNyReX2DswV7OykE7LbCCREKJtVo+Qv0Jjjb5uAFhqU5t/xoVM
   hOHb2gfzXKXZ87cQSP2GUAEO+LiTNpv7BExx3meB89SfmaJKRzu/Y3SS9
   sIBedpz0WxN/6z5nT5g2wqgLyO4eW/P9z44IdVEN1uSL3QdNHVTy7aC3u
   +ntqfyYZRNDf7u3Hk11YBavY7ceL8Bc4HGedj52vN49c9VfwxbNewlUb6
   eeOQ35blOdHIhmCk6fTNYE6GclDDGvexqnQIfq/lQEVQuw5jBrmEw8nvV
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10786"; a="455166308"
X-IronPort-AV: E=Sophos;i="6.01,240,1684825200"; 
   d="scan'208";a="455166308"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2023 19:00:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10786"; a="721659222"
X-IronPort-AV: E=Sophos;i="6.01,240,1684825200"; 
   d="scan'208";a="721659222"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 29 Jul 2023 19:00:14 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qPvjC-0004NZ-0e;
	Sun, 30 Jul 2023 02:00:14 +0000
Date: Sun, 30 Jul 2023 09:59:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH next resend 5/5] minmax: Relax check to allow comparison
 between int and small unsigned constants.
Message-ID: <202307300944.zJptaW4B-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: drivers/gpu/drm/amd/amdgpu/amdgpu_pll.c:97:20: sparse: sparse: too long token expansion"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <48c2cd0407f14859919d4fcbe526234a@AcuMS.aculab.com>
References: <48c2cd0407f14859919d4fcbe526234a@AcuMS.aculab.com>
TO: David Laight <David.Laight@ACULAB.COM>
TO: "'linux-kernel@vger.kernel.org'" <linux-kernel@vger.kernel.org>
TO: "'Andy Shevchenko'" <andriy.shevchenko@linux.intel.com>
TO: "'Andrew Morton'" <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: "'Matthew Wilcox (Oracle)'" <willy@infradead.org>
TO: "'Christoph Hellwig'" <hch@infradead.org>
TO: "'Jason A. Donenfeld'" <Jason@zx2c4.com>

Hi David,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on linus/master]
[cannot apply to next-20230725]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Laight/minmax-Allow-min-max-clamp-if-the-arguments-have-the-same-signedness/20230725-204940
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/48c2cd0407f14859919d4fcbe526234a%40AcuMS.aculab.com
patch subject: [PATCH next resend 5/5] minmax: Relax check to allow comparison between int and small unsigned constants.
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: s390-randconfig-r071-20230730 (https://download.01.org/0day-ci/archive/20230730/202307300944.zJptaW4B-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230730/202307300944.zJptaW4B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202307300944.zJptaW4B-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/amd/amdgpu/amdgpu_pll.c:97:20: sparse: sparse: too long token expansion
>> drivers/gpu/drm/amd/amdgpu/amdgpu_pll.c:97:20: sparse: sparse: too long token expansion
   drivers/gpu/drm/amd/amdgpu/amdgpu_pll.c: note: in included file (through include/drm/drm_plane.h, include/drm/drm_crtc.h, drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h, ...):
   include/drm/drm_color_mgmt.h:52:16: sparse: sparse: bad integer constant expression
   include/drm/drm_color_mgmt.h:52:16: sparse: sparse: static assertion failed: "clamp() low limit (typeof(val))(0) greater than high limit (typeof(val))(max)"
   drivers/gpu/drm/amd/amdgpu/amdgpu_pll.c: note: in included file (through drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h, drivers/gpu/drm/amd/amdgpu/amdgpu.h):
   drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:315:49: sparse: sparse: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
   drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:319:49: sparse: sparse: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"

vim +97 drivers/gpu/drm/amd/amdgpu/amdgpu_pll.c

7301757ea1fbea Shashank Sharma 2021-08-20   89  
d38ceaf99ed015 Alex Deucher    2015-04-20   90  	/* limit reference * post divider to a maximum */
7301757ea1fbea Shashank Sharma 2021-08-20   91  	if (adev->family == AMDGPU_FAMILY_SI)
7301757ea1fbea Shashank Sharma 2021-08-20   92  		ref_div_max = min(100 / post_div, ref_div_max);
7301757ea1fbea Shashank Sharma 2021-08-20   93  	else
d38ceaf99ed015 Alex Deucher    2015-04-20   94  		ref_div_max = min(128 / post_div, ref_div_max);
d38ceaf99ed015 Alex Deucher    2015-04-20   95  
d38ceaf99ed015 Alex Deucher    2015-04-20   96  	/* get matching reference and feedback divider */
d38ceaf99ed015 Alex Deucher    2015-04-20  @97  	*ref_div = min(max(DIV_ROUND_CLOSEST(den, post_div), 1u), ref_div_max);
d38ceaf99ed015 Alex Deucher    2015-04-20   98  	*fb_div = DIV_ROUND_CLOSEST(nom * *ref_div * post_div, den);
d38ceaf99ed015 Alex Deucher    2015-04-20   99  
d38ceaf99ed015 Alex Deucher    2015-04-20  100  	/* limit fb divider to its maximum */
d38ceaf99ed015 Alex Deucher    2015-04-20  101  	if (*fb_div > fb_div_max) {
d38ceaf99ed015 Alex Deucher    2015-04-20  102  		*ref_div = DIV_ROUND_CLOSEST(*ref_div * fb_div_max, *fb_div);
d38ceaf99ed015 Alex Deucher    2015-04-20  103  		*fb_div = fb_div_max;
d38ceaf99ed015 Alex Deucher    2015-04-20  104  	}
d38ceaf99ed015 Alex Deucher    2015-04-20  105  }
d38ceaf99ed015 Alex Deucher    2015-04-20  106  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
