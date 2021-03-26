Content-Type: multipart/mixed; boundary="===============7600840067455227391=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [phy-linux-phy:next 18/21] dtbs_check: arch/arm/boot/dts/mt7629-rfb.dt.yaml: pcie-phy@1a14a000: 'port1phy@0' does not match any of the regexes:
Date: Fri, 26 Mar 2021 14:11:35 +0800
Message-ID: <202103261431.5jPnKzpy-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7600840067455227391==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: Vinod Koul <vkoul@kernel.org>
CC: Kishon <kishon@ti.com>
TO: Chunfeng Yun <chunfeng.yun@mediatek.com>
CC: Vinod Koul <vkoul@kernel.org>
CC: Rob Herring <robh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/phy/linux-phy.git n=
ext
head:   0d811cda22abeeeb8d3412ac17b687764f4b4c9f
commit: 5c977c69c8b2be793b3f5a11a97addabdea47f8b [18/21] dt-bindings: phy: =
mediatek: tphy: change patternProperties
:::::: branch date: 23 hours ago
:::::: commit date: 23 hours ago
compiler: arm-linux-gnueabi-gcc (GCC) 9.3.0
reproduce: make ARCH=3Darm dtbs_check

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/mt7629-rfb.dt.yaml: pcie-phy(a)1a14a000: $nodename:0: =
'pcie-phy(a)1a14a000' does not match '^t-phy@[0-9a-f]+$'
   	From schema: Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
   arch/arm/boot/dts/mt7629-rfb.dt.yaml: pcie-phy(a)1a14a000: compatible: '=
oneOf' conditional failed, one must be fixed:
   	['mediatek,generic-tphy-v2'] is too short
   	'mediatek,generic-tphy-v2' is not one of ['mediatek,mt2701-tphy', 'medi=
atek,mt7623-tphy', 'mediatek,mt7622-tphy', 'mediatek,mt8516-tphy']
   	'mediatek,generic-tphy-v2' is not one of ['mediatek,mt2712-tphy', 'medi=
atek,mt7629-tphy', 'mediatek,mt8183-tphy', 'mediatek,mt8195-tphy']
   	'mediatek,mt2701-u3phy' was expected
   	'mediatek,mt2712-u3phy' was expected
   	'mediatek,mt8173-u3phy' was expected
   	From schema: Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
>> arch/arm/boot/dts/mt7629-rfb.dt.yaml: pcie-phy(a)1a14a000: 'port1phy(a)0=
' does not match any of the regexes: '^(usb|pcie|sata)-phy@[0-9a-f]+$', 'pi=
nctrl-[0-9]+'
   	From schema: Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
   arch/arm/boot/dts/mt7629-rfb.dt.yaml: pcie-phy(a)1a14a000: '#phy-cells' =
is a required property
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/ph=
y/phy-provider.yaml

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7600840067455227391==--

