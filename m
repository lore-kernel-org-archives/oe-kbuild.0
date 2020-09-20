Content-Type: multipart/mixed; boundary="===============8627737746896739643=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [drm-msm:msm-next-staging 47/65] drivers/gpu/drm/msm/adreno/a6xx_gpu.c:61:20: warning: Local variable a6xx_gpu shadows outer variable
Date: Sun, 20 Sep 2020 11:18:08 +0800
Message-ID: <202009201104.e5iSQJ2G%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8627737746896739643==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Jordan Crouse <jcrouse@codeaurora.org>
CC: Rob Clark <robdclark@chromium.org>

tree:   https://gitlab.freedesktop.org/drm/msm.git msm-next-staging
head:   55fd7dd29d679836a308d81c27c770b0a9c6a8d1
commit: d3a569fccfa087ac685b17fc378547846891e7b4 [47/65] drm/msm: a6xx: Use=
 WHERE_AM_I for eligible targets
:::::: branch date: 10 hours ago
:::::: commit date: 4 days ago
compiler: aarch64-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> drivers/gpu/drm/msm/adreno/a6xx_gpu.c:61:20: warning: Local variable a6x=
x_gpu shadows outer variable [shadowVar]
     struct a6xx_gpu *a6xx_gpu =3D to_a6xx_gpu(adreno_gpu);
                      ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:55:19: note: Shadowed declaration
    struct a6xx_gpu *a6xx_gpu =3D to_a6xx_gpu(adreno_gpu);
                     ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:61:20: note: Shadow variable
     struct a6xx_gpu *a6xx_gpu =3D to_a6xx_gpu(adreno_gpu);
                      ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:729:41: warning: Shifting signed 3=
2-bit value by 31 bits is undefined behaviour [shiftTooManyBitsSigned]
    gpu_write(gpu, REG_A6XX_CP_PROTECT(1), A6XX_PROTECT_RW(0xae50, 0x2));
                                           ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:730:41: warning: Shifting signed 3=
2-bit value by 31 bits is undefined behaviour [shiftTooManyBitsSigned]
    gpu_write(gpu, REG_A6XX_CP_PROTECT(2), A6XX_PROTECT_RW(0x9624, 0x13));
                                           ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:731:41: warning: Shifting signed 3=
2-bit value by 31 bits is undefined behaviour [shiftTooManyBitsSigned]
    gpu_write(gpu, REG_A6XX_CP_PROTECT(3), A6XX_PROTECT_RW(0x8630, 0x8));
                                           ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:732:41: warning: Shifting signed 3=
2-bit value by 31 bits is undefined behaviour [shiftTooManyBitsSigned]
    gpu_write(gpu, REG_A6XX_CP_PROTECT(4), A6XX_PROTECT_RW(0x9e70, 0x1));
                                           ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:733:41: warning: Shifting signed 3=
2-bit value by 31 bits is undefined behaviour [shiftTooManyBitsSigned]
    gpu_write(gpu, REG_A6XX_CP_PROTECT(5), A6XX_PROTECT_RW(0x9e78, 0x187));
                                           ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:734:41: warning: Shifting signed 3=
2-bit value by 31 bits is undefined behaviour [shiftTooManyBitsSigned]
    gpu_write(gpu, REG_A6XX_CP_PROTECT(6), A6XX_PROTECT_RW(0xf000, 0x810));
                                           ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:737:41: warning: Shifting signed 3=
2-bit value by 31 bits is undefined behaviour [shiftTooManyBitsSigned]
    gpu_write(gpu, REG_A6XX_CP_PROTECT(8), A6XX_PROTECT_RW(0x50e, 0x0));
                                           ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:739:42: warning: Shifting signed 3=
2-bit value by 31 bits is undefined behaviour [shiftTooManyBitsSigned]
    gpu_write(gpu, REG_A6XX_CP_PROTECT(10), A6XX_PROTECT_RW(0x510, 0x0));
                                            ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:746:42: warning: Shifting signed 3=
2-bit value by 31 bits is undefined behaviour [shiftTooManyBitsSigned]
    gpu_write(gpu, REG_A6XX_CP_PROTECT(14), A6XX_PROTECT_RW(0xe00, 0xe));
                                            ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:747:42: warning: Shifting signed 3=
2-bit value by 31 bits is undefined behaviour [shiftTooManyBitsSigned]
    gpu_write(gpu, REG_A6XX_CP_PROTECT(15), A6XX_PROTECT_RW(0x8e00, 0x0));
                                            ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:748:42: warning: Shifting signed 3=
2-bit value by 31 bits is undefined behaviour [shiftTooManyBitsSigned]
    gpu_write(gpu, REG_A6XX_CP_PROTECT(16), A6XX_PROTECT_RW(0x8e50, 0xf));
                                            ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:749:42: warning: Shifting signed 3=
2-bit value by 31 bits is undefined behaviour [shiftTooManyBitsSigned]
    gpu_write(gpu, REG_A6XX_CP_PROTECT(17), A6XX_PROTECT_RW(0xbe02, 0x0));
                                            ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:751:3: warning: Shifting signed 32=
-bit value by 31 bits is undefined behaviour [shiftTooManyBitsSigned]
     A6XX_PROTECT_RW(0xbe20, 0x11f3));
     ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:752:42: warning: Shifting signed 3=
2-bit value by 31 bits is undefined behaviour [shiftTooManyBitsSigned]
    gpu_write(gpu, REG_A6XX_CP_PROTECT(19), A6XX_PROTECT_RW(0x800, 0x82));
                                            ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:753:42: warning: Shifting signed 3=
2-bit value by 31 bits is undefined behaviour [shiftTooManyBitsSigned]
    gpu_write(gpu, REG_A6XX_CP_PROTECT(20), A6XX_PROTECT_RW(0x8a0, 0x8));
                                            ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:754:42: warning: Shifting signed 3=
2-bit value by 31 bits is undefined behaviour [shiftTooManyBitsSigned]
    gpu_write(gpu, REG_A6XX_CP_PROTECT(21), A6XX_PROTECT_RW(0x8ab, 0x19));
                                            ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:755:42: warning: Shifting signed 3=
2-bit value by 31 bits is undefined behaviour [shiftTooManyBitsSigned]
    gpu_write(gpu, REG_A6XX_CP_PROTECT(22), A6XX_PROTECT_RW(0x900, 0x4d));
                                            ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:756:42: warning: Shifting signed 3=
2-bit value by 31 bits is undefined behaviour [shiftTooManyBitsSigned]
    gpu_write(gpu, REG_A6XX_CP_PROTECT(23), A6XX_PROTECT_RW(0x98d, 0x76));
                                            ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu.c:759:42: warning: Shifting signed 3=
2-bit value by 31 bits is undefined behaviour [shiftTooManyBitsSigned]
    gpu_write(gpu, REG_A6XX_CP_PROTECT(25), A6XX_PROTECT_RW(0xa630, 0x0));
                                            ^
>> drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h:74:0: warning: There is an unk=
nown macro here somewhere. Configuration is required. If TRACE_EVENT is a m=
acro then please configure it. [unknownMacro]
   =

   ^
--
>> drivers/gpu/drm/msm/msm_gem_submit.c:80:32: warning: Local variable subm=
it_bo shadows outer function [shadowFunction]
     struct drm_msm_gem_submit_bo submit_bo;
                                  ^
   drivers/gpu/drm/msm/msm_gem_submit.c:283:12: note: Shadowed declaration
   static int submit_bo(struct msm_gem_submit *submit, uint32_t idx,
              ^
   drivers/gpu/drm/msm/msm_gem_submit.c:80:32: note: Shadow variable
     struct drm_msm_gem_submit_bo submit_bo;
                                  ^
>> drivers/gpu/drm/msm/msm_gem_submit.c:330:35: warning: Local variable sub=
mit_reloc shadows outer function [shadowFunction]
     struct drm_msm_gem_submit_reloc submit_reloc;
                                     ^
   drivers/gpu/drm/msm/msm_gem_submit.c:303:12: note: Shadowed declaration
   static int submit_reloc(struct msm_gem_submit *submit, struct msm_gem_ob=
ject *obj,
              ^
   drivers/gpu/drm/msm/msm_gem_submit.c:330:35: note: Shadow variable
     struct drm_msm_gem_submit_reloc submit_reloc;
                                     ^
--
>> drivers/gpu/drm/msm/msm_gem.c:1033:2: warning: Address of local auto-var=
iable assigned to a function parameter. [autoVariables]
    *obj =3D &msm_obj->base;
    ^

git remote add drm-msm https://gitlab.freedesktop.org/drm/msm.git
git fetch --no-tags drm-msm msm-next-staging
git checkout d3a569fccfa087ac685b17fc378547846891e7b4
vim +61 drivers/gpu/drm/msm/adreno/a6xx_gpu.c

4b565ca5a2cbbb Jordan Crouse 2018-08-06  51  =

4b565ca5a2cbbb Jordan Crouse 2018-08-06  52  static void a6xx_flush(struct =
msm_gpu *gpu, struct msm_ringbuffer *ring)
4b565ca5a2cbbb Jordan Crouse 2018-08-06  53  {
d3a569fccfa087 Jordan Crouse 2020-09-14  54  	struct adreno_gpu *adreno_gpu=
 =3D to_adreno_gpu(gpu);
d3a569fccfa087 Jordan Crouse 2020-09-14  55  	struct a6xx_gpu *a6xx_gpu =3D=
 to_a6xx_gpu(adreno_gpu);
4b565ca5a2cbbb Jordan Crouse 2018-08-06  56  	uint32_t wptr;
4b565ca5a2cbbb Jordan Crouse 2018-08-06  57  	unsigned long flags;
4b565ca5a2cbbb Jordan Crouse 2018-08-06  58  =

d3a569fccfa087 Jordan Crouse 2020-09-14  59  	/* Expanded APRIV doesn't nee=
d to issue the WHERE_AM_I opcode */
d3a569fccfa087 Jordan Crouse 2020-09-14  60  	if (a6xx_gpu->has_whereami &&=
 !adreno_gpu->base.hw_apriv) {
d3a569fccfa087 Jordan Crouse 2020-09-14 @61  		struct a6xx_gpu *a6xx_gpu =
=3D to_a6xx_gpu(adreno_gpu);
d3a569fccfa087 Jordan Crouse 2020-09-14  62  =

d3a569fccfa087 Jordan Crouse 2020-09-14  63  		OUT_PKT7(ring, CP_WHERE_AM_I=
, 2);
d3a569fccfa087 Jordan Crouse 2020-09-14  64  		OUT_RING(ring, lower_32_bits=
(shadowptr(a6xx_gpu, ring)));
d3a569fccfa087 Jordan Crouse 2020-09-14  65  		OUT_RING(ring, upper_32_bits=
(shadowptr(a6xx_gpu, ring)));
d3a569fccfa087 Jordan Crouse 2020-09-14  66  	}
d3a569fccfa087 Jordan Crouse 2020-09-14  67  =

4b565ca5a2cbbb Jordan Crouse 2018-08-06  68  	spin_lock_irqsave(&ring->lock=
, flags);
4b565ca5a2cbbb Jordan Crouse 2018-08-06  69  =

4b565ca5a2cbbb Jordan Crouse 2018-08-06  70  	/* Copy the shadow to the act=
ual register */
4b565ca5a2cbbb Jordan Crouse 2018-08-06  71  	ring->cur =3D ring->next;
4b565ca5a2cbbb Jordan Crouse 2018-08-06  72  =

4b565ca5a2cbbb Jordan Crouse 2018-08-06  73  	/* Make sure to wrap wptr if =
we need to */
4b565ca5a2cbbb Jordan Crouse 2018-08-06  74  	wptr =3D get_wptr(ring);
4b565ca5a2cbbb Jordan Crouse 2018-08-06  75  =

4b565ca5a2cbbb Jordan Crouse 2018-08-06  76  	spin_unlock_irqrestore(&ring-=
>lock, flags);
4b565ca5a2cbbb Jordan Crouse 2018-08-06  77  =

4b565ca5a2cbbb Jordan Crouse 2018-08-06  78  	/* Make sure everything is po=
sted before making a decision */
4b565ca5a2cbbb Jordan Crouse 2018-08-06  79  	mb();
4b565ca5a2cbbb Jordan Crouse 2018-08-06  80  =

4b565ca5a2cbbb Jordan Crouse 2018-08-06  81  	gpu_write(gpu, REG_A6XX_CP_RB=
_WPTR, wptr);
4b565ca5a2cbbb Jordan Crouse 2018-08-06  82  }
4b565ca5a2cbbb Jordan Crouse 2018-08-06  83  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8627737746896739643==--

