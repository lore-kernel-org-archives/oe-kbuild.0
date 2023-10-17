Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59D7F19A
	for <oe-kbuild@lists.linux.dev>; Tue, 17 Oct 2023 00:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LyGs4SWY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697502427; x=1729038427;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xRZFx5dr1gvYh8aCrlXFPP7UoiI//IpTbSoTp9v7bDo=;
  b=LyGs4SWYxdLH31dkgul700ZgknbG+JeIB7/iTVS7kGb9Mfx4nZ0h2kz3
   /xb5V1c4nEm9CKp92vGzxcuU0HI7Yk3/JtMCXDFIBrMYv6ghQeWU/o9gP
   VO6h1eES5Inr8u+VDU/k3HsO+9lmRcbQueDEgnx9CQzyLK9cYyScHroTl
   e/lBtIcDd+wPpLjABx+HiFEmWMCGI+vH0G3FofmJJTsXAgOfnfvcw79DG
   ESOOjs2+dQclTK8iOGLxBob/CdHK7L3aHkLdjNccRpDvN2aS3/Pq7mk4b
   LnweDMR/Vmo6LCyX0+Sz+CTi7+Lw8jkFFkfy0/QWOSV6k7VJu27a2ddoe
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="471888705"
X-IronPort-AV: E=Sophos;i="6.03,230,1694761200"; 
   d="scan'208";a="471888705"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2023 17:27:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="749464085"
X-IronPort-AV: E=Sophos;i="6.03,230,1694761200"; 
   d="scan'208";a="749464085"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 16 Oct 2023 17:27:05 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsXvK-0008m7-2M;
	Tue, 17 Oct 2023 00:27:02 +0000
Date: Tue, 17 Oct 2023 08:26:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 10929/12451] dtbs_check:
 Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml:
Message-ID: <202310170810.1a8KESbb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml:"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Devi Priya <quic_devipriy@quicinc.com>
CC: Lee Jones <lee@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: linux-doc@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4d0515b235dec789578d135a5db586b25c5870cb
commit: b4a32d218d424b81a58fbd419e1114b1c1f76168 [10929/12451] dt-bindings: mfd: qcom,tcsr: Add simple-mfd support for IPQ6018
:::::: branch date: 19 hours ago
:::::: commit date: 5 days ago
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231017/202310170810.1a8KESbb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202310170810.1a8KESbb-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   Documentation/devicetree/bindings/mfd/qcom-pm8xxx.yaml:
   Error in referenced schema matching $id: http://devicetree.org/schemas/input/qcom,pm8921-keypad.yaml
>> Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml:
   Error in referenced schema matching $id: http://devicetree.org/schemas/pwm/qcom,ipq6018-pwm.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
