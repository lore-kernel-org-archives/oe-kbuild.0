Content-Type: multipart/mixed; boundary="===============4758970092265527129=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [chrome-os:chromeos-5.10 57/58] drivers/gpu/arm/mali/mali_kbase_mem_linux.c:1025:25: warning: variable 'dma_buf' set but not used
Date: Sat, 13 Aug 2022 03:30:20 +0800
Message-ID: <202208130314.8kYeuLzD-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4758970092265527129==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "commit no functional change"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
TO: cros-kernel-buildreports(a)googlegroups.com
TO: Guenter Roeck <groeck@google.com>

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chr=
omeos-5.10
head:   7af632a8881d94b2b4576adc1c2eb26ae733a952
commit: 62c8f0ef54f519e80ccb82f9698073947c04db55 [57/58] CHROMIUM: gpu: mal=
i: Rename driver path
:::::: branch date: 2 hours ago
:::::: commit date: 6 hours ago
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/2022081=
3/202208130314.8kYeuLzD-lkp(a)intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add chrome-os https://chromium.googlesource.com/chromium=
os/third_party/kernel
        git fetch --no-tags chrome-os chromeos-5.10
        git checkout 62c8f0ef54f519e80ccb82f9698073947c04db55
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 W=3D1 O=3Dbuild_dir ARCH=3Darm64 SHELL=3D/bin/bash drivers/gpu/arm/mali/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   cc1: warning: kbuild/src/consumer/drivers/gpu/arm/mali: No such file or =
directory [-Wmissing-include-dirs]
   drivers/gpu/arm/mali/mali_kbase_mem_linux.c: In function 'kbase_mem_do_s=
ync_imported':
>> drivers/gpu/arm/mali/mali_kbase_mem_linux.c:1025:25: warning: variable '=
dma_buf' set but not used [-Wunused-but-set-variable]
    1025 |         struct dma_buf *dma_buf;
         |                         ^~~~~~~
--
   cc1: warning: kbuild/src/consumer/drivers/gpu/arm/mali: No such file or =
directory [-Wmissing-include-dirs]
   drivers/gpu/arm/mali/backend/gpu/mali_kbase_jm_hw.c: In function 'kbase_=
job_slot_hardstop':
>> drivers/gpu/arm/mali/backend/gpu/mali_kbase_jm_hw.c:988:14: warning: var=
iable 'stopped' set but not used [-Wunused-but-set-variable]
     988 |         bool stopped;
         |              ^~~~~~~
--
   cc1: warning: kbuild/src/consumer/drivers/gpu/arm/mali: No such file or =
directory [-Wmissing-include-dirs]
>> drivers/gpu/arm/mali/ipa/mali_kbase_ipa.c:399:5: warning: no previous pr=
ototype for 'kbase_scale_static_power' [-Wmissing-prototypes]
     399 | u32 kbase_scale_static_power(const u32 c, const u32 voltage)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/dma_buf +1025 drivers/gpu/arm/mali/mali_kbase_mem_linux.c

f38632197c49e6 drivers/gpu/arm/valhall/mali_kbase_mem_linux.c Nicolas Boich=
at 2020-04-18  1020  =

f38632197c49e6 drivers/gpu/arm/valhall/mali_kbase_mem_linux.c Nicolas Boich=
at 2020-04-18  1021  int kbase_mem_do_sync_imported(struct kbase_context *k=
ctx,
f38632197c49e6 drivers/gpu/arm/valhall/mali_kbase_mem_linux.c Nicolas Boich=
at 2020-04-18  1022  		struct kbase_va_region *reg, enum kbase_sync_type sy=
nc_fn)
f38632197c49e6 drivers/gpu/arm/valhall/mali_kbase_mem_linux.c Nicolas Boich=
at 2020-04-18  1023  {
f38632197c49e6 drivers/gpu/arm/valhall/mali_kbase_mem_linux.c Nicolas Boich=
at 2020-04-18  1024  	int ret =3D -EINVAL;
f38632197c49e6 drivers/gpu/arm/valhall/mali_kbase_mem_linux.c Nicolas Boich=
at 2020-04-18 @1025  	struct dma_buf *dma_buf;
f38632197c49e6 drivers/gpu/arm/valhall/mali_kbase_mem_linux.c Nicolas Boich=
at 2020-04-18  1026  	enum dma_data_direction dir =3D DMA_BIDIRECTIONAL;
f38632197c49e6 drivers/gpu/arm/valhall/mali_kbase_mem_linux.c Nicolas Boich=
at 2020-04-18  1027  =

f38632197c49e6 drivers/gpu/arm/valhall/mali_kbase_mem_linux.c Nicolas Boich=
at 2020-04-18  1028  	lockdep_assert_held(&kctx->reg_lock);
f38632197c49e6 drivers/gpu/arm/valhall/mali_kbase_mem_linux.c Nicolas Boich=
at 2020-04-18  1029  =

f38632197c49e6 drivers/gpu/arm/valhall/mali_kbase_mem_linux.c Nicolas Boich=
at 2020-04-18  1030  	/* We assume that the same physical allocation object=
 is used for both
f38632197c49e6 drivers/gpu/arm/valhall/mali_kbase_mem_linux.c Nicolas Boich=
at 2020-04-18  1031  	 * GPU and CPU for imported buffers.
f38632197c49e6 drivers/gpu/arm/valhall/mali_kbase_mem_linux.c Nicolas Boich=
at 2020-04-18  1032  	 */
f38632197c49e6 drivers/gpu/arm/valhall/mali_kbase_mem_linux.c Nicolas Boich=
at 2020-04-18  1033  	WARN_ON(reg->cpu_alloc !=3D reg->gpu_alloc);
f38632197c49e6 drivers/gpu/arm/valhall/mali_kbase_mem_linux.c Nicolas Boich=
at 2020-04-18  1034  =

f38632197c49e6 drivers/gpu/arm/valhall/mali_kbase_mem_linux.c Nicolas Boich=
at 2020-04-18  1035  	/* Currently only handle dma-bufs */
f38632197c49e6 drivers/gpu/arm/valhall/mali_kbase_mem_linux.c Nicolas Boich=
at 2020-04-18  1036  	if (reg->gpu_alloc->type !=3D KBASE_MEM_TYPE_IMPORTED=
_UMM)
f38632197c49e6 drivers/gpu/arm/valhall/mali_kbase_mem_linux.c Nicolas Boich=
at 2020-04-18  1037  		return ret;
f38632197c49e6 drivers/gpu/arm/valhall/mali_kbase_mem_linux.c Nicolas Boich=
at 2020-04-18  1038  	/*
f38632197c49e6 drivers/gpu/arm/valhall/mali_kbase_mem_linux.c Nicolas Boich=
at 2020-04-18  1039  	 * Attempting to sync with CONFIG_MALI_VALHALL_DMA_BU=
F_MAP_ON_DEMAND
f38632197c49e6 drivers/gpu/arm/valhall/mali_kbase_mem_linux.c Nicolas Boich=
at 2020-04-18  1040  	 * enabled can expose us to a Linux Kernel issue betw=
een v4.6 and
f38632197c49e6 drivers/gpu/arm/valhall/mali_kbase_mem_linux.c Nicolas Boich=
at 2020-04-18  1041  	 * v4.19. We will not attempt to support cache syncs =
on dma-bufs that
f38632197c49e6 drivers/gpu/arm/valhall/mali_kbase_mem_linux.c Nicolas Boich=
at 2020-04-18  1042  	 * are mapped on demand (i.e. not on import), even on=
 pre-4.6, neither
f38632197c49e6 drivers/gpu/arm/valhall/mali_kbase_mem_linux.c Nicolas Boich=
at 2020-04-18  1043  	 * on 4.20 or newer kernels, because this makes it di=
fficult for
f38632197c49e6 drivers/gpu/arm/valhall/mali_kbase_mem_linux.c Nicolas Boich=
at 2020-04-18  1044  	 * userspace to know when they can rely on the cache =
sync.
f38632197c49e6 drivers/gpu/arm/valhall/mali_kbase_mem_linux.c Nicolas Boich=
at 2020-04-18  1045  	 * Instead, only support syncing when we always map d=
ma-bufs on import,
f38632197c49e6 drivers/gpu/arm/valhall/mali_kbase_mem_linux.c Nicolas Boich=
at 2020-04-18  1046  	 * or if the particular buffer is mapped right now.
f38632197c49e6 drivers/gpu/arm/valhall/mali_kbase_mem_linux.c Nicolas Boich=
at 2020-04-18  1047  	 */
f38632197c49e6 drivers/gpu/arm/valhall/mali_kbase_mem_linux.c Nicolas Boich=
at 2020-04-18  1048  	if (IS_ENABLED(CONFIG_MALI_VALHALL_DMA_BUF_MAP_ON_DEM=
AND) &&
f38632197c49e6 drivers/gpu/arm/valhall/mali_kbase_mem_linux.c Nicolas Boich=
at 2020-04-18  1049  	    !reg->gpu_alloc->imported.umm.current_mapping_usa=
ge_count)
f38632197c49e6 drivers/gpu/arm/valhall/mali_kbase_mem_linux.c Nicolas Boich=
at 2020-04-18  1050  		return ret;
f38632197c49e6 drivers/gpu/arm/valhall/mali_kbase_mem_linux.c Nicolas Boich=
at 2020-04-18  1051  =

f38632197c49e6 drivers/gpu/arm/valhall/mali_kbase_mem_linux.c Nicolas Boich=
at 2020-04-18  1052  	dma_buf =3D reg->gpu_alloc->imported.umm.dma_buf;
f38632197c49e6 drivers/gpu/arm/valhall/mali_kbase_mem_linux.c Nicolas Boich=
at 2020-04-18  1053  =

f38632197c49e6 drivers/gpu/arm/valhall/mali_kbase_mem_linux.c Nicolas Boich=
at 2020-04-18  1054  	switch (sync_fn) {
f38632197c49e6 drivers/gpu/arm/valhall/mali_kbase_mem_linux.c Nicolas Boich=
at 2020-04-18  1055  	case KBASE_SYNC_TO_DEVICE:
f38632197c49e6 drivers/gpu/arm/valhall/mali_kbase_mem_linux.c Nicolas Boich=
at 2020-04-18  1056  		dev_dbg(kctx->kbdev->dev,
f38632197c49e6 drivers/gpu/arm/valhall/mali_kbase_mem_linux.c Nicolas Boich=
at 2020-04-18  1057  			"Syncing imported buffer at GPU VA %llx to GPU\n",
f38632197c49e6 drivers/gpu/arm/valhall/mali_kbase_mem_linux.c Nicolas Boich=
at 2020-04-18  1058  			reg->start_pfn);
f38632197c49e6 drivers/gpu/arm/valhall/mali_kbase_mem_linux.c Nicolas Boich=
at 2020-04-18  1059  #ifdef KBASE_MEM_ION_SYNC_WORKAROUND
f38632197c49e6 drivers/gpu/arm/valhall/mali_kbase_mem_linux.c Nicolas Boich=
at 2020-04-18  1060  		if (!WARN_ON(!reg->gpu_alloc->imported.umm.dma_attac=
hment)) {
f38632197c49e6 drivers/gpu/arm/valhall/mali_kbase_mem_linux.c Nicolas Boich=
at 2020-04-18  1061  			struct dma_buf_attachment *attachment =3D reg->gpu_=
alloc->imported.umm.dma_attachment;
f38632197c49e6 drivers/gpu/arm/valhall/mali_kbase_mem_linux.c Nicolas Boich=
at 2020-04-18  1062  			struct sg_table *sgt =3D reg->gpu_alloc->imported.u=
mm.sgt;
f38632197c49e6 drivers/gpu/arm/valhall/mali_kbase_mem_linux.c Nicolas Boich=
at 2020-04-18  1063  =

f38632197c49e6 drivers/gpu/arm/valhall/mali_kbase_mem_linux.c Nicolas Boich=
at 2020-04-18  1064  			dma_sync_sg_for_device(attachment->dev, sgt->sgl,
f38632197c49e6 drivers/gpu/arm/valhall/mali_kbase_mem_linux.c Nicolas Boich=
at 2020-04-18  1065  					sgt->nents, dir);
f38632197c49e6 drivers/gpu/arm/valhall/mali_kbase_mem_linux.c Nicolas Boich=
at 2020-04-18  1066  			ret =3D 0;
f38632197c49e6 drivers/gpu/arm/valhall/mali_kbase_mem_linux.c Nicolas Boich=
at 2020-04-18  1067  		}
f38632197c49e6 drivers/gpu/arm/valhall/mali_kbase_mem_linux.c Nicolas Boich=
at 2020-04-18  1068  #else
f38632197c49e6 drivers/gpu/arm/valhall/mali_kbase_mem_linux.c Nicolas Boich=
at 2020-04-18  1069  	/* Though the below version check could be superfluou=
s depending upon the version condition
f38632197c49e6 drivers/gpu/arm/valhall/mali_kbase_mem_linux.c Nicolas Boich=
at 2020-04-18  1070  	 * used for enabling KBASE_MEM_ION_SYNC_WORKAROUND, w=
e still keep this check here to allow
f38632197c49e6 drivers/gpu/arm/valhall/mali_kbase_mem_linux.c Nicolas Boich=
at 2020-04-18  1071  	 * ease of modification for non-ION systems or system=
s where ION has been patched.
f38632197c49e6 drivers/gpu/arm/valhall/mali_kbase_mem_linux.c Nicolas Boich=
at 2020-04-18  1072  	 */
f38632197c49e6 drivers/gpu/arm/valhall/mali_kbase_mem_linux.c Nicolas Boich=
at 2020-04-18  1073  #if KERNEL_VERSION(4, 6, 0) > LINUX_VERSION_CODE && !d=
efined(CONFIG_CHROMEOS)
f38632197c49e6 drivers/gpu/arm/valhall/mali_kbase_mem_linux.c Nicolas Boich=
at 2020-04-18  1074  		dma_buf_end_cpu_access(dma_buf,
f38632197c49e6 drivers/gpu/arm/valhall/mali_kbase_mem_linux.c Nicolas Boich=
at 2020-04-18  1075  				0, dma_buf->size,
f38632197c49e6 drivers/gpu/arm/valhall/mali_kbase_mem_linux.c Nicolas Boich=
at 2020-04-18  1076  				dir);
f38632197c49e6 drivers/gpu/arm/valhall/mali_kbase_mem_linux.c Nicolas Boich=
at 2020-04-18  1077  		ret =3D 0;
f38632197c49e6 drivers/gpu/arm/valhall/mali_kbase_mem_linux.c Nicolas Boich=
at 2020-04-18  1078  #else
f38632197c49e6 drivers/gpu/arm/valhall/mali_kbase_mem_linux.c Nicolas Boich=
at 2020-04-18  1079  		ret =3D dma_buf_end_cpu_access(dma_buf,
f38632197c49e6 drivers/gpu/arm/valhall/mali_kbase_mem_linux.c Nicolas Boich=
at 2020-04-18  1080  				dir);
f38632197c49e6 drivers/gpu/arm/valhall/mali_kbase_mem_linux.c Nicolas Boich=
at 2020-04-18  1081  #endif
f38632197c49e6 drivers/gpu/arm/valhall/mali_kbase_mem_linux.c Nicolas Boich=
at 2020-04-18  1082  #endif /* KBASE_MEM_ION_SYNC_WORKAROUND */
f38632197c49e6 drivers/gpu/arm/valhall/mali_kbase_mem_linux.c Nicolas Boich=
at 2020-04-18  1083  		break;
f38632197c49e6 drivers/gpu/arm/valhall/mali_kbase_mem_linux.c Nicolas Boich=
at 2020-04-18  1084  	case KBASE_SYNC_TO_CPU:
f38632197c49e6 drivers/gpu/arm/valhall/mali_kbase_mem_linux.c Nicolas Boich=
at 2020-04-18  1085  		dev_dbg(kctx->kbdev->dev,
f38632197c49e6 drivers/gpu/arm/valhall/mali_kbase_mem_linux.c Nicolas Boich=
at 2020-04-18  1086  			"Syncing imported buffer at GPU VA %llx to CPU\n",
f38632197c49e6 drivers/gpu/arm/valhall/mali_kbase_mem_linux.c Nicolas Boich=
at 2020-04-18  1087  			reg->start_pfn);
f38632197c49e6 drivers/gpu/arm/valhall/mali_kbase_mem_linux.c Nicolas Boich=
at 2020-04-18  1088  #ifdef KBASE_MEM_ION_SYNC_WORKAROUND
f38632197c49e6 drivers/gpu/arm/valhall/mali_kbase_mem_linux.c Nicolas Boich=
at 2020-04-18  1089  		if (!WARN_ON(!reg->gpu_alloc->imported.umm.dma_attac=
hment)) {
f38632197c49e6 drivers/gpu/arm/valhall/mali_kbase_mem_linux.c Nicolas Boich=
at 2020-04-18  1090  			struct dma_buf_attachment *attachment =3D reg->gpu_=
alloc->imported.umm.dma_attachment;
f38632197c49e6 drivers/gpu/arm/valhall/mali_kbase_mem_linux.c Nicolas Boich=
at 2020-04-18  1091  			struct sg_table *sgt =3D reg->gpu_alloc->imported.u=
mm.sgt;
f38632197c49e6 drivers/gpu/arm/valhall/mali_kbase_mem_linux.c Nicolas Boich=
at 2020-04-18  1092  =

f38632197c49e6 drivers/gpu/arm/valhall/mali_kbase_mem_linux.c Nicolas Boich=
at 2020-04-18  1093  			dma_sync_sg_for_cpu(attachment->dev, sgt->sgl,
f38632197c49e6 drivers/gpu/arm/valhall/mali_kbase_mem_linux.c Nicolas Boich=
at 2020-04-18  1094  					sgt->nents, dir);
f38632197c49e6 drivers/gpu/arm/valhall/mali_kbase_mem_linux.c Nicolas Boich=
at 2020-04-18  1095  			ret =3D 0;
f38632197c49e6 drivers/gpu/arm/valhall/mali_kbase_mem_linux.c Nicolas Boich=
at 2020-04-18  1096  		}
f38632197c49e6 drivers/gpu/arm/valhall/mali_kbase_mem_linux.c Nicolas Boich=
at 2020-04-18  1097  #else
f38632197c49e6 drivers/gpu/arm/valhall/mali_kbase_mem_linux.c Nicolas Boich=
at 2020-04-18  1098  		ret =3D dma_buf_begin_cpu_access(dma_buf,
f38632197c49e6 drivers/gpu/arm/valhall/mali_kbase_mem_linux.c Nicolas Boich=
at 2020-04-18  1099  #if KERNEL_VERSION(4, 6, 0) > LINUX_VERSION_CODE && !d=
efined(CONFIG_CHROMEOS)
f38632197c49e6 drivers/gpu/arm/valhall/mali_kbase_mem_linux.c Nicolas Boich=
at 2020-04-18  1100  				0, dma_buf->size,
f38632197c49e6 drivers/gpu/arm/valhall/mali_kbase_mem_linux.c Nicolas Boich=
at 2020-04-18  1101  #endif
f38632197c49e6 drivers/gpu/arm/valhall/mali_kbase_mem_linux.c Nicolas Boich=
at 2020-04-18  1102  				dir);
f38632197c49e6 drivers/gpu/arm/valhall/mali_kbase_mem_linux.c Nicolas Boich=
at 2020-04-18  1103  #endif /* KBASE_MEM_ION_SYNC_WORKAROUND */
f38632197c49e6 drivers/gpu/arm/valhall/mali_kbase_mem_linux.c Nicolas Boich=
at 2020-04-18  1104  		break;
79b0a1f26446bb drivers/gpu/arm/valhall/mali_kbase_mem_linux.c Fei Shao     =
   2021-12-13  1105  	}
f38632197c49e6 drivers/gpu/arm/valhall/mali_kbase_mem_linux.c Nicolas Boich=
at 2020-04-18  1106  =

f38632197c49e6 drivers/gpu/arm/valhall/mali_kbase_mem_linux.c Nicolas Boich=
at 2020-04-18  1107  	if (unlikely(ret))
f38632197c49e6 drivers/gpu/arm/valhall/mali_kbase_mem_linux.c Nicolas Boich=
at 2020-04-18  1108  		dev_warn(kctx->kbdev->dev,
f38632197c49e6 drivers/gpu/arm/valhall/mali_kbase_mem_linux.c Nicolas Boich=
at 2020-04-18  1109  			 "Failed to sync mem region %pK at GPU VA %llx: %d\=
n",
f38632197c49e6 drivers/gpu/arm/valhall/mali_kbase_mem_linux.c Nicolas Boich=
at 2020-04-18  1110  			 reg, reg->start_pfn, ret);
f38632197c49e6 drivers/gpu/arm/valhall/mali_kbase_mem_linux.c Nicolas Boich=
at 2020-04-18  1111  =

f38632197c49e6 drivers/gpu/arm/valhall/mali_kbase_mem_linux.c Nicolas Boich=
at 2020-04-18  1112  	return ret;
f38632197c49e6 drivers/gpu/arm/valhall/mali_kbase_mem_linux.c Nicolas Boich=
at 2020-04-18  1113  }
f38632197c49e6 drivers/gpu/arm/valhall/mali_kbase_mem_linux.c Nicolas Boich=
at 2020-04-18  1114  =


:::::: The code at line 1025 was first introduced by commit
:::::: f38632197c49e6558fbbd293bcaa11c1cd91c2ca CHROMIUM: MALI: Apply Valha=
ll r24p0 EAC release

:::::: TO: Nicolas Boichat <drinkcat@chromium.org>
:::::: CC: Guenter Roeck <groeck@chromium.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4758970092265527129==--

