Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD6301DDF0
	for <oe-kbuild@lists.linux.dev>; Fri, 21 Jul 2023 15:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689953547; x=1721489547;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CZ58Cec2QZ2byqafzZ3WeFLJsCPoVjP8Zmlq5WOu2fc=;
  b=FzD8oHzfPh6rqeP7loL3e/xNvt29ic/zDjvnCcPayuGDdsaqleK69/nb
   VxXhYeNOBco2RZqA19SF4PeQKDL0NfDa5kYMJ7AX1b3zIjXokQuCywoYs
   QwbJf8E0yz6awV7j9IEXATU9pQOE2ZPGtDAuNWKQcf5OIVtS6uQhKLp8z
   4OVWx6Y1cPEPfeRaQFbVHGIuuBm0S8MzMVs+CstsFX6jrix5l0hSizA9a
   6SOv8Lqy2cZ0G65wSy7KnZhJzBdgRVo3HCsknHFJcM0gO8xKtJtQDyYxh
   5Jg9uSl28Z5ofCnTo+xMAFHW1u4f7K8kXTgQgolo+TpJxwug97NW2G5+Y
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="369719233"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; 
   d="scan'208";a="369719233"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2023 08:32:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="815002235"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; 
   d="scan'208";a="815002235"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 21 Jul 2023 08:32:26 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qMs7F-0007PJ-1J;
	Fri, 21 Jul 2023 15:32:25 +0000
Date: Fri, 21 Jul 2023 23:32:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3] arm64: dts: qcom: sdm630: Add support for modem
 remoteproc
Message-ID: <202307212316.9YPFt78p-lkp@intel.com>
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
In-Reply-To: <20230719093458.2668842-1-alexeymin@postmarketos.org>
References: <20230719093458.2668842-1-alexeymin@postmarketos.org>
TO: Alexey Minnekhanov <alexeymin@postmarketos.org>
TO: Andy Gross <agross@kernel.org>
TO: Bjorn Andersson <andersson@kernel.org>
TO: Konrad Dybcio <konrad.dybcio@linaro.org>
TO: Rob Herring <robh+dt@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: linux-arm-msm@vger.kernel.org
TO: devicetree@vger.kernel.org
TO: linux-kernel@vger.kernel.org
CC: ~postmarketos/upstreaming@lists.sr.ht
CC: phone-devel@vger.kernel.org
CC: Alexey Minnekhanov <alexeymin@postmarketos.org>

Hi Alexey,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on linus/master v6.5-rc2]
[cannot apply to next-20230721]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexey-Minnekhanov/arm64-dts-qcom-sdm630-Add-support-for-modem-remoteproc/20230719-174428
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20230719093458.2668842-1-alexeymin%40postmarketos.org
patch subject: [PATCH v3] arm64: dts: qcom: sdm630: Add support for modem remoteproc
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20230721/202307212316.9YPFt78p-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230721/202307212316.9YPFt78p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202307212316.9YPFt78p-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm64/boot/dts/qcom/sdm630.dtsi:1092.38-1149.5: ERROR (duplicate_node_names): /soc@0/remoteproc@4080000: Duplicate node name
>> ERROR: Input tree has errors, aborting (use -f to force output)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
