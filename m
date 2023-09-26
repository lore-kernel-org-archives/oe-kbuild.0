Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2F6347351
	for <oe-kbuild@lists.linux.dev>; Tue, 26 Sep 2023 18:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695752878; x=1727288878;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pPmXGkttQXaDiKv70TuYf6SRURUkxCLuSPVXVy0aLA0=;
  b=DjedETyMYA5zAb5ZNAhHRgAvF/nwXXy5ThFQN/Iw7ff2Naac+1Kxz/Zp
   qWsZ6PWsqA1t518vd/vPaZBMQ+0FpnV8GPYzhuvJlZ1uvhHWTUEhHqGuw
   /nyO/HXjHJzuyIc46iy73kiZCMG/nWRmMP/yTV/3sq55lYgAfNHv6yxnn
   YTyHP7S4rQSFPfaOOkoRsxBXKNVEwKFPyJn+Unmmp+2FxEhrAVFHNjzvu
   qDGaOoZ3fKRzIAsQh8heo/Peh28E58wLFM8wDJ2HODaC3t6ArZ1SuQqIL
   JbmmTfJV0HrfIJJe7pWHyrtElCiu7utB4REV2LbC59ktkGnMJiluIs0BW
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="366700053"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; 
   d="scan'208";a="366700053"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2023 11:27:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="819123473"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; 
   d="scan'208";a="819123473"
Received: from lkp-server02.sh.intel.com (HELO 32c80313467c) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 26 Sep 2023 11:27:56 -0700
Received: from kbuild by 32c80313467c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qlCmo-0003EH-0Z;
	Tue, 26 Sep 2023 18:27:54 +0000
Date: Wed, 27 Sep 2023 02:26:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] scsi: ufs: qcom: dt-bindings: Add MCQ ESI property
Message-ID: <202309270236.73iDpbX8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: Documentation/devicetree/bindings/ufs/qcom,ufs.yaml:108:8: [warning] wrong indentation: expected 6 but found 7 (indentation)"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <1694163203-39123-1-git-send-email-quic_ziqichen@quicinc.com>
References: <1694163203-39123-1-git-send-email-quic_ziqichen@quicinc.com>
TO: Ziqi Chen <quic_ziqichen@quicinc.com>
TO: quic_asutoshd@quicinc.com
TO: quic_cang@quicinc.com
TO: bvanassche@acm.org
TO: mani@kernel.org
TO: adrian.hunter@intel.com
TO: beanhuo@micron.com
TO: avri.altman@wdc.com
TO: junwoo80.lee@samsung.com
TO: martin.petersen@oracle.com
TO: quic_nguyenb@quicinc.com
TO: quic_nitirawa@quicinc.com
TO: quic_ziqichen@quicinc.com
CC: linux-scsi@vger.kernel.org
CC: Andy Gross <agross@kernel.org>
CC: Bjorn Andersson <andersson@kernel.org>
CC: Konrad Dybcio <konrad.dybcio@linaro.org>
CC: Alim Akhtar <alim.akhtar@samsung.com>
CC: Rob Herring <robh+dt@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>
CC: "(open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)" <devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Hi Ziqi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.6-rc3 next-20230926]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ziqi-Chen/scsi-ufs-qcom-dt-bindings-Add-MCQ-ESI-property/20230908-165641
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/1694163203-39123-1-git-send-email-quic_ziqichen%40quicinc.com
patch subject: [PATCH] scsi: ufs: qcom: dt-bindings: Add MCQ ESI property
:::::: branch date: 3 weeks ago
:::::: commit date: 3 weeks ago
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230927/202309270236.73iDpbX8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202309270236.73iDpbX8-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/ufs/qcom,ufs.yaml:108:8: [warning] wrong indentation: expected 6 but found 7 (indentation)
--
   Documentation/devicetree/bindings/iio/addac/adi,ad74115.yaml: properties:adi,ext1-burnout-current-nanoamp: '$ref' should not be valid under {'const': '$ref'}
   	hint: Standard unit suffix properties don't need a type $ref
   	from schema $id: http://devicetree.org/meta-schemas/core.yaml#
   Documentation/devicetree/bindings/iio/addac/adi,ad74115.yaml: properties:adi,ext2-burnout-current-nanoamp: '$ref' should not be valid under {'const': '$ref'}
   	hint: Standard unit suffix properties don't need a type $ref
   	from schema $id: http://devicetree.org/meta-schemas/core.yaml#
   Documentation/devicetree/bindings/iio/addac/adi,ad74115.yaml: properties:adi,viout-burnout-current-nanoamp: '$ref' should not be valid under {'const': '$ref'}
   	hint: Standard unit suffix properties don't need a type $ref
   	from schema $id: http://devicetree.org/meta-schemas/core.yaml#
>> Documentation/devicetree/bindings/ufs/qcom,ufs.yaml: properties:qcom,esi-affinity-mask: 'oneOf' conditional failed, one must be fixed:
   	'type' is a required property
   		hint: A vendor boolean property can use "type: boolean"
>> 	Documentation/devicetree/bindings/ufs/qcom,ufs.yaml: properties:qcom,esi-affinity-mask: 'oneOf' conditional failed, one must be fixed:
   		'enum' is a required property
   		'const' is a required property
   		hint: A vendor string property with exact values has an implicit type
   		from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#
>> 	Documentation/devicetree/bindings/ufs/qcom,ufs.yaml: properties:qcom,esi-affinity-mask: 'oneOf' conditional failed, one must be fixed:
   		'$ref' is a required property
   		'allOf' is a required property
   		hint: A vendor property needs a $ref to types.yaml
   		from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#
   	hint: Vendor specific properties must have a type and description unless they have a defined, common suffix.
   	from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#

vim +108 Documentation/devicetree/bindings/ufs/qcom,ufs.yaml

462c5c0aa7989e Krzysztof Kozlowski 2022-03-06    8  
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06    9  maintainers:
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06   10    - Bjorn Andersson <bjorn.andersson@linaro.org>
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06   11    - Andy Gross <agross@kernel.org>
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06   12  
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06   13  # Select only our matches, not all jedec,ufs-2.0
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06   14  select:
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06   15    properties:
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06   16      compatible:
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06   17        contains:
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06   18          const: qcom,ufshc
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06   19    required:
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06   20      - compatible
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06   21  
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06   22  properties:
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06   23    compatible:
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06   24      items:
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06   25        - enum:
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06   26            - qcom,msm8994-ufshc
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06   27            - qcom,msm8996-ufshc
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06   28            - qcom,msm8998-ufshc
8f0c17bf6bf33b Bartosz Golaszewski 2023-04-11   29            - qcom,sa8775p-ufshc
2f3b3200ac389d Johan Hovold        2022-07-11   30            - qcom,sc8280xp-ufshc
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06   31            - qcom,sdm845-ufshc
a11eaed308efc7 Iskren Chernev      2023-08-14   32            - qcom,sm6115-ufshc
3d8fa7a22dcd54 Luca Weiss          2022-03-21   33            - qcom,sm6350-ufshc
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06   34            - qcom,sm8150-ufshc
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06   35            - qcom,sm8250-ufshc
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06   36            - qcom,sm8350-ufshc
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06   37            - qcom,sm8450-ufshc
b8c203891121be Abel Vesa           2023-01-19   38            - qcom,sm8550-ufshc
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06   39        - const: qcom,ufshc
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06   40        - const: jedec,ufs-2.0
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06   41  
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06   42    clocks:
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06   43      minItems: 8
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06   44      maxItems: 11
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06   45  
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06   46    clock-names:
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06   47      minItems: 8
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06   48      maxItems: 11
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06   49  
85e182b48a33a4 Johan Hovold        2023-01-16   50    dma-coherent: true
85e182b48a33a4 Johan Hovold        2023-01-16   51  
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06   52    interconnects:
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06   53      minItems: 2
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06   54      maxItems: 2
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06   55  
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06   56    interconnect-names:
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06   57      items:
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06   58        - const: ufs-ddr
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06   59        - const: cpu-ufs
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06   60  
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06   61    iommus:
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06   62      minItems: 1
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06   63      maxItems: 2
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06   64  
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06   65    phys:
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06   66      maxItems: 1
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06   67  
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06   68    phy-names:
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06   69      items:
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06   70        - const: ufsphy
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06   71  
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06   72    power-domains:
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06   73      maxItems: 1
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06   74  
29a6d1215b7cd5 Abel Vesa           2023-06-12   75    qcom,ice:
29a6d1215b7cd5 Abel Vesa           2023-06-12   76      $ref: /schemas/types.yaml#/definitions/phandle
29a6d1215b7cd5 Abel Vesa           2023-06-12   77      description: phandle to the Inline Crypto Engine node
29a6d1215b7cd5 Abel Vesa           2023-06-12   78  
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06   79    reg:
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06   80      minItems: 1
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06   81      maxItems: 2
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06   82  
7839d566c653bc Luca Weiss          2023-08-14   83    reg-names:
7839d566c653bc Luca Weiss          2023-08-14   84      items:
7839d566c653bc Luca Weiss          2023-08-14   85        - const: std
7839d566c653bc Luca Weiss          2023-08-14   86        - const: ice
7839d566c653bc Luca Weiss          2023-08-14   87  
8ffbaa98ccf823 Krzysztof Kozlowski 2022-12-28   88    required-opps:
8ffbaa98ccf823 Krzysztof Kozlowski 2022-12-28   89      maxItems: 1
8ffbaa98ccf823 Krzysztof Kozlowski 2022-12-28   90  
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06   91    resets:
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06   92      maxItems: 1
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06   93  
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06   94    '#reset-cells':
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06   95      const: 1
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06   96  
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06   97    reset-names:
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06   98      items:
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06   99        - const: rst
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06  100  
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06  101    reset-gpios:
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06  102      maxItems: 1
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06  103      description:
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06  104        GPIO connected to the RESET pin of the UFS memory device.
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06  105  
b620cbe2435f88 Ziqi Chen           2023-09-08  106    qcom,esi-affinity-mask:
b620cbe2435f88 Ziqi Chen           2023-09-08  107      description:
b620cbe2435f88 Ziqi Chen           2023-09-08 @108         UFS MCQ ESI affinity mask. Affine ESI on registration according to this CPU mask.
b620cbe2435f88 Ziqi Chen           2023-09-08  109  
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06  110  required:
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06  111    - compatible
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06  112    - reg
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06  113  
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06  114  allOf:
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06  115    - $ref: ufs-common.yaml
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06  116  
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06  117    - if:
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06  118        properties:
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06  119          compatible:
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06  120            contains:
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06  121              enum:
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06  122                - qcom,msm8998-ufshc
8f0c17bf6bf33b Bartosz Golaszewski 2023-04-11  123                - qcom,sa8775p-ufshc
2f3b3200ac389d Johan Hovold        2022-07-11  124                - qcom,sc8280xp-ufshc
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06  125                - qcom,sm8250-ufshc
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06  126                - qcom,sm8350-ufshc
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06  127                - qcom,sm8450-ufshc
b8c203891121be Abel Vesa           2023-01-19  128                - qcom,sm8550-ufshc
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06  129      then:
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06  130        properties:
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06  131          clocks:
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06  132            minItems: 8
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06  133            maxItems: 8
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06  134          clock-names:
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06  135            items:
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06  136              - const: core_clk
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06  137              - const: bus_aggr_clk
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06  138              - const: iface_clk
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06  139              - const: core_clk_unipro
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06  140              - const: ref_clk
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06  141              - const: tx_lane0_sync_clk
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06  142              - const: rx_lane0_sync_clk
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06  143              - const: rx_lane1_sync_clk
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06  144          reg:
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06  145            minItems: 1
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06  146            maxItems: 1
7839d566c653bc Luca Weiss          2023-08-14  147          reg-names:
7839d566c653bc Luca Weiss          2023-08-14  148            maxItems: 1
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06  149  
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06  150    - if:
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06  151        properties:
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06  152          compatible:
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06  153            contains:
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06  154              enum:
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06  155                - qcom,sdm845-ufshc
3d8fa7a22dcd54 Luca Weiss          2022-03-21  156                - qcom,sm6350-ufshc
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06  157                - qcom,sm8150-ufshc
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06  158      then:
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06  159        properties:
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06  160          clocks:
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06  161            minItems: 9
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06  162            maxItems: 9
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06  163          clock-names:
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06  164            items:
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06  165              - const: core_clk
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06  166              - const: bus_aggr_clk
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06  167              - const: iface_clk
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06  168              - const: core_clk_unipro
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06  169              - const: ref_clk
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06  170              - const: tx_lane0_sync_clk
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06  171              - const: rx_lane0_sync_clk
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06  172              - const: rx_lane1_sync_clk
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06  173              - const: ice_core_clk
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06  174          reg:
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06  175            minItems: 2
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06  176            maxItems: 2
7839d566c653bc Luca Weiss          2023-08-14  177          reg-names:
7839d566c653bc Luca Weiss          2023-08-14  178            minItems: 2
7839d566c653bc Luca Weiss          2023-08-14  179        required:
7839d566c653bc Luca Weiss          2023-08-14  180          - reg-names
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06  181  
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06  182    - if:
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06  183        properties:
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06  184          compatible:
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06  185            contains:
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06  186              enum:
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06  187                - qcom,msm8996-ufshc
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06  188      then:
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06  189        properties:
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06  190          clocks:
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06  191            minItems: 11
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06  192            maxItems: 11
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06  193          clock-names:
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06  194            items:
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06  195              - const: core_clk_src
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06  196              - const: core_clk
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06  197              - const: bus_clk
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06  198              - const: bus_aggr_clk
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06  199              - const: iface_clk
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06  200              - const: core_clk_unipro_src
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06  201              - const: core_clk_unipro
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06  202              - const: core_clk_ice
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06  203              - const: ref_clk
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06  204              - const: tx_lane0_sync_clk
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06  205              - const: rx_lane0_sync_clk
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06  206          reg:
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06  207            minItems: 1
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06  208            maxItems: 1
7839d566c653bc Luca Weiss          2023-08-14  209          reg-names:
7839d566c653bc Luca Weiss          2023-08-14  210            maxItems: 1
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06  211  
a11eaed308efc7 Iskren Chernev      2023-08-14  212    - if:
a11eaed308efc7 Iskren Chernev      2023-08-14  213        properties:
a11eaed308efc7 Iskren Chernev      2023-08-14  214          compatible:
a11eaed308efc7 Iskren Chernev      2023-08-14  215            contains:
a11eaed308efc7 Iskren Chernev      2023-08-14  216              enum:
a11eaed308efc7 Iskren Chernev      2023-08-14  217                - qcom,sm6115-ufshc
a11eaed308efc7 Iskren Chernev      2023-08-14  218      then:
a11eaed308efc7 Iskren Chernev      2023-08-14  219        properties:
a11eaed308efc7 Iskren Chernev      2023-08-14  220          clocks:
a11eaed308efc7 Iskren Chernev      2023-08-14  221            minItems: 8
a11eaed308efc7 Iskren Chernev      2023-08-14  222            maxItems: 8
a11eaed308efc7 Iskren Chernev      2023-08-14  223          clock-names:
a11eaed308efc7 Iskren Chernev      2023-08-14  224            items:
a11eaed308efc7 Iskren Chernev      2023-08-14  225              - const: core_clk
a11eaed308efc7 Iskren Chernev      2023-08-14  226              - const: bus_aggr_clk
a11eaed308efc7 Iskren Chernev      2023-08-14  227              - const: iface_clk
a11eaed308efc7 Iskren Chernev      2023-08-14  228              - const: core_clk_unipro
a11eaed308efc7 Iskren Chernev      2023-08-14  229              - const: ref_clk
a11eaed308efc7 Iskren Chernev      2023-08-14  230              - const: tx_lane0_sync_clk
a11eaed308efc7 Iskren Chernev      2023-08-14  231              - const: rx_lane0_sync_clk
a11eaed308efc7 Iskren Chernev      2023-08-14  232              - const: ice_core_clk
a11eaed308efc7 Iskren Chernev      2023-08-14  233          reg:
a11eaed308efc7 Iskren Chernev      2023-08-14  234            minItems: 2
a11eaed308efc7 Iskren Chernev      2023-08-14  235            maxItems: 2
a11eaed308efc7 Iskren Chernev      2023-08-14  236          reg-names:
a11eaed308efc7 Iskren Chernev      2023-08-14  237            minItems: 2
a11eaed308efc7 Iskren Chernev      2023-08-14  238        required:
a11eaed308efc7 Iskren Chernev      2023-08-14  239          - reg-names
a11eaed308efc7 Iskren Chernev      2023-08-14  240  
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06  241      # TODO: define clock bindings for qcom,msm8994-ufshc
462c5c0aa7989e Krzysztof Kozlowski 2022-03-06  242  
29a6d1215b7cd5 Abel Vesa           2023-06-12  243    - if:
9b7c13b83c1ded Abel Vesa           2023-06-23  244        required:
9b7c13b83c1ded Abel Vesa           2023-06-23  245          - qcom,ice
29a6d1215b7cd5 Abel Vesa           2023-06-12  246      then:
29a6d1215b7cd5 Abel Vesa           2023-06-12  247        properties:
29a6d1215b7cd5 Abel Vesa           2023-06-12  248          reg:
29a6d1215b7cd5 Abel Vesa           2023-06-12  249            maxItems: 1
29a6d1215b7cd5 Abel Vesa           2023-06-12  250          clocks:
29a6d1215b7cd5 Abel Vesa           2023-06-12  251            minItems: 8
29a6d1215b7cd5 Abel Vesa           2023-06-12  252            maxItems: 8
29a6d1215b7cd5 Abel Vesa           2023-06-12  253      else:
29a6d1215b7cd5 Abel Vesa           2023-06-12  254        properties:
29a6d1215b7cd5 Abel Vesa           2023-06-12  255          reg:
9b7c13b83c1ded Abel Vesa           2023-06-23  256            minItems: 1
29a6d1215b7cd5 Abel Vesa           2023-06-12  257            maxItems: 2
29a6d1215b7cd5 Abel Vesa           2023-06-12  258          clocks:
9b7c13b83c1ded Abel Vesa           2023-06-23  259            minItems: 8
29a6d1215b7cd5 Abel Vesa           2023-06-12  260            maxItems: 11
29a6d1215b7cd5 Abel Vesa           2023-06-12  261  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
