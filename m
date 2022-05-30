Content-Type: multipart/mixed; boundary="===============0046363814474821615=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/msm/adreno/a6xx_gpu.c:689:8: warning: Redundant initialization for 'regs'. The initialized value is overwritten before it is read. [redundantInitialization]
Date: Tue, 31 May 2022 05:39:21 +0800
Message-ID: <202205310503.BsxWeZbs-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0046363814474821615==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: drivers/g=
pu/drm/msm/adreno/a6xx_gpu.c:689:8: warning: Redundant initialization for '=
regs'. The initialized value is overwritten before it is read. [redundantIn=
itialization]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Rob Clark <robdclark@chromium.org>
CC: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   8ab2afa23bd197df47819a87f0265c0ac95c5b6a
commit: cca96584b35765bf9eb5f38ca55a144ea2ba0de4 drm/msm/a6xx: Fix missing =
ARRAY_SIZE() check
date:   3 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 3 months ago
compiler: arc-elf-gcc (GCC) 11.3.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout cca96584b35765bf9eb5f38ca55a144ea2ba0de4
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/gpu/drm/msm/adreno/a6xx_gpu.c:689:8: warning: Redundant initiali=
zation for 'regs'. The initialized value is overwritten before it is read. =
[redundantInitialization]
     regs =3D a650_protect;
          ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:685:18: note: regs is initialized
    const u32 *regs =3D a6xx_protect;
                    ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:689:8: note: regs is overwritten
     regs =3D a650_protect;
          ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:563:2: warning: Shifting signed 32=
-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBits=
Signed]
    A6XX_PROTECT_NORDWR(0x0050e, 0x0000),
    ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:564:2: warning: Shifting signed 32=
-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBits=
Signed]
    A6XX_PROTECT_NORDWR(0x00510, 0x0000),
    ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:565:2: warning: Shifting signed 32=
-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBits=
Signed]
    A6XX_PROTECT_NORDWR(0x00534, 0x0000),
    ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:566:2: warning: Shifting signed 32=
-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBits=
Signed]
    A6XX_PROTECT_NORDWR(0x00800, 0x0082),
    ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:567:2: warning: Shifting signed 32=
-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBits=
Signed]
    A6XX_PROTECT_NORDWR(0x008a0, 0x0008),
    ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:568:2: warning: Shifting signed 32=
-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBits=
Signed]
    A6XX_PROTECT_NORDWR(0x008ab, 0x0024),
    ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:570:2: warning: Shifting signed 32=
-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBits=
Signed]
    A6XX_PROTECT_NORDWR(0x00900, 0x004d),
    ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:571:2: warning: Shifting signed 32=
-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBits=
Signed]
    A6XX_PROTECT_NORDWR(0x0098d, 0x0272),
    ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:572:2: warning: Shifting signed 32=
-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBits=
Signed]
    A6XX_PROTECT_NORDWR(0x00e00, 0x0001),
    ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:573:2: warning: Shifting signed 32=
-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBits=
Signed]
    A6XX_PROTECT_NORDWR(0x00e03, 0x000c),
    ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:574:2: warning: Shifting signed 32=
-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBits=
Signed]
    A6XX_PROTECT_NORDWR(0x03c00, 0x00c3),
    ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:576:2: warning: Shifting signed 32=
-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBits=
Signed]
    A6XX_PROTECT_NORDWR(0x08630, 0x01cf),
    ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:577:2: warning: Shifting signed 32=
-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBits=
Signed]
    A6XX_PROTECT_NORDWR(0x08e00, 0x0000),
    ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:578:2: warning: Shifting signed 32=
-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBits=
Signed]
    A6XX_PROTECT_NORDWR(0x08e08, 0x0000),
    ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:579:2: warning: Shifting signed 32=
-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBits=
Signed]
    A6XX_PROTECT_NORDWR(0x08e50, 0x001f),
    ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:580:2: warning: Shifting signed 32=
-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBits=
Signed]
    A6XX_PROTECT_NORDWR(0x09624, 0x01db),
    ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:581:2: warning: Shifting signed 32=
-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBits=
Signed]
    A6XX_PROTECT_NORDWR(0x09e70, 0x0001),
    ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:582:2: warning: Shifting signed 32=
-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBits=
Signed]
    A6XX_PROTECT_NORDWR(0x09e78, 0x0187),
    ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:583:2: warning: Shifting signed 32=
-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBits=
Signed]
    A6XX_PROTECT_NORDWR(0x0a630, 0x01cf),
    ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:584:2: warning: Shifting signed 32=
-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBits=
Signed]
    A6XX_PROTECT_NORDWR(0x0ae02, 0x0000),
    ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:585:2: warning: Shifting signed 32=
-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBits=
Signed]
    A6XX_PROTECT_NORDWR(0x0ae50, 0x032f),
    ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:586:2: warning: Shifting signed 32=
-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBits=
Signed]
    A6XX_PROTECT_NORDWR(0x0b604, 0x0000),
    ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:587:2: warning: Shifting signed 32=
-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBits=
Signed]
    A6XX_PROTECT_NORDWR(0x0be02, 0x0001),
    ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:588:2: warning: Shifting signed 32=
-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBits=
Signed]
    A6XX_PROTECT_NORDWR(0x0be20, 0x17df),
    ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:589:2: warning: Shifting signed 32=
-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBits=
Signed]
    A6XX_PROTECT_NORDWR(0x0f000, 0x0bff),
    ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:591:2: warning: Shifting signed 32=
-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBits=
Signed]
    A6XX_PROTECT_NORDWR(0x11c00, 0x0000), /* note: infinite range */
    ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:599:2: warning: Shifting signed 32=
-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBits=
Signed]
    A6XX_PROTECT_NORDWR(0x0050e, 0x0000),
    ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:600:2: warning: Shifting signed 32=
-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBits=
Signed]
    A6XX_PROTECT_NORDWR(0x00510, 0x0000),
    ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:601:2: warning: Shifting signed 32=
-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBits=
Signed]
    A6XX_PROTECT_NORDWR(0x00534, 0x0000),

vim +/regs +689 drivers/gpu/drm/msm/adreno/a6xx_gpu.c

f6d62d091cfd1c Jonathan Marek 2021-06-08  681  =

40843403695869 Jonathan Marek 2021-05-13  682  static void a6xx_set_cp_prot=
ect(struct msm_gpu *gpu)
40843403695869 Jonathan Marek 2021-05-13  683  {
40843403695869 Jonathan Marek 2021-05-13  684  	struct adreno_gpu *adreno_g=
pu =3D to_adreno_gpu(gpu);
40843403695869 Jonathan Marek 2021-05-13  685  	const u32 *regs =3D a6xx_pr=
otect;
cca96584b35765 Rob Clark      2022-03-05  686  	unsigned i, count, count_ma=
x;
40843403695869 Jonathan Marek 2021-05-13  687  =

40843403695869 Jonathan Marek 2021-05-13  688  	if (adreno_is_a650(adreno_g=
pu)) {
40843403695869 Jonathan Marek 2021-05-13 @689  		regs =3D a650_protect;
40843403695869 Jonathan Marek 2021-05-13  690  		count =3D ARRAY_SIZE(a650_=
protect);
40843403695869 Jonathan Marek 2021-05-13  691  		count_max =3D 48;
cca96584b35765 Rob Clark      2022-03-05  692  		BUILD_BUG_ON(ARRAY_SIZE(a6=
50_protect) > 48);
192f4ee3e40855 Akhil P Oommen 2021-07-30  693  	} else if (adreno_is_a660_f=
amily(adreno_gpu)) {
f6d62d091cfd1c Jonathan Marek 2021-06-08  694  		regs =3D a660_protect;
f6d62d091cfd1c Jonathan Marek 2021-06-08  695  		count =3D ARRAY_SIZE(a660_=
protect);
f6d62d091cfd1c Jonathan Marek 2021-06-08  696  		count_max =3D 48;
cca96584b35765 Rob Clark      2022-03-05  697  		BUILD_BUG_ON(ARRAY_SIZE(a6=
60_protect) > 48);
cca96584b35765 Rob Clark      2022-03-05  698  	} else {
cca96584b35765 Rob Clark      2022-03-05  699  		regs =3D a6xx_protect;
cca96584b35765 Rob Clark      2022-03-05  700  		count =3D ARRAY_SIZE(a6xx_=
protect);
cca96584b35765 Rob Clark      2022-03-05  701  		count_max =3D 32;
cca96584b35765 Rob Clark      2022-03-05  702  		BUILD_BUG_ON(ARRAY_SIZE(a6=
xx_protect) > 32);
40843403695869 Jonathan Marek 2021-05-13  703  	}
40843403695869 Jonathan Marek 2021-05-13  704  =

40843403695869 Jonathan Marek 2021-05-13  705  	/*
40843403695869 Jonathan Marek 2021-05-13  706  	 * Enable access protection=
 to privileged registers, fault on an access
40843403695869 Jonathan Marek 2021-05-13  707  	 * protect violation and se=
lect the last span to protect from the start
40843403695869 Jonathan Marek 2021-05-13  708  	 * address all the way to t=
he end of the register address space
40843403695869 Jonathan Marek 2021-05-13  709  	 */
40843403695869 Jonathan Marek 2021-05-13  710  	gpu_write(gpu, REG_A6XX_CP_=
PROTECT_CNTL, BIT(0) | BIT(1) | BIT(3));
40843403695869 Jonathan Marek 2021-05-13  711  =

40843403695869 Jonathan Marek 2021-05-13  712  	for (i =3D 0; i < count - 1=
; i++)
40843403695869 Jonathan Marek 2021-05-13  713  		gpu_write(gpu, REG_A6XX_CP=
_PROTECT(i), regs[i]);
40843403695869 Jonathan Marek 2021-05-13  714  	/* last CP_PROTECT to have =
"infinite" length on the last entry */
40843403695869 Jonathan Marek 2021-05-13  715  	gpu_write(gpu, REG_A6XX_CP_=
PROTECT(count_max - 1), regs[i]);
40843403695869 Jonathan Marek 2021-05-13  716  }
40843403695869 Jonathan Marek 2021-05-13  717  =


:::::: The code@line 689 was first introduced by commit
:::::: 408434036958699a7f50ddec984f7ba33e11a8f5 drm/msm/a6xx: update/fix CP=
_PROTECT initialization

:::::: TO: Jonathan Marek <jonathan@marek.ca>
:::::: CC: Rob Clark <robdclark@chromium.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0046363814474821615==--

