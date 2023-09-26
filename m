Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CD626AA3
	for <oe-kbuild@lists.linux.dev>; Tue, 26 Sep 2023 15:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695742122; x=1727278122;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6I/Ij8JDxC1akirCIwCBN2KBHxkmZWjgAZFyVA8rWms=;
  b=AxgrdOVL1ZySnaaBxiuDprnNZzehlgIySfdic8tJgzeGhmjh5m9UxoCI
   uBaqKNC3HjsONB4KHC1VJbK0jlkNpm9k0/mgO3WbpPu26erDp9H3LknAt
   5UPTg23+mPFVNM95lg+30EjytUx+ftifoOEH1S4vh39YLMj48Gpl2CjIX
   1SW/NDVjwcfCJIbjuNc32XlZ2QGm6ekbeRS5xlMQMnJnbd1DTJx+PI9HG
   pC1nl8LzflDgFU+snety7SZa4vifcSYZMZ6rC0fN80rGyoK5GVrm/gu2O
   o698s1MWPJPRs9DriHrMKeyr1UGzjBlKvq9fd5ttHRyJ8TRb5lb92fwm8
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="371925705"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; 
   d="scan'208";a="371925705"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2023 08:28:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="742397673"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; 
   d="scan'208";a="742397673"
Received: from lkp-server02.sh.intel.com (HELO 32c80313467c) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 26 Sep 2023 08:28:38 -0700
Received: from kbuild by 32c80313467c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ql9zI-0002zX-0T;
	Tue, 26 Sep 2023 15:28:36 +0000
Date: Tue, 26 Sep 2023 23:28:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 5572/8008] dtbs_check:
 Documentation/devicetree/bindings/mfd/qcom-pm8xxx.yaml:
Message-ID: <202309262305.DAUAHrn8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: Documentation/devicetree/bindings/mfd/qcom-pm8xxx.yaml:"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Lee Jones <lee@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: linux-doc@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4ae73bba62a367f2314f6ce69e3085a941983d8b
commit: 2c09766cb133ee4d57d19f56c6a0035b0d9eb034 [5572/8008] dt-bindings: mfd: qcom-pm8xxx: Add missing child nodes
:::::: branch date: 10 hours ago
:::::: commit date: 7 days ago
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230926/202309262305.DAUAHrn8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202309262305.DAUAHrn8-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/mfd/qcom-pm8xxx.yaml:
   Error in referenced schema matching $id: http://devicetree.org/schemas/input/qcom,pm8921-keypad.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
