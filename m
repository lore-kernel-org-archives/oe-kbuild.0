Content-Type: multipart/mixed; boundary="===============6700687056603593902=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/ieee802154/adf7242.c:269:8: warning: Excessive padding in 'struct adf7242_local' (45 padding bytes, where 13 is optimal). Optimal fields order: buf, promiscuous, spi, hw, debugfs_root, wqueue, flags, tx_stat, tx_complete, bmux, work, stat_msg, ...
Date: Sun, 04 Sep 2022 10:27:13 +0800
Message-ID: <202209041058.jJNqNbEE-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6700687056603593902==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check first_new_problem:=
 drivers/net/ieee802154/adf7242.c:269:8: warning: Excessive padding in 'str=
uct adf7242_local' (45 padding bytes, where 13 is optimal). Optimal fields =
order: buf, promiscuous, spi, hw, debugfs_root, wqueue, flags, tx_stat, tx_=
complete, bmux, work, stat_msg, stat_xfer, rssi, max_frame_retries, max_cca=
_retries, max_be, min_be, buf_stat_rx, buf_stat_tx, buf_cmd, buf_reg_tx, bu=
f_read_tx, buf_read_rx, consider reordering the fields or adding explicit p=
adding members [clang-analyzer-optin.performance.Padding]"
:::::: =


BCC: lkp(a)intel.com
CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: David Jander <david@protonic.nl>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   65eea2c060aee3bf6d27ea365360059fbd4eeff4
commit: 1714582a3a087eda8786d5a1b32b2ec86ca8a303 spi: Move ctlr->cur_msg_pr=
epared to struct spi_message
date:   10 weeks ago
:::::: branch date: 6 hours ago
:::::: commit date: 10 weeks ago
config: arm-randconfig-c002-20220901 (https://download.01.org/0day-ci/archi=
ve/20220904/202209041058.jJNqNbEE-lkp(a)intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project c55b41=
d5199d2394dd6cdb8f52180d8b81d809d4)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D1714582a3a087eda8786d5a1b32b2ec86ca8a303
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 1714582a3a087eda8786d5a1b32b2ec86ca8a303
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

clang_analyzer warnings: (new ones prefixed by >>)
                           ^~~~~~
   crypto/tcrypt.c:1171:5: warning: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insec=
ureAPI.DeprecatedOrUnsafeBufferHandling]
                                   memset(&iv, 0xff, iv_len);
                                   ^~~~~~
   crypto/tcrypt.c:1171:5: note: Call to function 'memset' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'memset_s' in case of C11
                                   memset(&iv, 0xff, iv_len);
                                   ^~~~~~
   crypto/tcrypt.c:1186:6: warning: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insec=
ureAPI.DeprecatedOrUnsafeBufferHandling]
                                           memset(cur->xbuf[p], 0xff, PAGE_=
SIZE);
                                           ^~~~~~
   crypto/tcrypt.c:1186:6: note: Call to function 'memset' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'memset_s' in case of C11
                                           memset(cur->xbuf[p], 0xff, PAGE_=
SIZE);
                                           ^~~~~~
   crypto/tcrypt.c:1192:5: warning: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insec=
ureAPI.DeprecatedOrUnsafeBufferHandling]
                                   memset(cur->xbuf[p], 0xff, k);
                                   ^~~~~~
   crypto/tcrypt.c:1192:5: note: Call to function 'memset' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'memset_s' in case of C11
                                   memset(cur->xbuf[p], 0xff, k);
                                   ^~~~~~
   crypto/tcrypt.c:1369:4: warning: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insec=
ureAPI.DeprecatedOrUnsafeBufferHandling]
                           memset(tvmem[0], 0xff, PAGE_SIZE);
                           ^~~~~~
   crypto/tcrypt.c:1369:4: note: Call to function 'memset' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'memset_s' in case of C11
                           memset(tvmem[0], 0xff, PAGE_SIZE);
                           ^~~~~~
   crypto/tcrypt.c:1399:6: warning: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insec=
ureAPI.DeprecatedOrUnsafeBufferHandling]
                                           memset(tvmem[j], 0xff, PAGE_SIZE=
);
                                           ^~~~~~
   crypto/tcrypt.c:1399:6: note: Call to function 'memset' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'memset_s' in case of C11
                                           memset(tvmem[j], 0xff, PAGE_SIZE=
);
                                           ^~~~~~
   crypto/tcrypt.c:1404:5: warning: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insec=
ureAPI.DeprecatedOrUnsafeBufferHandling]
                                   memset(tvmem[j], 0xff, k);
                                   ^~~~~~
   crypto/tcrypt.c:1404:5: note: Call to function 'memset' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'memset_s' in case of C11
                                   memset(tvmem[j], 0xff, k);
                                   ^~~~~~
   crypto/tcrypt.c:1411:5: warning: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insec=
ureAPI.DeprecatedOrUnsafeBufferHandling]
                                   memset(&iv, 0xff, iv_len);
                                   ^~~~~~
   crypto/tcrypt.c:1411:5: note: Call to function 'memset' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'memset_s' in case of C11
                                   memset(&iv, 0xff, iv_len);
                                   ^~~~~~
   Suppressed 32 warnings (32 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   33 warnings generated.
   sound/core/info.c:114:3: warning: Value stored to 'offset' is never read=
 [clang-analyzer-deadcode.DeadStores]
                   offset =3D entry->c.ops->llseek(entry,
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/core/info.c:114:3: note: Value stored to 'offset' is never read
                   offset =3D entry->c.ops->llseek(entry,
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/core/info.c:509:2: warning: Call to function 'sprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           sprintf(str, "card%i", card->number);
           ^~~~~~~
   sound/core/info.c:509:2: note: Call to function 'sprintf' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'sprintf_s' in case of C11
           sprintf(str, "card%i", card->number);
           ^~~~~~~
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   sound/core/ctljack.c:34:2: warning: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&sid, 0, sizeof(sid));
           ^~~~~~
   sound/core/ctljack.c:34:2: note: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11
           memset(&sid, 0, sizeof(sid));
           ^~~~~~
   sound/core/ctljack.c:58:2: warning: Call to function 'snprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(name, size, need_cat ? "%s Jack" : "%s", src_name);
           ^~~~~~~~
   sound/core/ctljack.c:58:2: note: Call to function 'snprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'snprintf_s' in case of C11
           snprintf(name, size, need_cat ? "%s Jack" : "%s", src_name);
           ^~~~~~~~
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   67 warnings generated.
   drivers/net/ieee802154/mrf24j40.c:518:2: warning: Call to function 'memc=
py' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(buf, data, count);
           ^~~~~~
   drivers/net/ieee802154/mrf24j40.c:518:2: note: Call to function 'memcpy'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(buf, data, count);
           ^~~~~~
   drivers/net/ieee802154/mrf24j40.c:689:3: warning: Call to function 'memc=
py' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(addr, &filt->ieee_addr, 8);
                   ^~~~~~
   drivers/net/ieee802154/mrf24j40.c:689:3: note: Call to function 'memcpy'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(addr, &filt->ieee_addr, 8);
                   ^~~~~~
   drivers/net/ieee802154/mrf24j40.c:759:2: warning: Call to function 'memc=
py' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(rx_local_buf, devrec->rx_fifo_buf, len);
           ^~~~~~
   drivers/net/ieee802154/mrf24j40.c:759:2: note: Call to function 'memcpy'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(rx_local_buf, devrec->rx_fifo_buf, len);
           ^~~~~~
   Suppressed 64 warnings (64 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   64 warnings generated.
   Suppressed 64 warnings (64 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   72 warnings generated.
>> drivers/net/ieee802154/adf7242.c:269:8: warning: Excessive padding in 's=
truct adf7242_local' (45 padding bytes, where 13 is optimal). Optimal field=
s order: buf, promiscuous, spi, hw, debugfs_root, wqueue, flags, tx_stat, t=
x_complete, bmux, work, stat_msg, stat_xfer, rssi, max_frame_retries, max_c=
ca_retries, max_be, min_be, buf_stat_rx, buf_stat_tx, buf_cmd, buf_reg_tx, =
buf_read_tx, buf_read_rx, consider reordering the fields or adding explicit=
 padding members [clang-analyzer-optin.performance.Padding]
   struct adf7242_local {
   ~~~~~~~^~~~~~~~~~~~~~~
   drivers/net/ieee802154/adf7242.c:269:8: note: Excessive padding in 'stru=
ct adf7242_local' (45 padding bytes, where 13 is optimal). Optimal fields o=
rder: buf, promiscuous, spi, hw, debugfs_root, wqueue, flags, tx_stat, tx_c=
omplete, bmux, work, stat_msg, stat_xfer, rssi, max_frame_retries, max_cca_=
retries, max_be, min_be, buf_stat_rx, buf_stat_tx, buf_cmd, buf_reg_tx, buf=
_read_tx, buf_read_rx, consider reordering the fields or adding explicit pa=
dding members
   struct adf7242_local {
   ~~~~~~~^~~~~~~~~~~~~~~
   drivers/net/ieee802154/adf7242.c:623:6: warning: The left expression of =
the compound assignment is an uninitialized value. The computed value will =
also be garbage [clang-analyzer-core.uninitialized.Assign]
           tmp &=3D ~PA_BRIDGE_DBIAS(~0);
           ~~~ ^
   drivers/net/ieee802154/adf7242.c:602:28: note: 'tmp' declared without an=
 initial value
           u8 pwr, bias_ctrl, dbias, tmp;
                                     ^~~
   drivers/net/ieee802154/adf7242.c:605:2: note: Taking false branch
           dev_vdbg(&lp->spi->dev, "%s : Power %d dB\n", __func__, db);
           ^
   include/linux/dev_printk.h:261:2: note: expanded from macro 'dev_vdbg'
           if (0)                                                          \
           ^
   drivers/net/ieee802154/adf7242.c:607:6: note: Assuming 'db' is <=3D 5
           if (db > 5 || db < -26)
               ^~~~~~
   drivers/net/ieee802154/adf7242.c:607:6: note: Left side of '||' is false
   drivers/net/ieee802154/adf7242.c:607:16: note: Assuming the condition is=
 false
           if (db > 5 || db < -26)
                         ^~~~~~~~
   drivers/net/ieee802154/adf7242.c:607:2: note: Taking false branch
           if (db > 5 || db < -26)
           ^
   drivers/net/ieee802154/adf7242.c:610:7: note: Left side of '||' is false
           db =3D DIV_ROUND_CLOSEST(db + 29, 2);
                ^
   include/linux/math.h:90:3: note: expanded from macro 'DIV_ROUND_CLOSEST'
           (((typeof(x))-1) > 0 ||                         \
            ^
   drivers/net/ieee802154/adf7242.c:610:7: note: Left side of '||' is false
           db =3D DIV_ROUND_CLOSEST(db + 29, 2);
                ^
   include/linux/math.h:90:3: note: expanded from macro 'DIV_ROUND_CLOSEST'
           (((typeof(x))-1) > 0 ||                         \
            ^
   drivers/net/ieee802154/adf7242.c:610:7: note: '__x' is > 0
           db =3D DIV_ROUND_CLOSEST(db + 29, 2);
                ^
   include/linux/math.h:92:5: note: expanded from macro 'DIV_ROUND_CLOSEST'
            (((__x) > 0) =3D=3D ((__d) > 0))) ?                \
              ^~~~~
   drivers/net/ieee802154/adf7242.c:610:7: note: '?' condition is true
           db =3D DIV_ROUND_CLOSEST(db + 29, 2);
                ^
   include/linux/math.h:90:2: note: expanded from macro 'DIV_ROUND_CLOSEST'
           (((typeof(x))-1) > 0 ||                         \
           ^
   drivers/net/ieee802154/adf7242.c:612:6: note: Assuming 'db' is <=3D 15
           if (db > 15) {
               ^~~~~~~
   drivers/net/ieee802154/adf7242.c:612:2: note: Taking false branch
           if (db > 15) {
           ^
   drivers/net/ieee802154/adf7242.c:620:8: note: Assuming '__UNIQUE_ID___x3=
05' is <=3D '__UNIQUE_ID___y306'
           pwr =3D clamp_t(u8, db, 3, 15);
                 ^
   include/linux/minmax.h:124:48: note: expanded from macro 'clamp_t'
   #define clamp_t(type, val, lo, hi) min_t(type, max_t(type, val, lo), hi)
                                      ~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:112:27: note: expanded from macro 'max_t'
   #define max_t(type, x, y)       __careful_cmp((type)(x), (type)(y), >)
                                   ^
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/minmax.h:104:48: note: expanded from macro 'min_t'
   #define min_t(type, x, y)       __careful_cmp((type)(x), (type)(y), <)
                                   ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~
   include/linux/minmax.h:38:14: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:31:25: note: expanded from macro '__cmp_once'
                   typeof(x) unique_x =3D (x);               \
                                         ^
   drivers/net/ieee802154/adf7242.c:620:8: note: '?' condition is false
           pwr =3D clamp_t(u8, db, 3, 15);
                 ^
   include/linux/minmax.h:124:48: note: expanded from macro 'clamp_t'
   #define clamp_t(type, val, lo, hi) min_t(type, max_t(type, val, lo), hi)
                                                  ^
   include/linux/minmax.h:112:27: note: expanded from macro 'max_t'
   #define max_t(type, x, y)       __careful_cmp((type)(x), (type)(y), >)
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
   drivers/net/ieee802154/adf7242.c:620:8: note: '__UNIQUE_ID___x307' is < =
'__UNIQUE_ID___y308'
           pwr =3D clamp_t(u8, db, 3, 15);
                 ^

vim +269 drivers/net/ieee802154/adf7242.c

7302b9d9011749 Michael Hennerich 2015-12-11  268  =

7302b9d9011749 Michael Hennerich 2015-12-11 @269  struct adf7242_local {
7302b9d9011749 Michael Hennerich 2015-12-11  270  	struct spi_device *spi;
7302b9d9011749 Michael Hennerich 2015-12-11  271  	struct completion tx_com=
plete;
7302b9d9011749 Michael Hennerich 2015-12-11  272  	struct ieee802154_hw *hw;
7302b9d9011749 Michael Hennerich 2015-12-11  273  	struct mutex bmux; /* pr=
otect SPI messages */
7302b9d9011749 Michael Hennerich 2015-12-11  274  	struct spi_message stat_=
msg;
7302b9d9011749 Michael Hennerich 2015-12-11  275  	struct spi_transfer stat=
_xfer;
7302b9d9011749 Michael Hennerich 2015-12-11  276  	struct dentry *debugfs_r=
oot;
58e9683d14752d Michael Hennerich 2018-06-25  277  	struct delayed_work work;
58e9683d14752d Michael Hennerich 2018-06-25  278  	struct workqueue_struct =
*wqueue;
7302b9d9011749 Michael Hennerich 2015-12-11  279  	unsigned long flags;
7302b9d9011749 Michael Hennerich 2015-12-11  280  	int tx_stat;
7302b9d9011749 Michael Hennerich 2015-12-11  281  	bool promiscuous;
7302b9d9011749 Michael Hennerich 2015-12-11  282  	s8 rssi;
7302b9d9011749 Michael Hennerich 2015-12-11  283  	u8 max_frame_retries;
7302b9d9011749 Michael Hennerich 2015-12-11  284  	u8 max_cca_retries;
7302b9d9011749 Michael Hennerich 2015-12-11  285  	u8 max_be;
7302b9d9011749 Michael Hennerich 2015-12-11  286  	u8 min_be;
7302b9d9011749 Michael Hennerich 2015-12-11  287  =

7302b9d9011749 Michael Hennerich 2015-12-11  288  	/* DMA (thus cache coher=
ency maintenance) requires the
7302b9d9011749 Michael Hennerich 2015-12-11  289  	 * transfer buffers to l=
ive in their own cache lines.
7302b9d9011749 Michael Hennerich 2015-12-11  290  	 */
7302b9d9011749 Michael Hennerich 2015-12-11  291  =

7302b9d9011749 Michael Hennerich 2015-12-11  292  	u8 buf[3] ____cacheline_=
aligned;
7302b9d9011749 Michael Hennerich 2015-12-11  293  	u8 buf_reg_tx[3];
7302b9d9011749 Michael Hennerich 2015-12-11  294  	u8 buf_read_tx[4];
7302b9d9011749 Michael Hennerich 2015-12-11  295  	u8 buf_read_rx[4];
7302b9d9011749 Michael Hennerich 2015-12-11  296  	u8 buf_stat_rx;
7302b9d9011749 Michael Hennerich 2015-12-11  297  	u8 buf_stat_tx;
7302b9d9011749 Michael Hennerich 2015-12-11  298  	u8 buf_cmd;
7302b9d9011749 Michael Hennerich 2015-12-11  299  };
7302b9d9011749 Michael Hennerich 2015-12-11  300  =


:::::: The code@line 269 was first introduced by commit
:::::: 7302b9d90117496049dd4bfa28755f7c2ed55b27 ieee802154/adf7242: Driver =
for ADF7242 MAC IEEE802154

:::::: TO: Michael Hennerich <michael.hennerich@analog.com>
:::::: CC: Marcel Holtmann <marcel@holtmann.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6700687056603593902==--

