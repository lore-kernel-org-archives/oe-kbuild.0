Content-Type: multipart/mixed; boundary="===============1716226481210609227=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: sound/soc/codecs/ak4375.c:343:3: warning: Value stored to 'mclk' is never read [clang-analyzer-deadcode.DeadStores]
Date: Sat, 15 Jan 2022 23:02:21 +0800
Message-ID: <202201152210.0zTOGFme-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1716226481210609227==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Vincent Knecht <vincent.knecht@mailoo.org>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   a33f5c380c4bd3fa5278d690421b72052456d9fe
commit: 53778b8292b5492ec3ecf1efb84163eac2a6e422 ASoC: Add AK4375 support
date:   4 weeks ago
:::::: branch date: 9 hours ago
:::::: commit date: 4 weeks ago
config: arm-randconfig-c002-20220111 (https://download.01.org/0day-ci/archi=
ve/20220115/202201152210.0zTOGFme-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 244dd2=
913a43a200f5a6544d424cdc37b771028b)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D53778b8292b5492ec3ecf1efb84163eac2a6e422
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 53778b8292b5492ec3ecf1efb84163eac2a6e422
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                   ^
   include/asm-generic/bug.h:123:3: note: expanded from macro 'WARN_ON'
                   __WARN();                                               \
                   ^
   include/asm-generic/bug.h:88:19: note: expanded from macro '__WARN'
   #define __WARN()                __WARN_printf(TAINT_WARN, NULL)
                                   ^
   include/asm-generic/bug.h:90:3: note: expanded from macro '__WARN_printf'
                   instrumentation_begin();                                \
                   ^
   include/linux/instrumentation.h:57:34: note: expanded from macro 'instru=
mentation_begin'
   # define instrumentation_begin()        do { } while(0)
                                           ^
   fs/btrfs/disk-io.c:2178:3: note: Loop condition is false.  Exiting loop
                   WARN_ON(test_bit(BTRFS_ROOT_DEAD_RELOC_TREE, &root->stat=
e));
                   ^
   include/asm-generic/bug.h:123:3: note: expanded from macro 'WARN_ON'
                   __WARN();                                               \
                   ^
   include/asm-generic/bug.h:88:19: note: expanded from macro '__WARN'
   #define __WARN()                __WARN_printf(TAINT_WARN, NULL)
                                   ^
   include/asm-generic/bug.h:92:3: note: expanded from macro '__WARN_printf'
                   instrumentation_end();                                  \
                   ^
   include/linux/instrumentation.h:58:33: note: expanded from macro 'instru=
mentation_end'
   # define instrumentation_end()          do { } while(0)
                                           ^
   fs/btrfs/disk-io.c:2178:3: note: Loop condition is false.  Exiting loop
                   WARN_ON(test_bit(BTRFS_ROOT_DEAD_RELOC_TREE, &root->stat=
e));
                   ^
   include/asm-generic/bug.h:123:3: note: expanded from macro 'WARN_ON'
                   __WARN();                                               \
                   ^
   include/asm-generic/bug.h:88:19: note: expanded from macro '__WARN'
   #define __WARN()                __WARN_printf(TAINT_WARN, NULL)
                                   ^
   include/asm-generic/bug.h:89:38: note: expanded from macro '__WARN_print=
f'
   #define __WARN_printf(taint, arg...) do {                               \
                                        ^
   fs/btrfs/disk-io.c:2179:7: note: Assuming field 'anon_dev' is 0
                   if (root->anon_dev)
                       ^~~~~~~~~~~~~~
   fs/btrfs/disk-io.c:2179:3: note: Taking false branch
                   if (root->anon_dev)
                   ^
   fs/btrfs/disk-io.c:2188:3: note: Memory is released
                   kfree(root);
                   ^~~~~~~~~~~
   fs/btrfs/disk-io.c:2205:3: note: Returning; memory was released
                   btrfs_put_root(gang[0]);
                   ^~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/disk-io.c:2198:2: note: Loop condition is true.  Entering loop =
body
           while (!list_empty(&fs_info->dead_roots)) {
           ^
   fs/btrfs/disk-io.c:2201:3: note: Calling 'list_del'
                   list_del(&gang[0]->root_list);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:149:14: note: Use of memory after it is freed
           entry->next =3D LIST_POISON1;
           ~~~~~~~~~~~ ^
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/media/i2c/rj54n1cb0c.c:687:3: warning: Value stored to 'input_w'=
 is never read [clang-analyzer-deadcode.DeadStores]
                   input_w =3D output_w;
                   ^         ~~~~~~~~
   drivers/media/i2c/rj54n1cb0c.c:687:3: note: Value stored to 'input_w' is=
 never read
                   input_w =3D output_w;
                   ^         ~~~~~~~~
   drivers/media/i2c/rj54n1cb0c.c:688:3: warning: Value stored to 'input_h'=
 is never read [clang-analyzer-deadcode.DeadStores]
                   input_h =3D output_h;
                   ^         ~~~~~~~~
   drivers/media/i2c/rj54n1cb0c.c:688:3: note: Value stored to 'input_h' is=
 never read
                   input_h =3D output_h;
                   ^         ~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
>> sound/soc/codecs/ak4375.c:343:3: warning: Value stored to 'mclk' is neve=
r read [clang-analyzer-deadcode.DeadStores]
                   mclk =3D 128 * ak4375->rate;
                   ^      ~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/ak4375.c:343:3: note: Value stored to 'mclk' is never r=
ead
                   mclk =3D 128 * ak4375->rate;
                   ^      ~~~~~~~~~~~~~~~~~~
   Suppressed 3 warnings (2 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   sound/soc/codecs/alc5623.c:700:23: warning: Value stored to 'alc5623' du=
ring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct alc5623_priv *alc5623 =3D snd_soc_component_get_drvdata(c=
omponent);
                                ^~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   sound/soc/codecs/alc5623.c:700:23: note: Value stored to 'alc5623' durin=
g its initialization is never read
           struct alc5623_priv *alc5623 =3D snd_soc_component_get_drvdata(c=
omponent);
                                ^~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   sound/soc/codecs/lpass-tx-macro.c:771:4: warning: 2nd function call argu=
ment is an uninitialized value [clang-analyzer-core.CallAndMessage]
                           snd_soc_component_write_field(component, mic_sel=
_reg,
                           ^                                        ~~~~~~~=
~~~~
   sound/soc/codecs/lpass-tx-macro.c:736:2: note: 'mic_sel_reg' declared wi=
thout an initial value
           u16 mic_sel_reg;
           ^~~~~~~~~~~~~~~
   sound/soc/codecs/lpass-tx-macro.c:742:2: note: 'Default' branch taken. E=
xecution continues on line 769
           switch (e->reg) {
           ^
   sound/soc/codecs/lpass-tx-macro.c:769:6: note: Assuming 'val' is not equ=
al to 0
           if (val !=3D 0) {
               ^~~~~~~~
   sound/soc/codecs/lpass-tx-macro.c:769:2: note: Taking true branch
           if (val !=3D 0) {
           ^
   sound/soc/codecs/lpass-tx-macro.c:770:7: note: Assuming 'val' is < 5
                   if (val < 5) {
                       ^~~~~~~
   sound/soc/codecs/lpass-tx-macro.c:770:3: note: Taking true branch
                   if (val < 5) {
                   ^
   sound/soc/codecs/lpass-tx-macro.c:771:4: note: 2nd function call argumen=
t is an uninitialized value
                           snd_soc_component_write_field(component, mic_sel=
_reg,
                           ^                                        ~~~~~~~=
~~~~
   sound/soc/codecs/lpass-tx-macro.c:774:4: warning: 2nd function call argu=
ment is an uninitialized value [clang-analyzer-core.CallAndMessage]
                           snd_soc_component_write_field(component, mic_sel=
_reg,
                           ^                                        ~~~~~~~=
~~~~
   sound/soc/codecs/lpass-tx-macro.c:736:2: note: 'mic_sel_reg' declared wi=
thout an initial value
           u16 mic_sel_reg;
           ^~~~~~~~~~~~~~~
   sound/soc/codecs/lpass-tx-macro.c:742:2: note: 'Default' branch taken. E=
xecution continues on line 769
           switch (e->reg) {
           ^
   sound/soc/codecs/lpass-tx-macro.c:769:6: note: Assuming 'val' is not equ=
al to 0
           if (val !=3D 0) {
               ^~~~~~~~
   sound/soc/codecs/lpass-tx-macro.c:769:2: note: Taking true branch
           if (val !=3D 0) {
           ^
   sound/soc/codecs/lpass-tx-macro.c:770:7: note: Assuming 'val' is >=3D 5
                   if (val < 5) {
                       ^~~~~~~
   sound/soc/codecs/lpass-tx-macro.c:770:3: note: Taking false branch
                   if (val < 5) {
                   ^
   sound/soc/codecs/lpass-tx-macro.c:774:4: note: 2nd function call argumen=
t is an uninitialized value
                           snd_soc_component_write_field(component, mic_sel=
_reg,
                           ^                                        ~~~~~~~=
~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   sound/isa/gus/gus_mem.c:84:21: warning: Access to field 'prev' results i=
n a dereference of a null pointer (loaded from field 'next') [clang-analyze=
r-core.NullDereference]
                   block->next->prev =3D block->prev;
                                     ^
   sound/isa/gus/gus_mem.c:261:2: note: Loop condition is true.  Entering l=
oop body
           while (block) {
           ^
   sound/isa/gus/gus_mem.c:263:3: note: Calling 'snd_gf1_mem_xfree'
                   snd_gf1_mem_xfree(alloc, block);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/isa/gus/gus_mem.c:65:6: note: Assuming field 'share' is 0
           if (block->share) {     /* ok.. shared block */
               ^~~~~~~~~~~~
   sound/isa/gus/gus_mem.c:65:2: note: Taking false branch
           if (block->share) {     /* ok.. shared block */
           ^
   sound/isa/gus/gus_mem.c:70:22: note: 'block' is equal to field 'first'
           if (alloc->first =3D=3D block) {
                               ^~~~~
   sound/isa/gus/gus_mem.c:70:2: note: Taking true branch
           if (alloc->first =3D=3D block) {
           ^
   sound/isa/gus/gus_mem.c:72:7: note: Assuming field 'next' is null
                   if (block->next)
--
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:724:2: note: Returning pointer, which participates =
in a condition later
           return kmalloc(size, flags | __GFP_ZERO);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:724:2: note: Returning pointer
           return kmalloc(size, flags | __GFP_ZERO);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/target/target_core_transport.c:1493:21: note: Returning from 'kz=
alloc'
                   cmd->t_task_cdb =3D kzalloc(scsi_command_size(cdb), gfp);
                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/target/target_core_transport.c:1493:3: note: Value assigned to f=
ield 't_task_cdb'
                   cmd->t_task_cdb =3D kzalloc(scsi_command_size(cdb), gfp);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/target/target_core_transport.c:1494:7: note: Assuming field 't_t=
ask_cdb' is null
                   if (!cmd->t_task_cdb) {
                       ^~~~~~~~~~~~~~~~
   drivers/target/target_core_transport.c:1494:7: note: Assuming pointer va=
lue is null
                   if (!cmd->t_task_cdb) {
                       ^~~~~~~~~~~~~~~~
   drivers/target/target_core_transport.c:1494:3: note: Taking true branch
                   if (!cmd->t_task_cdb) {
                   ^
   drivers/target/target_core_transport.c:1495:4: note: Loop condition is f=
alse.  Exiting loop
                           pr_err("Unable to allocate cmd->t_task_cdb"
                           ^
   include/linux/printk.h:489:2: note: expanded from macro 'pr_err'
           printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:446:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:417:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:392:34: note: expanded from macro '__printk_index=
_emit'
   #define __printk_index_emit(...) do {} while (0)
                                    ^
   drivers/target/target_core_transport.c:1500:4: note: Control jumps to li=
ne 1516
                           goto err;
                           ^
   drivers/target/target_core_transport.c:1516:31: note: Assuming '__UNIQUE=
_ID___x517' is >=3D '__UNIQUE_ID___y518'
           memcpy(cmd->t_task_cdb, cdb, min(scsi_command_size(cdb),
                                        ^
   include/linux/minmax.h:45:19: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                           ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^~~~~~~~~~
   drivers/target/target_core_transport.c:1516:31: note: '?' condition is f=
alse
           memcpy(cmd->t_task_cdb, cdb, min(scsi_command_size(cdb),
                                        ^
   include/linux/minmax.h:45:19: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                           ^
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^
   drivers/target/target_core_transport.c:1516:2: note: Null pointer passed=
 as 1st argument to memory copy function
           memcpy(cmd->t_task_cdb, cdb, min(scsi_command_size(cdb),
           ^      ~~~~~~~~~~~~~~~
   drivers/target/target_core_transport.c:3105:12: warning: Value stored to=
 'cdb' during its initialization is never read [clang-analyzer-deadcode.Dea=
dStores]
           const u8 *cdb =3D cmd->t_task_cdb;
                     ^~~   ~~~~~~~~~~~~~~~
   drivers/target/target_core_transport.c:3105:12: note: Value stored to 'c=
db' during its initialization is never read
           const u8 *cdb =3D cmd->t_task_cdb;
                     ^~~   ~~~~~~~~~~~~~~~
   drivers/target/target_core_transport.c:3106:21: warning: Value stored to=
 'tmf' during its initialization is never read [clang-analyzer-deadcode.Dea=
dStores]
           struct se_tmr_req *tmf =3D cmd->se_tmr_req;
                              ^~~   ~~~~~~~~~~~~~~~
   drivers/target/target_core_transport.c:3106:21: note: Value stored to 't=
mf' during its initialization is never read
           struct se_tmr_req *tmf =3D cmd->se_tmr_req;
                              ^~~   ~~~~~~~~~~~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
>> sound/soc/codecs/ak4375.c:343:3: warning: Value stored to 'mclk' is neve=
r read [clang-analyzer-deadcode.DeadStores]
                   mclk =3D 128 * ak4375->rate;
                   ^      ~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/ak4375.c:343:3: note: Value stored to 'mclk' is never r=
ead
                   mclk =3D 128 * ak4375->rate;
                   ^      ~~~~~~~~~~~~~~~~~~
   Suppressed 3 warnings (2 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   sound/soc/codecs/alc5623.c:700:23: warning: Value stored to 'alc5623' du=
ring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct alc5623_priv *alc5623 =3D snd_soc_component_get_drvdata(c=
omponent);
                                ^~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   sound/soc/codecs/alc5623.c:700:23: note: Value stored to 'alc5623' durin=
g its initialization is never read
           struct alc5623_priv *alc5623 =3D snd_soc_component_get_drvdata(c=
omponent);
                                ^~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   sound/soc/codecs/cs35l34.c:260:3: warning: Value stored to 'ret' is neve=
r read [clang-analyzer-deadcode.DeadStores]
                   ret =3D regmap_update_bits(priv->regmap, CS35L34_PWRCTL1,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/cs35l34.c:260:3: note: Value stored to 'ret' is never r=
ead
                   ret =3D regmap_update_bits(priv->regmap, CS35L34_PWRCTL1,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   sound/pci/lx6464es/lx6464es.c:428:3: warning: Value stored to 'err' is n=
ever read [clang-analyzer-deadcode.DeadStores]
                   err =3D lx_buffer_ask(chip, 0, is_capture, &needed, &fre=
ed,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/pci/lx6464es/lx6464es.c:428:3: note: Value stored to 'err' is neve=
r read
                   err =3D lx_buffer_ask(chip, 0, is_capture, &needed, &fre=
ed,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/pci/lx6464es/lx6464es.c:433:3: warning: Value stored to 'err' is n=
ever read [clang-analyzer-deadcode.DeadStores]
                   err =3D lx_buffer_give(chip, 0, is_capture, period_bytes,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/pci/lx6464es/lx6464es.c:433:3: note: Value stored to 'err' is neve=
r read
                   err =3D lx_buffer_give(chip, 0, is_capture, period_bytes,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/pci/lx6464es/lx6464es.c:442:2: warning: Value stored to 'err' is n=
ever read [clang-analyzer-deadcode.DeadStores]
           err =3D lx_buffer_ask(chip, 0, is_capture, &needed, &freed, size=
_array);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   sound/pci/lx6464es/lx6464es.c:442:2: note: Value stored to 'err' is neve=
r read
           err =3D lx_buffer_ask(chip, 0, is_capture, &needed, &freed, size=
_array);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   sound/pci/lx6464es/lx6464es.c:817:2: warning: Call to function 'strcpy' =
is insecure as it does not provide bounding of the memory buffer. Replace u=
nbounded copy functions with analogous functions that support length argume=
nts such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(pcm->name, card_name);
           ^~~~~~
   sound/pci/lx6464es/lx6464es.c:817:2: note: Call to function 'strcpy' is =
insecure as it does not provide bounding of the memory buffer. Replace unbo=
unded copy functions with analogous functions that support length arguments=
 such as 'strlcpy'. CWE-119
           strcpy(pcm->name, card_name);
           ^~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   sound/pci/lx6464es/lx_core.c:995:44: warning: The left operand of '<<' i=
s a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
                   *r_notified_in_pipe_mask =3D ((u64)stat[3] << 32)
                                                            ^
   sound/pci/lx6464es/lx_core.c:1113:8: note: Calling 'lx_interrupt_handle_=
async_events'
           err =3D lx_interrupt_handle_async_events(chip, chip->irqsrc,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/pci/lx6464es/lx_core.c:985:24: note: Assuming the condition is fal=
se
           int eb_pending_out =3D (irqsrc & MASK_SYS_STATUS_EOBO) ? 1 : 0;
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/pci/lx6464es/lx_core.c:985:23: note: '?' condition is false
           int eb_pending_out =3D (irqsrc & MASK_SYS_STATUS_EOBO) ? 1 : 0;
                                ^
   sound/pci/lx6464es/lx_core.c:986:24: note: Assuming the condition is true
           int eb_pending_in  =3D (irqsrc & MASK_SYS_STATUS_EOBI) ? 1 : 0;
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/pci/lx6464es/lx_core.c:986:23: note: '?' condition is true
           int eb_pending_in  =3D (irqsrc & MASK_SYS_STATUS_EOBI) ? 1 : 0;
                                ^
   sound/pci/lx6464es/lx_core.c:988:21: note: Assuming the condition is fal=
se
           *r_freq_changed =3D (irqsrc & MASK_SYS_STATUS_FREQ) ? 1 : 0;
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/pci/lx6464es/lx_core.c:988:20: note: '?' condition is false
           *r_freq_changed =3D (irqsrc & MASK_SYS_STATUS_FREQ) ? 1 : 0;
                             ^
   sound/pci/lx6464es/lx_core.c:990:8: note: Calling 'lx_dsp_read_async_eve=
nts'
           err =3D lx_dsp_read_async_events(chip, stat);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/pci/lx6464es/lx_core.c:407:6: note: Assuming 'ret' is not equal to=
 0
           if (!ret)
               ^~~~
   sound/pci/lx6464es/lx_core.c:407:2: note: Taking false branch
           if (!ret)
           ^
   sound/pci/lx6464es/lx_core.c:990:8: note: Returning from 'lx_dsp_read_as=
ync_events'
           err =3D lx_dsp_read_async_events(chip, stat);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/pci/lx6464es/lx_core.c:991:6: note: Assuming 'err' is >=3D 0
           if (err < 0)

vim +/mclk +343 sound/soc/codecs/ak4375.c

53778b8292b549 Vincent Knecht 2021-12-20  280  =

53778b8292b549 Vincent Knecht 2021-12-20  281  static int ak4375_dai_set_pl=
l(struct snd_soc_dai *dai, int pll_id, int source,
53778b8292b549 Vincent Knecht 2021-12-20  282  			      unsigned int freq_i=
n, unsigned int freq_out)
53778b8292b549 Vincent Knecht 2021-12-20  283  {
53778b8292b549 Vincent Knecht 2021-12-20  284  	struct snd_soc_component *c=
omponent =3D dai->component;
53778b8292b549 Vincent Knecht 2021-12-20  285  	struct ak4375_priv *ak4375 =
=3D snd_soc_component_get_drvdata(component);
53778b8292b549 Vincent Knecht 2021-12-20  286  	unsigned int mclk, plm, mdi=
v, div;
53778b8292b549 Vincent Knecht 2021-12-20  287  	u8 cms, fs, cm;
53778b8292b549 Vincent Knecht 2021-12-20  288  =

53778b8292b549 Vincent Knecht 2021-12-20  289  	cms =3D snd_soc_component_r=
ead(component, AK4375_05_CLOCK_MODE_SELECT);
53778b8292b549 Vincent Knecht 2021-12-20  290  	fs =3D cms & ~FS_MASK;
53778b8292b549 Vincent Knecht 2021-12-20  291  	cm =3D cms & ~CM_MASK;
53778b8292b549 Vincent Knecht 2021-12-20  292  =

53778b8292b549 Vincent Knecht 2021-12-20  293  	switch (ak4375->rate) {
53778b8292b549 Vincent Knecht 2021-12-20  294  	case 8000:
53778b8292b549 Vincent Knecht 2021-12-20  295  		fs |=3D FS_8KHZ;
53778b8292b549 Vincent Knecht 2021-12-20  296  		break;
53778b8292b549 Vincent Knecht 2021-12-20  297  	case 11025:
53778b8292b549 Vincent Knecht 2021-12-20  298  		fs |=3D FS_11_025KHZ;
53778b8292b549 Vincent Knecht 2021-12-20  299  		break;
53778b8292b549 Vincent Knecht 2021-12-20  300  	case 16000:
53778b8292b549 Vincent Knecht 2021-12-20  301  		fs |=3D FS_16KHZ;
53778b8292b549 Vincent Knecht 2021-12-20  302  		break;
53778b8292b549 Vincent Knecht 2021-12-20  303  	case 22050:
53778b8292b549 Vincent Knecht 2021-12-20  304  		fs |=3D FS_22_05KHZ;
53778b8292b549 Vincent Knecht 2021-12-20  305  		break;
53778b8292b549 Vincent Knecht 2021-12-20  306  	case 32000:
53778b8292b549 Vincent Knecht 2021-12-20  307  		fs |=3D FS_32KHZ;
53778b8292b549 Vincent Knecht 2021-12-20  308  		break;
53778b8292b549 Vincent Knecht 2021-12-20  309  	case 44100:
53778b8292b549 Vincent Knecht 2021-12-20  310  		fs |=3D FS_44_1KHZ;
53778b8292b549 Vincent Knecht 2021-12-20  311  		break;
53778b8292b549 Vincent Knecht 2021-12-20  312  	case 48000:
53778b8292b549 Vincent Knecht 2021-12-20  313  		fs |=3D FS_48KHZ;
53778b8292b549 Vincent Knecht 2021-12-20  314  		break;
53778b8292b549 Vincent Knecht 2021-12-20  315  	case 88200:
53778b8292b549 Vincent Knecht 2021-12-20  316  		fs |=3D FS_88_2KHZ;
53778b8292b549 Vincent Knecht 2021-12-20  317  		break;
53778b8292b549 Vincent Knecht 2021-12-20  318  	case 96000:
53778b8292b549 Vincent Knecht 2021-12-20  319  		fs |=3D FS_96KHZ;
53778b8292b549 Vincent Knecht 2021-12-20  320  		break;
53778b8292b549 Vincent Knecht 2021-12-20  321  	case 176400:
53778b8292b549 Vincent Knecht 2021-12-20  322  		fs |=3D FS_176_4KHZ;
53778b8292b549 Vincent Knecht 2021-12-20  323  		break;
53778b8292b549 Vincent Knecht 2021-12-20  324  	case 192000:
53778b8292b549 Vincent Knecht 2021-12-20  325  		fs |=3D FS_192KHZ;
53778b8292b549 Vincent Knecht 2021-12-20  326  		break;
53778b8292b549 Vincent Knecht 2021-12-20  327  	default:
53778b8292b549 Vincent Knecht 2021-12-20  328  		return -EINVAL;
53778b8292b549 Vincent Knecht 2021-12-20  329  	}
53778b8292b549 Vincent Knecht 2021-12-20  330  =

53778b8292b549 Vincent Knecht 2021-12-20  331  	if (ak4375->rate <=3D 24000=
) {
53778b8292b549 Vincent Knecht 2021-12-20  332  		cm |=3D CM_1;
53778b8292b549 Vincent Knecht 2021-12-20  333  		mclk =3D 512 * ak4375->rat=
e;
53778b8292b549 Vincent Knecht 2021-12-20  334  		mdiv =3D freq_out / mclk -=
 1;
53778b8292b549 Vincent Knecht 2021-12-20  335  		div =3D 0;
53778b8292b549 Vincent Knecht 2021-12-20  336  	} else if (ak4375->rate <=
=3D 96000) {
53778b8292b549 Vincent Knecht 2021-12-20  337  		cm |=3D CM_0;
53778b8292b549 Vincent Knecht 2021-12-20  338  		mclk =3D 256 * ak4375->rat=
e;
53778b8292b549 Vincent Knecht 2021-12-20  339  		mdiv =3D freq_out / mclk -=
 1;
53778b8292b549 Vincent Knecht 2021-12-20  340  		div =3D 0;
53778b8292b549 Vincent Knecht 2021-12-20  341  	} else {
53778b8292b549 Vincent Knecht 2021-12-20  342  		cm |=3D CM_3;
53778b8292b549 Vincent Knecht 2021-12-20 @343  		mclk =3D 128 * ak4375->rat=
e;
53778b8292b549 Vincent Knecht 2021-12-20  344  		mdiv =3D 4;
53778b8292b549 Vincent Knecht 2021-12-20  345  		div =3D 1;
53778b8292b549 Vincent Knecht 2021-12-20  346  	}
53778b8292b549 Vincent Knecht 2021-12-20  347  =

53778b8292b549 Vincent Knecht 2021-12-20  348  	/* Writing both fields in o=
ne go seems to make playback choppy on start */
53778b8292b549 Vincent Knecht 2021-12-20  349  	snd_soc_component_update_bi=
ts(component, AK4375_05_CLOCK_MODE_SELECT, FS_MASK, fs);
53778b8292b549 Vincent Knecht 2021-12-20  350  	snd_soc_component_update_bi=
ts(component, AK4375_05_CLOCK_MODE_SELECT, CM_MASK, cm);
53778b8292b549 Vincent Knecht 2021-12-20  351  =

53778b8292b549 Vincent Knecht 2021-12-20  352  	snd_soc_component_write(com=
ponent, AK4375_0F_PLL_REF_CLK_DIVIDER1,
53778b8292b549 Vincent Knecht 2021-12-20  353  				(ak4375->pld & 0xff00) >=
> 8);
53778b8292b549 Vincent Knecht 2021-12-20  354  	snd_soc_component_write(com=
ponent, AK4375_10_PLL_REF_CLK_DIVIDER2,
53778b8292b549 Vincent Knecht 2021-12-20  355  				ak4375->pld & 0x00ff);
53778b8292b549 Vincent Knecht 2021-12-20  356  =

53778b8292b549 Vincent Knecht 2021-12-20  357  	plm =3D freq_out / freq_in =
- 1;
53778b8292b549 Vincent Knecht 2021-12-20  358  	snd_soc_component_write(com=
ponent, AK4375_11_PLL_FB_CLK_DIVIDER1, (plm & 0xff00) >> 8);
53778b8292b549 Vincent Knecht 2021-12-20  359  	snd_soc_component_write(com=
ponent, AK4375_12_PLL_FB_CLK_DIVIDER2, plm & 0x00ff);
53778b8292b549 Vincent Knecht 2021-12-20  360  =

53778b8292b549 Vincent Knecht 2021-12-20  361  	snd_soc_component_update_bi=
ts(component, AK4375_13_SRC_CLK_SOURCE, DIV, div);
53778b8292b549 Vincent Knecht 2021-12-20  362  =

53778b8292b549 Vincent Knecht 2021-12-20  363  	/* SRCCKS bit: force to 1 f=
or SRC PLL source clock */
53778b8292b549 Vincent Knecht 2021-12-20  364  	snd_soc_component_update_bi=
ts(component, AK4375_13_SRC_CLK_SOURCE, SRCCKS, SRCCKS);
53778b8292b549 Vincent Knecht 2021-12-20  365  =

53778b8292b549 Vincent Knecht 2021-12-20  366  	snd_soc_component_write(com=
ponent, AK4375_14_DAC_CLK_DIVIDER, mdiv);
53778b8292b549 Vincent Knecht 2021-12-20  367  =

53778b8292b549 Vincent Knecht 2021-12-20  368  	dev_dbg(ak4375->dev, "rate=
=3D%d mclk=3D%d f_in=3D%d f_out=3D%d PLD=3D%d PLM=3D%d MDIV=3D%d DIV=3D%d\n=
",
53778b8292b549 Vincent Knecht 2021-12-20  369  		ak4375->rate, mclk, freq_i=
n, freq_out, ak4375->pld, plm, mdiv, div);
53778b8292b549 Vincent Knecht 2021-12-20  370  =

53778b8292b549 Vincent Knecht 2021-12-20  371  	return 0;
53778b8292b549 Vincent Knecht 2021-12-20  372  }
53778b8292b549 Vincent Knecht 2021-12-20  373  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1716226481210609227==--

