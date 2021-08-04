Content-Type: multipart/mixed; boundary="===============1169661249542951047=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [pavel-linux-leds:for-next 9/18] drivers/leds/blink/leds-lgm-sso.c:635:4: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
Date: Wed, 04 Aug 2021 18:07:12 +0800
Message-ID: <202108041809.QsYhsqqy-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1169661249542951047==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: clang-built-linux(a)googlegroups.com
CC: kbuild-all(a)lists.01.org
CC: linux-leds(a)vger.kernel.org
TO: Andy Shevchenko <andy.shevchenko@gmail.com>
CC: Pavel Machek <pavel@ucw.cz>

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git =
for-next
head:   64f67b5240db79eceb0bd57dae8e591fd3103ba0
commit: 9999908ca1abee7aa518a4f6a3739517c137acbf [9/18] leds: lgm-sso: Put =
fwnode in any case during ->probe()
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: x86_64-randconfig-c001-20210803 (attached as .config)
compiler: clang version 13.0.0 (https://github.com/llvm/llvm-project 4f71f5=
9bf3d9914188a11d0c41bedbb339d36ff5)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install x86_64 cross compiling tool for clang build
        # apt-get install binutils-x86-64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.=
git/commit/?id=3D9999908ca1abee7aa518a4f6a3739517c137acbf
        git remote add pavel-linux-leds git://git.kernel.org/pub/scm/linux/=
kernel/git/pavel/linux-leds.git
        git fetch --no-tags pavel-linux-leds for-next
        git checkout 9999908ca1abee7aa518a4f6a3739517c137acbf
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
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
   drivers/tty/serial/serial_core.c:734:29: note: Loop condition is false. =
 Exiting loop
           struct uart_state *state =3D container_of(port, struct uart_stat=
e, port);
                                      ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:328:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:316:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:306:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/tty/serial/serial_core.c:744:6: note: Assuming 'uport' is null
           if (!uport)
               ^~~~~~
   drivers/tty/serial/serial_core.c:744:2: note: Taking true branch
           if (!uport)
           ^
   drivers/tty/serial/serial_core.c:745:3: note: Control jumps to line 768
                   goto out;
                   ^
   drivers/tty/serial/serial_core.c:769:2: note: Returning without writing =
to 'retinfo->iomem_reg_shift'
           return ret;
           ^
   drivers/tty/serial/serial_core.c:2729:2: note: Returning from 'uart_get_=
info'
           uart_get_info(port, &tmp);
           ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tty/serial/serial_core.c:2730:9: note: 3rd function call argumen=
t is an uninitialized value
           return sprintf(buf, "%d\n", tmp.iomem_reg_shift);
                  ^                    ~~~~~~~~~~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
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
   5 warnings generated.
   fs/nfs/direct.c:703:19: warning: Value stored to 'req' during its initia=
lization is never read [clang-analyzer-deadcode.DeadStores]
           struct nfs_page *req =3D nfs_list_entry(hdr->pages.next);
                            ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/nfs/direct.c:703:19: note: Value stored to 'req' during its initializ=
ation is never read
           struct nfs_page *req =3D nfs_list_entry(hdr->pages.next);
                            ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/leds/uleds.c:150:4: warning: Value stored to 'retval' is never r=
ead [clang-analyzer-deadcode.DeadStores]
                           retval =3D copy_to_user(buffer, &udev->brightnes=
s,
                           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/leds/uleds.c:150:4: note: Value stored to 'retval' is never read
                           retval =3D copy_to_user(buffer, &udev->brightnes=
s,
                           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
>> drivers/leds/blink/leds-lgm-sso.c:635:4: warning: Value stored to 'ret' =
is never read [clang-analyzer-deadcode.DeadStores]
                           ret =3D -ENOMEM;
                           ^     ~~~~~~~
   drivers/leds/blink/leds-lgm-sso.c:635:4: note: Value stored to 'ret' is =
never read
                           ret =3D -ENOMEM;
                           ^     ~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   drivers/rtc/interface.c:799:8: warning: Passed-by-value struct argument =
contains uninitialized data (e.g., field: 'tm_sec') [clang-analyzer-core.Ca=
llAndMessage]
           now =3D rtc_tm_to_ktime(tm);
                 ^
   drivers/rtc/interface.c:984:6: note: Assuming field 'enabled' is 0
           if (timer->enabled)
               ^~~~~~~~~~~~~~
   drivers/rtc/interface.c:984:2: note: Taking false branch
           if (timer->enabled)
           ^
   drivers/rtc/interface.c:990:8: note: Calling 'rtc_timer_enqueue'
           ret =3D rtc_timer_enqueue(rtc, timer);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/rtc/interface.c:794:2: note: 'tm' initialized here
           struct rtc_time tm;
           ^~~~~~~~~~~~~~~~~~
   drivers/rtc/interface.c:799:8: note: Passed-by-value struct argument con=
tains uninitialized data (e.g., field: 'tm_sec')
           now =3D rtc_tm_to_ktime(tm);
                 ^               ~~
   drivers/rtc/interface.c:899:8: warning: Passed-by-value struct argument =
contains uninitialized data (e.g., field: 'tm_sec') [clang-analyzer-core.Ca=
llAndMessage]
           now =3D rtc_tm_to_ktime(tm);
                 ^               ~~
   drivers/rtc/interface.c:891:2: note: 'tm' initialized here
           struct rtc_time tm;
           ^~~~~~~~~~~~~~~~~~
   drivers/rtc/interface.c:894:3: note: Left side of '&&' is false
                   container_of(work, struct rtc_device, irqwork);
                   ^
   include/linux/kernel.h:495:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/rtc/interface.c:894:3: note: Taking false branch
                   container_of(work, struct rtc_device, irqwork);
                   ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
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
   drivers/rtc/interface.c:894:3: note: Loop condition is false.  Exiting l=
oop
                   container_of(work, struct rtc_device, irqwork);
                   ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:328:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:316:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:306:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/rtc/interface.c:899:8: note: Passed-by-value struct argument con=
tains uninitialized data (e.g., field: 'tm_sec')
           now =3D rtc_tm_to_ktime(tm);
                 ^               ~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/input/keyboard/samsung-keypad.c:88:23: warning: The result of th=
e left shift is undefined because the left operand is negative [clang-analy=
zer-core.UndefinedBinaryOperatorResult]
                           val &=3D ~(1 << col) << 8;
                                              ^
   drivers/input/keyboard/samsung-keypad.c:158:3: note: Calling 'samsung_ke=
ypad_scan'
                   samsung_keypad_scan(keypad, row_state);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/input/keyboard/samsung-keypad.c:85:16: note: Assuming 'col' is <=
 field 'cols'
           for (col =3D 0; col < keypad->cols; col++) {

vim +/ret +635 drivers/leds/blink/leds-lgm-sso.c

c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  619  =

c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  620  static int
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  621  __sso_led_dt_p=
arse(struct sso_led_priv *priv, struct fwnode_handle *fw_ssoled)
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  622  {
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  623  	struct fwnode=
_handle *fwnode_child;
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  624  	struct device=
 *dev =3D priv->dev;
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  625  	struct sso_le=
d_desc *desc;
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  626  	struct sso_le=
d *led;
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  627  	struct list_h=
ead *p;
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  628  	const char *t=
mp;
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  629  	u32 prop;
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  630  	int ret;
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  631  =

c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  632  	fwnode_for_ea=
ch_child_node(fw_ssoled, fwnode_child) {
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  633  		led =3D devm=
_kzalloc(dev, sizeof(*led), GFP_KERNEL);
9999908ca1abee7 Andy Shevchenko             2021-05-29  634  		if (!led) {
9999908ca1abee7 Andy Shevchenko             2021-05-29 @635  			ret =3D -EN=
OMEM;
9999908ca1abee7 Andy Shevchenko             2021-05-29  636  			goto __dt_e=
rr;
9999908ca1abee7 Andy Shevchenko             2021-05-29  637  		}
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  638  =

c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  639  		INIT_LIST_HE=
AD(&led->list);
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  640  		led->priv =
=3D priv;
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  641  		desc =3D &le=
d->desc;
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  642  =

c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  643  		led->gpiod =
=3D devm_fwnode_get_gpiod_from_child(dev, NULL,
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  644  							      f=
wnode_child,
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  645  							      G=
PIOD_ASIS, NULL);
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  646  		if (IS_ERR(l=
ed->gpiod)) {
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  647  			dev_err(dev=
, "led: get gpio fail!\n");
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  648  			goto __dt_e=
rr;
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  649  		}
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  650  =

c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  651  		fwnode_prope=
rty_read_string(fwnode_child,
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  652  					    "linu=
x,default-trigger",
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  653  					    &desc=
->default_trigger);
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  654  =

c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  655  		if (fwnode_p=
roperty_present(fwnode_child,
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  656  					    "reta=
in-state-suspended"))
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  657  			desc->retai=
n_state_suspended =3D 1;
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  658  =

c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  659  		if (fwnode_p=
roperty_present(fwnode_child,
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  660  					    "reta=
in-state-shutdown"))
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  661  			desc->retai=
n_state_shutdown =3D 1;
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  662  =

c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  663  		if (fwnode_p=
roperty_present(fwnode_child, "panic-indicator"))
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  664  			desc->panic=
_indicator =3D 1;
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  665  =

c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  666  		ret =3D fwno=
de_property_read_u32(fwnode_child, "reg", &prop);
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  667  		if (ret !=3D=
 0 || prop >=3D SSO_LED_MAX_NUM) {
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  668  			dev_err(dev=
, "invalid LED pin:%u\n", prop);
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  669  			goto __dt_e=
rr;
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  670  		}
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  671  		desc->pin =
=3D prop;
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  672  =

c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  673  		if (fwnode_p=
roperty_present(fwnode_child, "intel,sso-hw-blink"))
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  674  			desc->hw_bl=
ink =3D 1;
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  675  =

c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  676  		desc->hw_tri=
g =3D fwnode_property_read_bool(fwnode_child,
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  677  							  "inte=
l,sso-hw-trigger");
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  678  		if (desc->hw=
_trig) {
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  679  			desc->defau=
lt_trigger =3D NULL;
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  680  			desc->retai=
n_state_shutdown =3D 0;
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  681  			desc->retai=
n_state_suspended =3D 0;
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  682  			desc->panic=
_indicator =3D 0;
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  683  			desc->hw_bl=
ink =3D 0;
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  684  		}
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  685  =

c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  686  		if (fwnode_p=
roperty_read_u32(fwnode_child,
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  687  					     "int=
el,sso-blink-rate-hz", &prop)) {
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  688  			/* default =
first freq rate */
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  689  			desc->freq_=
idx =3D 0;
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  690  			desc->blink=
_rate =3D priv->freq[desc->freq_idx];
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  691  		} else {
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  692  			desc->freq_=
idx =3D sso_get_blink_rate_idx(priv, prop);
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  693  			if (desc->f=
req_idx =3D=3D -1)
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  694  				desc->freq=
_idx =3D MAX_FREQ_RANK - 1;
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  695  =

c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  696  			desc->blink=
_rate =3D priv->freq[desc->freq_idx];
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  697  		}
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  698  =

c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  699  		if (!fwnode_=
property_read_string(fwnode_child, "default-state", &tmp)) {
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  700  			if (!strcmp=
(tmp, "on"))
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  701  				desc->brig=
htness =3D LED_FULL;
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  702  		}
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  703  =

c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  704  		if (sso_crea=
te_led(priv, led, fwnode_child))
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  705  			goto __dt_e=
rr;
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  706  	}
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  707  =

c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  708  	return 0;
9999908ca1abee7 Andy Shevchenko             2021-05-29  709  =

c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  710  __dt_err:
9999908ca1abee7 Andy Shevchenko             2021-05-29  711  	fwnode_handle=
_put(fwnode_child);
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  712  	/* unregister=
 leds */
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  713  	list_for_each=
(p, &priv->led_list) {
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  714  		led =3D list=
_entry(p, struct sso_led, list);
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  715  		sso_led_shut=
down(led);
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  716  	}
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  717  =

c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  718  	return -EINVA=
L;
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  719  }
c3987cd2bca34dd Amireddy Mallikarjuna reddy 2020-12-10  720  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============1169661249542951047==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
pojV1Y5etEFsPW3f/v9CnCCYB94BAA==
--===============1169661249542951047==--

