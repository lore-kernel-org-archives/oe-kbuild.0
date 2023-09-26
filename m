Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83FFA107BE
	for <oe-kbuild@lists.linux.dev>; Tue, 26 Sep 2023 18:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695754708; x=1727290708;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zW1VOxDBy8kVV1RK3R6UDppwQm6gTEHAbQ2A+mjc6vs=;
  b=ZlTsSPOLhD+LnUJc965kMxrKZonCx8jgBkoClqAghp3GQqsnEX+we6Tp
   mGIjSaoClreM7DgtJKoDuJF5QIi2GPPNQVRV7+CB7BZfyhMUCaTsbLOaZ
   rotrcvR1/ZS9VCrCeYXkcImWJJiisUS254moDYUESid0ZHB0WXhds0FNj
   rzkCmqSQoPK9FfN5waHVOzu8+EZxe5Of9F2ABGvO1XzbwukU1nOT4pofR
   R0V8+9m77NTazSEvky0lyHkLPGCUIpMHte4A0xz6oqiMeY8u6bTjqlqX1
   jUfV6egHuA1PU/3syHv2Jw1u4btiX1Z9vn4ojJqskfXFcaEDpw4tTlulz
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="361025476"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; 
   d="scan'208";a="361025476"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2023 11:58:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="698565577"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; 
   d="scan'208";a="698565577"
Received: from lkp-server02.sh.intel.com (HELO 32c80313467c) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 26 Sep 2023 11:58:26 -0700
Received: from kbuild by 32c80313467c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qlDGK-0003G7-0C;
	Tue, 26 Sep 2023 18:58:24 +0000
Date: Wed, 27 Sep 2023 02:58:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3 1/2] dt-bindings: phy: add binding for the i.MX8MP
 HDMI PHY
Message-ID: <202309270258.sXXln4tF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: Documentation/devicetree/bindings/phy/fsl,imx8mp-hdmi-phy.yaml: title: 'Freescale i.MX8MP HDMI PHY binding' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20230906184211.1857585-1-l.stach@pengutronix.de>
References: <20230906184211.1857585-1-l.stach@pengutronix.de>
TO: Lucas Stach <l.stach@pengutronix.de>

Hi Lucas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on soc/for-next linus/master v6.6-rc3 next-20230926]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lucas-Stach/phy-freescale-add-Samsung-HDMI-PHY/20230907-024449
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20230906184211.1857585-1-l.stach%40pengutronix.de
patch subject: [PATCH v3 1/2] dt-bindings: phy: add binding for the i.MX8MP HDMI PHY
:::::: branch date: 3 weeks ago
:::::: commit date: 3 weeks ago
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230927/202309270258.sXXln4tF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202309270258.sXXln4tF-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/phy/fsl,imx8mp-hdmi-phy.yaml: title: 'Freescale i.MX8MP HDMI PHY binding' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   	hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   	from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/iio/addac/adi,ad74115.yaml: properties:adi,ext1-burnout-current-nanoamp: '$ref' should not be valid under {'const': '$ref'}
   	hint: Standard unit suffix properties don't need a type $ref
   	from schema $id: http://devicetree.org/meta-schemas/core.yaml#
   Documentation/devicetree/bindings/iio/addac/adi,ad74115.yaml: properties:adi,ext2-burnout-current-nanoamp: '$ref' should not be valid under {'const': '$ref'}
   	hint: Standard unit suffix properties don't need a type $ref
   	from schema $id: http://devicetree.org/meta-schemas/core.yaml#
   Documentation/devicetree/bindings/iio/addac/adi,ad74115.yaml: properties:adi,viout-burnout-current-nanoamp: '$ref' should not be valid under {'const': '$ref'}
   	hint: Standard unit suffix properties don't need a type $ref

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
