Content-Type: multipart/mixed; boundary="===============1554971479009480754=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/msm/dsi/dsi_host.c:1228:37: warning: Parameter 'buf' can be declared with const [constParameter]
Date: Tue, 31 May 2022 02:57:09 +0800
Message-ID: <202205310242.fPEnMQJB-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1554971479009480754==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check first_new_problem:=
 drivers/gpu/drm/msm/dsi/dsi_host.c:1228:37: warning: Parameter 'buf' can b=
e declared with const [constParameter]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: "Christian K=C3=B6nig" <christian.koenig@amd.com>
CC: Rob Clark <robdclark@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   b00ed48bb0a7c295facf9036135a573a5cdbe7de
commit: b3ed524f84f573ece1aa2f26e9db3c34a593e0d1 drm/msm: allow compile_tes=
t on !ARM
date:   8 months ago
:::::: branch date: 24 hours ago
:::::: commit date: 8 months ago
compiler: arc-elf-gcc (GCC) 11.3.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout b3ed524f84f573ece1aa2f26e9db3c34a593e0d1
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/msm/adreno/a5xx_gpu.c:1148:7: warning: Local variable 's=
tatus' shadows outer variable [shadowVariable]
     u32 status =3D gpu_read(gpu, REG_A5XX_CP_AHB_FAULT);
         ^
   drivers/gpu/drm/msm/adreno/a5xx_gpu.c:1112:6: note: Shadowed declaration
    u32 status =3D gpu_read(gpu, REG_A5XX_CP_INTERRUPT_STATUS);
        ^
   drivers/gpu/drm/msm/adreno/a5xx_gpu.c:1148:7: note: Shadow variable
     u32 status =3D gpu_read(gpu, REG_A5XX_CP_AHB_FAULT);
         ^

cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/gpu/drm/msm/dsi/dsi_host.c:1228:37: warning: Parameter 'buf' can=
 be declared with const [constParameter]
   static int dsi_short_read1_resp(u8 *buf, const struct mipi_dsi_msg *msg)
                                       ^
   drivers/gpu/drm/msm/dsi/dsi_host.c:1244:37: warning: Parameter 'buf' can=
 be declared with const [constParameter]
   static int dsi_short_read2_resp(u8 *buf, const struct mipi_dsi_msg *msg)
                                       ^
>> drivers/gpu/drm/msm/adreno/a6xx_gpu.c:538:2: warning: Shifting signed 32=
-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBits=
Signed]
    A6XX_PROTECT_NORDWR(0x0050e, 0x0000),
    ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:539:2: warning: Shifting signed 32=
-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBits=
Signed]
    A6XX_PROTECT_NORDWR(0x00510, 0x0000),
    ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:540:2: warning: Shifting signed 32=
-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBits=
Signed]
    A6XX_PROTECT_NORDWR(0x00534, 0x0000),
    ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:541:2: warning: Shifting signed 32=
-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBits=
Signed]
    A6XX_PROTECT_NORDWR(0x00800, 0x0082),
    ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:542:2: warning: Shifting signed 32=
-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBits=
Signed]
    A6XX_PROTECT_NORDWR(0x008a0, 0x0008),
    ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:543:2: warning: Shifting signed 32=
-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBits=
Signed]
    A6XX_PROTECT_NORDWR(0x008ab, 0x0024),
    ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:545:2: warning: Shifting signed 32=
-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBits=
Signed]
    A6XX_PROTECT_NORDWR(0x00900, 0x004d),
    ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:546:2: warning: Shifting signed 32=
-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBits=
Signed]
    A6XX_PROTECT_NORDWR(0x0098d, 0x0272),
    ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:547:2: warning: Shifting signed 32=
-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBits=
Signed]
    A6XX_PROTECT_NORDWR(0x00e00, 0x0001),
    ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:548:2: warning: Shifting signed 32=
-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBits=
Signed]
    A6XX_PROTECT_NORDWR(0x00e03, 0x000c),
    ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:549:2: warning: Shifting signed 32=
-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBits=
Signed]
    A6XX_PROTECT_NORDWR(0x03c00, 0x00c3),
    ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:551:2: warning: Shifting signed 32=
-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBits=
Signed]
    A6XX_PROTECT_NORDWR(0x08630, 0x01cf),
    ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:552:2: warning: Shifting signed 32=
-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBits=
Signed]
    A6XX_PROTECT_NORDWR(0x08e00, 0x0000),
    ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:553:2: warning: Shifting signed 32=
-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBits=
Signed]
    A6XX_PROTECT_NORDWR(0x08e08, 0x0000),
    ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:554:2: warning: Shifting signed 32=
-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBits=
Signed]
    A6XX_PROTECT_NORDWR(0x08e50, 0x001f),
    ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:555:2: warning: Shifting signed 32=
-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBits=
Signed]
    A6XX_PROTECT_NORDWR(0x09624, 0x01db),
    ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:556:2: warning: Shifting signed 32=
-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBits=
Signed]
    A6XX_PROTECT_NORDWR(0x09e70, 0x0001),
    ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:557:2: warning: Shifting signed 32=
-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBits=
Signed]
    A6XX_PROTECT_NORDWR(0x09e78, 0x0187),
    ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:558:2: warning: Shifting signed 32=
-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBits=
Signed]
    A6XX_PROTECT_NORDWR(0x0a630, 0x01cf),
    ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:559:2: warning: Shifting signed 32=
-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBits=
Signed]
    A6XX_PROTECT_NORDWR(0x0ae02, 0x0000),
    ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:560:2: warning: Shifting signed 32=
-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBits=
Signed]
    A6XX_PROTECT_NORDWR(0x0ae50, 0x032f),
    ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:561:2: warning: Shifting signed 32=
-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBits=
Signed]
    A6XX_PROTECT_NORDWR(0x0b604, 0x0000),
    ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:562:2: warning: Shifting signed 32=
-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBits=
Signed]
    A6XX_PROTECT_NORDWR(0x0be02, 0x0001),
    ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:563:2: warning: Shifting signed 32=
-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBits=
Signed]
    A6XX_PROTECT_NORDWR(0x0be20, 0x17df),
    ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:564:2: warning: Shifting signed 32=
-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBits=
Signed]
    A6XX_PROTECT_NORDWR(0x0f000, 0x0bff),
    ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:566:2: warning: Shifting signed 32=
-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBits=
Signed]
    A6XX_PROTECT_NORDWR(0x11c00, 0x0000), /* note: infinite range */
    ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:574:2: warning: Shifting signed 32=
-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBits=
Signed]
    A6XX_PROTECT_NORDWR(0x0050e, 0x0000),
    ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:575:2: warning: Shifting signed 32=
-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBits=
Signed]
    A6XX_PROTECT_NORDWR(0x00510, 0x0000),
    ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:576:2: warning: Shifting signed 32=
-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBits=
Signed]
    A6XX_PROTECT_NORDWR(0x00534, 0x0000),
    ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:577:2: warning: Shifting signed 32=
-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBits=
Signed]
    A6XX_PROTECT_NORDWR(0x00800, 0x0082),
    ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:578:2: warning: Shifting signed 32=
-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBits=
Signed]
    A6XX_PROTECT_NORDWR(0x008a0, 0x0008),
    ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:579:2: warning: Shifting signed 32=
-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBits=
Signed]
    A6XX_PROTECT_NORDWR(0x008ab, 0x0024),
    ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:581:2: warning: Shifting signed 32=
-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBits=
Signed]
    A6XX_PROTECT_NORDWR(0x00900, 0x004d),
    ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:582:2: warning: Shifting signed 32=
-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBits=
Signed]
    A6XX_PROTECT_NORDWR(0x0098d, 0x0272),
--
    ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:618:2: warning: Shifting signed 32=
-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBits=
Signed]
    A6XX_PROTECT_NORDWR(0x00510, 0x0000),
    ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:619:2: warning: Shifting signed 32=
-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBits=
Signed]
    A6XX_PROTECT_NORDWR(0x00534, 0x0000),
    ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:620:2: warning: Shifting signed 32=
-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBits=
Signed]
    A6XX_PROTECT_NORDWR(0x00800, 0x0082),
    ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:621:2: warning: Shifting signed 32=
-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBits=
Signed]
    A6XX_PROTECT_NORDWR(0x008a0, 0x0008),
    ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:622:2: warning: Shifting signed 32=
-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBits=
Signed]
    A6XX_PROTECT_NORDWR(0x008ab, 0x0024),
    ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:624:2: warning: Shifting signed 32=
-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBits=
Signed]
    A6XX_PROTECT_NORDWR(0x00900, 0x004d),
    ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:625:2: warning: Shifting signed 32=
-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBits=
Signed]
    A6XX_PROTECT_NORDWR(0x0098d, 0x0272),
    ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:626:2: warning: Shifting signed 32=
-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBits=
Signed]
    A6XX_PROTECT_NORDWR(0x00e00, 0x0001),
    ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:627:2: warning: Shifting signed 32=
-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBits=
Signed]
    A6XX_PROTECT_NORDWR(0x00e03, 0x000c),
    ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:628:2: warning: Shifting signed 32=
-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBits=
Signed]
    A6XX_PROTECT_NORDWR(0x03c00, 0x00c3),
    ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:630:2: warning: Shifting signed 32=
-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBits=
Signed]
    A6XX_PROTECT_NORDWR(0x08630, 0x01cf),
    ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:631:2: warning: Shifting signed 32=
-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBits=
Signed]
    A6XX_PROTECT_NORDWR(0x08e00, 0x0000),
    ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:632:2: warning: Shifting signed 32=
-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBits=
Signed]
    A6XX_PROTECT_NORDWR(0x08e08, 0x0000),
    ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:633:2: warning: Shifting signed 32=
-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBits=
Signed]
    A6XX_PROTECT_NORDWR(0x08e50, 0x001f),
    ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:634:2: warning: Shifting signed 32=
-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBits=
Signed]
    A6XX_PROTECT_NORDWR(0x08e80, 0x027f),
    ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:635:2: warning: Shifting signed 32=
-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBits=
Signed]
    A6XX_PROTECT_NORDWR(0x09624, 0x01db),
    ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:636:2: warning: Shifting signed 32=
-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBits=
Signed]
    A6XX_PROTECT_NORDWR(0x09e60, 0x0011),
    ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:637:2: warning: Shifting signed 32=
-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBits=
Signed]
    A6XX_PROTECT_NORDWR(0x09e78, 0x0187),
    ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:638:2: warning: Shifting signed 32=
-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBits=
Signed]
    A6XX_PROTECT_NORDWR(0x0a630, 0x01cf),
    ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:639:2: warning: Shifting signed 32=
-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBits=
Signed]
    A6XX_PROTECT_NORDWR(0x0ae02, 0x0000),
    ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:640:2: warning: Shifting signed 32=
-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBits=
Signed]
    A6XX_PROTECT_NORDWR(0x0ae50, 0x012f),
    ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:641:2: warning: Shifting signed 32=
-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBits=
Signed]
    A6XX_PROTECT_NORDWR(0x0b604, 0x0000),
    ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:642:2: warning: Shifting signed 32=
-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBits=
Signed]
    A6XX_PROTECT_NORDWR(0x0b608, 0x0006),
    ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:643:2: warning: Shifting signed 32=
-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBits=
Signed]
    A6XX_PROTECT_NORDWR(0x0be02, 0x0001),
    ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:644:2: warning: Shifting signed 32=
-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBits=
Signed]
    A6XX_PROTECT_NORDWR(0x0be20, 0x015f),
    ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:645:2: warning: Shifting signed 32=
-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBits=
Signed]
    A6XX_PROTECT_NORDWR(0x0d000, 0x05ff),
    ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:646:2: warning: Shifting signed 32=
-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBits=
Signed]
    A6XX_PROTECT_NORDWR(0x0f000, 0x0bff),
    ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:648:2: warning: Shifting signed 32=
-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBits=
Signed]
    A6XX_PROTECT_NORDWR(0x18400, 0x1fff),
    ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:649:2: warning: Shifting signed 32=
-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBits=
Signed]
    A6XX_PROTECT_NORDWR(0x1a400, 0x1fff),
    ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:650:2: warning: Shifting signed 32=
-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBits=
Signed]
    A6XX_PROTECT_NORDWR(0x1f400, 0x0443),
    ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:652:2: warning: Shifting signed 32=
-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBits=
Signed]
    A6XX_PROTECT_NORDWR(0x1f860, 0x0000),
    ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:653:2: warning: Shifting signed 32=
-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBits=
Signed]
    A6XX_PROTECT_NORDWR(0x1f887, 0x001b),
    ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:654:2: warning: Shifting signed 32=
-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBits=
Signed]
    A6XX_PROTECT_NORDWR(0x1f8c0, 0x0000), /* note: infinite range */
    ^
>> drivers/gpu/drm/msm/adreno/a6xx_gpu.c:538:2: warning: Signed integer ove=
rflow for expression '1<<31'. [integerOverflow]
    A6XX_PROTECT_NORDWR(0x0050e, 0x0000),
    ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:539:2: warning: Signed integer ove=
rflow for expression '1<<31'. [integerOverflow]
    A6XX_PROTECT_NORDWR(0x00510, 0x0000),
    ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:540:2: warning: Signed integer ove=
rflow for expression '1<<31'. [integerOverflow]
    A6XX_PROTECT_NORDWR(0x00534, 0x0000),
    ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:541:2: warning: Signed integer ove=
rflow for expression '1<<31'. [integerOverflow]
    A6XX_PROTECT_NORDWR(0x00800, 0x0082),
    ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:542:2: warning: Signed integer ove=
rflow for expression '1<<31'. [integerOverflow]
    A6XX_PROTECT_NORDWR(0x008a0, 0x0008),
    ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:543:2: warning: Signed integer ove=
rflow for expression '1<<31'. [integerOverflow]
    A6XX_PROTECT_NORDWR(0x008ab, 0x0024),
    ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:545:2: warning: Signed integer ove=
rflow for expression '1<<31'. [integerOverflow]
    A6XX_PROTECT_NORDWR(0x00900, 0x004d),
    ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:546:2: warning: Signed integer ove=
rflow for expression '1<<31'. [integerOverflow]
    A6XX_PROTECT_NORDWR(0x0098d, 0x0272),
    ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:547:2: warning: Signed integer ove=
rflow for expression '1<<31'. [integerOverflow]
    A6XX_PROTECT_NORDWR(0x00e00, 0x0001),
    ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:548:2: warning: Signed integer ove=
rflow for expression '1<<31'. [integerOverflow]
    A6XX_PROTECT_NORDWR(0x00e03, 0x000c),
    ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:549:2: warning: Signed integer ove=
rflow for expression '1<<31'. [integerOverflow]
    A6XX_PROTECT_NORDWR(0x03c00, 0x00c3),
    ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:551:2: warning: Signed integer ove=
rflow for expression '1<<31'. [integerOverflow]
    A6XX_PROTECT_NORDWR(0x08630, 0x01cf),
    ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:552:2: warning: Signed integer ove=
rflow for expression '1<<31'. [integerOverflow]
    A6XX_PROTECT_NORDWR(0x08e00, 0x0000),
    ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:553:2: warning: Signed integer ove=
rflow for expression '1<<31'. [integerOverflow]
    A6XX_PROTECT_NORDWR(0x08e08, 0x0000),
    ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:554:2: warning: Signed integer ove=
rflow for expression '1<<31'. [integerOverflow]
    A6XX_PROTECT_NORDWR(0x08e50, 0x001f),
    ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:555:2: warning: Signed integer ove=
rflow for expression '1<<31'. [integerOverflow]
    A6XX_PROTECT_NORDWR(0x09624, 0x01db),
    ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:556:2: warning: Signed integer ove=
rflow for expression '1<<31'. [integerOverflow]
    A6XX_PROTECT_NORDWR(0x09e70, 0x0001),
    ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:557:2: warning: Signed integer ove=
rflow for expression '1<<31'. [integerOverflow]
    A6XX_PROTECT_NORDWR(0x09e78, 0x0187),
    ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:558:2: warning: Signed integer ove=
rflow for expression '1<<31'. [integerOverflow]
    A6XX_PROTECT_NORDWR(0x0a630, 0x01cf),
    ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:559:2: warning: Signed integer ove=
rflow for expression '1<<31'. [integerOverflow]
    A6XX_PROTECT_NORDWR(0x0ae02, 0x0000),
    ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:560:2: warning: Signed integer ove=
rflow for expression '1<<31'. [integerOverflow]
    A6XX_PROTECT_NORDWR(0x0ae50, 0x032f),
    ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:561:2: warning: Signed integer ove=
rflow for expression '1<<31'. [integerOverflow]
    A6XX_PROTECT_NORDWR(0x0b604, 0x0000),
    ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:562:2: warning: Signed integer ove=
rflow for expression '1<<31'. [integerOverflow]
    A6XX_PROTECT_NORDWR(0x0be02, 0x0001),
    ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:563:2: warning: Signed integer ove=
rflow for expression '1<<31'. [integerOverflow]
    A6XX_PROTECT_NORDWR(0x0be20, 0x17df),
    ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:564:2: warning: Signed integer ove=
rflow for expression '1<<31'. [integerOverflow]
    A6XX_PROTECT_NORDWR(0x0f000, 0x0bff),
    ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:566:2: warning: Signed integer ove=
rflow for expression '1<<31'. [integerOverflow]
    A6XX_PROTECT_NORDWR(0x11c00, 0x0000), /* note: infinite range */
    ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:574:2: warning: Signed integer ove=
rflow for expression '1<<31'. [integerOverflow]
    A6XX_PROTECT_NORDWR(0x0050e, 0x0000),
    ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:575:2: warning: Signed integer ove=
rflow for expression '1<<31'. [integerOverflow]
    A6XX_PROTECT_NORDWR(0x00510, 0x0000),
    ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:576:2: warning: Signed integer ove=
rflow for expression '1<<31'. [integerOverflow]
    A6XX_PROTECT_NORDWR(0x00534, 0x0000),
    ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:577:2: warning: Signed integer ove=
rflow for expression '1<<31'. [integerOverflow]
    A6XX_PROTECT_NORDWR(0x00800, 0x0082),
    ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:578:2: warning: Signed integer ove=
rflow for expression '1<<31'. [integerOverflow]
    A6XX_PROTECT_NORDWR(0x008a0, 0x0008),
    ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:579:2: warning: Signed integer ove=
rflow for expression '1<<31'. [integerOverflow]
    A6XX_PROTECT_NORDWR(0x008ab, 0x0024),
    ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:581:2: warning: Signed integer ove=
rflow for expression '1<<31'. [integerOverflow]
    A6XX_PROTECT_NORDWR(0x00900, 0x004d),
    ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:582:2: warning: Signed integer ove=
rflow for expression '1<<31'. [integerOverflow]
    A6XX_PROTECT_NORDWR(0x0098d, 0x0272),
--
>> drivers/gpu/drm/msm/adreno/a5xx_gpu.c:1157:17: warning: Shifting signed =
32-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBi=
tsSigned]
      (status & (1 << 31)), status);
                   ^
>> drivers/gpu/drm/msm/adreno/a5xx_gpu.c:760:27: warning: Signed integer ov=
erflow for expression '0x200<<22'. [integerOverflow]
        (0x200 << 11 | 0x200 << 22));
                             ^
   drivers/gpu/drm/msm/adreno/a5xx_gpu.c:763:27: warning: Signed integer ov=
erflow for expression '0x300<<22'. [integerOverflow]
        (0x400 << 11 | 0x300 << 22));
                             ^
   drivers/gpu/drm/msm/adreno/a5xx_gpu.c:1157:17: warning: Signed integer o=
verflow for expression '1<<31'. [integerOverflow]
      (status & (1 << 31)), status);
                   ^

vim +/buf +1228 drivers/gpu/drm/msm/dsi/dsi_host.c

a689554ba6ed81 Hai Li        2015-03-31  1224  =

a689554ba6ed81 Hai Li        2015-03-31  1225  /*
a689554ba6ed81 Hai Li        2015-03-31  1226   * dsi_short_read1_resp: 1 p=
arameter
a689554ba6ed81 Hai Li        2015-03-31  1227   */
a689554ba6ed81 Hai Li        2015-03-31 @1228  static int dsi_short_read1_r=
esp(u8 *buf, const struct mipi_dsi_msg *msg)
a689554ba6ed81 Hai Li        2015-03-31  1229  {
a689554ba6ed81 Hai Li        2015-03-31  1230  	u8 *data =3D msg->rx_buf;
a689554ba6ed81 Hai Li        2015-03-31  1231  	if (data && (msg->rx_len >=
=3D 1)) {
a689554ba6ed81 Hai Li        2015-03-31  1232  		*data =3D buf[1]; /* strip=
 out dcs type */
a689554ba6ed81 Hai Li        2015-03-31  1233  		return 1;
a689554ba6ed81 Hai Li        2015-03-31  1234  	} else {
981371f326235e Stephane Viau 2015-04-30  1235  		pr_err("%s: read data does=
 not match with rx_buf len %zu\n",
a689554ba6ed81 Hai Li        2015-03-31  1236  			__func__, msg->rx_len);
a689554ba6ed81 Hai Li        2015-03-31  1237  		return -EINVAL;
a689554ba6ed81 Hai Li        2015-03-31  1238  	}
a689554ba6ed81 Hai Li        2015-03-31  1239  }
a689554ba6ed81 Hai Li        2015-03-31  1240  =


:::::: The code at line 1228 was first introduced by commit
:::::: a689554ba6ed81cf606c16539f6ffc2a1dcdaf8e drm/msm: Initial add DSI co=
nnector support

:::::: TO: Hai Li <hali@codeaurora.org>
:::::: CC: Rob Clark <robdclark@gmail.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1554971479009480754==--

