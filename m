Content-Type: multipart/mixed; boundary="===============4771930478804284355=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 3/3] input: ps2-gpio: don't send rx data before the stop bit
Date: Sat, 12 Feb 2022 18:39:41 +0800
Message-ID: <202202121815.P1KN65lf-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4771930478804284355==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220211212258.80345-4-danilokrummrich@dk-develop.de>
References: <20220211212258.80345-4-danilokrummrich@dk-develop.de>
TO: Danilo Krummrich <danilokrummrich@dk-develop.de>
TO: dmitry.torokhov(a)gmail.com
TO: linux-input(a)vger.kernel.org
TO: linux-kernel(a)vger.kernel.org
CC: linus.walleij(a)linaro.org
CC: Danilo Krummrich <danilokrummrich@dk-develop.de>

Hi Danilo,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on dtor-input/next]
[also build test WARNING on hid/for-next linux/master linus/master v5.17-rc=
3 next-20220211]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Danilo-Krummrich/input-ps2=
-gpio-use-ktime-for-IRQ-timekeeping/20220212-062327
base:   https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: mips-randconfig-c004-20220211 (https://download.01.org/0day-ci/arch=
ive/20220212/202202121815.P1KN65lf-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c7eb84=
634519e6497be42f5fe323f9a04ed67127)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://github.com/0day-ci/linux/commit/01c1b8646b0bd235aef95354f=
4852676493ac784
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Danilo-Krummrich/input-ps2-gpio-us=
e-ktime-for-IRQ-timekeeping/20220212-062327
        git checkout 01c1b8646b0bd235aef95354f4852676493ac784
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dmips clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   drivers/extcon/extcon-fsa9480.c:281:2: note: Taking false branch
           if (IS_ERR(info->edev)) {
           ^
   drivers/extcon/extcon-fsa9480.c:288:6: note: Assuming 'ret' is 0
           if (ret) {
               ^~~
   drivers/extcon/extcon-fsa9480.c:288:2: note: Taking false branch
           if (ret) {
           ^
   drivers/extcon/extcon-fsa9480.c:294:2: note: Taking false branch
           if (IS_ERR(info->regmap)) {
           ^
   drivers/extcon/extcon-fsa9480.c:316:6: note: Assuming 'ret' is 0
           if (ret) {
               ^~~
   drivers/extcon/extcon-fsa9480.c:316:2: note: Taking false branch
           if (ret) {
           ^
   drivers/extcon/extcon-fsa9480.c:322:2: note: Calling 'fsa9480_detect_dev'
           fsa9480_detect_dev(info);
           ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/extcon/extcon-fsa9480.c:227:6: note: Assuming 'val1' is >=3D 0
           if (val1 < 0 || val2 < 0) {
               ^~~~~~~~
   drivers/extcon/extcon-fsa9480.c:227:6: note: Left side of '||' is false
   drivers/extcon/extcon-fsa9480.c:227:18: note: Assuming 'val2' is >=3D 0
           if (val1 < 0 || val2 < 0) {
                           ^~~~~~~~
   drivers/extcon/extcon-fsa9480.c:227:2: note: Taking false branch
           if (val1 < 0 || val2 < 0) {
           ^
   drivers/extcon/extcon-fsa9480.c:233:2: note: Loop condition is false.  E=
xiting loop
           dev_info(usbsw->dev, "dev1: 0x%x, dev2: 0x%x\n", val1, val2);
           ^
   include/linux/dev_printk.h:150:2: note: expanded from macro 'dev_info'
           dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), #=
#__VA_ARGS__)
           ^
   include/linux/dev_printk.h:109:3: note: expanded from macro 'dev_printk_=
index_wrap'
                   dev_printk_index_emit(level, fmt);                      \
                   ^
   include/linux/dev_printk.h:105:2: note: expanded from macro 'dev_printk_=
index_emit'
           printk_index_subsys_emit("%s %s: ", level, fmt)
           ^
   include/linux/printk.h:417:2: note: expanded from macro 'printk_index_su=
bsys_emit'
           __printk_index_emit(fmt, level, subsys_fmt_prefix)
           ^
   include/linux/printk.h:396:34: note: expanded from macro '__printk_index=
_emit'
   #define __printk_index_emit(...) do {} while (0)
                                    ^
   drivers/extcon/extcon-fsa9480.c:236:2: note: Calling 'fsa9480_handle_cha=
nge'
           fsa9480_handle_change(usbsw, usbsw->cable & ~val, false);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/extcon/extcon-fsa9480.c:205:2: note: Loop condition is true.  En=
tering loop body
           while (mask) {
           ^
   drivers/extcon/extcon-fsa9480.c:206:3: note: 'dev' initialized to 63
                   int dev =3D fls64(mask) - 1;
                   ^~~~~~~
   drivers/extcon/extcon-fsa9480.c:207:3: note: Assigned value is garbage o=
r undefined
                   u64 cables =3D cable_types[dev];
                   ^            ~~~~~~~~~~~~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   fs/configfs/symlink.c:70:3: warning: Call to function 'strcpy' is insecu=
re as it does not provide bounding of the memory buffer. Replace unbounded =
copy functions with analogous functions that support length arguments such =
as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(s,"../");
                   ^~~~~~
   fs/configfs/symlink.c:70:3: note: Call to function 'strcpy' is insecure =
as it does not provide bounding of the memory buffer. Replace unbounded cop=
y functions with analogous functions that support length arguments such as =
'strlcpy'. CWE-119
                   strcpy(s,"../");
                   ^~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   fs/xfs/libxfs/xfs_refcount.c:114:19: warning: Value stored to 'agno' dur=
ing its initialization is never read [clang-analyzer-deadcode.DeadStores]
           xfs_agnumber_t                  agno =3D cur->bc_ag.pag->pag_agn=
o;
                                           ^~~~   ~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_refcount.c:114:19: note: Value stored to 'agno' during=
 its initialization is never read
           xfs_agnumber_t                  agno =3D cur->bc_ag.pag->pag_agn=
o;
                                           ^~~~   ~~~~~~~~~~~~~~~~~~~~~~~~
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
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
>> drivers/input/serio/ps2-gpio.c:215:4: warning: Value stored to 'rxflags'=
 is never read [clang-analyzer-deadcode.DeadStores]
                           rxflags |=3D SERIO_PARITY;
                           ^
   drivers/input/serio/ps2-gpio.c:215:4: note: Value stored to 'rxflags' is=
 never read
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
   fs/sysv/dir.c:339:2: warning: Value stored to 'err' is never read [clang=
-analyzer-deadcode.DeadStores]
           err =3D dir_commit_chunk(page, pos, SYSV_DIRSIZE);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/sysv/dir.c:339:2: note: Value stored to 'err' is never read
           err =3D dir_commit_chunk(page, pos, SYSV_DIRSIZE);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
   drivers/usb/serial/usb_wwan.c:151:2: warning: Value stored to 'i' is nev=
er read [clang-analyzer-deadcode.DeadStores]
           i =3D 0;
           ^   ~
   drivers/usb/serial/usb_wwan.c:151:2: note: Value stored to 'i' is never =
read
           i =3D 0;
           ^   ~
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
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
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
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
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

vim +/rxflags +215 drivers/input/serio/ps2-gpio.c

9ee0a0558819e6 Danilo Krummrich 2017-08-28  151  =

9ee0a0558819e6 Danilo Krummrich 2017-08-28  152  static irqreturn_t ps2_gpi=
o_irq_rx(struct ps2_gpio_data *drvdata)
9ee0a0558819e6 Danilo Krummrich 2017-08-28  153  {
9ee0a0558819e6 Danilo Krummrich 2017-08-28  154  	unsigned char byte, cnt;
9ee0a0558819e6 Danilo Krummrich 2017-08-28  155  	int data;
9ee0a0558819e6 Danilo Krummrich 2017-08-28  156  	int rxflags =3D 0;
dc1a5808b83032 Danilo Krummrich 2022-02-11  157  	static ktime_t t_last, t_=
now;
dc1a5808b83032 Danilo Krummrich 2022-02-11  158  	s64 us_delta;
9ee0a0558819e6 Danilo Krummrich 2017-08-28  159  =

9ee0a0558819e6 Danilo Krummrich 2017-08-28  160  	byte =3D drvdata->rx_byte;
9ee0a0558819e6 Danilo Krummrich 2017-08-28  161  	cnt =3D drvdata->rx_cnt;
9ee0a0558819e6 Danilo Krummrich 2017-08-28  162  =

dc1a5808b83032 Danilo Krummrich 2022-02-11  163  	t_now =3D ktime_get();
dc1a5808b83032 Danilo Krummrich 2022-02-11  164  	if (t_last =3D=3D 0)
dc1a5808b83032 Danilo Krummrich 2022-02-11  165  		t_last =3D t_now;
9ee0a0558819e6 Danilo Krummrich 2017-08-28  166  =

dc1a5808b83032 Danilo Krummrich 2022-02-11  167  	/* We need to consider sp=
urious interrupts happening right after a TX xfer
dc1a5808b83032 Danilo Krummrich 2022-02-11  168  	 * finished.
dc1a5808b83032 Danilo Krummrich 2022-02-11  169  	 */
dc1a5808b83032 Danilo Krummrich 2022-02-11  170  	if (unlikely(ktime_us_del=
ta(t_now, drvdata->tx_end) <
dc1a5808b83032 Danilo Krummrich 2022-02-11  171  		     PS2_IRQ_MIN_INTERVA=
L_US))
dc1a5808b83032 Danilo Krummrich 2022-02-11  172  		goto end;
dc1a5808b83032 Danilo Krummrich 2022-02-11  173  =

dc1a5808b83032 Danilo Krummrich 2022-02-11  174  	us_delta =3D ktime_us_del=
ta(t_now, t_last);
dc1a5808b83032 Danilo Krummrich 2022-02-11  175  	if (us_delta > PS2_IRQ_MA=
X_INTERVAL_US && cnt) {
9ee0a0558819e6 Danilo Krummrich 2017-08-28  176  		dev_err(drvdata->dev,
9ee0a0558819e6 Danilo Krummrich 2017-08-28  177  			"RX: timeout, probably =
we missed an interrupt\n");
9ee0a0558819e6 Danilo Krummrich 2017-08-28  178  		goto err;
dc1a5808b83032 Danilo Krummrich 2022-02-11  179  	} else if (us_delta < PS2=
_IRQ_MIN_INTERVAL_US && t_now !=3D t_last) {
dc1a5808b83032 Danilo Krummrich 2022-02-11  180  		/* Ignore spurious IRQs.=
 */
dc1a5808b83032 Danilo Krummrich 2022-02-11  181  		goto end;
9ee0a0558819e6 Danilo Krummrich 2017-08-28  182  	}
dc1a5808b83032 Danilo Krummrich 2022-02-11  183  	t_last =3D t_now;
9ee0a0558819e6 Danilo Krummrich 2017-08-28  184  =

9ee0a0558819e6 Danilo Krummrich 2017-08-28  185  	data =3D gpiod_get_value(=
drvdata->gpio_data);
9ee0a0558819e6 Danilo Krummrich 2017-08-28  186  	if (unlikely(data < 0)) {
9ee0a0558819e6 Danilo Krummrich 2017-08-28  187  		dev_err(drvdata->dev, "R=
X: failed to get data gpio val: %d\n",
9ee0a0558819e6 Danilo Krummrich 2017-08-28  188  			data);
9ee0a0558819e6 Danilo Krummrich 2017-08-28  189  		goto err;
9ee0a0558819e6 Danilo Krummrich 2017-08-28  190  	}
9ee0a0558819e6 Danilo Krummrich 2017-08-28  191  =

9ee0a0558819e6 Danilo Krummrich 2017-08-28  192  	switch (cnt) {
9ee0a0558819e6 Danilo Krummrich 2017-08-28  193  	case PS2_START_BIT:
9ee0a0558819e6 Danilo Krummrich 2017-08-28  194  		/* start bit should be l=
ow */
9ee0a0558819e6 Danilo Krummrich 2017-08-28  195  		if (unlikely(data)) {
9ee0a0558819e6 Danilo Krummrich 2017-08-28  196  			dev_err(drvdata->dev, "=
RX: start bit should be low\n");
9ee0a0558819e6 Danilo Krummrich 2017-08-28  197  			goto err;
9ee0a0558819e6 Danilo Krummrich 2017-08-28  198  		}
9ee0a0558819e6 Danilo Krummrich 2017-08-28  199  		break;
9ee0a0558819e6 Danilo Krummrich 2017-08-28  200  	case PS2_DATA_BIT0:
9ee0a0558819e6 Danilo Krummrich 2017-08-28  201  	case PS2_DATA_BIT1:
9ee0a0558819e6 Danilo Krummrich 2017-08-28  202  	case PS2_DATA_BIT2:
9ee0a0558819e6 Danilo Krummrich 2017-08-28  203  	case PS2_DATA_BIT3:
9ee0a0558819e6 Danilo Krummrich 2017-08-28  204  	case PS2_DATA_BIT4:
9ee0a0558819e6 Danilo Krummrich 2017-08-28  205  	case PS2_DATA_BIT5:
9ee0a0558819e6 Danilo Krummrich 2017-08-28  206  	case PS2_DATA_BIT6:
9ee0a0558819e6 Danilo Krummrich 2017-08-28  207  	case PS2_DATA_BIT7:
9ee0a0558819e6 Danilo Krummrich 2017-08-28  208  		/* processing data bits =
*/
9ee0a0558819e6 Danilo Krummrich 2017-08-28  209  		if (data)
9ee0a0558819e6 Danilo Krummrich 2017-08-28  210  			byte |=3D (data << (cnt=
 - 1));
9ee0a0558819e6 Danilo Krummrich 2017-08-28  211  		break;
9ee0a0558819e6 Danilo Krummrich 2017-08-28  212  	case PS2_PARITY_BIT:
9ee0a0558819e6 Danilo Krummrich 2017-08-28  213  		/* check odd parity */
9ee0a0558819e6 Danilo Krummrich 2017-08-28  214  		if (!((hweight8(byte) & =
1) ^ data)) {
9ee0a0558819e6 Danilo Krummrich 2017-08-28 @215  			rxflags |=3D SERIO_PARI=
TY;
9ee0a0558819e6 Danilo Krummrich 2017-08-28  216  			dev_warn(drvdata->dev, =
"RX: parity error\n");
9ee0a0558819e6 Danilo Krummrich 2017-08-28  217  			if (!drvdata->write_ena=
ble)
9ee0a0558819e6 Danilo Krummrich 2017-08-28  218  				goto err;
9ee0a0558819e6 Danilo Krummrich 2017-08-28  219  		}
01c1b8646b0bd2 Danilo Krummrich 2022-02-11  220  		break;
01c1b8646b0bd2 Danilo Krummrich 2022-02-11  221  	case PS2_STOP_BIT:
01c1b8646b0bd2 Danilo Krummrich 2022-02-11  222  		/* stop bit should be hi=
gh */
01c1b8646b0bd2 Danilo Krummrich 2022-02-11  223  		if (unlikely(!data)) {
01c1b8646b0bd2 Danilo Krummrich 2022-02-11  224  			dev_err(drvdata->dev, "=
RX: stop bit should be high\n");
01c1b8646b0bd2 Danilo Krummrich 2022-02-11  225  			goto err;
01c1b8646b0bd2 Danilo Krummrich 2022-02-11  226  		}
9ee0a0558819e6 Danilo Krummrich 2017-08-28  227  =

9ee0a0558819e6 Danilo Krummrich 2017-08-28  228  		/* Do not send spurious =
ACK's and NACK's when write fn is
9ee0a0558819e6 Danilo Krummrich 2017-08-28  229  		 * not provided.
9ee0a0558819e6 Danilo Krummrich 2017-08-28  230  		 */
9ee0a0558819e6 Danilo Krummrich 2017-08-28  231  		if (!drvdata->write_enab=
le) {
9ee0a0558819e6 Danilo Krummrich 2017-08-28  232  			if (byte =3D=3D PS2_DEV=
_RET_NACK)
9ee0a0558819e6 Danilo Krummrich 2017-08-28  233  				goto err;
9ee0a0558819e6 Danilo Krummrich 2017-08-28  234  			else if (byte =3D=3D PS=
2_DEV_RET_ACK)
9ee0a0558819e6 Danilo Krummrich 2017-08-28  235  				break;
9ee0a0558819e6 Danilo Krummrich 2017-08-28  236  		}
9ee0a0558819e6 Danilo Krummrich 2017-08-28  237  =

9ee0a0558819e6 Danilo Krummrich 2017-08-28  238  		serio_interrupt(drvdata-=
>serio, byte, rxflags);
9ee0a0558819e6 Danilo Krummrich 2017-08-28  239  		dev_dbg(drvdata->dev, "R=
X: sending byte 0x%x\n", byte);
01c1b8646b0bd2 Danilo Krummrich 2022-02-11  240  =

9ee0a0558819e6 Danilo Krummrich 2017-08-28  241  		cnt =3D byte =3D 0;
dc1a5808b83032 Danilo Krummrich 2022-02-11  242  =

9ee0a0558819e6 Danilo Krummrich 2017-08-28  243  		goto end; /* success */
9ee0a0558819e6 Danilo Krummrich 2017-08-28  244  	default:
9ee0a0558819e6 Danilo Krummrich 2017-08-28  245  		dev_err(drvdata->dev, "R=
X: got out of sync with the device\n");
9ee0a0558819e6 Danilo Krummrich 2017-08-28  246  		goto err;
9ee0a0558819e6 Danilo Krummrich 2017-08-28  247  	}
9ee0a0558819e6 Danilo Krummrich 2017-08-28  248  =

9ee0a0558819e6 Danilo Krummrich 2017-08-28  249  	cnt++;
9ee0a0558819e6 Danilo Krummrich 2017-08-28  250  	goto end; /* success */
9ee0a0558819e6 Danilo Krummrich 2017-08-28  251  =

9ee0a0558819e6 Danilo Krummrich 2017-08-28  252  err:
9ee0a0558819e6 Danilo Krummrich 2017-08-28  253  	cnt =3D byte =3D 0;
9ee0a0558819e6 Danilo Krummrich 2017-08-28  254  	__ps2_gpio_write(drvdata-=
>serio, PS2_CMD_RESEND);
9ee0a0558819e6 Danilo Krummrich 2017-08-28  255  end:
9ee0a0558819e6 Danilo Krummrich 2017-08-28  256  	drvdata->rx_cnt =3D cnt;
9ee0a0558819e6 Danilo Krummrich 2017-08-28  257  	drvdata->rx_byte =3D byte;
9ee0a0558819e6 Danilo Krummrich 2017-08-28  258  	return IRQ_HANDLED;
9ee0a0558819e6 Danilo Krummrich 2017-08-28  259  }
9ee0a0558819e6 Danilo Krummrich 2017-08-28  260  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4771930478804284355==--

