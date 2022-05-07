Content-Type: multipart/mixed; boundary="===============4755501934624595311=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 5484/9759] mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gpu/drm/display/drm_hdcp_helper.o' being placed in section `.ctors.65436'
Date: Sun, 08 May 2022 06:36:51 +0800
Message-ID: <202205080628.FSqEEvYt-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4755501934624595311==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Thomas Zimmermann <tzimmermann@suse.de>
CC: Javier Martinez Canillas <javierm@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   38a288f5941ef03752887ad86f2d85442358c99a
commit: 6a99099fe1d6c46cbcd74298eeb386c4b9048f77 [5484/9759] drm/display: M=
ove HDCP helpers into display-helper module
:::::: branch date: 2 days ago
:::::: commit date: 13 days ago
config: mips-randconfig-p002-20220505 (https://download.01.org/0day-ci/arch=
ive/20220508/202205080628.FSqEEvYt-lkp(a)intel.com/config)
compiler: mips64-linux-gcc (GCC) 11.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3D6a99099fe1d6c46cbcd74298eeb386c4b9048f77
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 6a99099fe1d6c46cbcd74298eeb386c4b9048f77
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-11.3.0 make.cross=
 W=3D1 O=3Dbuild_dir ARCH=3Dmips SHELL=3D/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/ch=
ar/tpm/tpm-dev.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/ch=
ar/tpm/tpm-interface.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/ch=
ar/tpm/tpm1-cmd.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/ch=
ar/tpm/tpm2-cmd.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/ch=
ar/tpm/tpmrm-dev.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/ch=
ar/tpm/tpm2-space.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/ch=
ar/tpm/tpm-sysfs.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/ch=
ar/tpm/eventlog/common.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/ch=
ar/tpm/eventlog/tpm1.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/ch=
ar/tpm/eventlog/tpm2.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/ch=
ar/tpm/eventlog/of.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/ch=
ar/tpm/tpm_tis_i2c_cr50.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/ch=
ar/tpm/tpm_i2c_atmel.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/ch=
ar/tpm/tpm_atmel.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/ch=
ar/tpm/st33zp24/st33zp24.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/ch=
ar/tpm/st33zp24/i2c.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/ch=
ar/tpm/tpm_vtpm_proxy.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/ch=
ar/xillybus/xillybus_class.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/ch=
ar/xillybus/xillybus_core.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/ch=
ar/xillybus/xillybus_of.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/io=
mmu/iommu.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/io=
mmu/iommu-traces.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/io=
mmu/iommu-sysfs.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/io=
mmu/of_iommu.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_aperture.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_auth.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_cache.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_file.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_gem.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_ioctl.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_drv.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_sysfs.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_mm.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_crtc.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_fourcc.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_modes.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_edid.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_displayid.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_trace_points.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_prime.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_vma_manager.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_modeset_lock.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_atomic.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_bridge.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_framebuffer.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_connector.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_blend.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_encoder.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_mode_object.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_property.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_plane.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_color_mgmt.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_print.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_dumb_buffers.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_mode_config.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_vblank.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_syncobj.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_lease.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_writeback.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_client.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_client_modeset.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_atomic_uapi.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_managed.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_vblank_work.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_panel.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_of.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_debugfs.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_debugfs_crc.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_edid_load.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_nomodeset.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_panel_orientation_quirks.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_gem_cma_helper.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_fb_cma_helper.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_gem_shmem_helper.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_bridge_connector.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_crtc_helper.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_encoder_slave.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_flip_work.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_probe_helper.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_plane_helper.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_atomic_helper.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_kms_helper_common.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_simple_kms_helper.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_modeset_helper.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_scdc_helper.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_gem_atomic_helper.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_gem_framebuffer_helper.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_atomic_state_helper.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_damage_helper.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_format_helper.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_self_refresh_helper.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_rect.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/bridge/panel.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_mipi_dsi.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/display/drm_dp_aux_bus.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/display/drm_display_helper_mod.o' being placed in section `.ctors.654=
36'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/display/drm_dp_dual_mode_helper.o' being placed in section `.ctors.65=
436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/display/drm_dp_helper.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/display/drm_dp_mst_topology.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/display/drm_dsc_helper.o' being placed in section `.ctors.65436'
>> mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/display/drm_hdcp_helper.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/display/drm_dp_cec.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/scheduler/sched_main.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/scheduler/sched_fence.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/scheduler/sched_entity.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/vkms/vkms_drv.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/vkms/vkms_plane.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/vkms/vkms_output.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/vkms/vkms_crtc.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/vkms/vkms_composer.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/vkms/vkms_writeback.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/udl/udl_drv.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/udl/udl_modeset.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/udl/udl_connector.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/udl/udl_main.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/udl/udl_transfer.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/rcar-du/rcar_dw_hdmi.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/rcar-du/rcar_mipi_dsi.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/i2c/ch7006_drv.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/i2c/ch7006_mode.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/i2c/sil164_drv.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/i2c/tda9950.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/panel/panel-boe-bf060y8m-aj0.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/panel/panel-boe-himax8279d.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/panel/panel-boe-tv101wum-nl6.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/panel/panel-dsi-cm.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/panel/panel-lvds.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/panel/panel-elida-kd35t133.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/panel/panel-feixin-k101-im2ba02.o' being placed in section `.ctors.65=
436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/panel/panel-ilitek-ili9881c.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/panel/panel-innolux-p079zca.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/panel/panel-jdi-fhd-r63452.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/panel/panel-khadas-ts050.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/panel/panel-kingdisplay-kd097d04.o' being placed in section `.ctors.6=
5436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/panel/panel-leadtek-ltk050h3146w.o' being placed in section `.ctors.6=
5436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/panel/panel-novatek-nt35510.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/panel/panel-novatek-nt35560.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/panel/panel-novatek-nt35950.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/panel/panel-novatek-nt36672a.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/panel/panel-orisetech-otm8009a.o' being placed in section `.ctors.654=
36'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/panel/panel-raspberrypi-touchscreen.o' being placed in section `.ctor=
s.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/panel/panel-ronbo-rb070d30.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/panel/panel-samsung-s6d16d0.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/panel/panel-samsung-s6e3ha2.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/panel/panel-samsung-s6e63j0x03.o' being placed in section `.ctors.654=
36'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/panel/panel-samsung-s6e63m0.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/panel/panel-samsung-s6e63m0-dsi.o' being placed in section `.ctors.65=
436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/panel/panel-samsung-s6e8aa0.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/panel/panel-samsung-sofef00.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/panel/panel-seiko-43wvf1g.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/panel/panel-sharp-lq101r1sx01.o' being placed in section `.ctors.6543=
6'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/panel/panel-sharp-ls043t1le01.o' being placed in section `.ctors.6543=
6'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/panel/panel-sharp-ls060t1sx01.o' being placed in section `.ctors.6543=
6'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/panel/panel-sitronix-st7701.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/panel/panel-sony-tulip-truly-nt35521.o' being placed in section `.cto=
rs.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/panel/panel-tdo-tl070wsh30.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/panel/panel-visionox-rm69299.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/bridge/cdns-dsi.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/bridge/chipone-icn6211.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/bridge/ite-it6505.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/bridge/lontium-lt8912b.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/bridge/lontium-lt9611.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/bridge/lontium-lt9611uxc.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/bridge/lvds-codec.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.o' being placed in section `.c=
tors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/bridge/nxp-ptn3460.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/bridge/sil-sii8620.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/bridge/sii902x.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/bridge/sii9234.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/bridge/simple-bridge.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/bridge/tc358762.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/bridge/tc358767.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/bridge/tc358775.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/bridge/adv7511/adv7511_drv.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/bridge/adv7511/adv7533.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/bridge/ti-sn65dsi83.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/bridge/ti-sn65dsi86.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/bridge/ti-tpd12s015.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/bridge/ite-it66121.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/bridge/analogix/anx7625.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/bridge/analogix/analogix-anx78xx.o' being placed in section `.ctors.6=
5436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/bridge/analogix/analogix_dp_core.o' being placed in section `.ctors.6=
5436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/bridge/analogix/analogix_dp_reg.o' being placed in section `.ctors.65=
436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/bridge/analogix/analogix-i2c-dptx.o' being placed in section `.ctors.=
65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/bridge/synopsys/dw-hdmi.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/bridge/synopsys/dw-hdmi-ahb-audio.o' being placed in section `.ctors.=
65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/bridge/synopsys/dw-hdmi-i2s-audio.o' being placed in section `.ctors.=
65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/bridge/synopsys/dw-hdmi-cec.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/etnaviv/etnaviv_buffer.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/etnaviv/etnaviv_cmd_parser.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/etnaviv/etnaviv_cmdbuf.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/etnaviv/etnaviv_drv.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/etnaviv/etnaviv_dump.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/etnaviv/etnaviv_gem_prime.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/etnaviv/etnaviv_gem_submit.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/etnaviv/etnaviv_gem.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/etnaviv/etnaviv_gpu.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/etnaviv/etnaviv_hwdb.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/etnaviv/etnaviv_iommu_v2.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/etnaviv/etnaviv_iommu.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/etnaviv/etnaviv_mmu.o' being placed in section `.ctors.65436'
--
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/ch=
ar/tpm/tpm-dev.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/ch=
ar/tpm/tpm-interface.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/ch=
ar/tpm/tpm1-cmd.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/ch=
ar/tpm/tpm2-cmd.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/ch=
ar/tpm/tpmrm-dev.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/ch=
ar/tpm/tpm2-space.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/ch=
ar/tpm/tpm-sysfs.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/ch=
ar/tpm/eventlog/common.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/ch=
ar/tpm/eventlog/tpm1.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/ch=
ar/tpm/eventlog/tpm2.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/ch=
ar/tpm/eventlog/of.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/ch=
ar/tpm/tpm_tis_i2c_cr50.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/ch=
ar/tpm/tpm_i2c_atmel.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/ch=
ar/tpm/tpm_atmel.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/ch=
ar/tpm/st33zp24/st33zp24.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/ch=
ar/tpm/st33zp24/i2c.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/ch=
ar/tpm/tpm_vtpm_proxy.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/ch=
ar/xillybus/xillybus_class.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/ch=
ar/xillybus/xillybus_core.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/ch=
ar/xillybus/xillybus_of.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/io=
mmu/iommu.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/io=
mmu/iommu-traces.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/io=
mmu/iommu-sysfs.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/io=
mmu/of_iommu.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_aperture.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_auth.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_cache.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_file.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_gem.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_ioctl.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_drv.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_sysfs.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_mm.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_crtc.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_fourcc.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_modes.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_edid.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_displayid.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_trace_points.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_prime.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_vma_manager.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_modeset_lock.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_atomic.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_bridge.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_framebuffer.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_connector.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_blend.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_encoder.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_mode_object.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_property.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_plane.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_color_mgmt.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_print.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_dumb_buffers.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_mode_config.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_vblank.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_syncobj.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_lease.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_writeback.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_client.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_client_modeset.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_atomic_uapi.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_managed.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_vblank_work.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_panel.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_of.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_debugfs.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_debugfs_crc.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_edid_load.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_nomodeset.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_panel_orientation_quirks.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_gem_cma_helper.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_fb_cma_helper.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_gem_shmem_helper.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_bridge_connector.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_crtc_helper.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_encoder_slave.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_flip_work.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_probe_helper.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_plane_helper.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_atomic_helper.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_kms_helper_common.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_simple_kms_helper.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_modeset_helper.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_scdc_helper.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_gem_atomic_helper.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_gem_framebuffer_helper.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_atomic_state_helper.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_damage_helper.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_format_helper.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_self_refresh_helper.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_rect.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/bridge/panel.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/drm_mipi_dsi.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/display/drm_dp_aux_bus.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/display/drm_display_helper_mod.o' being placed in section `.ctors.654=
36'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/display/drm_dp_dual_mode_helper.o' being placed in section `.ctors.65=
436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/display/drm_dp_helper.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/display/drm_dp_mst_topology.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/display/drm_dsc_helper.o' being placed in section `.ctors.65436'
>> mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/display/drm_hdcp_helper.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/display/drm_dp_cec.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/scheduler/sched_main.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/scheduler/sched_fence.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/scheduler/sched_entity.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/vkms/vkms_drv.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/vkms/vkms_plane.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/vkms/vkms_output.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/vkms/vkms_crtc.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/vkms/vkms_composer.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/vkms/vkms_writeback.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/udl/udl_drv.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/udl/udl_modeset.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/udl/udl_connector.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/udl/udl_main.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/udl/udl_transfer.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/rcar-du/rcar_dw_hdmi.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/rcar-du/rcar_mipi_dsi.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/i2c/ch7006_drv.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/i2c/ch7006_mode.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/i2c/sil164_drv.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/i2c/tda9950.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/panel/panel-boe-bf060y8m-aj0.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/panel/panel-boe-himax8279d.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/panel/panel-boe-tv101wum-nl6.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/panel/panel-dsi-cm.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/panel/panel-lvds.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/panel/panel-elida-kd35t133.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/panel/panel-feixin-k101-im2ba02.o' being placed in section `.ctors.65=
436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/panel/panel-ilitek-ili9881c.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/panel/panel-innolux-p079zca.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/panel/panel-jdi-fhd-r63452.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/panel/panel-khadas-ts050.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/panel/panel-kingdisplay-kd097d04.o' being placed in section `.ctors.6=
5436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/panel/panel-leadtek-ltk050h3146w.o' being placed in section `.ctors.6=
5436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/panel/panel-novatek-nt35510.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/panel/panel-novatek-nt35560.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/panel/panel-novatek-nt35950.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/panel/panel-novatek-nt36672a.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/panel/panel-orisetech-otm8009a.o' being placed in section `.ctors.654=
36'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/panel/panel-raspberrypi-touchscreen.o' being placed in section `.ctor=
s.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/panel/panel-ronbo-rb070d30.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/panel/panel-samsung-s6d16d0.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/panel/panel-samsung-s6e3ha2.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/panel/panel-samsung-s6e63j0x03.o' being placed in section `.ctors.654=
36'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/panel/panel-samsung-s6e63m0.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/panel/panel-samsung-s6e63m0-dsi.o' being placed in section `.ctors.65=
436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/panel/panel-samsung-s6e8aa0.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/panel/panel-samsung-sofef00.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/panel/panel-seiko-43wvf1g.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/panel/panel-sharp-lq101r1sx01.o' being placed in section `.ctors.6543=
6'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/panel/panel-sharp-ls043t1le01.o' being placed in section `.ctors.6543=
6'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/panel/panel-sharp-ls060t1sx01.o' being placed in section `.ctors.6543=
6'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/panel/panel-sitronix-st7701.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/panel/panel-sony-tulip-truly-nt35521.o' being placed in section `.cto=
rs.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/panel/panel-tdo-tl070wsh30.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/panel/panel-visionox-rm69299.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/bridge/cdns-dsi.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/bridge/chipone-icn6211.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/bridge/ite-it6505.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/bridge/lontium-lt8912b.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/bridge/lontium-lt9611.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/bridge/lontium-lt9611uxc.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/bridge/lvds-codec.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.o' being placed in section `.c=
tors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/bridge/nxp-ptn3460.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/bridge/sil-sii8620.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/bridge/sii902x.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/bridge/sii9234.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/bridge/simple-bridge.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/bridge/tc358762.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/bridge/tc358767.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/bridge/tc358775.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/bridge/adv7511/adv7511_drv.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/bridge/adv7511/adv7533.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/bridge/ti-sn65dsi83.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/bridge/ti-sn65dsi86.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/bridge/ti-tpd12s015.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/bridge/ite-it66121.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/bridge/analogix/anx7625.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/bridge/analogix/analogix-anx78xx.o' being placed in section `.ctors.6=
5436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/bridge/analogix/analogix_dp_core.o' being placed in section `.ctors.6=
5436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/bridge/analogix/analogix_dp_reg.o' being placed in section `.ctors.65=
436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/bridge/analogix/analogix-i2c-dptx.o' being placed in section `.ctors.=
65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/bridge/synopsys/dw-hdmi.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/bridge/synopsys/dw-hdmi-ahb-audio.o' being placed in section `.ctors.=
65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/bridge/synopsys/dw-hdmi-i2s-audio.o' being placed in section `.ctors.=
65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/bridge/synopsys/dw-hdmi-cec.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/etnaviv/etnaviv_buffer.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/etnaviv/etnaviv_cmd_parser.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/etnaviv/etnaviv_cmdbuf.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/etnaviv/etnaviv_drv.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/etnaviv/etnaviv_dump.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/etnaviv/etnaviv_gem_prime.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/etnaviv/etnaviv_gem_submit.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/etnaviv/etnaviv_gem.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/etnaviv/etnaviv_gpu.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/etnaviv/etnaviv_hwdb.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/etnaviv/etnaviv_iommu_v2.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/etnaviv/etnaviv_iommu.o' being placed in section `.ctors.65436'
   mips64-linux-ld: warning: orphan section `.ctors.65436' from `drivers/gp=
u/drm/etnaviv/etnaviv_mmu.o' being placed in section `.ctors.65436'
..

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4755501934624595311==--

