Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0A603AA87
	for <oe-kbuild@lists.linux.dev>; Thu, 22 Jun 2023 22:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687474370; x=1719010370;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RufNPBWEnWM7gTmoPBNtThVHNWk3URL6dm5748kRvyk=;
  b=VFDxZXzlfDPHkfuXj9lnC8/kVh7KtW6y8zBQKKbvndB+mxi+GmF7HYXL
   F3wpLAbD7K7L4zzOYbVP/24zxy4rppD/spI07nSOngZK9lWsfMZphfzSd
   mOUGrzvkIxFI0ZYMk8SDahg5KVSvD83R4/+RYv2tszfIap+CzNj/V7RM3
   j26cwAkdx1ycnm0F+b5l57mX0Aw0meVq6mieVXWNMsmny8ACfx0JCSyvJ
   9c+n8zZ+0una9KpTJvyeevqWSYVIjA+TpxTT1bNU0nzgUTudhXPRxOeAh
   gB0xH7TjdIWxL1J1KmbXgV5+22i4D4S2yRtMc5edYT89UFG2lr9YWEYkI
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="359499089"
X-IronPort-AV: E=Sophos;i="6.01,150,1684825200"; 
   d="scan'208";a="359499089"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2023 15:52:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="859637142"
X-IronPort-AV: E=Sophos;i="6.01,150,1684825200"; 
   d="scan'208";a="859637142"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 22 Jun 2023 15:52:48 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qCTAV-0007nl-1R;
	Thu, 22 Jun 2023 22:52:47 +0000
Date: Fri, 23 Jun 2023 06:52:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v7 4/4] fpga: add configuration for the FPGA KUnit test
 suites.
Message-ID: <202306230622.rXcGUvBj-lkp@intel.com>
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
In-Reply-To: <20230616154405.220502-5-marpagan@redhat.com>
References: <20230616154405.220502-5-marpagan@redhat.com>
TO: Marco Pagani <marpagan@redhat.com>
TO: Moritz Fischer <mdf@kernel.org>
TO: Wu Hao <hao.wu@intel.com>
TO: Xu Yilun <yilun.xu@intel.com>
TO: Tom Rix <trix@redhat.com>
CC: Marco Pagani <marpagan@redhat.com>
CC: linux-kernel@vger.kernel.org
CC: linux-fpga@vger.kernel.org

Hi Marco,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 858fd168a95c5b9669aac8db6c14a9aeab446375]

url:    https://github.com/intel-lab-lkp/linux/commits/Marco-Pagani/fpga-add-an-initial-KUnit-suite-for-the-FPGA-Manager/20230616-234637
base:   858fd168a95c5b9669aac8db6c14a9aeab446375
patch link:    https://lore.kernel.org/r/20230616154405.220502-5-marpagan%40redhat.com
patch subject: [PATCH v7 4/4] fpga: add configuration for the FPGA KUnit test suites.
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: openrisc-randconfig-m041-20230622 (https://download.01.org/0day-ci/archive/20230623/202306230622.rXcGUvBj-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230623/202306230622.rXcGUvBj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202306230622.rXcGUvBj-lkp@intel.com/

smatch warnings:
drivers/fpga/tests/fpga-bridge-test.c:81 fpga_bridge_test_get() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +81 drivers/fpga/tests/fpga-bridge-test.c

fe7bbf0985e0f2 Marco Pagani 2023-06-16  71  
fe7bbf0985e0f2 Marco Pagani 2023-06-16  72  static void fpga_bridge_test_get(struct kunit *test)
fe7bbf0985e0f2 Marco Pagani 2023-06-16  73  {
fe7bbf0985e0f2 Marco Pagani 2023-06-16  74  	struct bridge_ctx *ctx = test->priv;
fe7bbf0985e0f2 Marco Pagani 2023-06-16  75  	struct fpga_bridge *bridge;
fe7bbf0985e0f2 Marco Pagani 2023-06-16  76  
fe7bbf0985e0f2 Marco Pagani 2023-06-16  77  	bridge = fpga_bridge_get(&ctx->pdev->dev, NULL);
fe7bbf0985e0f2 Marco Pagani 2023-06-16  78  	KUNIT_EXPECT_PTR_EQ(test, bridge, ctx->bridge);
fe7bbf0985e0f2 Marco Pagani 2023-06-16  79  
fe7bbf0985e0f2 Marco Pagani 2023-06-16  80  	bridge = fpga_bridge_get(&ctx->pdev->dev, NULL);
fe7bbf0985e0f2 Marco Pagani 2023-06-16 @81  	KUNIT_EXPECT_EQ(test, PTR_ERR(bridge), -EBUSY);
fe7bbf0985e0f2 Marco Pagani 2023-06-16  82  
fe7bbf0985e0f2 Marco Pagani 2023-06-16  83  	fpga_bridge_put(ctx->bridge);
fe7bbf0985e0f2 Marco Pagani 2023-06-16  84  }
fe7bbf0985e0f2 Marco Pagani 2023-06-16  85  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
