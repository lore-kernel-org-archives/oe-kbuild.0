Content-Type: multipart/mixed; boundary="===============1305557957979110332=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 3611/14193] drivers/pinctrl/meson/pinctrl-meson8-pmx.c:60:25: warning: Value stored to 'func' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Wed, 25 May 2022 20:19:51 +0800
Message-ID: <202205252043.d91N9eFg-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1305557957979110332==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: Neil Armstrong <narmstrong@baylibre.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   8cb8311e95e3bb58bd84d6350365f14a718faa6d
commit: 6671d0bc17866f71b8ca7ea3fb7e6dfc2a8069d2 [3611/14193] pinctrl: meso=
n: Enable COMPILE_TEST
:::::: branch date: 6 hours ago
:::::: commit date: 5 weeks ago
config: arm-randconfig-c002-20220524 (https://download.01.org/0day-ci/archi=
ve/20220525/202205252043.d91N9eFg-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 10c9ec=
ce9f6096e18222a331c5e7d085bd813f75)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3D6671d0bc17866f71b8ca7ea3fb7e6dfc2a8069d2
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 6671d0bc17866f71b8ca7ea3fb7e6dfc2a8069d2
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   Suppressed 46 warnings (46 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   46 warnings generated.
   Suppressed 46 warnings (46 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   46 warnings generated.
   Suppressed 46 warnings (46 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
   fs/jbd2/transaction.c:949:2: warning: Call to function 'memcpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(jh->b_frozen_data, source + offset, bh->b_size);
           ^~~~~~
   fs/jbd2/transaction.c:949:2: note: Call to function 'memcpy' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memcpy_s' in case of C11
           memcpy(jh->b_frozen_data, source + offset, bh->b_size);
           ^~~~~~
   fs/jbd2/transaction.c:1407:3: warning: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(jh->b_committed_data, bh->b_data, bh->b_size);
                   ^~~~~~
   fs/jbd2/transaction.c:1407:3: note: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11
                   memcpy(jh->b_committed_data, bh->b_data, bh->b_size);
                   ^~~~~~
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
   fs/jbd2/commit.c:606:2: warning: Value stored to 'err' is never read [cl=
ang-analyzer-deadcode.DeadStores]
           err =3D 0;
           ^     ~
   fs/jbd2/commit.c:606:2: note: Value stored to 'err' is never read
           err =3D 0;
           ^     ~
   fs/jbd2/commit.c:723:4: warning: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insec=
ureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy (tagp, journal->j_uuid, 16);
                           ^~~~~~
   fs/jbd2/commit.c:723:4: note: Call to function 'memcpy' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'memcpy_s' in case of C11
                           memcpy (tagp, journal->j_uuid, 16);
                           ^~~~~~
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   48 warnings generated.
   fs/jbd2/recovery.c:209:3: warning: Call to function 'memcpy' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(&tag, tagp, sizeof(tag));
                   ^~~~~~
   fs/jbd2/recovery.c:209:3: note: Call to function 'memcpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memcpy_s' in case of C11
                   memcpy(&tag, tagp, sizeof(tag));
                   ^~~~~~
   fs/jbd2/recovery.c:290:2: warning: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&info, 0, sizeof(info));
           ^~~~~~
   fs/jbd2/recovery.c:290:2: note: Call to function 'memset' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memset_s' in case of C11
           memset(&info, 0, sizeof(info));
           ^~~~~~
   fs/jbd2/recovery.c:354:2: warning: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset (&info, 0, sizeof(info));
           ^~~~~~
   fs/jbd2/recovery.c:354:2: note: Call to function 'memset' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memset_s' in case of C11
           memset (&info, 0, sizeof(info));
           ^~~~~~
   fs/jbd2/recovery.c:616:5: warning: Call to function 'memcpy' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
                                   memcpy(&tag, tagp, sizeof(tag));
                                   ^~~~~~
   fs/jbd2/recovery.c:616:5: note: Call to function 'memcpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memcpy_s' in case of C11
                                   memcpy(&tag, tagp, sizeof(tag));
                                   ^~~~~~
   fs/jbd2/recovery.c:678:6: warning: Call to function 'memcpy' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
                                           memcpy(nbh->b_data, obh->b_data,
                                           ^~~~~~
   fs/jbd2/recovery.c:678:6: note: Call to function 'memcpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memcpy_s' in case of C11
                                           memcpy(nbh->b_data, obh->b_data,
                                           ^~~~~~
   Suppressed 43 warnings (43 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   31 warnings generated.
   drivers/pinctrl/pinctrl-at91.c:354:9: warning: Although the value stored=
 to 'pin' is used in the enclosing expression, the value is never actually =
read from 'pin' [clang-analyzer-deadcode.DeadStores]
           return pin /=3D MAX_NB_GPIO_PER_BANK;
                  ^
   drivers/pinctrl/pinctrl-at91.c:354:9: note: Although the value stored to=
 'pin' is used in the enclosing expression, the value is never actually rea=
d from 'pin'
   drivers/pinctrl/pinctrl-at91.c:949:23: warning: Value stored to 'npct' d=
uring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct at91_pinctrl *npct =3D pinctrl_dev_get_drvdata(pctldev);
                                ^~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/pinctrl-at91.c:949:23: note: Value stored to 'npct' duri=
ng its initialization is never read
           struct at91_pinctrl *npct =3D pinctrl_dev_get_drvdata(pctldev);
                                ^~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   29 warnings generated.
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   29 warnings generated.
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   29 warnings generated.
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   29 warnings generated.
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   29 warnings generated.
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
>> drivers/pinctrl/meson/pinctrl-meson8-pmx.c:60:25: warning: Value stored =
to 'func' during its initialization is never read [clang-analyzer-deadcode.=
DeadStores]
           struct meson_pmx_func *func =3D &pc->data->funcs[func_num];
                                  ^~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/meson/pinctrl-meson8-pmx.c:60:25: note: Value stored to =
'func' during its initialization is never read
           struct meson_pmx_func *func =3D &pc->data->funcs[func_num];
                                  ^~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   29 warnings generated.
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   31 warnings generated.
   drivers/comedi/drivers/das08.c:180:2: warning: Value stored to 'range' i=
s never read [clang-analyzer-deadcode.DeadStores]
           range =3D CR_RANGE(insn->chanspec);
           ^
   drivers/comedi/drivers/das08.c:180:2: note: Value stored to 'range' is n=
ever read
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   36 warnings generated.
   drivers/greybus/operation.c:651:2: warning: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(operation->request->header, data, size);
           ^~~~~~
   drivers/greybus/operation.c:651:2: note: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11
           memcpy(operation->request->header, data, size);
           ^~~~~~
   drivers/greybus/operation.c:1011:3: warning: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(message->buffer, data, size);
                   ^~~~~~
   drivers/greybus/operation.c:1011:3: note: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11
                   memcpy(message->buffer, data, size);
                   ^~~~~~
   drivers/greybus/operation.c:1047:2: warning: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&header, data, sizeof(header));
           ^~~~~~
   drivers/greybus/operation.c:1047:2: note: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11
           memcpy(&header, data, sizeof(header));
           ^~~~~~
   drivers/greybus/operation.c:1157:3: warning: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(operation->request->payload, request, request_siz=
e);
                   ^~~~~~
   drivers/greybus/operation.c:1157:3: note: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11
                   memcpy(operation->request->payload, request, request_siz=
e);
                   ^~~~~~
   drivers/greybus/operation.c:1166:4: warning: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(response, operation->response->payload,
                           ^~~~~~
   drivers/greybus/operation.c:1166:4: note: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11
                           memcpy(response, operation->response->payload,
                           ^~~~~~
   drivers/greybus/operation.c:1210:3: warning: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(operation->request->payload, request, request_siz=
e);
                   ^~~~~~
   drivers/greybus/operation.c:1210:3: note: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11
                   memcpy(operation->request->payload, request, request_siz=
e);
                   ^~~~~~
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   drivers/input/touchscreen/penmount.c:211:2: warning: Call to function 's=
nprintf' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'snprintf_s' in case of C11 [clang=
-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(pm->phys, sizeof(pm->phys), "%s/input0", serio->phys);
           ^~~~~~~~
   drivers/input/touchscreen/penmount.c:211:2: note: Call to function 'snpr=
intf' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(pm->phys, sizeof(pm->phys), "%s/input0", serio->phys);
           ^~~~~~~~
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   33 warnings generated.
   drivers/input/touchscreen/surface3_spi.c:28:8: warning: Excessive paddin=
g in 'struct surface3_ts_data' (32 padding bytes, where 0 is optimal). =

   Optimal fields order: =

   rd_buf, =

   spi, =

   input_dev, =

   pen_input_dev, =

   pen_tool, =

   gpiod_rst, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct surface3_ts_data {
   ~~~~~~~^~~~~~~~~~~~~~~~~~
   drivers/input/touchscreen/surface3_spi.c:28:8: note: Excessive padding i=
n 'struct surface3_ts_data' (32 padding bytes, where 0 is optimal). Optimal=
 fields order: rd_buf, spi, input_dev, pen_input_dev, pen_tool, gpiod_rst, =
consider reordering the fields or adding explicit padding members
   struct surface3_ts_data {
   ~~~~~~~^~~~~~~~~~~~~~~~~~
   drivers/input/touchscreen/surface3_spi.c:62:2: warning: Call to function=
 'memset' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'memset_s' in case of C11 [clang-=
analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(ts_data->rd_buf, 0, sizeof(ts_data->rd_buf));
           ^~~~~~
   drivers/input/touchscreen/surface3_spi.c:62:2: note: Call to function 'm=
emset' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memset_s' in case of C11
           memset(ts_data->rd_buf, 0, sizeof(ts_data->rd_buf));
           ^~~~~~
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   29 warnings generated.
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   29 warnings generated.
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.

vim +/func +60 drivers/pinctrl/meson/pinctrl-meson8-pmx.c

ce385aa24a0dcc Jerome Brunet 2017-10-12  55  =

ce385aa24a0dcc Jerome Brunet 2017-10-12  56  static int meson8_pmx_set_mux(=
struct pinctrl_dev *pcdev, unsigned func_num,
ce385aa24a0dcc Jerome Brunet 2017-10-12  57  			      unsigned group_num)
ce385aa24a0dcc Jerome Brunet 2017-10-12  58  {
ce385aa24a0dcc Jerome Brunet 2017-10-12  59  	struct meson_pinctrl *pc =3D =
pinctrl_dev_get_drvdata(pcdev);
ce385aa24a0dcc Jerome Brunet 2017-10-12 @60  	struct meson_pmx_func *func =
=3D &pc->data->funcs[func_num];
ce385aa24a0dcc Jerome Brunet 2017-10-12  61  	struct meson_pmx_group *group=
 =3D &pc->data->groups[group_num];
ce385aa24a0dcc Jerome Brunet 2017-10-12  62  	struct meson8_pmx_data *pmx_d=
ata =3D
ce385aa24a0dcc Jerome Brunet 2017-10-12  63  		(struct meson8_pmx_data *)gr=
oup->data;
ce385aa24a0dcc Jerome Brunet 2017-10-12  64  	int i, ret =3D 0;
ce385aa24a0dcc Jerome Brunet 2017-10-12  65  =

ce385aa24a0dcc Jerome Brunet 2017-10-12  66  	dev_dbg(pc->dev, "enable func=
tion %s, group %s\n", func->name,
ce385aa24a0dcc Jerome Brunet 2017-10-12  67  		group->name);
ce385aa24a0dcc Jerome Brunet 2017-10-12  68  =

ce385aa24a0dcc Jerome Brunet 2017-10-12  69  	/*
ce385aa24a0dcc Jerome Brunet 2017-10-12  70  	 * Disable groups using the s=
ame pin.
ce385aa24a0dcc Jerome Brunet 2017-10-12  71  	 * The selected group is not =
disabled to avoid glitches.
ce385aa24a0dcc Jerome Brunet 2017-10-12  72  	 */
ce385aa24a0dcc Jerome Brunet 2017-10-12  73  	for (i =3D 0; i < group->num_=
pins; i++)
ce385aa24a0dcc Jerome Brunet 2017-10-12  74  		meson8_pmx_disable_other_gro=
ups(pc, group->pins[i], group_num);
ce385aa24a0dcc Jerome Brunet 2017-10-12  75  =

ce385aa24a0dcc Jerome Brunet 2017-10-12  76  	/* Function 0 (GPIO) doesn't =
need any additional setting */
ce385aa24a0dcc Jerome Brunet 2017-10-12  77  	if (func_num)
ce385aa24a0dcc Jerome Brunet 2017-10-12  78  		ret =3D regmap_update_bits(p=
c->reg_mux, pmx_data->reg * 4,
ce385aa24a0dcc Jerome Brunet 2017-10-12  79  					 BIT(pmx_data->bit),
ce385aa24a0dcc Jerome Brunet 2017-10-12  80  					 BIT(pmx_data->bit));
ce385aa24a0dcc Jerome Brunet 2017-10-12  81  =

ce385aa24a0dcc Jerome Brunet 2017-10-12  82  	return ret;
ce385aa24a0dcc Jerome Brunet 2017-10-12  83  }
ce385aa24a0dcc Jerome Brunet 2017-10-12  84  =


:::::: The code at line 60 was first introduced by commit
:::::: ce385aa24a0dcccdc81dfcbc90cf7aa290d8b758 pinctrl: meson: rework pinm=
ux ops

:::::: TO: Jerome Brunet <jbrunet@baylibre.com>
:::::: CC: Linus Walleij <linus.walleij@linaro.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1305557957979110332==--

