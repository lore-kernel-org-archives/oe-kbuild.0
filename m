Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 539A429419
	for <oe-kbuild@lists.linux.dev>; Tue, 26 Sep 2023 17:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695749582; x=1727285582;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yDuOo7Dy7eFgagm5EiJMnZE87zfpJn80Ygl1x+ih03c=;
  b=JSjTjoLGDYgxXDkfAQb2QcyYnYAauMFZ5N0KARloYfCX/f8sPXB72v5e
   9qn2gmNhVjzvjnXkROf0mYJa1/LoSv19Tp3qhcJ05AAQtoBfxFm7GPvO2
   stkERubZcBp6oosCd0R6/xHfxX3YJtooXqZRrD9/pbi+zP6lJjt4mQwoa
   cjgYNepLm+dHENGY8CNv34RJNsY4ZArwkXSF3s+iEgzZ92Jg3lqtWUrLr
   G5h69ofTCp4sBqmfsJCQVRcSxvqrKfrdEerYU1S2YkWE13JnLmOSKSz+Q
   ov6GSCDVjHvb48WQT7QFV70EPECs4najClk65CwLDwNSqDKN04BOl8nxU
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="366687372"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; 
   d="scan'208";a="366687372"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2023 10:33:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="864478266"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; 
   d="scan'208";a="864478266"
Received: from lkp-server02.sh.intel.com (HELO 32c80313467c) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 26 Sep 2023 10:32:54 -0700
Received: from kbuild by 32c80313467c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qlBvX-0003BL-2n;
	Tue, 26 Sep 2023 17:32:51 +0000
Date: Wed, 27 Sep 2023 01:32:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [esmil:visionfive 20/46] dtbs_check:
 Documentation/devicetree/bindings/reset/starfive,jh7100-audrst.yaml: title:
 'StarFive JH7100 SoC Audio Reset Controller Device Tree Bindings' should not
 be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
Message-ID: <202309270130.Rq2jLCUA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: Documentation/devicetree/bindings/reset/starfive,jh7100-audrst.yaml: title: 'StarFive JH7100 SoC Audio Reset Controller Device Tree Bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Emil Renner Berthing <kernel@esmil.dk>
CC: linux-doc@vger.kernel.org

tree:   https://github.com/esmil/linux visionfive
head:   c727f594ac6d4d500eed929fe3bb1d6d90880662
commit: 15231f4e8cf50e957fc6e63586d34329f450ddcd [20/46] dt-bindings: reset: Add starfive,jh7100-audrst bindings
:::::: branch date: 2 days ago
:::::: commit date: 6 days ago
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230927/202309270130.Rq2jLCUA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202309270130.Rq2jLCUA-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/reset/starfive,jh7100-audrst.yaml: title: 'StarFive JH7100 SoC Audio Reset Controller Device Tree Bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   	hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   	from schema $id: http://devicetree.org/meta-schemas/base.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
