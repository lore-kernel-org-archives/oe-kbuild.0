Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A7F9620
	for <oe-kbuild@lists.linux.dev>; Wed, 27 Sep 2023 00:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695773990; x=1727309990;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ge+FGcxp0k/rcTPUrjmAz8/WoleJ4cwrtl/swDjyRWU=;
  b=TOxhnMhD+Ay2sIujiKJPNsJg7yJxsI3+Rb6/frb90MAiBuTxiWyvH89p
   GE/Y63ucsWyfD8IqZEyMdpqA6ikITn0vjg1Ghz+qOxzmqq0WFDu47crZY
   9qklNZz4N+8cVjuZplXL0/7pHjBVMDbwpKVdZXB3nQFTbBajvll4jGDcE
   YLkWbQm+a1lUu9B+UC7griSRqwHiQROPEPSXNkSVVNwTXOmaCmdR9qpCG
   3ppbEpbzN8dZySj5hZxvuqD7rvNK/hk2KHrs+ta5mrpUAOUgW56490O1V
   Sj7eWT4CjF/aCUqwVGcM6vLD1J3KCOqMZL1VSVbEtDV5BtXNmjbibfL1A
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="448191177"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; 
   d="scan'208";a="448191177"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2023 17:19:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="839215983"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; 
   d="scan'208";a="839215983"
Received: from lkp-server02.sh.intel.com (HELO 32c80313467c) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 26 Sep 2023 17:19:47 -0700
Received: from kbuild by 32c80313467c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qlIHJ-0003W3-1j;
	Wed, 27 Sep 2023 00:19:45 +0000
Date: Wed, 27 Sep 2023 08:19:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [xilinx-xlnx:xlnx_rebase_v6.1_LTS 206/1370] dtbs_check:
 Documentation/devicetree/bindings/nvmem/xlnx,versal-sec-cfg.yaml: title:
 'Xilinx Secure Configuration driver binding' should not be valid under
 {'pattern': '([Bb]inding| [Ss]chema)'}
Message-ID: <202309270821.DLrXzXER-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: Documentation/devicetree/bindings/nvmem/xlnx,versal-sec-cfg.yaml: title: 'Xilinx Secure Configuration driver binding' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: git@amd.com
TO: Harsha <harsha.harsha@xilinx.com>
CC: Michal Simek <monstr@monstr.eu>
CC: Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>
CC: linux-doc@vger.kernel.org

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.1_LTS
head:   a19da02cf5b44420ec6afb1eef348c21d9e8cda2
commit: 0b0b5da8d90c26006257e9336a74d5c2b2c1d886 [206/1370] dt-bindings: nvmem: Added nodes for BBRAM and volatile user keys
:::::: branch date: 5 days ago
:::::: commit date: 9 months ago
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230927/202309270821.DLrXzXER-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202309270821.DLrXzXER-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/power/supply/bq24257.yaml: title: 'Binding for bq24250, bq24251 and bq24257 Li-Ion Charger' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/mfd/ene-kb3930.yaml: title: 'ENE KB3930 Embedded Controller bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/mux/reg-mux.yaml: title: 'Generic register bitfield-based multiplexer controller bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
>> Documentation/devicetree/bindings/nvmem/xlnx,versal-sec-cfg.yaml: title: 'Xilinx Secure Configuration driver binding' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/power/supply/ingenic,battery.yaml: title: 'Ingenic JZ47xx battery bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/leds/backlight/gpio-backlight.yaml: title: 'gpio-backlight bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/mux/mux-controller.yaml: title: 'Common multiplexer controller provider bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
