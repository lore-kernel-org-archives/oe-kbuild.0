Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF89010FF
	for <oe-kbuild@lists.linux.dev>; Tue,  8 Aug 2023 22:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691532040; x=1723068040;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WY+TgikbONpSUb5iLDiygG+XwaANd5ertMICugYx1FU=;
  b=TIgVzDrZCZC5uydA3ECZN5iJBKEDoUK0j7J7QH1pLQXL74zrg+Hg1x62
   iKvej0nh+kbYBd6IY2+B6JMlHnb3+QrD/I7vMOdxgXr858Dao92qE4Lms
   AcnG3GtJizS37NyzxFzoFOv/m2ht5CW1L5twU0eYIVS79C+kCg9cG0T7E
   32g8xwoU50e5yyaGSJz9YGw+TBVOsOYIo7trjrenbVMsTL4UDbgNA/VdE
   C/ks+fq+FgkeB5aG+xfZGqUHR8kjzfIkrGP/cd3esmBfOmCitteF2sPYY
   fEulbxnCzeZLaYN+tJyr14QOf8RF01Evr4Di63rfv0+RYHXLmn2qUf3o+
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="361084153"
X-IronPort-AV: E=Sophos;i="6.01,157,1684825200"; 
   d="scan'208";a="361084153"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2023 14:59:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="766562883"
X-IronPort-AV: E=Sophos;i="6.01,157,1684825200"; 
   d="scan'208";a="766562883"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 08 Aug 2023 14:59:15 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qTUjT-0005e4-0c;
	Tue, 08 Aug 2023 21:59:15 +0000
Date: Wed, 9 Aug 2023 05:58:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v3 1/3] drm/display: add transparent bridge helper
Message-ID: <202308090559.RMlH2Dl6-lkp@intel.com>
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
In-Reply-To: <20230802011845.4176631-2-dmitry.baryshkov@linaro.org>
References: <20230802011845.4176631-2-dmitry.baryshkov@linaro.org>
TO: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
TO: David Airlie <airlied@gmail.com>
TO: Daniel Vetter <daniel@ffwll.ch>
TO: Andy Gross <agross@kernel.org>
TO: Bjorn Andersson <andersson@kernel.org>
TO: Konrad Dybcio <konrad.dybcio@linaro.org>
TO: Vinod Koul <vkoul@kernel.org>
TO: Kishon Vijay Abraham I <kishon@kernel.org>
TO: Heikki Krogerus <heikki.krogerus@linux.intel.com>
TO: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
TO: Neil Armstrong <neil.armstrong@linaro.org>
CC: linux-phy@lists.infradead.org
CC: linux-arm-msm@vger.kernel.org
CC: linux-usb@vger.kernel.org
CC: freedreno@lists.freedesktop.org
CC: dri-devel@lists.freedesktop.org

Hi Dmitry,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on usb/usb-testing usb/usb-next usb/usb-linus drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.5-rc5 next-20230808]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dmitry-Baryshkov/drm-display-add-transparent-bridge-helper/20230802-091932
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230802011845.4176631-2-dmitry.baryshkov%40linaro.org
patch subject: [PATCH v3 1/3] drm/display: add transparent bridge helper
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: x86_64-randconfig-m001-20230808 (https://download.01.org/0day-ci/archive/20230809/202308090559.RMlH2Dl6-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230809/202308090559.RMlH2Dl6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202308090559.RMlH2Dl6-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/display/drm_simple_bridge.c:41 drm_simple_bridge_register() warn: possible memory leak of 'adev'

vim +/adev +41 drivers/gpu/drm/display/drm_simple_bridge.c

abf701043719cd Dmitry Baryshkov 2023-08-02  29  
abf701043719cd Dmitry Baryshkov 2023-08-02  30  int drm_simple_bridge_register(struct device *parent)
abf701043719cd Dmitry Baryshkov 2023-08-02  31  {
abf701043719cd Dmitry Baryshkov 2023-08-02  32  	struct auxiliary_device *adev;
abf701043719cd Dmitry Baryshkov 2023-08-02  33  	int ret;
abf701043719cd Dmitry Baryshkov 2023-08-02  34  
abf701043719cd Dmitry Baryshkov 2023-08-02  35  	adev = kzalloc(sizeof(*adev), GFP_KERNEL);
abf701043719cd Dmitry Baryshkov 2023-08-02  36  	if (!adev)
abf701043719cd Dmitry Baryshkov 2023-08-02  37  		return -ENOMEM;
abf701043719cd Dmitry Baryshkov 2023-08-02  38  
abf701043719cd Dmitry Baryshkov 2023-08-02  39  	ret = ida_alloc(&simple_bridge_ida, GFP_KERNEL);
abf701043719cd Dmitry Baryshkov 2023-08-02  40  	if (ret < 0)
abf701043719cd Dmitry Baryshkov 2023-08-02 @41  		return ret;
abf701043719cd Dmitry Baryshkov 2023-08-02  42  
abf701043719cd Dmitry Baryshkov 2023-08-02  43  	adev->id = ret;
abf701043719cd Dmitry Baryshkov 2023-08-02  44  	adev->name = "simple_bridge";
abf701043719cd Dmitry Baryshkov 2023-08-02  45  	adev->dev.parent = parent;
abf701043719cd Dmitry Baryshkov 2023-08-02  46  	adev->dev.of_node = parent->of_node;
abf701043719cd Dmitry Baryshkov 2023-08-02  47  	adev->dev.release = drm_simple_bridge_release;
abf701043719cd Dmitry Baryshkov 2023-08-02  48  
abf701043719cd Dmitry Baryshkov 2023-08-02  49  	ret = auxiliary_device_init(adev);
abf701043719cd Dmitry Baryshkov 2023-08-02  50  	if (ret) {
abf701043719cd Dmitry Baryshkov 2023-08-02  51  		kfree(adev);
abf701043719cd Dmitry Baryshkov 2023-08-02  52  		return ret;
abf701043719cd Dmitry Baryshkov 2023-08-02  53  	}
abf701043719cd Dmitry Baryshkov 2023-08-02  54  
abf701043719cd Dmitry Baryshkov 2023-08-02  55  	ret = auxiliary_device_add(adev);
abf701043719cd Dmitry Baryshkov 2023-08-02  56  	if (ret) {
abf701043719cd Dmitry Baryshkov 2023-08-02  57  		auxiliary_device_uninit(adev);
abf701043719cd Dmitry Baryshkov 2023-08-02  58  		return ret;
abf701043719cd Dmitry Baryshkov 2023-08-02  59  	}
abf701043719cd Dmitry Baryshkov 2023-08-02  60  
abf701043719cd Dmitry Baryshkov 2023-08-02  61  	return devm_add_action_or_reset(parent, drm_simple_bridge_unregister_adev, adev);
abf701043719cd Dmitry Baryshkov 2023-08-02  62  }
abf701043719cd Dmitry Baryshkov 2023-08-02  63  EXPORT_SYMBOL_GPL(drm_simple_bridge_register);
abf701043719cd Dmitry Baryshkov 2023-08-02  64  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
