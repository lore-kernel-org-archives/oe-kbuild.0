Content-Type: multipart/mixed; boundary="===============3376308100061326219=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 2266/4328] drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h:53 amdgpu_vram_mgr_block_size() warn: should '((1) << 12) << drm_buddy_block_order(block)' be a 64 bit type?
Date: Tue, 19 Apr 2022 13:03:36 +0800
Message-ID: <202204191232.1PN0grE0-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3376308100061326219==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
CC: "Christian K=C3=B6nig" <christian.koenig@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   40354149f4d738dc3492d9998e45b3f02950369a
commit: c9cad937c0c58618fe5b0310fd539a854dc1ae95 [2266/4328] drm/amdgpu: ad=
d drm buddy support to amdgpu
:::::: branch date: 5 days ago
:::::: commit date: 11 days ago
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20220=
419/202204191232.1PN0grE0-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.2.0-19) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h:53 amdgpu_vram_mgr_block_size(=
) warn: should '((1) << 12) << drm_buddy_block_order(block)' be a 64 bit ty=
pe?
drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h:53 amdgpu_vram_mgr_block_size(=
) warn: should '((1) << 12) << drm_buddy_block_order(block)' be a 64 bit ty=
pe?
drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:413 amdgpu_vram_mgr_new() warn=
: should 'vres->base.num_pages << 12' be a 64 bit type?
drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:428 amdgpu_vram_mgr_new() warn=
: should 'pages_per_block << 12' be a 64 bit type?
drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h:53 amdgpu_vram_mgr_block_size(=
) warn: should '((1) << 12) << drm_buddy_block_order(block)' be a 64 bit ty=
pe?
drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h:53 amdgpu_vram_mgr_block_size(=
) warn: should '((1) << 12) << drm_buddy_block_order(block)' be a 64 bit ty=
pe?

Old smatch warnings:
drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:369 amdgpu_vram_mgr_new() warn=
: should 'place->lpfn << 12' be a 64 bit type?
drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:373 amdgpu_vram_mgr_new() warn=
: should 'place->fpfn << 12' be a 64 bit type?
drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:418 amdgpu_vram_mgr_new() warn=
: should 'tbo->page_alignment << 12' be a 64 bit type?
drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:472 amdgpu_vram_mgr_new() warn=
: should 'vres->base.num_pages << 12' be a 64 bit type?
drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:384 amdgpu_move_blit() warn: should=
 'new_mem->num_pages << 12' be a 64 bit type?
drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c:521 amdgpu_cs_parser_bos() error: we=
 previously assumed 'p->bo_list' could be null (see line 512)
drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c:541 amdgpu_cs_parser_bos() warn: Ple=
ase consider using kvcalloc instead

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
--===============3376308100061326219==--

