Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6349180D
	for <oe-kbuild@lists.linux.dev>; Sat, 23 Sep 2023 06:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695449575; x=1726985575;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=adrJUDkM3WtHMsMLyS0rFarhlRzGc+HOQqFTBeWvXlM=;
  b=KALN0vqzmiDyimGTh4148JkE8U2wXEKoWckU0gA9Z3ICPFj2/Gt0TwVs
   XdfFXIsbKYk/7446ZyuEIwcSqWZ+IiqOgbzsaepudU6+0z031r2GRAeIv
   /Z+Lny8CrQDVulqIn9xz17RrKqYy9rsCyneinB/pnmLmaaSXA/KmMnt2u
   Asismw72qu8kuQkgkggW73OrzfG8OEAgs74zB5VaGaRFl/dgjXzq/fwGh
   DdA7E4r1Emfh3nP3EZVxw6ev0rP5YujzKV0FD+xcwfi9wLcdZNxbatINU
   Ze5keCfMugsGT2feIfa02bzVz/jsKqIIQpn2CZhHpf4NsK8Vg61enrN0M
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="360379924"
X-IronPort-AV: E=Sophos;i="6.03,169,1694761200"; 
   d="scan'208";a="360379924"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2023 23:12:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="782891611"
X-IronPort-AV: E=Sophos;i="6.03,169,1694761200"; 
   d="scan'208";a="782891611"
Received: from lkp-server02.sh.intel.com (HELO 493f6c7fed5d) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 22 Sep 2023 23:12:53 -0700
Received: from kbuild by 493f6c7fed5d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qjvso-0001tg-2p;
	Sat, 23 Sep 2023 06:12:50 +0000
Date: Sat, 23 Sep 2023 14:12:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [l1k:tpm 2/2] dtbs_check:
 Documentation/devicetree/bindings/reset/infineon,slb9670-reset.yaml:29:111:
 [warning] line too long (124 > 110 characters) (line-length)
Message-ID: <202309231433.VxXJTkng-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: Documentation/devicetree/bindings/reset/infineon,slb9670-reset.yaml:29:111: [warning] line too long (124 > 110 characters) (line-length)"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Lukas Wunner <lukas@wunner.de>

tree:   https://github.com/l1k/linux tpm
head:   3872d25bd384f7ec706b0869844a12f21839c2af
commit: 3872d25bd384f7ec706b0869844a12f21839c2af [2/2] dt-bindings: reset: Add Infineon SLB9670 TPM reset driver
:::::: branch date: 2 hours ago
:::::: commit date: 2 hours ago
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230923/202309231433.VxXJTkng-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202309231433.VxXJTkng-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/reset/infineon,slb9670-reset.yaml:29:111: [warning] line too long (124 > 110 characters) (line-length)

vim +29 Documentation/devicetree/bindings/reset/infineon,slb9670-reset.yaml

3872d25bd384f7e Lukas Wunner 2023-09-23   8  
3872d25bd384f7e Lukas Wunner 2023-09-23   9  maintainers:
3872d25bd384f7e Lukas Wunner 2023-09-23  10    - Lukas Wunner <lukas@wunner.de>
3872d25bd384f7e Lukas Wunner 2023-09-23  11  
3872d25bd384f7e Lukas Wunner 2023-09-23  12  description: |
3872d25bd384f7e Lukas Wunner 2023-09-23  13    The Infineon SLB9670 Trusted Platform Module requires a specific reset
3872d25bd384f7e Lukas Wunner 2023-09-23  14    sequence on its RST# pin which is documented in sections 5.4 and 5.5 of
3872d25bd384f7e Lukas Wunner 2023-09-23  15    the datasheet [1]. This driver performs the reset sequence using a GPIO.
3872d25bd384f7e Lukas Wunner 2023-09-23  16  
3872d25bd384f7e Lukas Wunner 2023-09-23  17    The sequence with minimum wait intervals is as follows:
3872d25bd384f7e Lukas Wunner 2023-09-23  18    deassert RST#
3872d25bd384f7e Lukas Wunner 2023-09-23  19    wait at least 60 ms
3872d25bd384f7e Lukas Wunner 2023-09-23  20    assert RST#
3872d25bd384f7e Lukas Wunner 2023-09-23  21    wait at least 2 usecs
3872d25bd384f7e Lukas Wunner 2023-09-23  22    deassert RST#
3872d25bd384f7e Lukas Wunner 2023-09-23  23    wait at least 60 ms
3872d25bd384f7e Lukas Wunner 2023-09-23  24    assert RST#
3872d25bd384f7e Lukas Wunner 2023-09-23  25    wait at least 2 usecs
3872d25bd384f7e Lukas Wunner 2023-09-23  26    deassert RST#
3872d25bd384f7e Lukas Wunner 2023-09-23  27    wait at least 60 ms before issuing the first TPM command
3872d25bd384f7e Lukas Wunner 2023-09-23  28  
3872d25bd384f7e Lukas Wunner 2023-09-23 @29    [1] https://www.infineon.com/dgdl/Infineon-SLB%209670VQ2.0-DataSheet-v01_04-EN.pdf?fileId=5546d4626fc1ce0b016fc78270350cd6
3872d25bd384f7e Lukas Wunner 2023-09-23  30  
3872d25bd384f7e Lukas Wunner 2023-09-23  31  properties:
3872d25bd384f7e Lukas Wunner 2023-09-23  32    compatible:
3872d25bd384f7e Lukas Wunner 2023-09-23  33      enum:
3872d25bd384f7e Lukas Wunner 2023-09-23  34        - infineon,slb9670-reset
3872d25bd384f7e Lukas Wunner 2023-09-23  35  
3872d25bd384f7e Lukas Wunner 2023-09-23  36    reset-gpios:
3872d25bd384f7e Lukas Wunner 2023-09-23  37      maxItems: 1
3872d25bd384f7e Lukas Wunner 2023-09-23  38      description: Reference to the GPIO connected to the RST# pin.
3872d25bd384f7e Lukas Wunner 2023-09-23  39  
3872d25bd384f7e Lukas Wunner 2023-09-23  40    "#reset-cells":
3872d25bd384f7e Lukas Wunner 2023-09-23  41      const: 0
3872d25bd384f7e Lukas Wunner 2023-09-23  42  
3872d25bd384f7e Lukas Wunner 2023-09-23  43  required:
3872d25bd384f7e Lukas Wunner 2023-09-23  44    - compatible
3872d25bd384f7e Lukas Wunner 2023-09-23  45    - reset-gpios
3872d25bd384f7e Lukas Wunner 2023-09-23  46    - "#reset-cells"
3872d25bd384f7e Lukas Wunner 2023-09-23  47  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
