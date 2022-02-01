Content-Type: multipart/mixed; boundary="===============8554165920897321765=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: sound/soc/qcom/qdsp6/audioreach.c:500:36: warning: Division by zero [clang-analyzer-core.DivideZero]
Date: Wed, 02 Feb 2022 05:43:11 +0800
Message-ID: <202202020521.tgUIFWYr-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8554165920897321765==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
CC: Mark Brown <broonie@kernel.org>
CC: "Pierre-Louis Bossart" <pierre-louis.bossart@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   26291c54e111ff6ba87a164d85d4a4e134b7315c
commit: cf989b68fcadbeeea1446e50fd8b2f24a0f1275c ASoC: qdsp6: audioreach: a=
dd Kconfig and Makefile
date:   3 months ago
:::::: branch date: 2 days ago
:::::: commit date: 3 months ago
config: arm-randconfig-c002-20220122 (https://download.01.org/0day-ci/archi=
ve/20220202/202202020521.tgUIFWYr-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 7b3d30=
728816403d1fd73cc5082e9fb761262bce)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Dcf989b68fcadbeeea1446e50fd8b2f24a0f1275c
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout cf989b68fcadbeeea1446e50fd8b2f24a0f1275c
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   include/linux/printk.h:417:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:392:34: note: expanded from macro '__printk_index=
_emit'
   #define __printk_index_emit(...) do {} while (0)
                                    ^
   drivers/mtd/tests/subpagetest.c:348:14: note: Assuming 'i' is >=3D 'ebcn=
t'
           for (i =3D 0; i < ebcnt; ++i) {
                       ^~~~~~~~~
   drivers/mtd/tests/subpagetest.c:348:2: note: Loop condition is false. Ex=
ecution continues on line 361
           for (i =3D 0; i < ebcnt; ++i) {
           ^
   drivers/mtd/tests/subpagetest.c:361:2: note: Loop condition is false.  E=
xiting loop
           pr_info("verified %u eraseblocks\n", i);
           ^
   include/linux/printk.h:519:2: note: expanded from macro 'pr_info'
           printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
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
   drivers/mtd/tests/subpagetest.c:364:6: note: Assuming 'err' is 0
           if (err)
               ^~~
   drivers/mtd/tests/subpagetest.c:364:2: note: Taking false branch
           if (err)
           ^
   drivers/mtd/tests/subpagetest.c:367:8: note: Calling 'verify_all_erasebl=
ocks_ff'
           err =3D verify_all_eraseblocks_ff();
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/tests/subpagetest.c:250:2: note: Loop condition is false.  E=
xiting loop
           pr_info("verifying all eraseblocks for 0xff\n");
           ^
   include/linux/printk.h:519:2: note: expanded from macro 'pr_info'
           printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
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
   drivers/mtd/tests/subpagetest.c:251:14: note: Assuming 'i' is < 'ebcnt'
           for (i =3D 0; i < ebcnt; ++i) {
                       ^~~~~~~~~
   drivers/mtd/tests/subpagetest.c:251:2: note: Loop condition is true.  En=
tering loop body
           for (i =3D 0; i < ebcnt; ++i) {
           ^
   drivers/mtd/tests/subpagetest.c:252:7: note: Assuming the condition is f=
alse
                   if (bbt[i])
                       ^~~~~~
   drivers/mtd/tests/subpagetest.c:252:3: note: Taking false branch
                   if (bbt[i])
                   ^
   drivers/mtd/tests/subpagetest.c:254:9: note: Calling 'verify_eraseblock_=
ff'
                   err =3D verify_eraseblock_ff(i);
                         ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/tests/subpagetest.c:220:14: note: Assuming the condition is =
true
           for (j =3D 0; j < mtd->erasesize / subpgsize; ++j) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/tests/subpagetest.c:220:2: note: Loop condition is true.  En=
tering loop body
           for (j =3D 0; j < mtd->erasesize / subpgsize; ++j) {
           ^
   drivers/mtd/tests/subpagetest.c:222:9: note: Value assigned to 'subpgsiz=
e'
                   err =3D mtd_read(mtd, addr, subpgsize, &read, readbuf);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/tests/subpagetest.c:223:16: note: Assuming 'err' is 0
                   if (unlikely(err || read !=3D subpgsize)) {
                                ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   drivers/mtd/tests/subpagetest.c:223:16: note: Left side of '||' is false
                   if (unlikely(err || read !=3D subpgsize)) {
                                ^
   drivers/mtd/tests/subpagetest.c:223:23: note: Assuming 'read' is equal t=
o 'subpgsize'
                   if (unlikely(err || read !=3D subpgsize)) {
                                       ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   drivers/mtd/tests/subpagetest.c:223:3: note: Taking false branch
                   if (unlikely(err || read !=3D subpgsize)) {
                   ^
   drivers/mtd/tests/subpagetest.c:234:3: note: Taking false branch
                   if (unlikely(memcmp(readbuf, writebuf, subpgsize))) {
                   ^
   drivers/mtd/tests/subpagetest.c:220:33: note: Division by zero
           for (j =3D 0; j < mtd->erasesize / subpgsize; ++j) {
                           ~~~~~~~~~~~~~~~^~~~~~~~~~~
   2 warnings generated.
>> sound/soc/qcom/qdsp6/audioreach.c:500:36: warning: Division by zero [cla=
ng-analyzer-core.DivideZero]
           num_modules_per_list =3D num_modules/num_containers;
                                  ~~~~~~~~~~~^~~~~~~~~~~~~~~
   sound/soc/qcom/qdsp6/audioreach.c:480:2: note: 'num_containers' initiali=
zed to 0
           int num_containers =3D 0;
           ^~~~~~~~~~~~~~~~~~
   sound/soc/qcom/qdsp6/audioreach.c:487:2: note: Left side of '&&' is false
           list_for_each_entry(sgs, sg_list, node) {
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
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
   sound/soc/qcom/qdsp6/audioreach.c:487:2: note: Taking false branch
           list_for_each_entry(sgs, sg_list, node) {
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
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
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:302:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   sound/soc/qcom/qdsp6/audioreach.c:487:2: note: Loop condition is false. =
 Exiting loop
           list_for_each_entry(sgs, sg_list, node) {
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
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
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:300:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   sound/soc/qcom/qdsp6/audioreach.c:487:2: note: Loop condition is false. =
Execution continues on line 499
           list_for_each_entry(sgs, sg_list, node) {
           ^
   include/linux/list.h:628:2: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
           ^
   sound/soc/qcom/qdsp6/audioreach.c:500:36: note: Division by zero
           num_modules_per_list =3D num_modules/num_containers;
                                  ~~~~~~~~~~~^~~~~~~~~~~~~~~
>> sound/soc/qcom/qdsp6/audioreach.c:558:2: warning: Value stored to 'p' is=
 never read [clang-analyzer-deadcode.DeadStores]
           p +=3D mc_sz;
           ^    ~~~~~
   sound/soc/qcom/qdsp6/audioreach.c:558:2: note: Value stored to 'p' is ne=
ver read
           p +=3D mc_sz;
           ^    ~~~~~
   1 warning generated.
   drivers/iio/chemical/bme680_core.c:741:2: warning: Value stored to 'ret'=
 is never read [clang-analyzer-deadcode.DeadStores]
           ret =3D regmap_read(data->regmap, BME680_REG_MEAS_STAT_0, &check=
);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/chemical/bme680_core.c:741:2: note: Value stored to 'ret' is=
 never read
           ret =3D regmap_read(data->regmap, BME680_REG_MEAS_STAT_0, &check=
);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 warnings generated.
   sound/drivers/mpu401/mpu401.c:67:2: warning: Call to function 'strcpy' i=
s insecure as it does not provide bounding of the memory buffer. Replace un=
bounded copy functions with analogous functions that support length argumen=
ts such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(card->shortname, card->driver);
           ^~~~~~
   sound/drivers/mpu401/mpu401.c:67:2: note: Call to function 'strcpy' is i=
nsecure as it does not provide bounding of the memory buffer. Replace unbou=
nded copy functions with analogous functions that support length arguments =
such as 'strlcpy'. CWE-119
           strcpy(card->shortname, card->driver);
           ^~~~~~
   sound/drivers/mpu401/mpu401.c:72:3: warning: Call to function 'strcat' i=
s insecure as it does not provide bounding of the memory buffer. Replace un=
bounded copy functions with analogous functions that support length argumen=
ts such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcat(card->longname, "polled");
                   ^~~~~~
   sound/drivers/mpu401/mpu401.c:72:3: note: Call to function 'strcat' is i=
nsecure as it does not provide bounding of the memory buffer. Replace unbou=
nded copy functions with analogous functions that support length arguments =
such as 'strlcat'. CWE-119
                   strcat(card->longname, "polled");
                   ^~~~~~
   5 warnings generated.
   include/linux/list.h:86:2: warning: Use of memory after it is freed [cla=
ng-analyzer-unix.Malloc]
           __list_add(new, head, head->next);
           ^
   sound/pci/hda/hda_codec.c:270:9: note: Calling 'snd_hda_get_conn_list'
           nums =3D snd_hda_get_conn_list(codec, mux, &conn);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/pci/hda/hda_codec.c:173:2: note: Loop condition is true.  Entering=
 loop body
           for (;;) {
           ^
   sound/pci/hda/hda_codec.c:179:7: note: 'p' is null
                   if (p) {
                       ^
   sound/pci/hda/hda_codec.c:179:3: note: Taking false branch
                   if (p) {
                   ^
   sound/pci/hda/hda_codec.c:184:3: note: Taking false branch
                   if (snd_BUG_ON(added))
                   ^
   sound/pci/hda/hda_codec.c:187:9: note: Calling 'read_and_add_raw_conns'
                   err =3D read_and_add_raw_conns(codec, nid);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/pci/hda/hda_codec.c:139:6: note: Assuming the condition is false
           if (len =3D=3D -ENOSPC) {
               ^~~~~~~~~~~~~~
   sound/pci/hda/hda_codec.c:139:2: note: Taking false branch
           if (len =3D=3D -ENOSPC) {
           ^
   sound/pci/hda/hda_codec.c:146:6: note: Assuming 'len' is >=3D 0
           if (len >=3D 0)
               ^~~~~~~~
   sound/pci/hda/hda_codec.c:146:2: note: Taking true branch
           if (len >=3D 0)
           ^
   sound/pci/hda/hda_codec.c:147:9: note: Calling 'snd_hda_override_conn_li=
st'
                   len =3D snd_hda_override_conn_list(codec, nid, len, resu=
lt);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/pci/hda/hda_codec.c:244:6: note: 'p' is non-null
           if (p) {
               ^
   sound/pci/hda/hda_codec.c:244:2: note: Taking true branch
           if (p) {
           ^
   sound/pci/hda/hda_codec.c:246:3: note: Memory is released
                   kfree(p);
                   ^~~~~~~~
   sound/pci/hda/hda_codec.c:249:9: note: Calling 'add_conn_list'
           return add_conn_list(codec, nid, len, list);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/pci/hda/hda_codec.c:112:6: note: Assuming 'p' is non-null
           if (!p)
               ^~
   sound/pci/hda/hda_codec.c:112:2: note: Taking false branch
           if (!p)
           ^
   sound/pci/hda/hda_codec.c:117:2: note: Calling 'list_add'
           list_add(&p->list, &codec->conn_list);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:86:2: note: Use of memory after it is freed
           __list_add(new, head, head->next);
           ^                     ~~~~~~~~~~
   include/linux/list.h:135:13: warning: Use of memory after it is freed [c=
lang-analyzer-unix.Malloc]
           __list_del(entry->prev, entry->next);
                      ^
   sound/pci/hda/hda_codec.c:765:6: note: Assuming field 'registered' is 0
           if (codec->registered) {
               ^~~~~~~~~~~~~~~~~
   sound/pci/hda/hda_codec.c:765:2: note: Taking false branch
           if (codec->registered) {
           ^
   sound/pci/hda/hda_codec.c:773:6: note: Assuming field 'in_freeing' is no=
t equal to 0
           if (!codec->in_freeing)
               ^~~~~~~~~~~~~~~~~~
   sound/pci/hda/hda_codec.c:773:2: note: Taking false branch
           if (!codec->in_freeing)
--
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:300:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   sound/pci/hda/hda_codec.c:127:3: note: Memory is released
                   kfree(p);
                   ^~~~~~~~
   sound/pci/hda/hda_codec.c:123:2: note: Loop condition is true.  Entering=
 loop body
           while (!list_empty(&codec->conn_list)) {
           ^
   sound/pci/hda/hda_codec.c:125:7: note: Left side of '&&' is false
                   p =3D list_first_entry(&codec->conn_list, typeof(*p), li=
st);
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
   sound/pci/hda/hda_codec.c:125:7: note: Taking false branch
                   p =3D list_first_entry(&codec->conn_list, typeof(*p), li=
st);
                       ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:302:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   sound/pci/hda/hda_codec.c:125:7: note: Loop condition is false.  Exiting=
 loop
                   p =3D list_first_entry(&codec->conn_list, typeof(*p), li=
st);
                       ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:300:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   sound/pci/hda/hda_codec.c:126:3: note: Calling 'list_del'
                   list_del(&p->list);
                   ^~~~~~~~~~~~~~~~~~
   include/linux/list.h:147:14: note: Use of memory after it is freed
           entry->next =3D LIST_POISON1;
           ~~~~~~~~~~~ ^
   sound/pci/hda/hda_codec.c:1613:2: warning: Call to function 'strcpy' is =
insecure as it does not provide bounding of the memory buffer. Replace unbo=
unded copy functions with analogous functions that support length arguments=
 such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(id.name, name);
           ^~~~~~
   sound/pci/hda/hda_codec.c:1613:2: note: Call to function 'strcpy' is ins=
ecure as it does not provide bounding of the memory buffer. Replace unbound=
ed copy functions with analogous functions that support length arguments su=
ch as 'strlcpy'. CWE-119
           strcpy(id.name, name);
           ^~~~~~
   sound/pci/hda/hda_codec.c:3465:2: warning: Call to function 'strcpy' is =
insecure as it does not provide bounding of the memory buffer. Replace unbo=
unded copy functions with analogous functions that support length arguments=
 such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(uinfo->value.enumerated.name, imux->items[index].label);
           ^~~~~~
   sound/pci/hda/hda_codec.c:3465:2: note: Call to function 'strcpy' is ins=
ecure as it does not provide bounding of the memory buffer. Replace unbound=
ed copy functions with analogous functions that support length arguments su=
ch as 'strlcpy'. CWE-119
           strcpy(uinfo->value.enumerated.name, imux->items[index].label);
           ^~~~~~
   2 warnings generated.
>> sound/soc/qcom/qdsp6/audioreach.c:500:36: warning: Division by zero [cla=
ng-analyzer-core.DivideZero]
           num_modules_per_list =3D num_modules/num_containers;
                                  ~~~~~~~~~~~^~~~~~~~~~~~~~~
   sound/soc/qcom/qdsp6/audioreach.c:480:2: note: 'num_containers' initiali=
zed to 0
           int num_containers =3D 0;
           ^~~~~~~~~~~~~~~~~~
   sound/soc/qcom/qdsp6/audioreach.c:487:2: note: Left side of '&&' is false
           list_for_each_entry(sgs, sg_list, node) {
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
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
   sound/soc/qcom/qdsp6/audioreach.c:487:2: note: Taking false branch
           list_for_each_entry(sgs, sg_list, node) {
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
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
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:302:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   sound/soc/qcom/qdsp6/audioreach.c:487:2: note: Loop condition is false. =
 Exiting loop
           list_for_each_entry(sgs, sg_list, node) {
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
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
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:300:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   sound/soc/qcom/qdsp6/audioreach.c:487:2: note: Loop condition is false. =
Execution continues on line 499
           list_for_each_entry(sgs, sg_list, node) {
           ^
   include/linux/list.h:628:2: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
           ^
   sound/soc/qcom/qdsp6/audioreach.c:500:36: note: Division by zero
           num_modules_per_list =3D num_modules/num_containers;
                                  ~~~~~~~~~~~^~~~~~~~~~~~~~~
>> sound/soc/qcom/qdsp6/audioreach.c:558:2: warning: Value stored to 'p' is=
 never read [clang-analyzer-deadcode.DeadStores]
           p +=3D mc_sz;
           ^    ~~~~~
   sound/soc/qcom/qdsp6/audioreach.c:558:2: note: Value stored to 'p' is ne=
ver read
           p +=3D mc_sz;
           ^    ~~~~~
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   drivers/rtc/rtc-mc146818-lib.c:187:3: warning: Value stored to 'century'=
 is never read [clang-analyzer-deadcode.DeadStores]
                   century =3D bin2bcd(century);
                   ^
   drivers/rtc/rtc-mc146818-lib.c:187:3: note: Value stored to 'century' is=
 never read
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   2 warnings generated.
   net/bluetooth/hci_core.c:2188:2: warning: Call to function 'strcpy' is i=
nsecure as it does not provide bounding of the memory buffer. Replace unbou=
nded copy functions with analogous functions that support length arguments =
such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(di.name, hdev->name);
           ^~~~~~
   net/bluetooth/hci_core.c:2188:2: note: Call to function 'strcpy' is inse=
cure as it does not provide bounding of the memory buffer. Replace unbounde=
d copy functions with analogous functions that support length arguments suc=
h as 'strlcpy'. CWE-119
           strcpy(di.name, hdev->name);
           ^~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   net/bluetooth/mgmt.c:6265:4: warning: Value stored to 'authenticated' is=
 never read [clang-analyzer-deadcode.DeadStores]
                           authenticated =3D 0x00;
                           ^               ~~~~
   net/bluetooth/mgmt.c:6265:4: note: Value stored to 'authenticated' is ne=
ver read
                           authenticated =3D 0x00;
                           ^               ~~~~
   net/bluetooth/mgmt.c:6266:4: warning: Value stored to 'type' is never re=
ad [clang-analyzer-deadcode.DeadStores]
                           type =3D SMP_LTK_P256_DEBUG;
                           ^      ~~~~~~~~~~~~~~~~~~
   net/bluetooth/mgmt.c:6266:4: note: Value stored to 'type' is never read
                           type =3D SMP_LTK_P256_DEBUG;
                           ^      ~~~~~~~~~~~~~~~~~~
   net/bluetooth/mgmt.c:7239:2: warning: Value stored to 'err' is never rea=
d [clang-analyzer-deadcode.DeadStores]
           err =3D mgmt_limited_event(MGMT_EV_LOCAL_OOB_DATA_UPDATED, hdev,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/bluetooth/mgmt.c:7239:2: note: Value stored to 'err' is never read
           err =3D mgmt_limited_event(MGMT_EV_LOCAL_OOB_DATA_UPDATED, hdev,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/bluetooth/mgmt.c:7590:14: warning: Although the value stored to 'cur=
_len' is used in the enclosing expression, the value is never actually read=
 from 'cur_len' [clang-analyzer-deadcode.DeadStores]
           for (i =3D 0, cur_len =3D 0; i < len; i +=3D (cur_len + 1)) {
                       ^         ~
   net/bluetooth/mgmt.c:7590:14: note: Although the value stored to 'cur_le=
n' is used in the enclosing expression, the value is never actually read fr=
om 'cur_len'
           for (i =3D 0, cur_len =3D 0; i < len; i +=3D (cur_len + 1)) {
                       ^         ~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   drivers/net/phy/at803x.c:356:3: warning: Value stored to 'value' is neve=
r read [clang-analyzer-deadcode.DeadStores]
                   value =3D phy_read(phydev, AT803X_INTR_STATUS);
                   ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/phy/at803x.c:356:3: note: Value stored to 'value' is never r=
ead
                   value =3D phy_read(phydev, AT803X_INTR_STATUS);
                   ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/phy/at803x.c:363:3: warning: Value stored to 'value' is neve=
r read [clang-analyzer-deadcode.DeadStores]
                   value =3D phy_read(phydev, AT803X_INTR_STATUS);
                   ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/phy/at803x.c:363:3: note: Value stored to 'value' is never r=
ead
                   value =3D phy_read(phydev, AT803X_INTR_STATUS);
                   ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.
   drivers/net/phy/bcm-cygnus.c:70:2: warning: Value stored to 'rc' is neve=
r read [clang-analyzer-deadcode.DeadStores]
           rc =3D bcm_phy_write_exp_sel(phydev, MII_BRCM_CORE_EXPB0, 0x00);
           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/phy/bcm-cygnus.c:70:2: note: Value stored to 'rc' is never r=
ead
           rc =3D bcm_phy_write_exp_sel(phydev, MII_BRCM_CORE_EXPB0, 0x00);
           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.
   drivers/net/phy/marvell.c:1222:2: warning: Value stored to 'err' is neve=
r read [clang-analyzer-deadcode.DeadStores]
           err =3D genphy_config_aneg(phydev);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/phy/marvell.c:1222:2: note: Value stored to 'err' is never r=
ead
           err =3D genphy_config_aneg(phydev);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.
   drivers/comedi/drivers/das08.c:181:2: warning: Value stored to 'range' i=
s never read [clang-analyzer-deadcode.DeadStores]
           range =3D CR_RANGE(insn->chanspec);
           ^
   drivers/comedi/drivers/das08.c:181:2: note: Value stored to 'range' is n=
ever read
   2 warnings generated.
   drivers/fsi/fsi-scom.c:295:7: warning: 2nd function call argument is an =
uninitialized value [clang-analyzer-core.CallAndMessage]
           rc =3D handle_fsi2pib_status(scom, status);
                ^
   drivers/fsi/fsi-scom.c:360:6: note: Assuming the condition is false
           if (len !=3D sizeof(uint64_t))
               ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/fsi/fsi-scom.c:360:2: note: Taking false branch
           if (len !=3D sizeof(uint64_t))
           ^
   drivers/fsi/fsi-scom.c:364:6: note: 'rc' is 0
           if (rc) {

vim +500 sound/soc/qcom/qdsp6/audioreach.c

5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  464  =

5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  465  void *audioreach_alloc=
_graph_pkt(struct q6apm *apm, struct list_head *sg_list, int graph_id)
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  466  {
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  467  	int payload_size, sg_=
sz, cont_sz, ml_sz, mp_sz, mc_sz;
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  468  	struct apm_module_par=
am_data  *param_data;
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  469  	struct apm_container_=
params *cont_params;
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  470  	struct audioreach_con=
tainer *container;
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  471  	struct apm_sub_graph_=
params *sg_params;
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  472  	struct apm_mod_conn_l=
ist_params *mcon;
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  473  	struct apm_graph_open=
_params params;
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  474  	struct apm_prop_list_=
params *mprop;
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  475  	struct audioreach_mod=
ule *module;
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  476  	struct audioreach_sub=
_graph *sgs;
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  477  	struct apm_mod_list_o=
bj *mlobj;
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  478  	int num_modules_per_l=
ist;
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  479  	int num_connections =
=3D 0;
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  480  	int num_containers =
=3D 0;
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  481  	int num_sub_graphs =
=3D 0;
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  482  	int num_modules =3D 0;
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  483  	int num_modules_list;
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  484  	struct gpr_pkt *pkt;
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  485  	void *p;
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  486  =

5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26 @487  	list_for_each_entry(s=
gs, sg_list, node) {
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  488  		num_sub_graphs++;
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  489  		list_for_each_entry(=
container, &sgs->container_list, node) {
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  490  			num_containers++;
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  491  			num_modules +=3D co=
ntainer->num_modules;
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  492  			list_for_each_conta=
iner_module(module, container) {
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  493  				if (module->src_mo=
d_inst_id)
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  494  					num_connections++;
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  495  			}
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  496  		}
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  497  	}
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  498  =

5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  499  	num_modules_list =3D =
num_containers;
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26 @500  	num_modules_per_list =
=3D num_modules/num_containers;
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  501  	sg_sz =3D APM_SUB_GRA=
PH_PSIZE(sg_params, num_sub_graphs);
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  502  	cont_sz =3D APM_CONTA=
INER_PSIZE(cont_params, num_containers);
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  503  	ml_sz =3D	ALIGN(sizeo=
f(struct apm_module_list_params) +
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  504  		num_modules_list * A=
PM_MOD_LIST_OBJ_PSIZE(mlobj,  num_modules_per_list), 8);
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  505  	mp_sz =3D APM_MOD_PRO=
P_PSIZE(mprop, num_modules);
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  506  	mc_sz =3D	APM_MOD_CON=
N_PSIZE(mcon, num_connections);
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  507  =

5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  508  	payload_size =3D sg_s=
z + cont_sz + ml_sz + mp_sz + mc_sz;
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  509  	pkt =3D audioreach_al=
loc_apm_cmd_pkt(payload_size, APM_CMD_GRAPH_OPEN, 0);
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  510  	if (IS_ERR(pkt))
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  511  		return pkt;
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  512  =

5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  513  	p =3D (void *)pkt + G=
PR_HDR_SIZE + APM_CMD_HDR_SIZE;
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  514  =

5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  515  	/* SubGraph */
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  516  	params.sg_data =3D p;
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  517  	param_data =3D &param=
s.sg_data->param_data;
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  518  	param_data->module_in=
stance_id =3D APM_MODULE_INSTANCE_ID;
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  519  	param_data->param_id =
=3D APM_PARAM_ID_SUB_GRAPH_CONFIG;
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  520  	param_data->param_siz=
e =3D sg_sz - APM_MODULE_PARAM_DATA_SIZE;
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  521  	params.sg_data->num_s=
ub_graphs =3D num_sub_graphs;
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  522  	p +=3D sg_sz;
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  523  =

5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  524  	/* Container */
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  525  	params.cont_data =3D =
p;
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  526  	param_data =3D &param=
s.cont_data->param_data;
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  527  	param_data->module_in=
stance_id =3D APM_MODULE_INSTANCE_ID;
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  528  	param_data->param_id =
=3D APM_PARAM_ID_CONTAINER_CONFIG;
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  529  	param_data->param_siz=
e =3D cont_sz - APM_MODULE_PARAM_DATA_SIZE;
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  530  	params.cont_data->num=
_containers =3D num_containers;
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  531  	p +=3D cont_sz;
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  532  =

5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  533  	/* Module List*/
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  534  	params.mod_list_data =
=3D p;
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  535  	param_data =3D &param=
s.mod_list_data->param_data;
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  536  	param_data->module_in=
stance_id =3D APM_MODULE_INSTANCE_ID;
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  537  	param_data->param_id =
=3D APM_PARAM_ID_MODULE_LIST;
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  538  	param_data->param_siz=
e =3D ml_sz - APM_MODULE_PARAM_DATA_SIZE;
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  539  	params.mod_list_data-=
>num_modules_list =3D num_sub_graphs;
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  540  	p +=3D ml_sz;
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  541  =

5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  542  	/* Module Properties =
*/
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  543  	params.mod_prop_data =
=3D p;
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  544  	param_data =3D &param=
s.mod_prop_data->param_data;
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  545  	param_data->module_in=
stance_id =3D APM_MODULE_INSTANCE_ID;
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  546  	param_data->param_id =
=3D APM_PARAM_ID_MODULE_PROP;
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  547  	param_data->param_siz=
e =3D mp_sz - APM_MODULE_PARAM_DATA_SIZE;
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  548  	params.mod_prop_data-=
>num_modules_prop_cfg =3D num_modules;
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  549  	p +=3D mp_sz;
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  550  =

5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  551  	/* Module Connections=
 */
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  552  	params.mod_conn_list_=
data =3D p;
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  553  	param_data =3D &param=
s.mod_conn_list_data->param_data;
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  554  	param_data->module_in=
stance_id =3D APM_MODULE_INSTANCE_ID;
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  555  	param_data->param_id =
=3D APM_PARAM_ID_MODULE_CONN;
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  556  	param_data->param_siz=
e =3D mc_sz - APM_MODULE_PARAM_DATA_SIZE;
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  557  	params.mod_conn_list_=
data->num_connections =3D num_connections;
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26 @558  	p +=3D mc_sz;
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  559  =

5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  560  	audioreach_populate_g=
raph(&params, sg_list, num_sub_graphs);
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  561  =

5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  562  	return pkt;
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  563  }
5477518b8a0e8a4 Srinivas Kandagatla 2021-10-26  564  EXPORT_SYMBOL_GPL(audi=
oreach_alloc_graph_pkt);
25ab80db6b133c2 Srinivas Kandagatla 2021-10-26  565  =


:::::: The code at line 500 was first introduced by commit
:::::: 5477518b8a0e8a45239646acd80c9bafc4401522 ASoC: qdsp6: audioreach: ad=
d q6apm support

:::::: TO: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
:::::: CC: Mark Brown <broonie@kernel.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8554165920897321765==--

