Content-Type: multipart/mixed; boundary="===============3030161859374167217=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h:53 amdgpu_vram_mgr_block_size() warn: should '(((1)) << (14)) << drm_buddy_block_order(block)' be a 64 bit type?
Date: Fri, 27 May 2022 12:10:42 +0800
Message-ID: <202205271250.XulIv7rX-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3030161859374167217==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
CC: "Christian K=C3=B6nig" <christian.koenig@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   7f50d4dfe816dd916a7cbf39039674825c2b388b
commit: c9cad937c0c58618fe5b0310fd539a854dc1ae95 drm/amdgpu: add drm buddy =
support to amdgpu
date:   7 weeks ago
:::::: branch date: 4 hours ago
:::::: commit date: 7 weeks ago
config: arc-randconfig-m031-20220524 (https://download.01.org/0day-ci/archi=
ve/20220527/202205271250.XulIv7rX-lkp(a)intel.com/config)
compiler: arceb-elf-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h:53 amdgpu_vram_mgr_block_size(=
) warn: should '(((1)) << (14)) << drm_buddy_block_order(block)' be a 64 bi=
t type?
drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:369 amdgpu_vram_mgr_new() warn=
: should 'place->lpfn << 14' be a 64 bit type?
drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:373 amdgpu_vram_mgr_new() warn=
: should 'place->fpfn << 14' be a 64 bit type?
drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:418 amdgpu_vram_mgr_new() warn=
: should 'tbo->page_alignment << 14' be a 64 bit type?
drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:428 amdgpu_vram_mgr_new() warn=
: should 'pages_per_block << 14' be a 64 bit type?
drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h:53 amdgpu_vram_mgr_block_size(=
) warn: should '(((1)) << (14)) << drm_buddy_block_order(block)' be a 64 bi=
t type?
drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h:53 amdgpu_vram_mgr_block_size(=
) warn: should '(((1)) << (14)) << drm_buddy_block_order(block)' be a 64 bi=
t type?
drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h:53 amdgpu_vram_mgr_block_size(=
) warn: should '(((1)) << (14)) << drm_buddy_block_order(block)' be a 64 bi=
t type?

Old smatch warnings:
drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:384 amdgpu_move_blit() warn: should=
 'new_mem->num_pages << 14' be a 64 bit type?
drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c:541 amdgpu_cs_parser_bos() warn: Ple=
ase consider using kvcalloc instead of kvmalloc_array

vim +53 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h

c9cad937c0c586 Arunpravin Paneer Selvam 2022-04-08  50  =

c9cad937c0c586 Arunpravin Paneer Selvam 2022-04-08  51  static inline u64 a=
mdgpu_vram_mgr_block_size(struct drm_buddy_block *block)
c9cad937c0c586 Arunpravin Paneer Selvam 2022-04-08  52  {
c9cad937c0c586 Arunpravin Paneer Selvam 2022-04-08 @53  	return PAGE_SIZE <=
< drm_buddy_block_order(block);
c9cad937c0c586 Arunpravin Paneer Selvam 2022-04-08  54  }
c9cad937c0c586 Arunpravin Paneer Selvam 2022-04-08  55  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3030161859374167217==--

