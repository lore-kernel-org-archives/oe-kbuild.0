Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 463B24595C
	for <oe-kbuild@lists.linux.dev>; Wed, 15 Nov 2023 23:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ebu1hnBz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700091822; x=1731627822;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JhfcFduuUSfIbEuKQZAYvq0b+9icWV9BEPMYqF7+x/E=;
  b=ebu1hnBzz8IigKq7y7jZFrhuUC9aItNKbFHOfg/C9KCkCXjLywM0NtqA
   zGRVVPjAHP+d9qejzhOxzNQqHeZPGN7yaHh88JkUtQoURDybrYm1Pw41V
   cTFV34pIH5qziNhpVW6FgqtnFP2423pWASkRF/Q4wL4Q2rvf0AFF0Nizw
   bakufSm+QppJDhhSm+O6MsHgHJXyOGkMYwAxZNEIteNhK0GsPpdXPbLcf
   QnrwLZS5YvcmzgKCopjle0oQqjO9kcJhyX8OmjgI4OCWMO3DajKQX8J4n
   khvux1XJsiBjYWaqg/WPExvnjhQOFHtS2UNJroHqI+ptjSJFGMSkhzhjm
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="455269582"
X-IronPort-AV: E=Sophos;i="6.03,306,1694761200"; 
   d="scan'208";a="455269582"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 15:43:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="768740621"
X-IronPort-AV: E=Sophos;i="6.03,306,1694761200"; 
   d="scan'208";a="768740621"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 15 Nov 2023 15:43:40 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r3PXm-0000z8-1y;
	Wed, 15 Nov 2023 23:43:38 +0000
Date: Thu, 16 Nov 2023 07:42:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [sre-misc:uti260b 20/27] dtbs_check:
 Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-tsc.yaml:
 measure-delay-time: missing type definition
Message-ID: <202311160714.FRS5bWnD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-tsc.yaml: measure-delay-time: missing type definition"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Sebastian Reichel <sre@kernel.org>
CC: linux-doc@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-misc.git uti260b
head:   c7c89303911ada7c2765aa21f95c2d83778eac68
commit: ac71cd35df41222b775999c8c3c3aa0b1a8e4165 [20/27] dt-bindings: input: touchscreen: fsl,imx6ul-tsc convert to YAML
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231116/202311160714.FRS5bWnD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311160714.FRS5bWnD-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-tsc.yaml: measure-delay-time: missing type definition
>> Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-tsc.yaml: pre-charge-time: missing type definition

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
