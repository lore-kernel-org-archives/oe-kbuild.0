Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83C1420FE
	for <oe-kbuild@lists.linux.dev>; Mon,  7 Aug 2023 16:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691425986; x=1722961986;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=HSSbVrvfWsy4YWN9CGP4bP24o65dQtKhL1WeTqVtJr8=;
  b=CeTUQukY0fklRx0bb/1JBcK6YCHxJ1nWvbgTuXm9xX6iIgLZJ1EmpOSa
   exweuK1Sc17XYzr2ycsCdidNqeLt7kze1x7k3jv9kA0qHN+YlOuceOwEk
   B/C/X2x15imN6wtUMuVhTGe10GISUvs/Ei6EYTCQXRq0VNp9XW2MCrDfv
   ywojdiTJnYKoERVRo4PHyQIKgp5M2uA8BgtJrYY9sda/rKYmo4aLOt16D
   DOwa7m2VuoGkOzmzO/OwcRga4F9NxQOdmFeR/lFcK8nRYLTz/INm5jEt7
   HnJikBIbIdEpPaY6tQbAAG67dbQi5rHaoeqUMEQEN9taVc2JZvLI8dVIR
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="350896719"
X-IronPort-AV: E=Sophos;i="6.01,262,1684825200"; 
   d="scan'208";a="350896719"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2023 09:33:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="766052349"
X-IronPort-AV: E=Sophos;i="6.01,262,1684825200"; 
   d="scan'208";a="766052349"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 07 Aug 2023 09:33:03 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qT3AF-0004lj-00;
	Mon, 07 Aug 2023 16:33:03 +0000
Date: Tue, 8 Aug 2023 00:32:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 2/2] drm/exec: add test case for using a drm_exec
 multiple times
Message-ID: <202308080017.Zek8Gf7v-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20230731123625.3766-2-christian.koenig@amd.com>
References: <20230731123625.3766-2-christian.koenig@amd.com>
TO: "Christian König" <ckoenig.leichtzumerken@gmail.com>
TO: boris.brezillon@collabora.com
TO: ndesaulniers@google.com
TO: maarten.lankhorst@linux.intel.com
TO: mripard@kernel.org
TO: tzimmermann@suse.de
TO: airlied@gmail.com
TO: daniel@ffwll.ch
TO: trix@redhat.com
TO: dri-devel@lists.freedesktop.org
TO: linux-kernel@vger.kernel.org
TO: llvm@lists.linux.dev
TO: naresh.kamboju@linaro.org
TO: dakr@redhat.com

Hi Christian,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on next-20230807]
[cannot apply to linus/master v6.5-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-K-nig/drm-exec-add-test-case-for-using-a-drm_exec-multiple-times/20230731-203823
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230731123625.3766-2-christian.koenig%40amd.com
patch subject: [PATCH 2/2] drm/exec: add test case for using a drm_exec multiple times
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: parisc-randconfig-m041-20230807 (https://download.01.org/0day-ci/archive/20230808/202308080017.Zek8Gf7v-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230808/202308080017.Zek8Gf7v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202308080017.Zek8Gf7v-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/tests/drm_exec_test.c:146 test_multiple_loops() warn: ignoring unreachable code.

Old smatch warnings:
drivers/gpu/drm/tests/drm_exec_test.c:137 test_prepare_array() error: uninitialized symbol 'ret'.
drivers/gpu/drm/tests/drm_exec_test.c:153 test_multiple_loops() warn: ignoring unreachable code.

vim +146 drivers/gpu/drm/tests/drm_exec_test.c

9710631cc8f367 Christian König 2022-04-13  140  
6fa89ae7cfcd00 Christian König 2023-07-31  141  static void test_multiple_loops(struct kunit *test)
6fa89ae7cfcd00 Christian König 2023-07-31  142  {
6fa89ae7cfcd00 Christian König 2023-07-31  143  	struct drm_exec exec;
6fa89ae7cfcd00 Christian König 2023-07-31  144  
6fa89ae7cfcd00 Christian König 2023-07-31  145  	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT);
6fa89ae7cfcd00 Christian König 2023-07-31 @146  	drm_exec_until_all_locked(&exec)
6fa89ae7cfcd00 Christian König 2023-07-31  147  	{
6fa89ae7cfcd00 Christian König 2023-07-31  148  		break;
6fa89ae7cfcd00 Christian König 2023-07-31  149  	}
6fa89ae7cfcd00 Christian König 2023-07-31  150  	drm_exec_fini(&exec);
6fa89ae7cfcd00 Christian König 2023-07-31  151  
6fa89ae7cfcd00 Christian König 2023-07-31  152  	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT);
6fa89ae7cfcd00 Christian König 2023-07-31  153  	drm_exec_until_all_locked(&exec)
6fa89ae7cfcd00 Christian König 2023-07-31  154  	{
6fa89ae7cfcd00 Christian König 2023-07-31  155  		break;
6fa89ae7cfcd00 Christian König 2023-07-31  156  	}
6fa89ae7cfcd00 Christian König 2023-07-31  157  	drm_exec_fini(&exec);
6fa89ae7cfcd00 Christian König 2023-07-31  158  	KUNIT_SUCCEED(test);
6fa89ae7cfcd00 Christian König 2023-07-31  159  }
6fa89ae7cfcd00 Christian König 2023-07-31  160  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
