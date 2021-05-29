Content-Type: multipart/mixed; boundary="===============3965278007485262123=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [chrome-os:chromeos-5.4 7/10] dtbs_check: make[2]: *** [scripts/Makefile.lib:300: arch/arm/boot/dts/qcom-apq8074-dragonboard.dt.yaml] Error 255
Date: Sat, 29 May 2021 14:57:45 +0800
Message-ID: <202105291443.IL8teNdd-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3965278007485262123==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: cros-kernel-buildreports(a)googlegroups.com
TO: Guenter Roeck <groeck@google.com>

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chr=
omeos-5.4
head:   b0e815fd1d10aed3f5bb0e33654c31db68fcfa0a
commit: 0b7ab10669938f2878c681ea4d2b807f6ab3cecd [7/10] FROMGIT: dt-binding=
s: msm: dsi: add yaml schemas for DSI bindings
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
compiler: arm-linux-gnueabi-gcc (GCC) 9.3.0
reproduce: make ARCH=3Darm dtbs_check

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


dtcheck warnings: (new ones prefixed by >>)
   make[2]: *** [scripts/Makefile.lib:300: arch/arm/boot/dts/exynos5250-spr=
ing.dt.yaml] Error 255
   make[2]: *** Deleting file 'arch/arm/boot/dts/exynos5250-spring.dt.yaml'
   make[2]: *** [scripts/Makefile.lib:300: arch/arm/boot/dts/exynos5250-sno=
w-rev5.dt.yaml] Error 255
   make[2]: *** Deleting file 'arch/arm/boot/dts/exynos5250-snow-rev5.dt.ya=
ml'
   make[2]: *** [scripts/Makefile.lib:300: arch/arm/boot/dts/exynos5250-sno=
w.dt.yaml] Error 255
   make[2]: *** Deleting file 'arch/arm/boot/dts/exynos5250-snow.dt.yaml'
   make[2]: *** [scripts/Makefile.lib:300: arch/arm/boot/dts/exynos5420-pea=
ch-pit.dt.yaml] Error 255
   make[2]: *** Deleting file 'arch/arm/boot/dts/exynos5420-peach-pit.dt.ya=
ml'
   make[2]: *** [scripts/Makefile.lib:300: arch/arm/boot/dts/exynos5800-pea=
ch-pi.dt.yaml] Error 255
   make[2]: *** Deleting file 'arch/arm/boot/dts/exynos5800-peach-pi.dt.yam=
l'
>> make[2]: *** [scripts/Makefile.lib:300: arch/arm/boot/dts/qcom-apq8074-d=
ragonboard.dt.yaml] Error 255
   make[2]: *** Deleting file 'arch/arm/boot/dts/qcom-apq8074-dragonboard.d=
t.yaml'
   make[2]: *** [scripts/Makefile.lib:300: arch/arm/boot/dts/qcom-apq8064-a=
sus-nexus7-flo.dt.yaml] Error 255
   make[2]: *** Deleting file 'arch/arm/boot/dts/qcom-apq8064-asus-nexus7-f=
lo.dt.yaml'
   make[2]: *** [scripts/Makefile.lib:300: arch/arm/boot/dts/qcom-apq8064-c=
m-qs600.dt.yaml] Error 255
   make[2]: *** Deleting file 'arch/arm/boot/dts/qcom-apq8064-cm-qs600.dt.y=
aml'
   make[2]: *** [scripts/Makefile.lib:300: arch/arm/boot/dts/qcom-apq8064-s=
ony-xperia-yuga.dt.yaml] Error 255
   make[2]: *** Deleting file 'arch/arm/boot/dts/qcom-apq8064-sony-xperia-y=
uga.dt.yaml'
   make[2]: *** [scripts/Makefile.lib:300: arch/arm/boot/dts/qcom-apq8064-i=
fc6410.dt.yaml] Error 255
   make[2]: *** Deleting file 'arch/arm/boot/dts/qcom-apq8064-ifc6410.dt.ya=
ml'
>> make[2]: *** [scripts/Makefile.lib:300: arch/arm/boot/dts/qcom-msm8974-f=
airphone-fp2.dt.yaml] Error 255
   make[2]: *** Deleting file 'arch/arm/boot/dts/qcom-msm8974-fairphone-fp2=
.dt.yaml'
>> make[2]: *** [scripts/Makefile.lib:300: arch/arm/boot/dts/qcom-msm8974-l=
ge-nexus5-hammerhead.dt.yaml] Error 255
   make[2]: *** Deleting file 'arch/arm/boot/dts/qcom-msm8974-lge-nexus5-ha=
mmerhead.dt.yaml'
>> make[2]: *** [scripts/Makefile.lib:300: arch/arm/boot/dts/qcom-msm8974-s=
ony-xperia-amami.dt.yaml] Error 255
   make[2]: *** Deleting file 'arch/arm/boot/dts/qcom-msm8974-sony-xperia-a=
mami.dt.yaml'
>> make[2]: *** [scripts/Makefile.lib:300: arch/arm/boot/dts/qcom-msm8974-s=
ony-xperia-castor.dt.yaml] Error 255
   make[2]: *** Deleting file 'arch/arm/boot/dts/qcom-msm8974-sony-xperia-c=
astor.dt.yaml'
>> make[2]: *** [scripts/Makefile.lib:300: arch/arm/boot/dts/qcom-msm8974-s=
amsung-klte.dt.yaml] Error 255
   make[2]: *** Deleting file 'arch/arm/boot/dts/qcom-msm8974-samsung-klte.=
dt.yaml'
>> make[2]: *** [scripts/Makefile.lib:300: arch/arm/boot/dts/qcom-msm8974-s=
ony-xperia-honami.dt.yaml] Error 255
   make[2]: *** Deleting file 'arch/arm/boot/dts/qcom-msm8974-sony-xperia-h=
onami.dt.yaml'
   make[2]: *** [scripts/Makefile.lib:300: arch/arm/boot/dts/rk3288-veyron-=
jaq.dt.yaml] Error 255
   make[2]: *** Deleting file 'arch/arm/boot/dts/rk3288-veyron-jaq.dt.yaml'
   make[2]: *** [scripts/Makefile.lib:300: arch/arm/boot/dts/rk3288-veyron-=
mighty.dt.yaml] Error 255
   make[2]: *** Deleting file 'arch/arm/boot/dts/rk3288-veyron-mighty.dt.ya=
ml'
   make[2]: *** [scripts/Makefile.lib:300: arch/arm/boot/dts/rk3288-veyron-=
minnie.dt.yaml] Error 255
   make[2]: *** Deleting file 'arch/arm/boot/dts/rk3288-veyron-minnie.dt.ya=
ml'
   make[2]: *** [scripts/Makefile.lib:300: arch/arm/boot/dts/rk3288-veyron-=
speedy.dt.yaml] Error 255
   make[2]: *** Deleting file 'arch/arm/boot/dts/rk3288-veyron-speedy.dt.ya=
ml'
   make[2]: *** [scripts/Makefile.lib:300: arch/arm/boot/dts/rk3288-veyron-=
jerry.dt.yaml] Error 255

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3965278007485262123==--

