Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 124B628E35
	for <oe-kbuild@lists.linux.dev>; Tue, 26 Sep 2023 17:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695748213; x=1727284213;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5fqgDxeP0RBh4vQH6+BCE8Xdz0VBQik9wDqpAtOXrs0=;
  b=T3yRvPtK7xIyQy0OYd5Ekr8GC9uO5buaS4QmRQpRCh36J4f7AC92/FPw
   H0mYVt7vsFm5kxoGJX2Abn5DMEPisyvqyZmkRK1uXvztzQsXveFJ1wJO0
   RgUy1BRkOX/Lv6eAi2AM32VZ4IUWWvfVlH78vQCQAYH7sGfSCwM6ln9rH
   E62BEPWow60JXxeuXb06VMdlED6pCInY8d1nVPaph5DDi0RGIRBla79ad
   pcxwoPPY9/CSh2Foywbkw7F3jvudMwf6fEK00QnbJvm/IJty3/RGvNyRI
   Dg8dT9dzddTjkfzND+pOxJ5ZvdyhV9ndNA00GBouk7ZT9z1EmHK9VJUFf
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="371954278"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; 
   d="scan'208";a="371954278"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2023 10:10:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="819102329"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; 
   d="scan'208";a="819102329"
Received: from lkp-server02.sh.intel.com (HELO 32c80313467c) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 26 Sep 2023 10:10:10 -0700
Received: from kbuild by 32c80313467c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qlBZX-000399-1S;
	Tue, 26 Sep 2023 17:10:07 +0000
Date: Wed, 27 Sep 2023 01:09:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [hverkuil-media-tree:hdmi-dbg 8/27] dtbs_check:
 Documentation/devicetree/bindings/iio/adc/ti,ads7128.yaml:42:1: [error]
 syntax error: found character '\t' that cannot start any token (syntax)
Message-ID: <202309270131.Luymco2s-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: Documentation/devicetree/bindings/iio/adc/ti,ads7128.yaml:42:1: [error] syntax error: found character '\t' that cannot start any token (syntax)"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Erling Ljunggren <hljunggr@cisco.com>
CC: Hans Verkuil <hverkuil@xs4all.nl>
CC: linux-doc@vger.kernel.org

tree:   git://linuxtv.org/hverkuil/media_tree.git hdmi-dbg
head:   4e36f69879c101236bfb136deb83de210cf43046
commit: 7a67042f3ea611460e4cf943be4e136b456d8676 [8/27] dt-bindings: media: add cat24c208 bindings
:::::: branch date: 3 weeks ago
:::::: commit date: 3 weeks ago
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230927/202309270131.Luymco2s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202309270131.Luymco2s-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/iio/adc/ti,ads7128.yaml:42:1: [error] syntax error: found character '\t' that cannot start any token (syntax)
--
>> Documentation/devicetree/bindings/iio/adc/ti,ads7128.yaml:42:1: found a tab character where an indentation space is expected
--
>> Documentation/devicetree/bindings/iio/adc/ti,ads7128.yaml: ignoring, error parsing file

vim +42 Documentation/devicetree/bindings/iio/adc/ti,ads7128.yaml

3ccffba164ef024 Jenny Manne 2021-07-09  32  
3ccffba164ef024 Jenny Manne 2021-07-09  33  examples:
3ccffba164ef024 Jenny Manne 2021-07-09  34    - |
3ccffba164ef024 Jenny Manne 2021-07-09  35      i2c {
3ccffba164ef024 Jenny Manne 2021-07-09  36          #address-cells = <1>;
3ccffba164ef024 Jenny Manne 2021-07-09  37          #size-cells = <0>;
3ccffba164ef024 Jenny Manne 2021-07-09  38  
3ccffba164ef024 Jenny Manne 2021-07-09  39          adc@17 {
3ccffba164ef024 Jenny Manne 2021-07-09  40              compatible = "ti,ads7128";
3ccffba164ef024 Jenny Manne 2021-07-09  41              reg = <0x17>;
3ccffba164ef024 Jenny Manne 2021-07-09 @42  	    vref-supply = <&vref_5v0_reg>;

:::::: The code at line 42 was first introduced by commit
:::::: 3ccffba164ef0246aff8f810e17c9756c598c170 ti-ads7128: driver for the TI ADS7128 ADC

:::::: TO: Jenny Manne <jenny.v.manne@gmail.com>
:::::: CC: Hans Verkuil <hverkuil@xs4all.nl>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
