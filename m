Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0143629419
	for <oe-kbuild@lists.linux.dev>; Tue, 26 Sep 2023 17:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695749579; x=1727285579;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zCS5Q/9OwdoWrVzIVeBBYh4s4j6E0H4f2VMwSbZW768=;
  b=JFvKrV/pI83IyArF5VscIuffSj0cE5uYL33qncbJPlH4JSZfK1c953He
   SK5jiCqpkC2+OZ8gGtgZd9aJAlvUtT/d05a+a48CoeILft2gyuegTJDLN
   eQ6hkabFkJhKRubBIVCDGDChDnyWZlRP+aAHa+ci+nkLGHE/hCLWhI5yi
   fbVU/OqrxlPErOqiTe09OATx7c2xG1BBW2+CvWcArFOFp978ZklBc3BLN
   +0mL9FcKwiRddY8yZ6XBHTRR4oAJUaAu/eHtNerSAVFeDsmTLa7VoUYQ+
   brKoTaQrrvoDxfU90TjHMrCM675yYrmtfXSkxaN4P0CNOtdUm3cJQ85WT
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="366687361"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; 
   d="scan'208";a="366687361"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2023 10:32:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="864478268"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; 
   d="scan'208";a="864478268"
Received: from lkp-server02.sh.intel.com (HELO 32c80313467c) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 26 Sep 2023 10:32:54 -0700
Received: from kbuild by 32c80313467c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qlBvY-0003BR-0K;
	Tue, 26 Sep 2023 17:32:52 +0000
Date: Wed, 27 Sep 2023 01:32:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [omap-audio:peter/linux-next-wip 36/48] dtbs_check:
 Documentation/devicetree/bindings/gpio/gpio-shared.yaml: title: 'Bindings
 for shared GPIO lines in board level' should not be valid under {'pattern':
 '([Bb]inding| [Ss]chema)'}
Message-ID: <202309270114.61PtY3qe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: Documentation/devicetree/bindings/gpio/gpio-shared.yaml: title: 'Bindings for shared GPIO lines in board level' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Peter Ujfalusi <peter.ujfalusi@ti.com>

tree:   https://github.com/omap-audio/linux-audio peter/linux-next-wip
head:   53915ce9abe60ba07d0e5456948553edefc6cbfb
commit: 6527d988f2f5e2df2ee10ed231ffda16e54c7720 [36/48] dt-bindings: gpio: Add binding document for shared GPIO
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230927/202309270114.61PtY3qe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202309270114.61PtY3qe-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/gpio/gpio-shared.yaml: title: 'Bindings for shared GPIO lines in board level' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   	hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   	from schema $id: http://devicetree.org/meta-schemas/base.yaml#
>> Documentation/devicetree/bindings/gpio/gpio-shared.yaml: 'oneOf' conditional failed, one must be fixed:
   	'unevaluatedProperties' is a required property
   	'additionalProperties' is a required property
   	hint: Either unevaluatedProperties or additionalProperties must be present
   	from schema $id: http://devicetree.org/meta-schemas/core.yaml#
   Documentation/devicetree/bindings/sound/loongson,ls-audio-card.yaml:
   while parsing a block mapping
     in "<unicode string>", line 4, column 1
   did not find expected key
     in "<unicode string>", line 65, column 3
   Documentation/devicetree/bindings/sound/simple-card.yaml:65:3: did not find expected key

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
