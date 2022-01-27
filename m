Content-Type: multipart/mixed; boundary="===============4342837594570678812=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 2/9] Remove bdi_congested() and wb_congested() and related functions
Date: Fri, 28 Jan 2022 03:08:20 +0800
Message-ID: <202201280341.M0HhrMlw-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4342837594570678812==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
In-Reply-To: <164325158955.29787.4769373293473421057.stgit@noble.brown>
References: <164325158955.29787.4769373293473421057.stgit@noble.brown>
TO: NeilBrown <neilb@suse.de>
TO: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Jaegeuk Kim <jaegeuk@kernel.org>
TO: Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>
TO: Jeff Layton <jlayton@kernel.org>
TO: Ilya Dryomov <idryomov@gmail.com>
TO: Miklos Szeredi <miklos@szeredi.hu>
TO: Trond Myklebust <trond.myklebust@hammerspace.com>
TO: Anna Schumaker <anna.schumaker@netapp.com>
TO: Ryusuke Konishi <konishi.ryusuke@gmail.com>

Hi NeilBrown,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on jaegeuk-f2fs/dev-test]
[also build test WARNING on trondmy-nfs/linux-next linus/master v5.17-rc1 n=
ext-20220127]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/NeilBrown/Remove-remaining=
-parts-of-congestions-tracking-code/20220127-105051
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git de=
v-test
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
config: riscv-randconfig-c006-20220124 (https://download.01.org/0day-ci/arc=
hive/20220128/202201280341.M0HhrMlw-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project f32dcc=
b9a43b02ce4e540d6ba5dbbdb188f2dc7d)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/0day-ci/linux/commit/4e63f49027815bc4037227b6d=
091210c86009e7a
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review NeilBrown/Remove-remaining-parts-o=
f-congestions-tracking-code/20220127-105051
        git checkout 4e63f49027815bc4037227b6d091210c86009e7a
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce112/dce112_resource.c:1073:2=
: note: Taking true branch
           if (!dm_pp_get_clock_levels_by_type_with_latency(
           ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce112/dce112_resource.c:1084:2=
7: note: Access to field 'high_sclk' results in a dereference of a null poi=
nter (loaded from field 'bw_vbios')
                   dc->bw_vbios->high_sclk =3D bw_frc_to_fixed(
                       ~~~~~~~~            ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce112/dce112_resource.c:1120:2=
6: warning: Access to field 'high_sclk' results in a dereference of a null =
pointer (loaded from field 'bw_vbios') [clang-analyzer-core.NullDereference]
           dc->bw_vbios->high_sclk =3D bw_frc_to_fixed(
               ~~~~~~~~            ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce112/dce112_resource.c:1067:6=
: note: Assuming field 'bw_vbios' is null
           if (dc->bw_vbios && dc->bw_vbios->memory_type =3D=3D bw_def_hbm)
               ^~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce112/dce112_resource.c:1067:1=
9: note: Left side of '&&' is false
           if (dc->bw_vbios && dc->bw_vbios->memory_type =3D=3D bw_def_hbm)
                            ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce112/dce112_resource.c:1073:6=
: note: Assuming the condition is false
           if (!dm_pp_get_clock_levels_by_type_with_latency(
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce112/dce112_resource.c:1073:2=
: note: Taking false branch
           if (!dm_pp_get_clock_levels_by_type_with_latency(
           ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce112/dce112_resource.c:1120:2=
6: note: Access to field 'high_sclk' results in a dereference of a null poi=
nter (loaded from field 'bw_vbios')
           dc->bw_vbios->high_sclk =3D bw_frc_to_fixed(
               ~~~~~~~~            ^
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce110/dce110_hw_sequencer.c:89=
8:5: warning: Value stored to 'bp_result' is never read [clang-analyzer-dea=
dcode.DeadStores]
                                   bp_result =3D ctx->dc_bios->funcs->enabl=
e_lvtma_control(ctx->dc_bios,
                                   ^           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce110/dce110_hw_sequencer.c:89=
8:5: note: Value stored to 'bp_result' is never read
                                   bp_result =3D ctx->dc_bios->funcs->enabl=
e_lvtma_control(ctx->dc_bios,
                                   ^           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce110/dce110_hw_sequencer.c:90=
2:5: warning: Value stored to 'bp_result' is never read [clang-analyzer-dea=
dcode.DeadStores]
                                   bp_result =3D ctx->dc_bios->funcs->enabl=
e_lvtma_control(ctx->dc_bios,
                                   ^           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce110/dce110_hw_sequencer.c:90=
2:5: note: Value stored to 'bp_result' is never read
                                   bp_result =3D ctx->dc_bios->funcs->enabl=
e_lvtma_control(ctx->dc_bios,
                                   ^           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce110/dce110_hw_sequencer.c:10=
28:19: warning: Access to field 'inst' results in a dereference of a null p=
ointer (loaded from field 'panel_cntl') [clang-analyzer-core.NullDereferenc=
e]
           panel_instance =3D link->panel_cntl->inst;
                            ^     ~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce110/dce110_hw_sequencer.c:98=
1:6: note: Assuming the condition is false
           if (dal_graphics_object_id_get_connector_id(link->link_enc->conn=
ector)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce110/dce110_hw_sequencer.c:98=
1:2: note: Taking false branch
           if (dal_graphics_object_id_get_connector_id(link->link_enc->conn=
ector)
           ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce110/dce110_hw_sequencer.c:98=
7:6: note: Assuming field 'panel_cntl' is null
           if (link->panel_cntl) {
               ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce110/dce110_hw_sequencer.c:98=
7:2: note: Taking false branch
           if (link->panel_cntl) {
           ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce110/dce110_hw_sequencer.c:10=
02:15: note: Assuming 'enable' is false
                           __func__, (enable ? "On":"Off"));
                                      ^
   drivers/gpu/drm/amd/amdgpu/../display/include/logger_types.h:45:48: note=
: expanded from macro 'DC_LOG_HW_RESUME_S3'
   #define DC_LOG_HW_RESUME_S3(...) DRM_DEBUG_KMS(__VA_ARGS__)
                                                  ^~~~~~~~~~~
   include/drm/drm_print.h:534:31: note: expanded from macro 'DRM_DEBUG_KMS'
           __drm_dbg(DRM_UT_KMS, fmt, ##__VA_ARGS__)
                                        ^~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce110/dce110_hw_sequencer.c:10=
02:15: note: '?' condition is false
                           __func__, (enable ? "On":"Off"));
                                      ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce110/dce110_hw_sequencer.c:10=
04:16: note: 'enable' is false
           cntl.action =3D enable ?
                         ^~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce110/dce110_hw_sequencer.c:10=
04:16: note: '?' condition is false
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce110/dce110_hw_sequencer.c:10=
28:19: note: Access to field 'inst' results in a dereference of a null poin=
ter (loaded from field 'panel_cntl')
           panel_instance =3D link->panel_cntl->inst;
                            ^     ~~~~~~~~~~
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   fs/ext2/dir.c:477:2: warning: Value stored to 'err' is never read [clang=
-analyzer-deadcode.DeadStores]
           err =3D ext2_commit_chunk(page, pos, len);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ext2/dir.c:477:2: note: Value stored to 'err' is never read
           err =3D ext2_commit_chunk(page, pos, len);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
>> fs/ext2/ialloc.c:175:2: warning: Value stored to 'bdi' is never read [cl=
ang-analyzer-deadcode.DeadStores]
           bdi =3D inode_to_bdi(inode);
           ^     ~~~~~~~~~~~~~~~~~~~
   fs/ext2/ialloc.c:175:2: note: Value stored to 'bdi' is never read
           bdi =3D inode_to_bdi(inode);
           ^     ~~~~~~~~~~~~~~~~~~~
   fs/ext2/ialloc.c:301:4: warning: Value stored to 'desc' is never read [c=
lang-analyzer-deadcode.DeadStores]
                           desc =3D best_desc;
                           ^      ~~~~~~~~~
   fs/ext2/ialloc.c:301:4: note: Value stored to 'desc' is never read
                           desc =3D best_desc;
                           ^      ~~~~~~~~~
   Suppressed 5 warnings (4 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   fs/ext2/inode.c:809:23: warning: Value stored to 'sbi' during its initia=
lization is never read [clang-analyzer-deadcode.DeadStores]
           struct ext2_sb_info *sbi =3D EXT2_SB(inode->i_sb);
                                ^~~   ~~~~~~~~~~~~~~~~~~~~
   fs/ext2/inode.c:809:23: note: Value stored to 'sbi' during its initializ=
ation is never read
           struct ext2_sb_info *sbi =3D EXT2_SB(inode->i_sb);
                                ^~~   ~~~~~~~~~~~~~~~~~~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c:73:2: warning: Value stored to '=
temp' is never read [clang-analyzer-deadcode.DeadStores]
           temp =3D RREG32(rec->mask_clk_reg);
           ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c:73:2: note: Value stored to 'tem=
p' is never read
   drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c:77:2: warning: Value stored to '=
temp' is never read [clang-analyzer-deadcode.DeadStores]
           temp =3D RREG32(rec->mask_data_reg);
           ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c:77:2: note: Value stored to 'tem=
p' is never read
   drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c:92:2: warning: Value stored to '=
temp' is never read [clang-analyzer-deadcode.DeadStores]
           temp =3D RREG32(rec->mask_clk_reg);
           ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c:92:2: note: Value stored to 'tem=
p' is never read
   drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c:96:2: warning: Value stored to '=
temp' is never read [clang-analyzer-deadcode.DeadStores]
           temp =3D RREG32(rec->mask_data_reg);
           ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c:96:2: note: Value stored to 'tem=
p' is never read
   drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c:312:3: warning: 4th function cal=
l argument is an uninitialized value [clang-analyzer-core.CallAndMessage]
                   DRM_DEBUG("i2c 0x%02x 0x%02x read failed\n",
                   ^
   include/drm/drm_print.h:526:2: note: expanded from macro 'DRM_DEBUG'
           __drm_dbg(DRM_UT_CORE, fmt, ##__VA_ARGS__)
           ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c:371:2: note: 'val' declared with=
out an initial value
           u8 val;
           ^~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c:373:6: note: Assuming field 'cd_=
valid' is true
           if (!amdgpu_connector->router.cd_valid)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c:373:2: note: Taking false branch
           if (!amdgpu_connector->router.cd_valid)
           ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c:376:6: note: Assuming field 'rou=
ter_bus' is non-null
           if (!amdgpu_connector->router_bus)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c:376:2: note: Taking false branch
           if (!amdgpu_connector->router_bus)
           ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c:379:2: note: Calling 'amdgpu_i2c=
_get_byte'
           amdgpu_i2c_get_byte(amdgpu_connector->router_bus,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c:308:6: note: Assuming the condit=
ion is false
           if (i2c_transfer(&i2c_bus->adapter, msgs, 2) =3D=3D 2) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c:308:2: note: Taking false branch
           if (i2c_transfer(&i2c_bus->adapter, msgs, 2) =3D=3D 2) {
           ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c:312:3: note: 4th function call a=
rgument is an uninitialized value
                   DRM_DEBUG("i2c 0x%02x 0x%02x read failed\n",
                   ^
   include/drm/drm_print.h:526:2: note: expanded from macro 'DRM_DEBUG'
           __drm_dbg(DRM_UT_CORE, fmt, ##__VA_ARGS__)
           ^                             ~~~~~~~~~~~
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).

vim +/bdi +175 fs/ext2/ialloc.c

^1da177e4c3f41 Linus Torvalds    2005-04-16  154  =

^1da177e4c3f41 Linus Torvalds    2005-04-16  155  /*
^1da177e4c3f41 Linus Torvalds    2005-04-16  156   * We perform asynchronou=
s prereading of the new inode's inode block when
^1da177e4c3f41 Linus Torvalds    2005-04-16  157   * we create the inode, i=
n the expectation that the inode will be written
^1da177e4c3f41 Linus Torvalds    2005-04-16  158   * back soon.  There are =
two reasons:
^1da177e4c3f41 Linus Torvalds    2005-04-16  159   *
^1da177e4c3f41 Linus Torvalds    2005-04-16  160   * - When creating a larg=
e number of files, the async prereads will be
^1da177e4c3f41 Linus Torvalds    2005-04-16  161   *   nicely merged into l=
arge reads
^1da177e4c3f41 Linus Torvalds    2005-04-16  162   * - When writing out a l=
arge number of inodes, we don't need to keep on
^1da177e4c3f41 Linus Torvalds    2005-04-16  163   *   stalling the writes =
while we read the inode block.
^1da177e4c3f41 Linus Torvalds    2005-04-16  164   *
^1da177e4c3f41 Linus Torvalds    2005-04-16  165   * FIXME: ext2_get_group_=
desc() needs to be simplified.
^1da177e4c3f41 Linus Torvalds    2005-04-16  166   */
^1da177e4c3f41 Linus Torvalds    2005-04-16  167  static void ext2_preread_=
inode(struct inode *inode)
^1da177e4c3f41 Linus Torvalds    2005-04-16  168  {
^1da177e4c3f41 Linus Torvalds    2005-04-16  169  	unsigned long block_grou=
p;
^1da177e4c3f41 Linus Torvalds    2005-04-16  170  	unsigned long offset;
^1da177e4c3f41 Linus Torvalds    2005-04-16  171  	unsigned long block;
^1da177e4c3f41 Linus Torvalds    2005-04-16  172  	struct ext2_group_desc *=
 gdp;
^1da177e4c3f41 Linus Torvalds    2005-04-16  173  	struct backing_dev_info =
*bdi;
^1da177e4c3f41 Linus Torvalds    2005-04-16  174  =

de1414a654e66b Christoph Hellwig 2015-01-14 @175  	bdi =3D inode_to_bdi(ino=
de);
^1da177e4c3f41 Linus Torvalds    2005-04-16  176  =

^1da177e4c3f41 Linus Torvalds    2005-04-16  177  	block_group =3D (inode->=
i_ino - 1) / EXT2_INODES_PER_GROUP(inode->i_sb);
ef2fb67989d30f Eric Sandeen      2007-10-16  178  	gdp =3D ext2_get_group_d=
esc(inode->i_sb, block_group, NULL);
^1da177e4c3f41 Linus Torvalds    2005-04-16  179  	if (gdp =3D=3D NULL)
^1da177e4c3f41 Linus Torvalds    2005-04-16  180  		return;
^1da177e4c3f41 Linus Torvalds    2005-04-16  181  =

^1da177e4c3f41 Linus Torvalds    2005-04-16  182  	/*
^1da177e4c3f41 Linus Torvalds    2005-04-16  183  	 * Figure out the offset=
 within the block group inode table
^1da177e4c3f41 Linus Torvalds    2005-04-16  184  	 */
^1da177e4c3f41 Linus Torvalds    2005-04-16  185  	offset =3D ((inode->i_in=
o - 1) % EXT2_INODES_PER_GROUP(inode->i_sb)) *
^1da177e4c3f41 Linus Torvalds    2005-04-16  186  				EXT2_INODE_SIZE(inode=
->i_sb);
^1da177e4c3f41 Linus Torvalds    2005-04-16  187  	block =3D le32_to_cpu(gd=
p->bg_inode_table) +
^1da177e4c3f41 Linus Torvalds    2005-04-16  188  				(offset >> EXT2_BLOCK=
_SIZE_BITS(inode->i_sb));
^1da177e4c3f41 Linus Torvalds    2005-04-16  189  	sb_breadahead(inode->i_s=
b, block);
^1da177e4c3f41 Linus Torvalds    2005-04-16  190  }
^1da177e4c3f41 Linus Torvalds    2005-04-16  191  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4342837594570678812==--

