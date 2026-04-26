Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CF31524F
	for <oe-kbuild@lists.linux.dev>; Sun, 26 Apr 2026 04:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777177409; cv=none; b=YoxPWLHxJ/yL7ZUtnT6bunsBOQNTu6z2DHm/kTe2hq5Rdkcqi6K/QuT1BCZrsyPxESEgZ6otg+Q46RNfUTEJbsKyI8GpfxcGH4tWOYWTag3tTRNODiBomwoVxhPdlsgoA7lPt4lTdmTdWt2888pbujDML0Xpw0kNQ7XGCJH0B9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777177409; c=relaxed/simple;
	bh=3itazRj8xSKxzJM3PlznaRIihgIAo+olfQc0J2Jnk1g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=iaYNL7t+e5M8uWxdMmN1bdfMgul4G0yPRDOyaIN96JGb6g9fFqgFi4l/HbItvFhwv/8Q9Wdb+4nrmXsp5arlikBVXjBhsqzNf9iesRtYfNzqQZp0MCQ29Ru5ma1edLEFpHW6k/LHLdvTs1YkUkdDcjILSlTKCZqGZKWIF5Ao4NI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CPjh2ej0; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CPjh2ej0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777177407; x=1808713407;
  h=date:from:to:cc:subject:message-id;
  bh=3itazRj8xSKxzJM3PlznaRIihgIAo+olfQc0J2Jnk1g=;
  b=CPjh2ej0txfEDSKAis8fhBOINnvKenK9OuNfdRmFlLC8OjhH17Tn4Ne9
   GfV5b+UUNNgh5rM/REopymDAGH2UX0qQ1Ut05uLhOPuiYQyk8VIBLcxHD
   6yP8eGiXfvezY87JUbu/Z9Uhl7HGKymA51+fTOEKmqv90Nygrb0PAzf33
   t3941Pp7dXs4wVaRiM3UnNw9nnyGUkAbr/rPCBLy2MHCTgMsBXo4MrE2t
   Vk+0gAfvjAzE1P8Og6hMXzmCbzhRNiW7Sjcd3doOounLUFHiEZ7/QQDiw
   5zEWNmjoNNTYgDQjvMS3yImvCO30fJd3+glrXhSAuWy3YRhgmIZUmiJv0
   g==;
X-CSE-ConnectionGUID: eXVsv+G3S3mYK+VNiVTP2Q==
X-CSE-MsgGUID: qgVXL8mYSFuoSuGEhzwLyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11767"; a="103567657"
X-IronPort-AV: E=Sophos;i="6.23,199,1770624000"; 
   d="scan'208";a="103567657"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2026 21:23:26 -0700
X-CSE-ConnectionGUID: bv+qMcWmRoaPteFVxHqqnA==
X-CSE-MsgGUID: sWsKnqsARXaAj5A903FR4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,199,1770624000"; 
   d="scan'208";a="232450884"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 25 Apr 2026 21:23:25 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wGr1e-000000003en-0KN4;
	Sun, 26 Apr 2026 04:23:22 +0000
Date: Sun, 26 Apr 2026 06:22:55 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [steev:lenovo-x13s-linux-7.0.y 49/211]
 Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml:24:9:
 [warning] wrong indentation: expected 10 but found 8 (indentation)
Message-ID: <202604260637.U4vgRQQN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Steev Klimaszewski <threeway@gmail.com>

tree:   https://github.com/steev/linux lenovo-x13s-linux-7.0.y
head:   8aa2fc8b04088e4711c0468300087786eb973845
commit: b47239b14778c33998bbc63e4188c2e02203ec7f [49/211] media: dt-bindings: Document SC8280XP/SM8350 Iris
:::::: branch date: 3 days ago
:::::: commit date: 12 days ago
config: microblaze-randconfig-2052-20260426 (https://download.01.org/0day-ci/archive/20260426/202604260637.U4vgRQQN-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 8.5.0
dtschema: 2026.5.dev2+g3579443c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260426/202604260637.U4vgRQQN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604260637.U4vgRQQN-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.yaml:52:2: [warning] wrong indentation: expected 2 but found 1 (indentation)
   Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.yaml:84:1: [warning] too many blank lines (2 > 1) (empty-lines)
>> Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml:24:9: [warning] wrong indentation: expected 10 but found 8 (indentation)

vim +24 Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml

8d3a1cb32124eae Bryan O'Donoghue    2021-02-15    8  
8d3a1cb32124eae Bryan O'Donoghue    2021-02-15    9  maintainers:
8d3a1cb32124eae Bryan O'Donoghue    2021-02-15   10    - Stanimir Varbanov <stanimir.varbanov@linaro.org>
8d3a1cb32124eae Bryan O'Donoghue    2021-02-15   11  
8d3a1cb32124eae Bryan O'Donoghue    2021-02-15   12  description: |
b47239b14778c33 Dmitry Baryshkov    2026-03-12   13    The Iris2 IP is a video encode and decode accelerator present
8d3a1cb32124eae Bryan O'Donoghue    2021-02-15   14    on Qualcomm platforms
8d3a1cb32124eae Bryan O'Donoghue    2021-02-15   15  
f8cc21d454c5015 Krzysztof Kozlowski 2022-12-27   16  allOf:
f8cc21d454c5015 Krzysztof Kozlowski 2022-12-27   17    - $ref: qcom,venus-common.yaml#
f8cc21d454c5015 Krzysztof Kozlowski 2022-12-27   18  
8d3a1cb32124eae Bryan O'Donoghue    2021-02-15   19  properties:
8d3a1cb32124eae Bryan O'Donoghue    2021-02-15   20    compatible:
b47239b14778c33 Dmitry Baryshkov    2026-03-12   21      oneOf:
b47239b14778c33 Dmitry Baryshkov    2026-03-12   22        - const: qcom,sm8250-venus
b47239b14778c33 Dmitry Baryshkov    2026-03-12   23        - items:
b47239b14778c33 Dmitry Baryshkov    2026-03-12  @24          - enum:
b47239b14778c33 Dmitry Baryshkov    2026-03-12   25              - qcom,sc8280xp-iris
b47239b14778c33 Dmitry Baryshkov    2026-03-12   26              - qcom,sm8350-iris
b47239b14778c33 Dmitry Baryshkov    2026-03-12   27          - const: qcom,sm8250-venus
8d3a1cb32124eae Bryan O'Donoghue    2021-02-15   28  
8d3a1cb32124eae Bryan O'Donoghue    2021-02-15   29    power-domains:
181691e73406bf2 Dmitry Baryshkov    2026-02-01   30      maxItems: 4
8d3a1cb32124eae Bryan O'Donoghue    2021-02-15   31  
8d3a1cb32124eae Bryan O'Donoghue    2021-02-15   32    power-domain-names:
8d3a1cb32124eae Bryan O'Donoghue    2021-02-15   33      items:
8d3a1cb32124eae Bryan O'Donoghue    2021-02-15   34        - const: venus
8d3a1cb32124eae Bryan O'Donoghue    2021-02-15   35        - const: vcodec0
8d3a1cb32124eae Bryan O'Donoghue    2021-02-15   36        - const: mx
181691e73406bf2 Dmitry Baryshkov    2026-02-01   37        - const: mmcx
8d3a1cb32124eae Bryan O'Donoghue    2021-02-15   38  
8d3a1cb32124eae Bryan O'Donoghue    2021-02-15   39    clocks:
8d3a1cb32124eae Bryan O'Donoghue    2021-02-15   40      maxItems: 3
8d3a1cb32124eae Bryan O'Donoghue    2021-02-15   41  
8d3a1cb32124eae Bryan O'Donoghue    2021-02-15   42    clock-names:
8d3a1cb32124eae Bryan O'Donoghue    2021-02-15   43      items:
8d3a1cb32124eae Bryan O'Donoghue    2021-02-15   44        - const: iface
8d3a1cb32124eae Bryan O'Donoghue    2021-02-15   45        - const: core
8d3a1cb32124eae Bryan O'Donoghue    2021-02-15   46        - const: vcodec0_core
8d3a1cb32124eae Bryan O'Donoghue    2021-02-15   47  
8d3a1cb32124eae Bryan O'Donoghue    2021-02-15   48    iommus:
8d3a1cb32124eae Bryan O'Donoghue    2021-02-15   49      maxItems: 1
8d3a1cb32124eae Bryan O'Donoghue    2021-02-15   50  
8d3a1cb32124eae Bryan O'Donoghue    2021-02-15   51    interconnects:
8d3a1cb32124eae Bryan O'Donoghue    2021-02-15   52      maxItems: 2
8d3a1cb32124eae Bryan O'Donoghue    2021-02-15   53  
8d3a1cb32124eae Bryan O'Donoghue    2021-02-15   54    interconnect-names:
8d3a1cb32124eae Bryan O'Donoghue    2021-02-15   55      items:
8d3a1cb32124eae Bryan O'Donoghue    2021-02-15   56        - const: cpu-cfg
8d3a1cb32124eae Bryan O'Donoghue    2021-02-15   57        - const: video-mem
8d3a1cb32124eae Bryan O'Donoghue    2021-02-15   58  
a9dd982c60f31aa Krzysztof Kozlowski 2022-12-27   59    operating-points-v2: true
a9dd982c60f31aa Krzysztof Kozlowski 2022-12-27   60    opp-table:
a9dd982c60f31aa Krzysztof Kozlowski 2022-12-27   61      type: object
a9dd982c60f31aa Krzysztof Kozlowski 2022-12-27   62  
8d3a1cb32124eae Bryan O'Donoghue    2021-02-15   63    resets:
8d3a1cb32124eae Bryan O'Donoghue    2021-02-15   64      maxItems: 2
8d3a1cb32124eae Bryan O'Donoghue    2021-02-15   65  
8d3a1cb32124eae Bryan O'Donoghue    2021-02-15   66    reset-names:
8d3a1cb32124eae Bryan O'Donoghue    2021-02-15   67      items:
8d3a1cb32124eae Bryan O'Donoghue    2021-02-15   68        - const: bus
8d3a1cb32124eae Bryan O'Donoghue    2021-02-15   69        - const: core
8d3a1cb32124eae Bryan O'Donoghue    2021-02-15   70  
8d3a1cb32124eae Bryan O'Donoghue    2021-02-15   71    video-decoder:
8d3a1cb32124eae Bryan O'Donoghue    2021-02-15   72      type: object
8d3a1cb32124eae Bryan O'Donoghue    2021-02-15   73  
8d3a1cb32124eae Bryan O'Donoghue    2021-02-15   74      properties:
8d3a1cb32124eae Bryan O'Donoghue    2021-02-15   75        compatible:
8d3a1cb32124eae Bryan O'Donoghue    2021-02-15   76          const: venus-decoder
8d3a1cb32124eae Bryan O'Donoghue    2021-02-15   77  
8d3a1cb32124eae Bryan O'Donoghue    2021-02-15   78      required:
8d3a1cb32124eae Bryan O'Donoghue    2021-02-15   79        - compatible
8d3a1cb32124eae Bryan O'Donoghue    2021-02-15   80  
459997e8990d9cd Bryan O'Donoghue    2024-12-30   81      deprecated: true
8d3a1cb32124eae Bryan O'Donoghue    2021-02-15   82      additionalProperties: false
8d3a1cb32124eae Bryan O'Donoghue    2021-02-15   83  
8d3a1cb32124eae Bryan O'Donoghue    2021-02-15   84    video-encoder:
8d3a1cb32124eae Bryan O'Donoghue    2021-02-15   85      type: object
8d3a1cb32124eae Bryan O'Donoghue    2021-02-15   86  
8d3a1cb32124eae Bryan O'Donoghue    2021-02-15   87      properties:
8d3a1cb32124eae Bryan O'Donoghue    2021-02-15   88        compatible:
8d3a1cb32124eae Bryan O'Donoghue    2021-02-15   89          const: venus-encoder
8d3a1cb32124eae Bryan O'Donoghue    2021-02-15   90  
8d3a1cb32124eae Bryan O'Donoghue    2021-02-15   91      required:
8d3a1cb32124eae Bryan O'Donoghue    2021-02-15   92        - compatible
8d3a1cb32124eae Bryan O'Donoghue    2021-02-15   93  
459997e8990d9cd Bryan O'Donoghue    2024-12-30   94      deprecated: true
8d3a1cb32124eae Bryan O'Donoghue    2021-02-15   95      additionalProperties: false
8d3a1cb32124eae Bryan O'Donoghue    2021-02-15   96  
8d3a1cb32124eae Bryan O'Donoghue    2021-02-15   97  required:
8d3a1cb32124eae Bryan O'Donoghue    2021-02-15   98    - compatible
8d3a1cb32124eae Bryan O'Donoghue    2021-02-15   99    - power-domain-names
8d3a1cb32124eae Bryan O'Donoghue    2021-02-15  100    - interconnects
8d3a1cb32124eae Bryan O'Donoghue    2021-02-15  101    - interconnect-names
8d3a1cb32124eae Bryan O'Donoghue    2021-02-15  102    - iommus
8d3a1cb32124eae Bryan O'Donoghue    2021-02-15  103    - resets
8d3a1cb32124eae Bryan O'Donoghue    2021-02-15  104    - reset-names
8d3a1cb32124eae Bryan O'Donoghue    2021-02-15  105  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
