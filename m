Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC0C1A279
	for <oe-kbuild@lists.linux.dev>; Sat, 21 Oct 2023 15:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GHawicY7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697903054; x=1729439054;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HwNpcbK6rS57Y0KUUFunNyghOYe/Z/7q3x+BKo/W+8k=;
  b=GHawicY7V+uNiHTjssywNc1PKY2PGjj2TxLsk16deUnjXzDVb9yzDpsD
   96NRvh8Ba17H0dMCNzxA77qlkoKnFu2Kv3m0Gj4LK44AE7ChdsUXgYWR9
   Q9j8wzVnvpdTQEu45fYBUGWlrrNUfKAu60qb3JWb++3Q9Q7jtgGQgPQeK
   tTtkVbqf5lZdqJcM0pQ30luItMDNgg7oRAcd1ymtv4oivR7mZ9uMjg+kt
   6pvtZgV4V1OrUZ4eKofl2rZjNC8DAxtyGan9AvT79ls3tjLur475yHiIq
   QiO7LFobo0jJRx0rh4t9fpmDxA12Dzd5qupssBuc5pXckXxEyy7XRjNQx
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="389492932"
X-IronPort-AV: E=Sophos;i="6.03,241,1694761200"; 
   d="scan'208";a="389492932"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2023 08:44:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="1004878233"
X-IronPort-AV: E=Sophos;i="6.03,241,1694761200"; 
   d="scan'208";a="1004878233"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 21 Oct 2023 08:44:12 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1quE94-0004yM-1U;
	Sat, 21 Oct 2023 15:44:10 +0000
Date: Sat, 21 Oct 2023 23:43:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 2/5] dt-bindings: i3c: svc: add compatible string i3c:
 silvaco,i3c-slave
Message-ID: <202310212319.fHKT7CTx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "git am base is a link in commit message"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20231018215809.3477437-3-Frank.Li@nxp.com>
References: <20231018215809.3477437-3-Frank.Li@nxp.com>
TO: Frank Li <Frank.Li@nxp.com>
TO: miquel.raynal@bootlin.com
TO: conor.culhane@silvaco.com
TO: alexandre.belloni@bootlin.com
TO: robh+dt@kernel.org
TO: krzysztof.kozlowski+dt@linaro.org
TO: conor+dt@kernel.org
TO: corbet@lwn.net
TO: joe@perches.com
TO: Frank.Li@nxp.com
TO: linux-i3c@lists.infradead.org
TO: devicetree@vger.kernel.org
TO: linux-kernel@vger.kernel.org
TO: linux-doc@vger.kernel.org
CC: gregkh@linuxfoundation.org
CC: imx@lists.linux.dev
CC: jirislaby@kernel.org
CC: linux-serial@vger.kernel.org

Hi Frank,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.6-rc6 next-20231020]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Frank-Li/i3c-add-slave-mode-support/20231019-055940
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20231018215809.3477437-3-Frank.Li%40nxp.com
patch subject: [PATCH 2/5] dt-bindings: i3c: svc: add compatible string i3c: silvaco,i3c-slave
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231021/202310212319.fHKT7CTx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202310212319.fHKT7CTx-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml: properties:compatible:const: {'enum': ['silvaco,i3c-master-v1', 'silvaco,i3c-slave-v1']} is not of type 'integer', 'string'
   	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
>> Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml: properties:compatible:const: {'enum': ['silvaco,i3c-master-v1', 'silvaco,i3c-slave-v1']} is not of type 'string'
   	from schema $id: http://devicetree.org/meta-schemas/string-array.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
