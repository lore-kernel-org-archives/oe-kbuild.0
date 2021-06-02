Content-Type: multipart/mixed; boundary="===============4226043010758059234=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 5030/6331] dtbs_check: arch/arm/boot/dts/qcom-sdx55-t55.dt.yaml: nand-controller@1b30000: nand@0:secure-regions: More than one condition true in oneOf schema:
Date: Thu, 03 Jun 2021 03:28:12 +0800
Message-ID: <202106030309.qfprt8Gb-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4226043010758059234==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
CC: Bjorn Andersson <bjorn.andersson@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   ed5d0667a6540293c9485dd95babb5f1e241226a
commit: 619d3c4bf8f346ac9192d3c266efc9e231ca5d17 [5030/6331] ARM: dts: qcom=
: sdx55-t55: Represent secure-regions as 64-bit elements
:::::: branch date: 13 hours ago
:::::: commit date: 4 days ago
compiler: arm-linux-gnueabi-gcc (GCC) 9.3.0
reproduce: make ARCH=3Darm dtbs_check

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/qcom-sdx55-t55.dt.yaml: memory(a)8fced000: 'device_typ=
e' is a required property
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/me=
mory.yaml
   arch/arm/boot/dts/qcom-sdx55-t55.dt.yaml: memory(a)90800000: 'device_typ=
e' is a required property
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/me=
mory.yaml
   arch/arm/boot/dts/qcom-sdx55-t55.dt.yaml:0:0: /smp2p-mpss: failed to mat=
ch any schema with compatible: ['qcom,smp2p']
   arch/arm/boot/dts/qcom-sdx55-t55.dt.yaml:0:0: /soc/serial(a)831000: fail=
ed to match any schema with compatible: ['qcom,msm-uartdm-v1.4', 'qcom,msm-=
uartdm']
   arch/arm/boot/dts/qcom-sdx55-t55.dt.yaml:0:0: /soc/serial(a)831000: fail=
ed to match any schema with compatible: ['qcom,msm-uartdm-v1.4', 'qcom,msm-=
uartdm']
   arch/arm/boot/dts/qcom-sdx55-t55.dt.yaml: phy(a)ff6000: '#phy-cells' is =
a required property
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/ph=
y/phy-provider.yaml
   arch/arm/boot/dts/qcom-sdx55-t55.dt.yaml:0:0: /soc/dma-controller(a)1b04=
000: failed to match any schema with compatible: ['qcom,bam-v1.7.0']
>> arch/arm/boot/dts/qcom-sdx55-t55.dt.yaml: nand-controller(a)1b30000: nan=
d(a)0:secure-regions: More than one condition true in oneOf schema:
   	{'oneOf': [{'items': {'items': {'$ref': '#/definitions/cell'},
   	                      'minItems': 2,
   	                      'type': 'array'},
   	            'minItems': 1,
   	            'type': 'array'},
   	           {'items': {'items': {'maximum': 18446744073709551615,
   	                                'minimum': 0},
   	                      'type': 'array'},
   	            'minItems': 1,
   	            'type': 'array',
   	            'typeSize': 64}]}
   	From schema: Documentation/devicetree/bindings/mtd/nand-controller.yaml
>> arch/arm/boot/dts/qcom-sdx55-t55.dt.yaml: nand-controller(a)1b30000: nan=
d(a)0:secure-regions: More than one condition true in oneOf schema:
   	{'oneOf': [{'items': {'items': {'$ref': '#/definitions/cell'},
   	                      'minItems': 2,
   	                      'type': 'array'},
   	            'minItems': 1,
   	            'type': 'array'},
   	           {'items': {'items': {'maximum': 18446744073709551615,
   	                                'minimum': 0},
   	                      'type': 'array'},
   	            'minItems': 1,
   	            'type': 'array',

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4226043010758059234==--

