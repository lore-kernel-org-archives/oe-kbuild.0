Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38E8520B80B
	for <oe-kbuild@lists.linux.dev>; Sun,  7 Dec 2025 13:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765114329; cv=none; b=G+s9taVFRXDr92ueR6m7wpCryN/Swtr5arkhaCDNgdK7uEXmXCtXLoLJj1509071kycAIqo4n5cgAHVNzCzQHue7orS2L7Yk5q4/S4JvLDbA7LD045I2Gr3UCFUszU6jE+UwhNXBV+r/Kg4W/U56Vak39aANVkpNMAv0Wa8nylA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765114329; c=relaxed/simple;
	bh=AToUQhD3RDkGH7wnASkmo0CIbsMkK5x0DAbNHv7HCjM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=U0sbf0VDYq+T2SzHDAN8UlTT2jVM+Z7Sy7VY+L36H1Eh3j/H7Ks9FUa6lo9VNF/hX1FQfU0BVHpKDckKlgdh88rnuWcB/lj7A1/lMXmoiWvQQttZ6yuoSM7KeU2NpEP/ow/XoUniytDm4QIenvzFgrWofAXUWVhtBI+uZvDsiLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OuMbZ8+o; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OuMbZ8+o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765114327; x=1796650327;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=AToUQhD3RDkGH7wnASkmo0CIbsMkK5x0DAbNHv7HCjM=;
  b=OuMbZ8+o9P+BFWfNkD9joQPWws8kXmhN858eOfP0vI8+Xf+KEmfYOrBv
   /b6bJiS68XmVNtUnHoqW0P4dwwxWCnr3xEsglXZzLVZaeUe5GASbPdZlQ
   kEhAJOB67mf5q8Wrc2mITz0Jsvdhv1Jj/w6PJAtYW2xcesI/utFlIpxZO
   3t7QbgJjT1APLa93uyZBrTcRaNkhfI8hQt+2Gz1HXlrSbIpyijbpnjjEq
   kaowSMftoCTlVT49mo8TvjHCzv2ltQEI5ByKwtFpQVuKurBJ/NpJpzmDg
   gVx4cMWklDK8qUMcmoT+A6piFBEReLtDq2yjnRgtpWcCuJ95GpmXUj3QD
   g==;
X-CSE-ConnectionGUID: ORLEOsniSnu7vXc2DK+Lyg==
X-CSE-MsgGUID: Ed6xLMNjRMS0lIQ8ysFmJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="69673513"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="69673513"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2025 05:32:06 -0800
X-CSE-ConnectionGUID: b/QN+haoRH+nyClFNZfxug==
X-CSE-MsgGUID: NlO0yrF6RzWxp8LuYa9JzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="200190368"
Received: from igk-lkp-server01.igk.intel.com (HELO 314ca7b3cca8) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 07 Dec 2025 05:32:05 -0800
Received: from kbuild by 314ca7b3cca8 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vSErr-000000001DJ-0ACq;
	Sun, 07 Dec 2025 13:32:03 +0000
Date: Sun, 7 Dec 2025 14:32:01 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 11578/13567]
 Documentation/devicetree/bindings/thermal/qcom-tsens.yaml:64:1: found a tab
 character that violates indentation
Message-ID: <202512071426.xQTxb7nO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "low confidence static check warning: Documentation/devicetree/bindings/thermal/qcom-tsens.yaml:64:1: found a tab character that violates indentation"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Gaurav Kohli <quic_gkohli@quicinc.com>
CC: Daniel Lezcano <daniel.lezcano@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>
CC: Akhil P Oommen <akhilpo@oss.qualcomm.com>
CC: linux-doc@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6987d58a9cbc5bd57c983baa514474a86c945d56
commit: 1ee90870ce797f314168fb08a5cbb0fba8d4dd65 [11578/13567] dt-bindings: thermal: tsens: Add QCS8300 compatible
:::::: branch date: 2 days ago
:::::: commit date: 11 days ago
config: arc-randconfig-2052-20251207 (https://download.01.org/0day-ci/archive/20251207/202512071426.xQTxb7nO-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 10.5.0
dtschema version: 2025.9.dev21+gaa859412c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251207/202512071426.xQTxb7nO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512071426.xQTxb7nO-lkp@intel.com/

Note: the linux-next/master HEAD 6987d58a9cbc5bd57c983baa514474a86c945d56 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

>> make[3]: *** [Documentation/devicetree/bindings/Makefile:26: Documentation/devicetree/bindings/thermal/qcom-tsens.example.dts] Error 1
   make[3]: *** Deleting file 'Documentation/devicetree/bindings/thermal/qcom-tsens.example.dts'
   make[3]: Target 'dt_binding_check' not remade because of errors.

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/clock/qcom,gcc-ipq8064.yaml: Unresolvable reference: /schemas/thermal/qcom-tsens.yaml#
>> Documentation/devicetree/bindings/clock/qcom,gcc-apq8064.yaml: Unresolvable reference: /schemas/thermal/qcom-tsens.yaml#
   Documentation/devicetree/bindings/mfd/fsl,mc13xxx.yaml: leds: Missing additionalProperties/unevaluatedProperties constraint
--
>> Documentation/devicetree/bindings/thermal/qcom-tsens.yaml:64:1: found a tab character that violates indentation
   Documentation/devicetree/bindings/pinctrl/xlnx,versal-pinctrl.yaml: allOf: Missing additionalProperties/unevaluatedProperties constraint
--
   Documentation/devicetree/bindings/media/fsl,imx6q-vdoa.yaml:19:12: [error] string value is redundantly quoted with any quotes (quoted-strings)
>> Documentation/devicetree/bindings/thermal/qcom-tsens.yaml:64:1: [error] syntax error: found character '\t' that cannot start any token (syntax)
--
>> Documentation/devicetree/bindings/thermal/qcom-tsens.yaml:64:1: found a tab character that violates indentation

vim +64 Documentation/devicetree/bindings/thermal/qcom-tsens.yaml

a877e768f65521 Amit Kucheria                    2019-11-01    9  
a877e768f65521 Amit Kucheria                    2019-11-01   10  maintainers:
71eef84e37302d Amit Kucheria                    2020-06-30   11    - Amit Kucheria <amitk@kernel.org>
a877e768f65521 Amit Kucheria                    2019-11-01   12  
a877e768f65521 Amit Kucheria                    2019-11-01   13  description: |
a877e768f65521 Amit Kucheria                    2019-11-01   14    QCOM SoCs have TSENS IP to allow temperature measurement. There are currently
a877e768f65521 Amit Kucheria                    2019-11-01   15    three distinct major versions of the IP that is supported by a single driver.
a877e768f65521 Amit Kucheria                    2019-11-01   16    The IP versions are named v0.1, v1 and v2 in the driver, where v0.1 captures
a877e768f65521 Amit Kucheria                    2019-11-01   17    everything before v1 when there was no versioning information.
a877e768f65521 Amit Kucheria                    2019-11-01   18  
a877e768f65521 Amit Kucheria                    2019-11-01   19  properties:
a877e768f65521 Amit Kucheria                    2019-11-01   20    compatible:
a877e768f65521 Amit Kucheria                    2019-11-01   21      oneOf:
a63fa2b601f10f Dmitry Baryshkov                 2022-04-06   22        - description: msm8960 TSENS based
26b2f03d2adf43 Christian Marangi                2021-04-20   23          items:
26b2f03d2adf43 Christian Marangi                2021-04-20   24            - enum:
26b2f03d2adf43 Christian Marangi                2021-04-20   25                - qcom,ipq8064-tsens
a63fa2b601f10f Dmitry Baryshkov                 2022-04-06   26                - qcom,msm8960-tsens
26b2f03d2adf43 Christian Marangi                2021-04-20   27  
a877e768f65521 Amit Kucheria                    2019-11-01   28        - description: v0.1 of TSENS
a877e768f65521 Amit Kucheria                    2019-11-01   29          items:
a877e768f65521 Amit Kucheria                    2019-11-01   30            - enum:
957781612e44f9 Konrad Dybcio                    2021-03-19   31                - qcom,mdm9607-tsens
065ab3abf97a3f Matti Lehtimäki                  2023-05-07   32                - qcom,msm8226-tsens
ba3bcfebea9731 Stephan Gerhold                  2023-06-07   33                - qcom,msm8909-tsens
a877e768f65521 Amit Kucheria                    2019-11-01   34                - qcom,msm8916-tsens
ec99756ae13948 Konrad Dybcio                    2020-06-29   35                - qcom,msm8939-tsens
a877e768f65521 Amit Kucheria                    2019-11-01   36                - qcom,msm8974-tsens
a877e768f65521 Amit Kucheria                    2019-11-01   37            - const: qcom,tsens-v0_1
a877e768f65521 Amit Kucheria                    2019-11-01   38  
8d6f8d5c585f02 George Moussalem                 2025-08-18   39        - description:
8d6f8d5c585f02 George Moussalem                 2025-08-18   40            v1 of TSENS without RPM which requires to be explicitly reset
8d6f8d5c585f02 George Moussalem                 2025-08-18   41            and enabled in the driver.
8d6f8d5c585f02 George Moussalem                 2025-08-18   42          enum:
8d6f8d5c585f02 George Moussalem                 2025-08-18   43            - qcom,ipq5018-tsens
8d6f8d5c585f02 George Moussalem                 2025-08-18   44  
a877e768f65521 Amit Kucheria                    2019-11-01   45        - description: v1 of TSENS
a877e768f65521 Amit Kucheria                    2019-11-01   46          items:
a877e768f65521 Amit Kucheria                    2019-11-01   47            - enum:
fd9d75ef4686a5 Barnabás Czémán                  2024-11-13   48                - qcom,msm8937-tsens
8c1421456073aa Dmitry Baryshkov                 2023-01-01   49                - qcom,msm8956-tsens
da73f9b898b26f AngeloGioacchino Del Regno       2019-10-05   50                - qcom,msm8976-tsens
a877e768f65521 Amit Kucheria                    2019-11-01   51                - qcom,qcs404-tsens
a877e768f65521 Amit Kucheria                    2019-11-01   52            - const: qcom,tsens-v1
a877e768f65521 Amit Kucheria                    2019-11-01   53  
a877e768f65521 Amit Kucheria                    2019-11-01   54        - description: v2 of TSENS
a877e768f65521 Amit Kucheria                    2019-11-01   55          items:
a877e768f65521 Amit Kucheria                    2019-11-01   56            - enum:
79428e60897916 Manaf Meethalavalappu Pallikunhi 2025-09-20   57                - qcom,glymur-tsens
e1304efc19ee5c Manaf Meethalavalappu Pallikunhi 2025-10-21   58                - qcom,kaanapali-tsens
47f4bef6e71914 Luca Weiss                       2025-07-13   59                - qcom,milos-tsens
e8ec6bb302074e Luca Weiss                       2022-02-20   60                - qcom,msm8953-tsens
a877e768f65521 Amit Kucheria                    2019-11-01   61                - qcom,msm8996-tsens
a877e768f65521 Amit Kucheria                    2019-11-01   62                - qcom,msm8998-tsens
05570560d2d433 Konrad Dybcio                    2023-05-16   63                - qcom,qcm2290-tsens
1ee90870ce797f Gaurav Kohli                     2025-08-22  @64  	      - qcom,qcs8300-tsens
4ae50c82a5ab90 Gaurav Kohli                     2025-06-24   65                - qcom,qcs615-tsens
f41e6475ff100f Nikunj Kela                      2024-08-28   66                - qcom,sa8255p-tsens
50ab53095326d4 Priyansh Jain                    2023-09-26   67                - qcom,sa8775p-tsens
59e127d58c8df6 Dmitry Baryshkov                 2024-10-27   68                - qcom,sar2130p-tsens
2f8caa9f8f3254 Rajeshwari Ravindra Kamble       2020-01-06   69                - qcom,sc7180-tsens
c6e66f5c211475 Rajeshwari Ravindra Kamble       2021-05-07   70                - qcom,sc7280-tsens
481bd297291b59 Bjorn Andersson                  2021-06-08   71                - qcom,sc8180x-tsens
30988d3b31b1e8 Bjorn Andersson                  2022-05-03   72                - qcom,sc8280xp-tsens
7c54b82b454538 Konrad Dybcio                    2021-07-29   73                - qcom,sdm630-tsens
a877e768f65521 Amit Kucheria                    2019-11-01   74                - qcom,sdm845-tsens
47612a9fc4b822 Adam Skladowski                  2022-11-30   75                - qcom,sm6115-tsens
0bd1767942625c Luca Weiss                       2021-12-13   76                - qcom,sm6350-tsens
0849027b093b37 Konrad Dybcio                    2023-05-16   77                - qcom,sm6375-tsens
cedddb263ed901 Amit Kucheria                    2020-06-09   78                - qcom,sm8150-tsens
cedddb263ed901 Amit Kucheria                    2020-06-09   79                - qcom,sm8250-tsens
c0612265295bc7 Robert Foss                      2021-03-24   80                - qcom,sm8350-tsens
f0f4c3adcfe6d9 Luca Weiss                       2022-10-16   81                - qcom,sm8450-tsens
4a9f20112c22cd Neil Armstrong                   2022-11-16   82                - qcom,sm8550-tsens
748b49c7dfe59d Neil Armstrong                   2023-11-28   83                - qcom,sm8650-tsens
b18ce693a26526 Abel Vesa                        2024-06-28   84                - qcom,x1e80100-tsens
a877e768f65521 Amit Kucheria                    2019-11-01   85            - const: qcom,tsens-v2
a877e768f65521 Amit Kucheria                    2019-11-01   86  
c6db32ec7c600a Robert Marko                     2022-08-19   87        - description: v2 of TSENS with combined interrupt
c6db32ec7c600a Robert Marko                     2022-08-19   88          enum:
1a685e2b3fc70f Praveenkumar I                   2025-02-10   89            - qcom,ipq5332-tsens
1a685e2b3fc70f Praveenkumar I                   2025-02-10   90            - qcom,ipq5424-tsens
c6db32ec7c600a Robert Marko                     2022-08-19   91            - qcom,ipq8074-tsens
c6db32ec7c600a Robert Marko                     2022-08-19   92  
074ccf8d6ce9f3 Praveenkumar I                   2023-06-07   93        - description: v2 of TSENS with combined interrupt
074ccf8d6ce9f3 Praveenkumar I                   2023-06-07   94          items:
074ccf8d6ce9f3 Praveenkumar I                   2023-06-07   95            - enum:
fed79caaf76542 Rayyan Ansari                    2024-07-16   96                - qcom,ipq6018-tsens
074ccf8d6ce9f3 Praveenkumar I                   2023-06-07   97                - qcom,ipq9574-tsens
074ccf8d6ce9f3 Praveenkumar I                   2023-06-07   98            - const: qcom,ipq8074-tsens
074ccf8d6ce9f3 Praveenkumar I                   2023-06-07   99  
a877e768f65521 Amit Kucheria                    2019-11-01  100    reg:
a877e768f65521 Amit Kucheria                    2019-11-01  101      items:
a877e768f65521 Amit Kucheria                    2019-11-01  102        - description: TM registers
a877e768f65521 Amit Kucheria                    2019-11-01  103        - description: SROT registers
a877e768f65521 Amit Kucheria                    2019-11-01  104  
27f747b12313d0 Rob Herring                      2020-03-24  105    interrupts:
27f747b12313d0 Rob Herring                      2020-03-24  106      minItems: 1
c6db32ec7c600a Robert Marko                     2022-08-19  107      maxItems: 2
27f747b12313d0 Rob Herring                      2020-03-24  108  
27f747b12313d0 Rob Herring                      2020-03-24  109    interrupt-names:
27f747b12313d0 Rob Herring                      2020-03-24  110      minItems: 1
c6db32ec7c600a Robert Marko                     2022-08-19  111      maxItems: 2
27f747b12313d0 Rob Herring                      2020-03-24  112  
a877e768f65521 Amit Kucheria                    2019-11-01  113    nvmem-cells:
4f4292bf12f2dd Dmitry Baryshkov                 2023-01-01  114      oneOf:
4f4292bf12f2dd Dmitry Baryshkov                 2023-01-01  115        - minItems: 1
a877e768f65521 Amit Kucheria                    2019-11-01  116          maxItems: 2
a877e768f65521 Amit Kucheria                    2019-11-01  117          description:
a877e768f65521 Amit Kucheria                    2019-11-01  118            Reference to an nvmem node for the calibration data
4f4292bf12f2dd Dmitry Baryshkov                 2023-01-01  119        - minItems: 5
4f4292bf12f2dd Dmitry Baryshkov                 2023-01-01  120          maxItems: 35
4f4292bf12f2dd Dmitry Baryshkov                 2023-01-01  121          description: |
4f4292bf12f2dd Dmitry Baryshkov                 2023-01-01  122            Reference to nvmem cells for the calibration mode, two calibration
4f4292bf12f2dd Dmitry Baryshkov                 2023-01-01  123            bases and two cells per each sensor
acd31b9f225bc2 Dmitry Baryshkov                 2023-01-01  124          # special case for msm8974 / apq8084
acd31b9f225bc2 Dmitry Baryshkov                 2023-01-01  125        - maxItems: 51
acd31b9f225bc2 Dmitry Baryshkov                 2023-01-01  126          description: |
acd31b9f225bc2 Dmitry Baryshkov                 2023-01-01  127            Reference to nvmem cells for the calibration mode, two calibration
acd31b9f225bc2 Dmitry Baryshkov                 2023-01-01  128            bases and two cells per each sensor, main and backup copies, plus use_backup cell
a877e768f65521 Amit Kucheria                    2019-11-01  129  
b9589def9f9af9 Rob Herring                      2020-03-24  130    nvmem-cell-names:
4f4292bf12f2dd Dmitry Baryshkov                 2023-01-01  131      oneOf:
4f4292bf12f2dd Dmitry Baryshkov                 2023-01-01  132        - minItems: 1
a877e768f65521 Amit Kucheria                    2019-11-01  133          items:
b9589def9f9af9 Rob Herring                      2020-03-24  134            - const: calib
26b2f03d2adf43 Christian Marangi                2021-04-20  135            - enum:
26b2f03d2adf43 Christian Marangi                2021-04-20  136                - calib_backup
26b2f03d2adf43 Christian Marangi                2021-04-20  137                - calib_sel
4f4292bf12f2dd Dmitry Baryshkov                 2023-01-01  138        - minItems: 5
4f4292bf12f2dd Dmitry Baryshkov                 2023-01-01  139          items:
4f4292bf12f2dd Dmitry Baryshkov                 2023-01-01  140            - const: mode
4f4292bf12f2dd Dmitry Baryshkov                 2023-01-01  141            - const: base1
4f4292bf12f2dd Dmitry Baryshkov                 2023-01-01  142            - const: base2
4f4292bf12f2dd Dmitry Baryshkov                 2023-01-01  143            - pattern: '^s[0-9]+_p1$'
4f4292bf12f2dd Dmitry Baryshkov                 2023-01-01  144            - pattern: '^s[0-9]+_p2$'
4f4292bf12f2dd Dmitry Baryshkov                 2023-01-01  145            - pattern: '^s[0-9]+_p1$'
4f4292bf12f2dd Dmitry Baryshkov                 2023-01-01  146            - pattern: '^s[0-9]+_p2$'
4f4292bf12f2dd Dmitry Baryshkov                 2023-01-01  147            - pattern: '^s[0-9]+_p1$'
4f4292bf12f2dd Dmitry Baryshkov                 2023-01-01  148            - pattern: '^s[0-9]+_p2$'
4f4292bf12f2dd Dmitry Baryshkov                 2023-01-01  149            - pattern: '^s[0-9]+_p1$'
4f4292bf12f2dd Dmitry Baryshkov                 2023-01-01  150            - pattern: '^s[0-9]+_p2$'
4f4292bf12f2dd Dmitry Baryshkov                 2023-01-01  151            - pattern: '^s[0-9]+_p1$'
4f4292bf12f2dd Dmitry Baryshkov                 2023-01-01  152            - pattern: '^s[0-9]+_p2$'
4f4292bf12f2dd Dmitry Baryshkov                 2023-01-01  153            - pattern: '^s[0-9]+_p1$'
4f4292bf12f2dd Dmitry Baryshkov                 2023-01-01  154            - pattern: '^s[0-9]+_p2$'
4f4292bf12f2dd Dmitry Baryshkov                 2023-01-01  155            - pattern: '^s[0-9]+_p1$'
4f4292bf12f2dd Dmitry Baryshkov                 2023-01-01  156            - pattern: '^s[0-9]+_p2$'
4f4292bf12f2dd Dmitry Baryshkov                 2023-01-01  157            - pattern: '^s[0-9]+_p1$'
4f4292bf12f2dd Dmitry Baryshkov                 2023-01-01  158            - pattern: '^s[0-9]+_p2$'
4f4292bf12f2dd Dmitry Baryshkov                 2023-01-01  159            - pattern: '^s[0-9]+_p1$'
4f4292bf12f2dd Dmitry Baryshkov                 2023-01-01  160            - pattern: '^s[0-9]+_p2$'
4f4292bf12f2dd Dmitry Baryshkov                 2023-01-01  161            - pattern: '^s[0-9]+_p1$'
4f4292bf12f2dd Dmitry Baryshkov                 2023-01-01  162            - pattern: '^s[0-9]+_p2$'
4f4292bf12f2dd Dmitry Baryshkov                 2023-01-01  163            - pattern: '^s[0-9]+_p1$'
4f4292bf12f2dd Dmitry Baryshkov                 2023-01-01  164            - pattern: '^s[0-9]+_p2$'
4f4292bf12f2dd Dmitry Baryshkov                 2023-01-01  165            - pattern: '^s[0-9]+_p1$'
4f4292bf12f2dd Dmitry Baryshkov                 2023-01-01  166            - pattern: '^s[0-9]+_p2$'
4f4292bf12f2dd Dmitry Baryshkov                 2023-01-01  167            - pattern: '^s[0-9]+_p1$'
4f4292bf12f2dd Dmitry Baryshkov                 2023-01-01  168            - pattern: '^s[0-9]+_p2$'
4f4292bf12f2dd Dmitry Baryshkov                 2023-01-01  169            - pattern: '^s[0-9]+_p1$'
4f4292bf12f2dd Dmitry Baryshkov                 2023-01-01  170            - pattern: '^s[0-9]+_p2$'
4f4292bf12f2dd Dmitry Baryshkov                 2023-01-01  171            - pattern: '^s[0-9]+_p1$'
4f4292bf12f2dd Dmitry Baryshkov                 2023-01-01  172            - pattern: '^s[0-9]+_p2$'
4f4292bf12f2dd Dmitry Baryshkov                 2023-01-01  173            - pattern: '^s[0-9]+_p1$'
4f4292bf12f2dd Dmitry Baryshkov                 2023-01-01  174            - pattern: '^s[0-9]+_p2$'
acd31b9f225bc2 Dmitry Baryshkov                 2023-01-01  175          # special case for msm8974 / apq8084
acd31b9f225bc2 Dmitry Baryshkov                 2023-01-01  176        - items:
acd31b9f225bc2 Dmitry Baryshkov                 2023-01-01  177            - const: mode
acd31b9f225bc2 Dmitry Baryshkov                 2023-01-01  178            - const: base1
acd31b9f225bc2 Dmitry Baryshkov                 2023-01-01  179            - const: base2
acd31b9f225bc2 Dmitry Baryshkov                 2023-01-01  180            - const: use_backup
acd31b9f225bc2 Dmitry Baryshkov                 2023-01-01  181            - const: mode_backup
acd31b9f225bc2 Dmitry Baryshkov                 2023-01-01  182            - const: base1_backup
acd31b9f225bc2 Dmitry Baryshkov                 2023-01-01  183            - const: base2_backup
acd31b9f225bc2 Dmitry Baryshkov                 2023-01-01  184            - const: s0_p1
acd31b9f225bc2 Dmitry Baryshkov                 2023-01-01  185            - const: s0_p2
acd31b9f225bc2 Dmitry Baryshkov                 2023-01-01  186            - const: s1_p1
acd31b9f225bc2 Dmitry Baryshkov                 2023-01-01  187            - const: s1_p2
acd31b9f225bc2 Dmitry Baryshkov                 2023-01-01  188            - const: s2_p1
acd31b9f225bc2 Dmitry Baryshkov                 2023-01-01  189            - const: s2_p2
acd31b9f225bc2 Dmitry Baryshkov                 2023-01-01  190            - const: s3_p1
acd31b9f225bc2 Dmitry Baryshkov                 2023-01-01  191            - const: s3_p2
acd31b9f225bc2 Dmitry Baryshkov                 2023-01-01  192            - const: s4_p1
acd31b9f225bc2 Dmitry Baryshkov                 2023-01-01  193            - const: s4_p2
acd31b9f225bc2 Dmitry Baryshkov                 2023-01-01  194            - const: s5_p1
acd31b9f225bc2 Dmitry Baryshkov                 2023-01-01  195            - const: s5_p2
acd31b9f225bc2 Dmitry Baryshkov                 2023-01-01  196            - const: s6_p1
acd31b9f225bc2 Dmitry Baryshkov                 2023-01-01  197            - const: s6_p2
acd31b9f225bc2 Dmitry Baryshkov                 2023-01-01  198            - const: s7_p1
acd31b9f225bc2 Dmitry Baryshkov                 2023-01-01  199            - const: s7_p2
acd31b9f225bc2 Dmitry Baryshkov                 2023-01-01  200            - const: s8_p1
acd31b9f225bc2 Dmitry Baryshkov                 2023-01-01  201            - const: s8_p2
acd31b9f225bc2 Dmitry Baryshkov                 2023-01-01  202            - const: s9_p1
acd31b9f225bc2 Dmitry Baryshkov                 2023-01-01  203            - const: s9_p2
acd31b9f225bc2 Dmitry Baryshkov                 2023-01-01  204            - const: s10_p1
acd31b9f225bc2 Dmitry Baryshkov                 2023-01-01  205            - const: s10_p2
acd31b9f225bc2 Dmitry Baryshkov                 2023-01-01  206            - const: s0_p1_backup
acd31b9f225bc2 Dmitry Baryshkov                 2023-01-01  207            - const: s0_p2_backup
acd31b9f225bc2 Dmitry Baryshkov                 2023-01-01  208            - const: s1_p1_backup
acd31b9f225bc2 Dmitry Baryshkov                 2023-01-01  209            - const: s1_p2_backup
acd31b9f225bc2 Dmitry Baryshkov                 2023-01-01  210            - const: s2_p1_backup
acd31b9f225bc2 Dmitry Baryshkov                 2023-01-01  211            - const: s2_p2_backup
acd31b9f225bc2 Dmitry Baryshkov                 2023-01-01  212            - const: s3_p1_backup
acd31b9f225bc2 Dmitry Baryshkov                 2023-01-01  213            - const: s3_p2_backup
acd31b9f225bc2 Dmitry Baryshkov                 2023-01-01  214            - const: s4_p1_backup
acd31b9f225bc2 Dmitry Baryshkov                 2023-01-01  215            - const: s4_p2_backup
acd31b9f225bc2 Dmitry Baryshkov                 2023-01-01  216            - const: s5_p1_backup
acd31b9f225bc2 Dmitry Baryshkov                 2023-01-01  217            - const: s5_p2_backup
acd31b9f225bc2 Dmitry Baryshkov                 2023-01-01  218            - const: s6_p1_backup
acd31b9f225bc2 Dmitry Baryshkov                 2023-01-01  219            - const: s6_p2_backup
acd31b9f225bc2 Dmitry Baryshkov                 2023-01-01  220            - const: s7_p1_backup
acd31b9f225bc2 Dmitry Baryshkov                 2023-01-01  221            - const: s7_p2_backup
acd31b9f225bc2 Dmitry Baryshkov                 2023-01-01  222            - const: s8_p1_backup
acd31b9f225bc2 Dmitry Baryshkov                 2023-01-01  223            - const: s8_p2_backup
acd31b9f225bc2 Dmitry Baryshkov                 2023-01-01  224            - const: s9_p1_backup
acd31b9f225bc2 Dmitry Baryshkov                 2023-01-01  225            - const: s9_p2_backup
acd31b9f225bc2 Dmitry Baryshkov                 2023-01-01  226            - const: s10_p1_backup
acd31b9f225bc2 Dmitry Baryshkov                 2023-01-01  227            - const: s10_p2_backup
1a685e2b3fc70f Praveenkumar I                   2025-02-10  228        - minItems: 8
1a685e2b3fc70f Praveenkumar I                   2025-02-10  229          items:
1a685e2b3fc70f Praveenkumar I                   2025-02-10  230            - const: mode
1a685e2b3fc70f Praveenkumar I                   2025-02-10  231            - const: base0
1a685e2b3fc70f Praveenkumar I                   2025-02-10  232            - const: base1
1a685e2b3fc70f Praveenkumar I                   2025-02-10  233            - pattern: '^tsens_sens[0-9]+_off$'
1a685e2b3fc70f Praveenkumar I                   2025-02-10  234            - pattern: '^tsens_sens[0-9]+_off$'
1a685e2b3fc70f Praveenkumar I                   2025-02-10  235            - pattern: '^tsens_sens[0-9]+_off$'
1a685e2b3fc70f Praveenkumar I                   2025-02-10  236            - pattern: '^tsens_sens[0-9]+_off$'
1a685e2b3fc70f Praveenkumar I                   2025-02-10  237            - pattern: '^tsens_sens[0-9]+_off$'
1a685e2b3fc70f Praveenkumar I                   2025-02-10  238            - pattern: '^tsens_sens[0-9]+_off$'
1a685e2b3fc70f Praveenkumar I                   2025-02-10  239            - pattern: '^tsens_sens[0-9]+_off$'
a877e768f65521 Amit Kucheria                    2019-11-01  240  
a877e768f65521 Amit Kucheria                    2019-11-01  241    "#qcom,sensors":
a877e768f65521 Amit Kucheria                    2019-11-01  242      description:
a877e768f65521 Amit Kucheria                    2019-11-01  243        Number of sensors enabled on this platform
3d21a46093352f Rob Herring                      2020-04-15  244      $ref: /schemas/types.yaml#/definitions/uint32
3d21a46093352f Rob Herring                      2020-04-15  245      minimum: 1
3d21a46093352f Rob Herring                      2020-04-15  246      maximum: 16
a877e768f65521 Amit Kucheria                    2019-11-01  247  
a877e768f65521 Amit Kucheria                    2019-11-01  248    "#thermal-sensor-cells":
a877e768f65521 Amit Kucheria                    2019-11-01  249      const: 1
a877e768f65521 Amit Kucheria                    2019-11-01  250  
26b2f03d2adf43 Christian Marangi                2021-04-20  251  required:
26b2f03d2adf43 Christian Marangi                2021-04-20  252    - compatible
26b2f03d2adf43 Christian Marangi                2021-04-20  253    - interrupts
26b2f03d2adf43 Christian Marangi                2021-04-20  254    - interrupt-names
26b2f03d2adf43 Christian Marangi                2021-04-20  255    - "#qcom,sensors"
26b2f03d2adf43 Christian Marangi                2021-04-20  256  
a877e768f65521 Amit Kucheria                    2019-11-01  257  allOf:
80c3fda5de2cf5 Krzysztof Kozlowski              2024-07-05  258    - $ref: thermal-sensor.yaml#
80c3fda5de2cf5 Krzysztof Kozlowski              2024-07-05  259  
a877e768f65521 Amit Kucheria                    2019-11-01  260    - if:
a877e768f65521 Amit Kucheria                    2019-11-01  261        properties:
a877e768f65521 Amit Kucheria                    2019-11-01  262          compatible:
a877e768f65521 Amit Kucheria                    2019-11-01  263            contains:
a877e768f65521 Amit Kucheria                    2019-11-01  264              enum:
77c6d28192ef59 Sricharan Ramabadhran            2025-02-28  265                - qcom,ipq5018-tsens
26b2f03d2adf43 Christian Marangi                2021-04-20  266                - qcom,ipq8064-tsens
a63fa2b601f10f Dmitry Baryshkov                 2022-04-06  267                - qcom,msm8960-tsens
a877e768f65521 Amit Kucheria                    2019-11-01  268                - qcom,tsens-v0_1
a877e768f65521 Amit Kucheria                    2019-11-01  269                - qcom,tsens-v1
a877e768f65521 Amit Kucheria                    2019-11-01  270      then:
a877e768f65521 Amit Kucheria                    2019-11-01  271        properties:
a877e768f65521 Amit Kucheria                    2019-11-01  272          interrupts:
c6db32ec7c600a Robert Marko                     2022-08-19  273            items:
c6db32ec7c600a Robert Marko                     2022-08-19  274              - description: Combined interrupt if upper or lower threshold crossed
c6db32ec7c600a Robert Marko                     2022-08-19  275          interrupt-names:
c6db32ec7c600a Robert Marko                     2022-08-19  276            items:
c6db32ec7c600a Robert Marko                     2022-08-19  277              - const: uplow
c6db32ec7c600a Robert Marko                     2022-08-19  278  
c6db32ec7c600a Robert Marko                     2022-08-19  279    - if:
c6db32ec7c600a Robert Marko                     2022-08-19  280        properties:
c6db32ec7c600a Robert Marko                     2022-08-19  281          compatible:
c6db32ec7c600a Robert Marko                     2022-08-19  282            contains:
a06027820da7d4 Stephan Gerhold                  2023-06-07  283              const: qcom,tsens-v2
c6db32ec7c600a Robert Marko                     2022-08-19  284      then:
c6db32ec7c600a Robert Marko                     2022-08-19  285        properties:
c6db32ec7c600a Robert Marko                     2022-08-19  286          interrupts:
c6db32ec7c600a Robert Marko                     2022-08-19  287            items:
c6db32ec7c600a Robert Marko                     2022-08-19  288              - description: Combined interrupt if upper or lower threshold crossed
c6db32ec7c600a Robert Marko                     2022-08-19  289              - description: Interrupt if critical threshold crossed
a877e768f65521 Amit Kucheria                    2019-11-01  290          interrupt-names:
c6db32ec7c600a Robert Marko                     2022-08-19  291            items:
c6db32ec7c600a Robert Marko                     2022-08-19  292              - const: uplow
c6db32ec7c600a Robert Marko                     2022-08-19  293              - const: critical
a877e768f65521 Amit Kucheria                    2019-11-01  294  
c6db32ec7c600a Robert Marko                     2022-08-19  295    - if:
c6db32ec7c600a Robert Marko                     2022-08-19  296        properties:
c6db32ec7c600a Robert Marko                     2022-08-19  297          compatible:
c6db32ec7c600a Robert Marko                     2022-08-19  298            contains:
c6db32ec7c600a Robert Marko                     2022-08-19  299              enum:
1a685e2b3fc70f Praveenkumar I                   2025-02-10  300                - qcom,ipq5332-tsens
1a685e2b3fc70f Praveenkumar I                   2025-02-10  301                - qcom,ipq5424-tsens
c6db32ec7c600a Robert Marko                     2022-08-19  302                - qcom,ipq8074-tsens
c6db32ec7c600a Robert Marko                     2022-08-19  303      then:
a877e768f65521 Amit Kucheria                    2019-11-01  304        properties:
a877e768f65521 Amit Kucheria                    2019-11-01  305          interrupts:
c6db32ec7c600a Robert Marko                     2022-08-19  306            items:
c6db32ec7c600a Robert Marko                     2022-08-19  307              - description: Combined interrupt if upper, lower or critical thresholds crossed
a877e768f65521 Amit Kucheria                    2019-11-01  308          interrupt-names:
c6db32ec7c600a Robert Marko                     2022-08-19  309            items:
c6db32ec7c600a Robert Marko                     2022-08-19  310              - const: combined
a877e768f65521 Amit Kucheria                    2019-11-01  311  
26b2f03d2adf43 Christian Marangi                2021-04-20  312    - if:
26b2f03d2adf43 Christian Marangi                2021-04-20  313        properties:
26b2f03d2adf43 Christian Marangi                2021-04-20  314          compatible:
26b2f03d2adf43 Christian Marangi                2021-04-20  315            contains:
26b2f03d2adf43 Christian Marangi                2021-04-20  316              enum:
1a685e2b3fc70f Praveenkumar I                   2025-02-10  317                - qcom,ipq5332-tsens
1a685e2b3fc70f Praveenkumar I                   2025-02-10  318                - qcom,ipq5424-tsens
c6db32ec7c600a Robert Marko                     2022-08-19  319                - qcom,ipq8074-tsens
26b2f03d2adf43 Christian Marangi                2021-04-20  320                - qcom,tsens-v0_1
26b2f03d2adf43 Christian Marangi                2021-04-20  321                - qcom,tsens-v1
26b2f03d2adf43 Christian Marangi                2021-04-20  322                - qcom,tsens-v2
26b2f03d2adf43 Christian Marangi                2021-04-20  323  
26b2f03d2adf43 Christian Marangi                2021-04-20  324      then:
a877e768f65521 Amit Kucheria                    2019-11-01  325        required:
a877e768f65521 Amit Kucheria                    2019-11-01  326          - reg
a877e768f65521 Amit Kucheria                    2019-11-01  327  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
