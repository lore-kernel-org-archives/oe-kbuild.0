Content-Type: multipart/mixed; boundary="===============5994553613718288549=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/mtd/spi-nor/core.c:1512:2: warning: Use of memory after it is freed [clang-analyzer-unix.Malloc]
Date: Thu, 05 May 2022 11:25:21 +0800
Message-ID: <202205051125.qgDf9RoF-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5994553613718288549==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Chris Down <chris@chrisdown.name>
CC: Petr Mladek <pmladek@suse.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   a7391ad3572431a354c927cf8896e86e50d7d0bf
commit: ad7d61f159db73974f1b0352f21afe04b0bbd920 printk: index: Add indexin=
g support to dev_printk
date:   10 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 10 months ago
config: arm-randconfig-c002-20220428 (https://download.01.org/0day-ci/archi=
ve/20220505/202205051125.qgDf9RoF-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c59473=
aacce38cd7dd77eebceaf3c98c5707ab3b)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Dad7d61f159db73974f1b0352f21afe04b0bbd920
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout ad7d61f159db73974f1b0352f21afe04b0bbd920
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           tmp =3D RREG32_SOC15(GC, 0, mmCP_MQD_CONTROL);
                 ^
   drivers/gpu/drm/amd/amdgpu/../amdgpu/soc15_common.h:49:2: note: expanded=
 from macro 'RREG32_SOC15'
           __RREG32_SOC15_RLC__(adev->reg_offset[ip##_HWIP][inst][reg##_BAS=
E_IDX] + reg, \
           ^
   drivers/gpu/drm/amd/amdgpu/../amdgpu/soc15_common.h:36:26: note: expande=
d from macro '__RREG32_SOC15_RLC__'
           ((amdgpu_sriov_vf(adev) && adev->gfx.rlc.funcs && adev->gfx.rlc.=
funcs->rlcg_rreg) ? \
                                   ^
   drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c:3531:8: note: Assuming the conditi=
on is false
           tmp =3D RREG32_SOC15(GC, 0, mmCP_HQD_PQ_CONTROL);
                 ^
   drivers/gpu/drm/amd/amdgpu/../amdgpu/soc15_common.h:49:2: note: expanded=
 from macro 'RREG32_SOC15'
           __RREG32_SOC15_RLC__(adev->reg_offset[ip##_HWIP][inst][reg##_BAS=
E_IDX] + reg, \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../amdgpu/soc15_common.h:36:4: note: expanded=
 from macro '__RREG32_SOC15_RLC__'
           ((amdgpu_sriov_vf(adev) && adev->gfx.rlc.funcs && adev->gfx.rlc.=
funcs->rlcg_rreg) ? \
             ^~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu_virt.h:251:2: note: expanded=
 from macro 'amdgpu_sriov_vf'
   ((adev)->virt.caps & AMDGPU_SRIOV_CAPS_IS_VF)
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c:3531:8: note: Left side of '&&' is=
 false
           tmp =3D RREG32_SOC15(GC, 0, mmCP_HQD_PQ_CONTROL);
                 ^
   drivers/gpu/drm/amd/amdgpu/../amdgpu/soc15_common.h:49:2: note: expanded=
 from macro 'RREG32_SOC15'
           __RREG32_SOC15_RLC__(adev->reg_offset[ip##_HWIP][inst][reg##_BAS=
E_IDX] + reg, \
           ^
   drivers/gpu/drm/amd/amdgpu/../amdgpu/soc15_common.h:36:26: note: expande=
d from macro '__RREG32_SOC15_RLC__'
           ((amdgpu_sriov_vf(adev) && adev->gfx.rlc.funcs && adev->gfx.rlc.=
funcs->rlcg_rreg) ? \
                                   ^
   drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c:3533:9: note: '?' condition is fal=
se
                               (order_base_2(ring->ring_size / 4) - 1));
                                ^
   include/linux/log2.h:219:2: note: expanded from macro 'order_base_2'
           __builtin_constant_p(n) ? (             \
           ^
   drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c:3532:8: note: The result of the le=
ft shift is undefined because the left operand is negative
           tmp =3D REG_SET_FIELD(tmp, CP_HQD_PQ_CONTROL, QUEUE_SIZE,
                 ^
   drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu.h:1210:46: note: expanded fr=
om macro 'REG_SET_FIELD'
            (REG_FIELD_MASK(reg, field) & ((field_val) << REG_FIELD_SHIFT(r=
eg, field))))
                                           ~~~~~~~~~~~ ^
   drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c:4126:4: warning: Value stored to '=
tmp' is never read [clang-analyzer-deadcode.DeadStores]
                           tmp =3D RREG32_SOC15(GC, 0, mmGRBM_SOFT_RESET);
                           ^
   drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c:4126:4: note: Value stored to 'tmp=
' is never read
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_link_encoder.c:310:2: w=
arning: Value stored to 'value' is never read [clang-analyzer-deadcode.Dead=
Stores]
           value =3D REG_READ(DP_DPHY_INTERNAL_CTRL);
           ^
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_link_encoder.c:310:2: n=
ote: Value stored to 'value' is never read
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_clock_source.c:1264:2: =
warning: Value stored to 'ss_info_cur' is never read [clang-analyzer-deadco=
de.DeadStores]
           ss_info_cur =3D ss_info;
           ^             ~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dce_clock_source.c:1264:2: =
note: Value stored to 'ss_info_cur' is never read
           ss_info_cur =3D ss_info;
           ^             ~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (8 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
>> drivers/mtd/spi-nor/core.c:1512:2: warning: Use of memory after it is fr=
eed [clang-analyzer-unix.Malloc]
           list_for_each_entry_safe(cmd, next, erase_list, list) {
           ^
   include/linux/list.h:716:7: note: expanded from macro 'list_for_each_ent=
ry_safe'
                   n =3D list_next_entry(pos, member);                     =
  \
                       ^
   include/linux/list.h:555:2: note: expanded from macro 'list_next_entry'
           list_entry((pos)->member.next, typeof(*(pos)), member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:494:25: note: expanded from macro 'container_of'
           void *__mptr =3D (void *)(ptr);                                 =
  \
                                  ^
   drivers/mtd/spi-nor/core.c:1651:2: note: Taking false branch
           dev_dbg(nor->dev, "at 0x%llx, len %lld\n", (long long)instr->add=
r,
           ^
   include/linux/dev_printk.h:162:2: note: expanded from macro 'dev_dbg'
           if (0)                                                          \
           ^
   drivers/mtd/spi-nor/core.c:1654:2: note: Taking true branch
           if (spi_nor_has_uniform_erase(nor)) {
           ^
   drivers/mtd/spi-nor/core.c:1656:7: note: Assuming 'rem' is 0
                   if (rem)
                       ^~~
   drivers/mtd/spi-nor/core.c:1656:3: note: Taking false branch
                   if (rem)
                   ^
   drivers/mtd/spi-nor/core.c:1664:6: note: 'ret' is 0
           if (ret)
               ^~~
   drivers/mtd/spi-nor/core.c:1664:2: note: Taking false branch
           if (ret)
           ^
   drivers/mtd/spi-nor/core.c:1668:6: note: Assuming 'len' is not equal to =
field 'size'
           if (len =3D=3D mtd->size && !(nor->flags & SNOR_F_NO_OP_CHIP_ERA=
SE)) {
               ^~~~~~~~~~~~~~~~
   drivers/mtd/spi-nor/core.c:1668:23: note: Left side of '&&' is false
           if (len =3D=3D mtd->size && !(nor->flags & SNOR_F_NO_OP_CHIP_ERA=
SE)) {
                                ^
   drivers/mtd/spi-nor/core.c:1698:9: note: Taking false branch
           } else if (spi_nor_has_uniform_erase(nor)) {
                  ^
   drivers/mtd/spi-nor/core.c:1718:9: note: Calling 'spi_nor_erase_multi_se=
ctors'
                   ret =3D spi_nor_erase_multi_sectors(nor, addr, len);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/spi-nor/core.c:1605:6: note: 'ret' is 0
           if (ret)
               ^~~
   drivers/mtd/spi-nor/core.c:1605:2: note: Taking false branch
           if (ret)
           ^
   drivers/mtd/spi-nor/core.c:1608:2: note: Left side of '&&' is false
           list_for_each_entry_safe(cmd, next, &erase_list, list) {
           ^
   include/linux/list.h:715:13: note: expanded from macro 'list_for_each_en=
try_safe'
           for (pos =3D list_first_entry(head, typeof(*pos), member),      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:495:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/mtd/spi-nor/core.c:1608:2: note: Taking false branch
           list_for_each_entry_safe(cmd, next, &erase_list, list) {
           ^
   include/linux/list.h:715:13: note: expanded from macro 'list_for_each_en=
try_safe'
           for (pos =3D list_first_entry(head, typeof(*pos), member),      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:328:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:316:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:308:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/mtd/spi-nor/core.c:1608:2: note: Loop condition is false.  Exiti=
ng loop
           list_for_each_entry_safe(cmd, next, &erase_list, list) {
           ^
   include/linux/list.h:715:13: note: expanded from macro 'list_for_each_en=
try_safe'
           for (pos =3D list_first_entry(head, typeof(*pos), member),      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'

vim +1512 drivers/mtd/spi-nor/core.c

5390a8df769ec9 drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus 2018-09-11  1503=
  =

5390a8df769ec9 drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus 2018-09-11  1504=
  /**
5390a8df769ec9 drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus 2018-09-11  1505=
   * spi_nor_destroy_erase_cmd_list() - destroy erase command list
5390a8df769ec9 drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus 2018-09-11  1506=
   * @erase_list:	list of erase commands
5390a8df769ec9 drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus 2018-09-11  1507=
   */
5390a8df769ec9 drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus 2018-09-11  1508=
  static void spi_nor_destroy_erase_cmd_list(struct list_head *erase_list)
5390a8df769ec9 drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus 2018-09-11  1509=
  {
5390a8df769ec9 drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus 2018-09-11  1510=
  	struct spi_nor_erase_command *cmd, *next;
5390a8df769ec9 drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus 2018-09-11  1511=
  =

5390a8df769ec9 drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus 2018-09-11 @1512=
  	list_for_each_entry_safe(cmd, next, erase_list, list) {
5390a8df769ec9 drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus 2018-09-11  1513=
  		list_del(&cmd->list);
5390a8df769ec9 drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus 2018-09-11  1514=
  		kfree(cmd);
5390a8df769ec9 drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus 2018-09-11  1515=
  	}
5390a8df769ec9 drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus 2018-09-11  1516=
  }
5390a8df769ec9 drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus 2018-09-11  1517=
  =


:::::: The code at line 1512 was first introduced by commit
:::::: 5390a8df769ec9ba9c995191bb0867430f602ebb mtd: spi-nor: add support t=
o non-uniform SFDP SPI NOR flash memories

:::::: TO: Tudor Ambarus <tudor.ambarus@microchip.com>
:::::: CC: Boris Brezillon <boris.brezillon@bootlin.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5994553613718288549==--

