Content-Type: multipart/mixed; boundary="===============2056778083764080857=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: kernel/trace/trace_events_user.c:743:3: warning: Value stored to 'pos' is never read [clang-analyzer-deadcode.DeadStores]
Date: Tue, 03 May 2022 05:51:08 +0800
Message-ID: <202205030500.55v8YRsy-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2056778083764080857==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Beau Belgrave <beaub@linux.microsoft.com>
CC: "Steven Rostedt (Google)" <rostedt@goodmis.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   9050ba3a61a4b5bd84c2cde092a100404f814f31
commit: 9aed4e157d1ffe4aeebc005b4eceede1ed5a403a user_events: Handle matchi=
ng arguments from dyn_events
date:   3 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 3 months ago
config: arm-randconfig-c002-20220502 (https://download.01.org/0day-ci/archi=
ve/20220503/202205030500.55v8YRsy-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 09325d=
36061e42b495d1f4c7e933e260eac260ed)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D9aed4e157d1ffe4aeebc005b4eceede1ed5a403a
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 9aed4e157d1ffe4aeebc005b4eceede1ed5a403a
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                                     ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:313:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   drivers/base/regmap/regmap.c:1526:11: note: Left side of '||' is true
                   async =3D list_first_entry_or_null(&map->async_free,
                           ^
   include/linux/list.h:554:28: note: expanded from macro 'list_first_entry=
_or_null'
           struct list_head *pos__ =3D READ_ONCE(head__->next); \
                                     ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:314:28: note: expanded from macro '__nati=
ve_word'
            sizeof(t) =3D=3D sizeof(int) || sizeof(t) =3D=3D sizeof(long))
                                     ^
   drivers/base/regmap/regmap.c:1526:11: note: Taking false branch
                   async =3D list_first_entry_or_null(&map->async_free,
                           ^
   include/linux/list.h:554:28: note: expanded from macro 'list_first_entry=
_or_null'
           struct list_head *pos__ =3D READ_ONCE(head__->next); \
                                     ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:2: note: expanded from macro 'compiletim=
e_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
           ^
   include/linux/compiler_types.h:346:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:334:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:326:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/base/regmap/regmap.c:1526:11: note: Loop condition is false.  Ex=
iting loop
                   async =3D list_first_entry_or_null(&map->async_free,
                           ^
   include/linux/list.h:554:28: note: expanded from macro 'list_first_entry=
_or_null'
           struct list_head *pos__ =3D READ_ONCE(head__->next); \
                                     ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:2: note: expanded from macro 'compiletim=
e_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
           ^
   include/linux/compiler_types.h:346:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:334:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:318:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/base/regmap/regmap.c:1526:11: note: Assuming 'pos__' is not equa=
l to 'head__'
                   async =3D list_first_entry_or_null(&map->async_free,
                           ^
   include/linux/list.h:555:2: note: expanded from macro 'list_first_entry_=
or_null'
           pos__ !=3D head__ ? list_entry(pos__, type, member) : NULL; \
           ^~~~~~~~~~~~~~~
   drivers/base/regmap/regmap.c:1526:11: note: '?' condition is true
                   async =3D list_first_entry_or_null(&map->async_free,
                           ^
   include/linux/list.h:555:2: note: expanded from macro 'list_first_entry_=
or_null'
           pos__ !=3D head__ ? list_entry(pos__, type, member) : NULL; \
           ^
   drivers/base/regmap/regmap.c:1529:3: note: Calling 'list_del'
                   list_del(&async->list);
                   ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:149:14: note: Use of memory after it is freed
           entry->next =3D LIST_POISON1;
           ~~~~~~~~~~~ ^
   Suppressed 22 warnings (22 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
>> kernel/trace/trace_events_user.c:743:3: warning: Value stored to 'pos' i=
s never read [clang-analyzer-deadcode.DeadStores]
                   pos +=3D snprintf(field_name + pos, len - pos, ";");
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace_events_user.c:743:3: note: Value stored to 'pos' is n=
ever read
                   pos +=3D snprintf(field_name + pos, len - pos, ";");
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   28 warnings generated.
   Suppressed 28 warnings (28 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
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
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   drivers/mfd/max8997-irq.c:248:3: warning: Value stored to 'ret' is never=
 read [clang-analyzer-deadcode.DeadStores]
                   ret =3D max8997_read_reg(max8997->i2c, MAX8997_REG_FLASH=
STATUS,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   drivers/mfd/max8997-irq.c:248:3: note: Value stored to 'ret' is never re=
ad
                   ret =3D max8997_read_reg(max8997->i2c, MAX8997_REG_FLASH=
STATUS,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   drivers/clk/clk-cdce706.c:355:22: warning: Division by zero [clang-analy=
zer-core.DivideZero]
           return *parent_rate / div;
                  ~~~~~~~~~~~~~^~~~~
   drivers/clk/clk-cdce706.c:297:2: note: Taking false branch
           dev_dbg(&hwd->dev_data->client->dev,
           ^
   include/linux/dev_printk.h:162:2: note: expanded from macro 'dev_dbg'
           if (0)                                                          \
           ^
   drivers/clk/clk-cdce706.c:304:6: note: Assuming 'mul' is not equal to 0
           if (!mul)
               ^~~~
   drivers/clk/clk-cdce706.c:304:2: note: Taking false branch
           if (!mul)
           ^
   drivers/clk/clk-cdce706.c:307:6: note: Assuming the condition is true
           if (clk_hw_get_flags(hw) & CLK_SET_RATE_PARENT) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/clk-cdce706.c:307:2: note: Taking true branch
           if (clk_hw_get_flags(hw) & CLK_SET_RATE_PARENT) {
           ^
   drivers/clk/clk-cdce706.c:309:3: note: 'best_div' initialized to 0
                   unsigned long best_div =3D 0;
                   ^~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/clk-cdce706.c:311:27: note: Assuming 'gp_clk' is null
                   unsigned long gp_rate =3D gp_clk ? clk_get_rate(gp_clk) =
: 0;
                                           ^~~~~~
   drivers/clk/clk-cdce706.c:311:27: note: '?' condition is false
   drivers/clk/clk-cdce706.c:313:43: note: 'best_diff' is not equal to 0
                   for (div =3D CDCE706_PLL_FREQ_MIN / rate; best_diff &&
                                                           ^~~~~~~~~
   drivers/clk/clk-cdce706.c:313:43: note: Left side of '&&' is true
   drivers/clk/clk-cdce706.c:314:8: note: Assuming the condition is false
                        div <=3D CDCE706_PLL_FREQ_MAX / rate; ++div) {
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/clk-cdce706.c:313:3: note: Loop condition is false. Executio=
n continues on line 342
                   for (div =3D CDCE706_PLL_FREQ_MIN / rate; best_diff &&
                   ^
   drivers/clk/clk-cdce706.c:342:3: note: The value 0 is assigned to 'div'
                   div =3D best_div;
                   ^~~~~~~~~~~~~~
   drivers/clk/clk-cdce706.c:344:3: note: Taking false branch
                   dev_dbg(&hwd->dev_data->client->dev,
                   ^
   include/linux/dev_printk.h:162:2: note: expanded from macro 'dev_dbg'
           if (0)                                                          \
           ^
   drivers/clk/clk-cdce706.c:351:2: note: Taking false branch
           dev_dbg(&hwd->dev_data->client->dev,
           ^
   include/linux/dev_printk.h:162:2: note: expanded from macro 'dev_dbg'
           if (0)                                                          \
           ^
   drivers/clk/clk-cdce706.c:355:22: note: Division by zero
           return *parent_rate / div;
                  ~~~~~~~~~~~~~^~~~~
--
                   ^
   drivers/media/dvb-frontends/atbm8830.c:17:7: note: expanded from macro '=
dprintk'
                   if (debug) \
                       ^~~~~
   drivers/media/dvb-frontends/atbm8830.c:66:3: note: Taking false branch
                   dprintk("%s: error reg=3D0x%04x, ret=3D%i\n", __func__, =
reg, ret);
                   ^
   drivers/media/dvb-frontends/atbm8830.c:17:3: note: expanded from macro '=
dprintk'
                   if (debug) \
                   ^
   drivers/media/dvb-frontends/atbm8830.c:66:3: note: Loop condition is fal=
se.  Exiting loop
                   dprintk("%s: error reg=3D0x%04x, ret=3D%i\n", __func__, =
reg, ret);
                   ^
   drivers/media/dvb-frontends/atbm8830.c:16:2: note: expanded from macro '=
dprintk'
           do { \
           ^
   drivers/media/dvb-frontends/atbm8830.c:67:3: note: Returning without wri=
ting to '*p_data'
                   return -EIO;
                   ^
   drivers/media/dvb-frontends/atbm8830.c:358:2: note: Returning from 'atbm=
8830_read_reg'
           atbm8830_read_reg(priv, REG_FRAME_ERR_CNT + 1, &t);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/atbm8830.c:359:16: note: The left operand of=
 '&' is a garbage value
           frame_err =3D t & 0x7F;
                       ~ ^
   drivers/media/dvb-frontends/atbm8830.c:382:10: warning: The left operand=
 of '&' is a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResu=
lt]
           pwm =3D t & 0x03;
                 ~ ^
   drivers/media/dvb-frontends/atbm8830.c:376:2: note: 't' declared without=
 an initial value
           u8 t;
           ^~~~
   drivers/media/dvb-frontends/atbm8830.c:378:2: note: Assuming 'debug' is 0
           dprintk("%s\n", __func__);
           ^
   drivers/media/dvb-frontends/atbm8830.c:17:7: note: expanded from macro '=
dprintk'
                   if (debug) \
                       ^~~~~
   drivers/media/dvb-frontends/atbm8830.c:378:2: note: Taking false branch
           dprintk("%s\n", __func__);
           ^
   drivers/media/dvb-frontends/atbm8830.c:17:3: note: expanded from macro '=
dprintk'
                   if (debug) \
                   ^
   drivers/media/dvb-frontends/atbm8830.c:378:2: note: Loop condition is fa=
lse.  Exiting loop
           dprintk("%s\n", __func__);
           ^
   drivers/media/dvb-frontends/atbm8830.c:16:2: note: expanded from macro '=
dprintk'
           do { \
           ^
   drivers/media/dvb-frontends/atbm8830.c:381:2: note: Calling 'atbm8830_re=
ad_reg'
           atbm8830_read_reg(priv, REG_AGC_PWM_VAL + 1, &t);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/atbm8830.c:65:6: note: Assuming 'ret' is not=
 equal to 1
           if (ret !=3D 1) {
               ^~~~~~~~
   drivers/media/dvb-frontends/atbm8830.c:65:2: note: Taking true branch
           if (ret !=3D 1) {
           ^
   drivers/media/dvb-frontends/atbm8830.c:66:3: note: Assuming 'debug' is 0
                   dprintk("%s: error reg=3D0x%04x, ret=3D%i\n", __func__, =
reg, ret);
                   ^
   drivers/media/dvb-frontends/atbm8830.c:17:7: note: expanded from macro '=
dprintk'
                   if (debug) \
                       ^~~~~
   drivers/media/dvb-frontends/atbm8830.c:66:3: note: Taking false branch
                   dprintk("%s: error reg=3D0x%04x, ret=3D%i\n", __func__, =
reg, ret);
                   ^
   drivers/media/dvb-frontends/atbm8830.c:17:3: note: expanded from macro '=
dprintk'
                   if (debug) \
                   ^
   drivers/media/dvb-frontends/atbm8830.c:66:3: note: Loop condition is fal=
se.  Exiting loop
                   dprintk("%s: error reg=3D0x%04x, ret=3D%i\n", __func__, =
reg, ret);
                   ^
   drivers/media/dvb-frontends/atbm8830.c:16:2: note: expanded from macro '=
dprintk'
           do { \
           ^
   drivers/media/dvb-frontends/atbm8830.c:67:3: note: Returning without wri=
ting to '*p_data'
                   return -EIO;
                   ^
   drivers/media/dvb-frontends/atbm8830.c:381:2: note: Returning from 'atbm=
8830_read_reg'
           atbm8830_read_reg(priv, REG_AGC_PWM_VAL + 1, &t);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/atbm8830.c:382:10: note: The left operand of=
 '&' is a garbage value
           pwm =3D t & 0x03;
                 ~ ^
   Suppressed 7 warnings (6 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
>> kernel/trace/trace_events_user.c:743:3: warning: Value stored to 'pos' i=
s never read [clang-analyzer-deadcode.DeadStores]
                   pos +=3D snprintf(field_name + pos, len - pos, ";");
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace_events_user.c:743:3: note: Value stored to 'pos' is n=
ever read
                   pos +=3D snprintf(field_name + pos, len - pos, ";");
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   28 warnings generated.
   Suppressed 28 warnings (28 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   drivers/uio/uio_aec.c:50:3: warning: Value stored to 'status' is never r=
ead [clang-analyzer-deadcode.DeadStores]
                   status =3D ioread8(dev_info->priv + MAILBOX);
                   ^
   drivers/uio/uio_aec.c:50:3: note: Value stored to 'status' is never read
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   fs/fuse/dir.c:505:3: warning: Call to function 'strcpy' is insecure as i=
t does not provide bounding of the memory buffer. Replace unbounded copy fu=
nctions with analogous functions that support length arguments such as 'str=
lcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(ptr, name);
                   ^~~~~~
   fs/fuse/dir.c:505:3: note: Call to function 'strcpy' is insecure as it d=
oes not provide bounding of the memory buffer. Replace unbounded copy funct=
ions with analogous functions that support length arguments such as 'strlcp=
y'. CWE-119
                   strcpy(ptr, name);
                   ^~~~~~
   fs/fuse/dir.c:762:2: warning: Address of stack memory associated with lo=
cal variable 'outarg' is still referred to by the stack variable 'args' upo=
n returning to the caller.  This will be a dangling reference [clang-analyz=
er-core.StackAddressEscape]
           return err;
           ^
   fs/fuse/dir.c:829:9: note: Calling 'create_new_entry'
           return create_new_entry(fm, &args, dir, entry, S_IFLNK);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/fuse/dir.c:700:2: note: Taking false branch
           if (fuse_is_bad(dir))
           ^
   fs/fuse/dir.c:704:6: note: Assuming 'forget' is non-null
           if (!forget)
               ^~~~~~~
   fs/fuse/dir.c:704:2: note: Taking false branch
           if (!forget)
           ^
   fs/fuse/dir.c:713:6: note: Assuming field 'init_security' is not equal t=
o 0
           if (fm->fc->init_security && args->opcode !=3D FUSE_LINK) {
               ^~~~~~~~~~~~~~~~~~~~~
   fs/fuse/dir.c:713:6: note: Left side of '&&' is true
   fs/fuse/dir.c:713:37: note: Field 'opcode' is not equal to FUSE_LINK
           if (fm->fc->init_security && args->opcode !=3D FUSE_LINK) {
                                              ^
   fs/fuse/dir.c:713:2: note: Taking true branch
           if (fm->fc->init_security && args->opcode !=3D FUSE_LINK) {
           ^
   fs/fuse/dir.c:716:7: note: 'err' is -12
                   if (err)
                       ^~~
   fs/fuse/dir.c:716:3: note: Taking true branch
                   if (err)
                   ^
   fs/fuse/dir.c:717:4: note: Control jumps to line 761
                           goto out_put_forget_req;
                           ^
   fs/fuse/dir.c:762:2: note: Address of stack memory associated with local=
 variable 'outarg' is still referred to by the stack variable 'args' upon r=
eturning to the caller.  This will be a dangling reference
           return err;
           ^
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   fs/fuse/file.c:1392:44: warning: The left operand of '<' is a garbage va=
lue [clang-analyzer-core.UndefinedBinaryOperatorResult]
           while (nbytes < *nbytesp && ap->num_pages < max_pages) {
                                                     ^
   fs/fuse/file.c:1591:2: note: Taking false branch
           if (fuse_is_bad(inode))
           ^
   fs/fuse/file.c:1594:6: note: Left side of '&&' is false
           if (FUSE_IS_DAX(inode))
               ^

vim +/pos +743 kernel/trace/trace_events_user.c

7f5a08c79df35e Beau Belgrave 2022-01-18  703  =

9aed4e157d1ffe Beau Belgrave 2022-01-18  704  static bool user_field_match(=
struct ftrace_event_field *field, int argc,
9aed4e157d1ffe Beau Belgrave 2022-01-18  705  			     const char **argv, in=
t *iout)
9aed4e157d1ffe Beau Belgrave 2022-01-18  706  {
9aed4e157d1ffe Beau Belgrave 2022-01-18  707  	char *field_name, *arg_name;
9aed4e157d1ffe Beau Belgrave 2022-01-18  708  	int len, pos, i =3D *iout;
9aed4e157d1ffe Beau Belgrave 2022-01-18  709  	bool colon =3D false, match =
=3D false;
9aed4e157d1ffe Beau Belgrave 2022-01-18  710  =

9aed4e157d1ffe Beau Belgrave 2022-01-18  711  	if (i >=3D argc)
9aed4e157d1ffe Beau Belgrave 2022-01-18  712  		return false;
9aed4e157d1ffe Beau Belgrave 2022-01-18  713  =

9aed4e157d1ffe Beau Belgrave 2022-01-18  714  	len =3D MAX_FIELD_ARG_NAME;
9aed4e157d1ffe Beau Belgrave 2022-01-18  715  	field_name =3D kmalloc(len, =
GFP_KERNEL);
9aed4e157d1ffe Beau Belgrave 2022-01-18  716  	arg_name =3D kmalloc(len, GF=
P_KERNEL);
9aed4e157d1ffe Beau Belgrave 2022-01-18  717  =

9aed4e157d1ffe Beau Belgrave 2022-01-18  718  	if (!arg_name || !field_name)
9aed4e157d1ffe Beau Belgrave 2022-01-18  719  		goto out;
9aed4e157d1ffe Beau Belgrave 2022-01-18  720  =

9aed4e157d1ffe Beau Belgrave 2022-01-18  721  	pos =3D 0;
9aed4e157d1ffe Beau Belgrave 2022-01-18  722  =

9aed4e157d1ffe Beau Belgrave 2022-01-18  723  	for (; i < argc; ++i) {
9aed4e157d1ffe Beau Belgrave 2022-01-18  724  		if (i !=3D *iout)
9aed4e157d1ffe Beau Belgrave 2022-01-18  725  			pos +=3D snprintf(arg_name=
 + pos, len - pos, " ");
9aed4e157d1ffe Beau Belgrave 2022-01-18  726  =

9aed4e157d1ffe Beau Belgrave 2022-01-18  727  		pos +=3D snprintf(arg_name =
+ pos, len - pos, argv[i]);
9aed4e157d1ffe Beau Belgrave 2022-01-18  728  =

9aed4e157d1ffe Beau Belgrave 2022-01-18  729  		if (strchr(argv[i], ';')) {
9aed4e157d1ffe Beau Belgrave 2022-01-18  730  			++i;
9aed4e157d1ffe Beau Belgrave 2022-01-18  731  			colon =3D true;
9aed4e157d1ffe Beau Belgrave 2022-01-18  732  			break;
9aed4e157d1ffe Beau Belgrave 2022-01-18  733  		}
9aed4e157d1ffe Beau Belgrave 2022-01-18  734  	}
9aed4e157d1ffe Beau Belgrave 2022-01-18  735  =

9aed4e157d1ffe Beau Belgrave 2022-01-18  736  	pos =3D 0;
9aed4e157d1ffe Beau Belgrave 2022-01-18  737  =

9aed4e157d1ffe Beau Belgrave 2022-01-18  738  	pos +=3D snprintf(field_name=
 + pos, len - pos, field->type);
9aed4e157d1ffe Beau Belgrave 2022-01-18  739  	pos +=3D snprintf(field_name=
 + pos, len - pos, " ");
9aed4e157d1ffe Beau Belgrave 2022-01-18  740  	pos +=3D snprintf(field_name=
 + pos, len - pos, field->name);
9aed4e157d1ffe Beau Belgrave 2022-01-18  741  =

9aed4e157d1ffe Beau Belgrave 2022-01-18  742  	if (colon)
9aed4e157d1ffe Beau Belgrave 2022-01-18 @743  		pos +=3D snprintf(field_nam=
e + pos, len - pos, ";");
9aed4e157d1ffe Beau Belgrave 2022-01-18  744  =

9aed4e157d1ffe Beau Belgrave 2022-01-18  745  	*iout =3D i;
9aed4e157d1ffe Beau Belgrave 2022-01-18  746  =

9aed4e157d1ffe Beau Belgrave 2022-01-18  747  	match =3D strcmp(arg_name, f=
ield_name) =3D=3D 0;
9aed4e157d1ffe Beau Belgrave 2022-01-18  748  out:
9aed4e157d1ffe Beau Belgrave 2022-01-18  749  	kfree(arg_name);
9aed4e157d1ffe Beau Belgrave 2022-01-18  750  	kfree(field_name);
9aed4e157d1ffe Beau Belgrave 2022-01-18  751  =

9aed4e157d1ffe Beau Belgrave 2022-01-18  752  	return match;
9aed4e157d1ffe Beau Belgrave 2022-01-18  753  }
9aed4e157d1ffe Beau Belgrave 2022-01-18  754  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2056778083764080857==--

