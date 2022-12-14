Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F13877F
	for <oe-kbuild@lists.linux.dev>; Wed, 14 Dec 2022 00:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670979198; x=1702515198;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jZFrfy4QEyuem9gQvRLtVTCEi8vyx0r1/Ykwtkw+n1I=;
  b=efzOzKJnYEOOvjAAtWeAo9lCQtsEWwVb0WokeDHyyM/i+fw0AbIgYPZS
   3C+ubCB1sWUX71LCM3y1BzwMkArS3EPrwlLGbnICOVPkkgKVr2iN5grKI
   l4F8C3UxIwkuYfF5EjoL2sJCEvnLiiztWnxYnrl7KsLksxuK5O1vmZQQd
   rkWRBNcFzJ72gvBrieSyB4BlhuCXqE+IMqsXlqWOH/eCYJdAIY8anx9zp
   3HpqS+3Z+czYRK3LUR5UuLJWWrYRNgM0HGUJ+aX8KcVQbFba9oVK2Lt74
   RC2i4kUr4XxuNA13B9eLM6uFgXn5oVtGYwQwQPlCsK+XPbPNDd94qeaee
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10560"; a="320142138"
X-IronPort-AV: E=Sophos;i="5.96,242,1665471600"; 
   d="scan'208";a="320142138"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2022 16:53:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10560"; a="648760362"
X-IronPort-AV: E=Sophos;i="5.96,242,1665471600"; 
   d="scan'208";a="648760362"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 13 Dec 2022 16:53:16 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1p5G1L-0004x5-35;
	Wed, 14 Dec 2022 00:53:15 +0000
Date: Wed, 14 Dec 2022 08:52:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH V6 2/5] ASoC: codecs: Implementation of aw883xx
 configuration file parsing function
Message-ID: <202212140806.TmBfM9g8-lkp@intel.com>
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
In-Reply-To: <20221208122313.55118-3-wangweidong.a@awinic.com>
References: <20221208122313.55118-3-wangweidong.a@awinic.com>
TO: wangweidong.a@awinic.com
TO: broonie@kernel.org
TO: perex@perex.cz
TO: alsa-devel@alsa-project.org
TO: tiwai@suse.com
TO: robh+dt@kernel.org
TO: krzysztof.kozlowski+dt@linaro.org
TO: ckeepax@opensource.cirrus.com
TO: tanureal@opensource.cirrus.com
TO: quic_potturu@quicinc.com
TO: pierre-louis.bossart@linux.intel.com
TO: cy_huang@richtek.com
CC: duanyibo@awinic.com
CC: Weidong Wang <wangweidong.a@awinic.com>
CC: zhaolei@awinic.com
CC: liweilei@awinic.com
CC: yijiangtao@awinic.com
CC: zhangjianming@awinic.com

Hi,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on 479174d402bcf60789106eedc4def3957c060bad]

url:    https://github.com/intel-lab-lkp/linux/commits/wangweidong-a-awinic-com/ASoC-codecs-Add-Awinic-AW883XX-audio-amplifier-driver/20221208-202807
base:   479174d402bcf60789106eedc4def3957c060bad
patch link:    https://lore.kernel.org/r/20221208122313.55118-3-wangweidong.a%40awinic.com
patch subject: [PATCH V6 2/5] ASoC: codecs: Implementation of aw883xx configuration file parsing function
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

includecheck warnings: (new ones prefixed by >>)
>> sound/soc/codecs/aw883xx/aw883xx_bin_parse.c: linux/module.h is included more than once.
>> sound/soc/codecs/aw883xx/aw883xx_bin_parse.c: linux/list.h is included more than once.
>> sound/soc/codecs/aw883xx/aw883xx_bin_parse.c: linux/slab.h is included more than once.
>> sound/soc/codecs/aw883xx/aw883xx_bin_parse.c: linux/device.h is included more than once.
>> sound/soc/codecs/aw883xx/aw883xx_bin_parse.c: linux/regmap.h is included more than once.

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
