Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB851EA1
	for <oe-kbuild@lists.linux.dev>; Thu, 29 Dec 2022 03:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672283984; x=1703819984;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1oFHs/dXjcUV8NNP5GXFOcfLq0Ksu2w3LHaPNB/Syuk=;
  b=ZiuIrFM2QxMshXgwEV3370CCOPJ6nsIhjHpDi/f/oY5LtWk2MfB5N6d2
   yHrSrGfCVuPfvJEWxwnKRvCwUN/BtZSuHfmCY6aXnmjXAGhgZNu14pTGu
   5n7VnE2GGpAnVtmjNFabN38gtY3QVKKgxBHxokD0anQe817Wo1hzgX7+h
   yjJtzGKsfuYluSPy3WbehcK47nn3PZ0uHMYcB5yXEH8WPQc0nM35ki7OK
   536bLY9SQnYiBdT7+IrN04z99bUSwzJPe5fTOHbZXKk3PBC2oM2WdSWqK
   q51U7s/jH03AaExSwjs4DhPaTpfuDGSTJsFt2j/9sr53SGCbphgAvYTfo
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10574"; a="319687645"
X-IronPort-AV: E=Sophos;i="5.96,282,1665471600"; 
   d="scan'208";a="319687645"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2022 19:19:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10574"; a="655477009"
X-IronPort-AV: E=Sophos;i="5.96,282,1665471600"; 
   d="scan'208";a="655477009"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 28 Dec 2022 19:19:42 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pAjSH-000GE3-1M;
	Thu, 29 Dec 2022 03:19:41 +0000
Date: Thu, 29 Dec 2022 11:18:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [Intel-gfx] [PATCH 3/3] drm/i915: allow running mock selftests
 via Kunit
Message-ID: <202212291126.uYIOGayj-lkp@intel.com>
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
In-Reply-To: <b8d4438af835b522297e6672370b6666857072f6.1669897668.git.mchehab@kernel.org>
References: <b8d4438af835b522297e6672370b6666857072f6.1669897668.git.mchehab@kernel.org>
TO: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media@vger.kernel.org
CC: intel-gfx@lists.freedesktop.org
CC: linux-kernel@vger.kernel.org
CC: dri-devel@lists.freedesktop.org
CC: Daniel Vetter <daniel@ffwll.ch>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media@vger.kernel.org
CC: David Airlie <airlied@gmail.com>

Hi Mauro,

I love your patch! Perhaps something to improve:

[auto build test WARNING on drm-intel/for-linux-next]
[also build test WARNING on drm-intel/for-linux-next-fixes drm-tip/drm-tip drm/drm-next drm-misc/drm-misc-next linus/master v6.2-rc1 next-20221226]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mauro-Carvalho-Chehab/Add-KUnit-support-for-i915-mock-selftests/20221201-203541
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
patch link:    https://lore.kernel.org/r/b8d4438af835b522297e6672370b6666857072f6.1669897668.git.mchehab%40kernel.org
patch subject: [Intel-gfx] [PATCH 3/3] drm/i915: allow running mock selftests via Kunit
:::::: branch date: 4 weeks ago
:::::: commit date: 4 weeks ago
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

includecheck warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/i915/selftests/i915_kunit.c: i915_mock_selftests.h is included more than once.

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
