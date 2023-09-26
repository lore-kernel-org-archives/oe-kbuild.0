Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 435B837CA6
	for <oe-kbuild@lists.linux.dev>; Tue, 26 Sep 2023 17:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695749581; x=1727285581;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5t6HBmMfMyWh/plT5fpbNQYRrZsYmObptJP421sGGZg=;
  b=MoKQXz+IvKkpV82AqvQijg7FLqzU9OzE3AGJk+fXUvHO9lOR3sme8SiH
   +DwqnrUjFaveREJKtR4QrFlbBp0bZVwhOOTK6evvsk2uo0wD50tb+pOkV
   eHz31z0EJLoBVStBjGxyLJipB4b9Zb2fKVBY1zC5r82J56oBf3Puz7CUE
   lFOXmuZ9KdDvJOVKGeSQ8cVFs1fpsxqH5N531JNH6Ed95P8EhtkRuRdhN
   a2Yw/tZMGn1AVIeLLWOHXtW2apRqelvJTqKIE9MTjlkevlCm5hSDV37YI
   E50xjlWt8a6L75sqNXNMgWyibXQLGs3fICwQJyLPhrljeNw/MypmHIcVx
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="366687363"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; 
   d="scan'208";a="366687363"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2023 10:32:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="864478273"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; 
   d="scan'208";a="864478273"
Received: from lkp-server02.sh.intel.com (HELO 32c80313467c) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 26 Sep 2023 10:32:54 -0700
Received: from kbuild by 32c80313467c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qlBvY-0003BU-0Y;
	Tue, 26 Sep 2023 17:32:52 +0000
Date: Wed, 27 Sep 2023 01:32:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [steev:lenovo-x13s-v6.6.0-rc2 27/71] dtbs_check:
 Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml:109:11: [error]
 string value is redundantly quoted with any quotes (quoted-strings)
Message-ID: <202309270116.WYXcCXZs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml:109:11: [error] string value is redundantly quoted with any quotes (quoted-strings)"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Satya Priya <quic_c_skakit@quicinc.com>
CC: Steev Klimaszewski <steev@kali.org>
CC: Stephen Boyd <swboyd@chromium.org>
CC: Rob Herring <robh@kernel.org>
CC: Johan Hovold <johan+linaro@kernel.org>
CC: linux-doc@vger.kernel.org

tree:   https://github.com/steev/linux lenovo-x13s-v6.6.0-rc2
head:   b1d6c8559499dbb9228adf2f6d1f7bccdf3026f7
commit: 1bb5dd5c4b32c7e6c73c2c2e38b3471b372196a5 [27/71] dt-bindings: mfd: pm8008: Add regulators for pm8008
:::::: branch date: 8 days ago
:::::: commit date: 9 days ago
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230927/202309270116.WYXcCXZs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202309270116.WYXcCXZs-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml:109:11: [error] string value is redundantly quoted with any quotes (quoted-strings)

vim +109 Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml

b0572a9b239711 Guru Das Srinagesh 2021-05-25    8  
b0572a9b239711 Guru Das Srinagesh 2021-05-25    9  maintainers:
3e82150697d90d Guru Das Srinagesh 2023-07-27   10    - Guru Das Srinagesh <quic_gurus@quicinc.com>
b0572a9b239711 Guru Das Srinagesh 2021-05-25   11  
b0572a9b239711 Guru Das Srinagesh 2021-05-25   12  description: |
b0572a9b239711 Guru Das Srinagesh 2021-05-25   13    Qualcomm Technologies, Inc. PM8008 is a dedicated camera PMIC that integrates
b0572a9b239711 Guru Das Srinagesh 2021-05-25   14    all the necessary power management, housekeeping, and interface support
b0572a9b239711 Guru Das Srinagesh 2021-05-25   15    functions into a single IC.
b0572a9b239711 Guru Das Srinagesh 2021-05-25   16  
b0572a9b239711 Guru Das Srinagesh 2021-05-25   17  properties:
b0572a9b239711 Guru Das Srinagesh 2021-05-25   18    compatible:
b0572a9b239711 Guru Das Srinagesh 2021-05-25   19      const: qcom,pm8008
b0572a9b239711 Guru Das Srinagesh 2021-05-25   20  
b0572a9b239711 Guru Das Srinagesh 2021-05-25   21    reg:
b0572a9b239711 Guru Das Srinagesh 2021-05-25   22      description:
b0572a9b239711 Guru Das Srinagesh 2021-05-25   23        I2C slave address.
b0572a9b239711 Guru Das Srinagesh 2021-05-25   24  
b0572a9b239711 Guru Das Srinagesh 2021-05-25   25      maxItems: 1
b0572a9b239711 Guru Das Srinagesh 2021-05-25   26  
b0572a9b239711 Guru Das Srinagesh 2021-05-25   27    interrupts:
b0572a9b239711 Guru Das Srinagesh 2021-05-25   28      maxItems: 1
b0572a9b239711 Guru Das Srinagesh 2021-05-25   29  
b0572a9b239711 Guru Das Srinagesh 2021-05-25   30      description: Parent interrupt.
b0572a9b239711 Guru Das Srinagesh 2021-05-25   31  
b0572a9b239711 Guru Das Srinagesh 2021-05-25   32    "#interrupt-cells":
b0572a9b239711 Guru Das Srinagesh 2021-05-25   33      const: 2
b0572a9b239711 Guru Das Srinagesh 2021-05-25   34  
b0572a9b239711 Guru Das Srinagesh 2021-05-25   35      description: |
b0572a9b239711 Guru Das Srinagesh 2021-05-25   36        The first cell is the IRQ number, the second cell is the IRQ trigger
b0572a9b239711 Guru Das Srinagesh 2021-05-25   37        flag. All interrupts are listed in include/dt-bindings/mfd/qcom-pm8008.h.
b0572a9b239711 Guru Das Srinagesh 2021-05-25   38  
b0572a9b239711 Guru Das Srinagesh 2021-05-25   39    interrupt-controller: true
b0572a9b239711 Guru Das Srinagesh 2021-05-25   40  
b0572a9b239711 Guru Das Srinagesh 2021-05-25   41    "#address-cells":
3ff858ea1a2525 Satya Priya        2022-06-14   42      const: 2
b0572a9b239711 Guru Das Srinagesh 2021-05-25   43  
b0572a9b239711 Guru Das Srinagesh 2021-05-25   44    "#size-cells":
b0572a9b239711 Guru Das Srinagesh 2021-05-25   45      const: 0
b0572a9b239711 Guru Das Srinagesh 2021-05-25   46  
df67edddfe9a84 Satya Priya        2022-06-14   47    reset-gpios:
df67edddfe9a84 Satya Priya        2022-06-14   48      maxItems: 1
df67edddfe9a84 Satya Priya        2022-06-14   49  
1bb5dd5c4b32c7 Satya Priya        2022-06-14   50    vdd_l1_l2-supply:
1bb5dd5c4b32c7 Satya Priya        2022-06-14   51      description: Input supply phandle of ldo1 and ldo2 regulators.
1bb5dd5c4b32c7 Satya Priya        2022-06-14   52  
1bb5dd5c4b32c7 Satya Priya        2022-06-14   53    vdd_l3_l4-supply:
1bb5dd5c4b32c7 Satya Priya        2022-06-14   54      description: Input supply phandle of ldo3 and ldo4 regulators.
1bb5dd5c4b32c7 Satya Priya        2022-06-14   55  
1bb5dd5c4b32c7 Satya Priya        2022-06-14   56    vdd_l5-supply:
1bb5dd5c4b32c7 Satya Priya        2022-06-14   57      description: Input supply phandle of ldo5 regulator.
1bb5dd5c4b32c7 Satya Priya        2022-06-14   58  
1bb5dd5c4b32c7 Satya Priya        2022-06-14   59    vdd_l6-supply:
1bb5dd5c4b32c7 Satya Priya        2022-06-14   60      description: Input supply phandle of ldo6 regulator.
1bb5dd5c4b32c7 Satya Priya        2022-06-14   61  
1bb5dd5c4b32c7 Satya Priya        2022-06-14   62    vdd_l7-supply:
1bb5dd5c4b32c7 Satya Priya        2022-06-14   63      description: Input supply phandle of ldo7 regulator.
1bb5dd5c4b32c7 Satya Priya        2022-06-14   64  
b0572a9b239711 Guru Das Srinagesh 2021-05-25   65  patternProperties:
3ff858ea1a2525 Satya Priya        2022-06-14   66    "^gpio@0,[0-9a-f]+$":
b0572a9b239711 Guru Das Srinagesh 2021-05-25   67      type: object
b0572a9b239711 Guru Das Srinagesh 2021-05-25   68  
b0572a9b239711 Guru Das Srinagesh 2021-05-25   69      description: |
b0572a9b239711 Guru Das Srinagesh 2021-05-25   70        The GPIO peripheral. This node may be specified twice, one for each GPIO.
b0572a9b239711 Guru Das Srinagesh 2021-05-25   71  
b0572a9b239711 Guru Das Srinagesh 2021-05-25   72      properties:
b0572a9b239711 Guru Das Srinagesh 2021-05-25   73        compatible:
ab09511fb69bdd Satya Priya        2021-07-23   74          items:
ab09511fb69bdd Satya Priya        2021-07-23   75            - const: qcom,pm8008-gpio
ab09511fb69bdd Satya Priya        2021-07-23   76            - const: qcom,spmi-gpio
b0572a9b239711 Guru Das Srinagesh 2021-05-25   77  
b0572a9b239711 Guru Das Srinagesh 2021-05-25   78        reg:
3ff858ea1a2525 Satya Priya        2022-06-14   79          description: Peripheral offset and address of one of the two GPIO peripherals.
b0572a9b239711 Guru Das Srinagesh 2021-05-25   80          maxItems: 1
b0572a9b239711 Guru Das Srinagesh 2021-05-25   81  
b0572a9b239711 Guru Das Srinagesh 2021-05-25   82        gpio-controller: true
b0572a9b239711 Guru Das Srinagesh 2021-05-25   83  
ab09511fb69bdd Satya Priya        2021-07-23   84        gpio-ranges:
ab09511fb69bdd Satya Priya        2021-07-23   85          maxItems: 1
ab09511fb69bdd Satya Priya        2021-07-23   86  
b0572a9b239711 Guru Das Srinagesh 2021-05-25   87        interrupt-controller: true
b0572a9b239711 Guru Das Srinagesh 2021-05-25   88  
b0572a9b239711 Guru Das Srinagesh 2021-05-25   89        "#interrupt-cells":
b0572a9b239711 Guru Das Srinagesh 2021-05-25   90          const: 2
b0572a9b239711 Guru Das Srinagesh 2021-05-25   91  
b0572a9b239711 Guru Das Srinagesh 2021-05-25   92        "#gpio-cells":
b0572a9b239711 Guru Das Srinagesh 2021-05-25   93          const: 2
b0572a9b239711 Guru Das Srinagesh 2021-05-25   94  
b0572a9b239711 Guru Das Srinagesh 2021-05-25   95      required:
b0572a9b239711 Guru Das Srinagesh 2021-05-25   96        - compatible
b0572a9b239711 Guru Das Srinagesh 2021-05-25   97        - reg
b0572a9b239711 Guru Das Srinagesh 2021-05-25   98        - gpio-controller
b0572a9b239711 Guru Das Srinagesh 2021-05-25   99        - interrupt-controller
b0572a9b239711 Guru Das Srinagesh 2021-05-25  100        - "#gpio-cells"
ab09511fb69bdd Satya Priya        2021-07-23  101        - gpio-ranges
b0572a9b239711 Guru Das Srinagesh 2021-05-25  102        - "#interrupt-cells"
b0572a9b239711 Guru Das Srinagesh 2021-05-25  103  
b0572a9b239711 Guru Das Srinagesh 2021-05-25  104      additionalProperties: false
b0572a9b239711 Guru Das Srinagesh 2021-05-25  105  
1bb5dd5c4b32c7 Satya Priya        2022-06-14  106    "^ldo[1-7]@[1],[0-9a-f]+$":
1bb5dd5c4b32c7 Satya Priya        2022-06-14  107      type: object
1bb5dd5c4b32c7 Satya Priya        2022-06-14  108  
1bb5dd5c4b32c7 Satya Priya        2022-06-14 @109      $ref: "/schemas/regulator/regulator.yaml#"
1bb5dd5c4b32c7 Satya Priya        2022-06-14  110  
1bb5dd5c4b32c7 Satya Priya        2022-06-14  111      description: PM8008 regulator peripherals of PM8008 regulator device.
1bb5dd5c4b32c7 Satya Priya        2022-06-14  112  
1bb5dd5c4b32c7 Satya Priya        2022-06-14  113      properties:
1bb5dd5c4b32c7 Satya Priya        2022-06-14  114        compatible:
1bb5dd5c4b32c7 Satya Priya        2022-06-14  115          const: qcom,pm8008-regulator
1bb5dd5c4b32c7 Satya Priya        2022-06-14  116  
1bb5dd5c4b32c7 Satya Priya        2022-06-14  117        reg:
1bb5dd5c4b32c7 Satya Priya        2022-06-14  118          description: Peripheral offset and address of the ldo regulator.
1bb5dd5c4b32c7 Satya Priya        2022-06-14  119          maxItems: 1
1bb5dd5c4b32c7 Satya Priya        2022-06-14  120  
1bb5dd5c4b32c7 Satya Priya        2022-06-14  121      required:
1bb5dd5c4b32c7 Satya Priya        2022-06-14  122        - compatible
1bb5dd5c4b32c7 Satya Priya        2022-06-14  123        - reg
1bb5dd5c4b32c7 Satya Priya        2022-06-14  124  
1bb5dd5c4b32c7 Satya Priya        2022-06-14  125      unevaluatedProperties: false
1bb5dd5c4b32c7 Satya Priya        2022-06-14  126  
b0572a9b239711 Guru Das Srinagesh 2021-05-25  127  required:
b0572a9b239711 Guru Das Srinagesh 2021-05-25  128    - compatible
b0572a9b239711 Guru Das Srinagesh 2021-05-25  129    - reg
b0572a9b239711 Guru Das Srinagesh 2021-05-25  130    - interrupts
b0572a9b239711 Guru Das Srinagesh 2021-05-25  131    - "#address-cells"
b0572a9b239711 Guru Das Srinagesh 2021-05-25  132    - "#size-cells"
b0572a9b239711 Guru Das Srinagesh 2021-05-25  133    - "#interrupt-cells"
df67edddfe9a84 Satya Priya        2022-06-14  134    - reset-gpios
b0572a9b239711 Guru Das Srinagesh 2021-05-25  135  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
