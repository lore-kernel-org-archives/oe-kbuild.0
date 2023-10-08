Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9618D2C9C
	for <oe-kbuild@lists.linux.dev>; Sun,  8 Oct 2023 20:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MRPOfQWL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696797017; x=1728333017;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Hp0T61Bnxrve7YlOhX9TwuLjv+e2gitn6KXHMzXTHog=;
  b=MRPOfQWLHFLRyKatXTwd5nmTZG4O1dNWOrsTE47Xu3Ckrzyhdaed12mR
   QlPYvAPFNfI1eX7QJ+dmLQB/C2oyvPWyEVZndmyEkcp7UCRIImShFK66D
   JPvcd5vs61peFRxNpiF+Qck/Qs3ldzVxbJxvVt0PvAcO/gynRhivU+Jz1
   9IVtUZFVzitW9NVdBJ2GHhe0SvRWv022lsLHH/1na9GOmy9jm+rXEP9q3
   yZpFq2CR3ZkUlBnR4DDkEdlEdLKVTFWRL3rmUXzI2YCMOxgpqblCay0jh
   7Pz/yNJRprbDQB/IMBfxG2fcXQZcr5BWRQxJ+umPw0Z4e0CmUZScfuTpv
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10857"; a="2635067"
X-IronPort-AV: E=Sophos;i="6.03,207,1694761200"; 
   d="scan'208";a="2635067"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2023 13:30:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10857"; a="1084113958"
X-IronPort-AV: E=Sophos;i="6.03,207,1694761200"; 
   d="scan'208";a="1084113958"
Received: from lkp-server01.sh.intel.com (HELO 8a3a91ad4240) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 08 Oct 2023 13:30:15 -0700
Received: from kbuild by 8a3a91ad4240 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qpaPl-0005jx-21;
	Sun, 08 Oct 2023 20:30:13 +0000
Date: Mon, 9 Oct 2023 04:30:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 1/2] dt-bindings: input: bindings for Adafruit Seesaw
 Gamepad
Message-ID: <202310090414.Iulnmfzb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: Documentation/devicetree/bindings/input/adafruit,seesaw-gamepad.yaml: $id: Cannot determine base path from $id, relative path/filename doesn't match actual path or filename"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20231008172435.2391009-1-anshulusr@gmail.com>
References: <20231008172435.2391009-1-anshulusr@gmail.com>
TO: Anshul Dalal <anshulusr@gmail.com>
TO: linux-input@vger.kernel.org
TO: devicetree@vger.kernel.org
CC: Anshul Dalal <anshulusr@gmail.com>
CC: Dmitry Torokhov <dmitry.torokhov@gmail.com>
CC: Rob Herring <robh+dt@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>
CC: Shuah Khan <skhan@linuxfoundation.org>
CC: linux-kernel-mentees@lists.linuxfoundation.org

Hi Anshul,

kernel test robot noticed the following build warnings:

[auto build test WARNING on dtor-input/next]
[also build test WARNING on dtor-input/for-linus hid/for-next linus/master v6.6-rc4 next-20231006]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Anshul-Dalal/input-joystick-driver-for-Adafruit-Seesaw-Gamepad/20231009-012745
base:   https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
patch link:    https://lore.kernel.org/r/20231008172435.2391009-1-anshulusr%40gmail.com
patch subject: [PATCH v2 1/2] dt-bindings: input: bindings for Adafruit Seesaw Gamepad
:::::: branch date: 3 hours ago
:::::: commit date: 3 hours ago
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231009/202310090414.Iulnmfzb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202310090414.Iulnmfzb-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/input/adafruit,seesaw-gamepad.yaml: $id: Cannot determine base path from $id, relative path/filename doesn't match actual path or filename
    	 $id: http://devicetree.org/schemas/input/adafruit_seesaw.yaml
    	file: Documentation/devicetree/bindings/input/adafruit,seesaw-gamepad.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
