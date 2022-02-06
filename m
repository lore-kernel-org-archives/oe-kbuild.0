Content-Type: multipart/mixed; boundary="===============7895838152780957318=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h:74:0: warning: There is an unknown macro here somewhere. Configuration is required. If TRACE_EVENT is a macro then please configure it. [unknownMacro]
Date: Sun, 06 Feb 2022 11:22:53 +0800
Message-ID: <202202061114.Pvyg3vTs-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7895838152780957318==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: "Christian K=C3=B6nig" <christian.koenig@amd.com>
CC: Rob Clark <robdclark@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   90c9e950c0def5c354b4a6154a2ddda3e5f214ac
commit: b3ed524f84f573ece1aa2f26e9db3c34a593e0d1 drm/msm: allow compile_tes=
t on !ARM
date:   4 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 4 months ago
compiler: xtensa-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

   In file included from drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd=
.c:
>> drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h:74:0: warning: There is an unk=
nown macro here somewhere. Configuration is required. If TRACE_EVENT is a m=
acro then please configure it. [unknownMacro]
   =

   ^

vim +74 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h

25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  73  =

25fdd5933e4c0f Jeykumar Sankaran 2018-06-27 @74  TRACE_EVENT(dpu_perf_set_o=
t,
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  75  	TP_PROTO(u32 pnum, u32 xi=
n_id, u32 rd_lim, u32 vbif_idx),
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  76  	TP_ARGS(pnum, xin_id, rd_=
lim, vbif_idx),
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  77  	TP_STRUCT__entry(
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  78  			__field(u32, pnum)
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  79  			__field(u32, xin_id)
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  80  			__field(u32, rd_lim)
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  81  			__field(u32, vbif_idx)
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  82  	),
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  83  	TP_fast_assign(
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  84  			__entry->pnum =3D pnum;
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  85  			__entry->xin_id =3D xin=
_id;
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  86  			__entry->rd_lim =3D rd_=
lim;
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  87  			__entry->vbif_idx =3D v=
bif_idx;
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  88  	),
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  89  	TP_printk("pnum:%d xin_id=
:%d ot:%d vbif:%d",
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  90  			__entry->pnum, __entry-=
>xin_id, __entry->rd_lim,
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  91  			__entry->vbif_idx)
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  92  )
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  93  =


:::::: The code at line 74 was first introduced by commit
:::::: 25fdd5933e4c0f5fe2ea5cd59994f8ac5fbe90ef drm/msm: Add SDM845 DPU sup=
port

:::::: TO: Jeykumar Sankaran <jsanka@codeaurora.org>
:::::: CC: Sean Paul <seanpaul@chromium.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7895838152780957318==--

