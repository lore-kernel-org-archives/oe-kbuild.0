Content-Type: multipart/mixed; boundary="===============8733636171977230411=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/media/platform/samsung/s5p-mfc/s5p_mfc_enc.c:1516:4: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
Date: Sun, 24 Apr 2022 15:44:41 +0800
Message-ID: <202204241537.5ZbwNbtw-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8733636171977230411==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media(a)vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   22da5264abf497a10a4ed629f07f4ba28a7ed5eb
commit: 43ecec16c4face9a59e81771e7cbff4671c62117 media: platform: rename s5=
p-mfc/ to samsung/s5p-mfc/
date:   5 weeks ago
:::::: branch date: 7 hours ago
:::::: commit date: 5 weeks ago
config: arm-randconfig-c002-20220418 (https://download.01.org/0day-ci/archi=
ve/20220424/202204241537.5ZbwNbtw-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project b27430=
f9f46b88bcd54d992debc8d72e131e1bd0)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D43ecec16c4face9a59e81771e7cbff4671c62117
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 43ecec16c4face9a59e81771e7cbff4671c62117
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   drivers/base/swnode.c:1110:29: note: Access to field 'managed' results i=
n a dereference of a null pointer
           to_swnode(fwnode)->managed =3D true;
                                      ^
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   drivers/rtc/interface.c:810:8: warning: Passed-by-value struct argument =
contains uninitialized data (e.g., field: 'tm_sec') [clang-analyzer-core.Ca=
llAndMessage]
           now =3D rtc_tm_to_ktime(tm);
                 ^
   drivers/rtc/interface.c:995:6: note: Assuming field 'enabled' is 0
           if (timer->enabled)
               ^~~~~~~~~~~~~~
   drivers/rtc/interface.c:995:2: note: Taking false branch
           if (timer->enabled)
           ^
   drivers/rtc/interface.c:1001:8: note: Calling 'rtc_timer_enqueue'
           ret =3D rtc_timer_enqueue(rtc, timer);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/rtc/interface.c:805:2: note: 'tm' initialized here
           struct rtc_time tm;
           ^~~~~~~~~~~~~~~~~~
   drivers/rtc/interface.c:810:8: note: Passed-by-value struct argument con=
tains uninitialized data (e.g., field: 'tm_sec')
           now =3D rtc_tm_to_ktime(tm);
                 ^               ~~
   drivers/rtc/interface.c:910:8: warning: Passed-by-value struct argument =
contains uninitialized data (e.g., field: 'tm_sec') [clang-analyzer-core.Ca=
llAndMessage]
           now =3D rtc_tm_to_ktime(tm);
                 ^               ~~
   drivers/rtc/interface.c:902:2: note: 'tm' initialized here
           struct rtc_time tm;
           ^~~~~~~~~~~~~~~~~~
   drivers/rtc/interface.c:910:8: note: Passed-by-value struct argument con=
tains uninitialized data (e.g., field: 'tm_sec')
           now =3D rtc_tm_to_ktime(tm);
                 ^               ~~
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   drivers/rtc/rtc-mc146818-lib.c:243:3: warning: Value stored to 'century'=
 is never read [clang-analyzer-deadcode.DeadStores]
                   century =3D bin2bcd(century);
                   ^
   drivers/rtc/rtc-mc146818-lib.c:243:3: note: Value stored to 'century' is=
 never read
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
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
   10 warnings generated.
   Suppressed 10 warnings (9 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   kernel/auditfilter.c:538:5: warning: Value stored to 'err' is never read=
 [clang-analyzer-deadcode.DeadStores]
                                   err =3D 0;
                                   ^     ~
   kernel/auditfilter.c:538:5: note: Value stored to 'err' is never read
                                   err =3D 0;
                                   ^     ~
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
>> drivers/media/platform/samsung/s5p-mfc/s5p_mfc_enc.c:1516:4: warning: Va=
lue stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
                           ret =3D vb2_reqbufs(&ctx->vq_dst, reqbufs);
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/samsung/s5p-mfc/s5p_mfc_enc.c:1516:4: note: Value=
 stored to 'ret' is never read
                           ret =3D vb2_reqbufs(&ctx->vq_dst, reqbufs);
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 10 warnings (9 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (9 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (9 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (9 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   drivers/base/dd.c:689:2: warning: Value stored to 'calltime' is never re=
ad [clang-analyzer-deadcode.DeadStores]
           calltime =3D ktime_get();
           ^          ~~~~~~~~~~~
   drivers/base/dd.c:689:2: note: Value stored to 'calltime' is never read
           calltime =3D ktime_get();
           ^          ~~~~~~~~~~~
   drivers/base/dd.c:691:2: warning: Value stored to 'rettime' is never rea=
d [clang-analyzer-deadcode.DeadStores]
           rettime =3D ktime_get();
           ^         ~~~~~~~~~~~
   drivers/base/dd.c:691:2: note: Value stored to 'rettime' is never read
           rettime =3D ktime_get();
           ^         ~~~~~~~~~~~
   drivers/base/dd.c:1085:2: warning: Value stored to 'ret' is never read [=
clang-analyzer-deadcode.DeadStores]
           ret =3D driver_probe_device(drv, dev);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/base/dd.c:1085:2: note: Value stored to 'ret' is never read
           ret =3D driver_probe_device(drv, dev);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   drivers/base/platform.c:578:3: warning: Call to function 'strcpy' is ins=
ecure as it does not provide bounding of the memory buffer. Replace unbound=
ed copy functions with analogous functions that support length arguments su=
ch as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(pa->name, name);
                   ^~~~~~
   drivers/base/platform.c:578:3: note: Call to function 'strcpy' is insecu=
re as it does not provide bounding of the memory buffer. Replace unbounded =
copy functions with analogous functions that support length arguments such =
as 'strlcpy'. CWE-119
                   strcpy(pa->name, name);
                   ^~~~~~
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (10 in non-user code).
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
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   fs/pipe.c:490:24: warning: Value stored to 'buf' during its initializati=
on is never read [clang-analyzer-deadcode.DeadStores]
                           struct pipe_buffer *buf =3D &pipe->bufs[head & m=
ask];
                                               ^~~   ~~~~~~~~~~~~~~~~~~~~~~=
~~
   fs/pipe.c:490:24: note: Value stored to 'buf' during its initialization =
is never read
                           struct pipe_buffer *buf =3D &pipe->bufs[head & m=
ask];
                                               ^~~   ~~~~~~~~~~~~~~~~~~~~~~=
~~
   include/linux/log2.h:57:13: warning: The result of the left shift is und=
efined due to shifting by '32', which is greater or equal to the width of t=
ype 'unsigned long' [clang-analyzer-core.UndefinedBinaryOperatorResult]
           return 1UL << fls_long(n - 1);
                      ^
   fs/pipe.c:1383:7: note: 'pipe' is non-null
           if (!pipe)
--
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
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
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   crypto/pcbc.c:74:10: warning: Although the value stored to 'nbytes' is u=
sed in the enclosing expression, the value is never actually read from 'nby=
tes' [clang-analyzer-deadcode.DeadStores]
           while ((nbytes =3D walk.nbytes)) {
                   ^        ~~~~~~~~~~~
   crypto/pcbc.c:74:10: note: Although the value stored to 'nbytes' is used=
 in the enclosing expression, the value is never actually read from 'nbytes'
           while ((nbytes =3D walk.nbytes)) {
                   ^        ~~~~~~~~~~~
   crypto/pcbc.c:141:10: warning: Although the value stored to 'nbytes' is =
used in the enclosing expression, the value is never actually read from 'nb=
ytes' [clang-analyzer-deadcode.DeadStores]
           while ((nbytes =3D walk.nbytes)) {
                   ^        ~~~~~~~~~~~
   crypto/pcbc.c:141:10: note: Although the value stored to 'nbytes' is use=
d in the enclosing expression, the value is never actually read from 'nbyte=
s'
           while ((nbytes =3D walk.nbytes)) {
                   ^        ~~~~~~~~~~~
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (9 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (9 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   drivers/media/dvb-frontends/drxd_hard.c:858:9: warning: The left express=
ion of the compound assignment is an uninitialized value. The computed valu=
e will also be garbage [clang-analyzer-core.uninitialized.Assign]
                   Value &=3D FE_AG_REG_GC1_AGC_DAT__M;
                         ^
   drivers/media/dvb-frontends/drxd_hard.c:2761:8: note: Calling 'ReadIFAgc'
           res =3D ReadIFAgc(state, &value);
                 ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/drxd_hard.c:855:6: note: Assuming field 'ctr=
lMode' is not equal to AGC_CTRL_OFF
           if (state->if_agc_cfg.ctrlMode !=3D AGC_CTRL_OFF) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/drxd_hard.c:855:2: note: Taking true branch
           if (state->if_agc_cfg.ctrlMode !=3D AGC_CTRL_OFF) {
           ^
   drivers/media/dvb-frontends/drxd_hard.c:856:3: note: 'Value' declared wi=
thout an initial value
                   u16 Value;
                   ^~~~~~~~~
   drivers/media/dvb-frontends/drxd_hard.c:857:12: note: Calling 'Read16'
                   status =3D Read16(state, FE_AG_REG_GC1_AGC_DAT__A, &Valu=
e, 0);
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/media/dvb-frontends/drxd_hard.c:232:2: note: Taking true branch
           if (i2c_read(state->i2c, adr, mm1, 4, mm2, 2) < 0)
           ^
   drivers/media/dvb-frontends/drxd_hard.c:233:3: note: Returning without w=
riting to '*data'
                   return -1;
                   ^
   drivers/media/dvb-frontends/drxd_hard.c:857:12: note: Returning from 'Re=
ad16'
                   status =3D Read16(state, FE_AG_REG_GC1_AGC_DAT__A, &Valu=
e, 0);
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/media/dvb-frontends/drxd_hard.c:858:9: note: The left expression=
 of the compound assignment is an uninitialized value. The computed value w=
ill also be garbage
                   Value &=3D FE_AG_REG_GC1_AGC_DAT__M;
                   ~~~~~ ^
   drivers/media/dvb-frontends/drxd_hard.c:2259:4: warning: Value stored to=
 'operationMode' is never read [clang-analyzer-deadcode.DeadStores]
                           operationMode |=3D SC_RA_RAM_OP_AUTO_RATE__M;
                           ^
   drivers/media/dvb-frontends/drxd_hard.c:2259:4: note: Value stored to 'o=
perationMode' is never read
   Suppressed 10 warnings (9 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
>> drivers/media/platform/samsung/s5p-mfc/s5p_mfc_opr_v5.c:600:3: warning: =
Value stored to 'buf_addr2' is never read [clang-analyzer-deadcode.DeadStor=
es]
                   buf_addr2 +=3D S5P_FIMV_ENC_INTRAPRED_SIZE;
                   ^
   drivers/media/platform/samsung/s5p-mfc/s5p_mfc_opr_v5.c:600:3: note: Val=
ue stored to 'buf_addr2' is never read
>> drivers/media/platform/samsung/s5p-mfc/s5p_mfc_opr_v5.c:604:3: warning: =
Value stored to 'buf_addr1' is never read [clang-analyzer-deadcode.DeadStor=
es]
                   buf_addr1 +=3D S5P_FIMV_ENC_NBORINFO_SIZE;
                   ^
   drivers/media/platform/samsung/s5p-mfc/s5p_mfc_opr_v5.c:604:3: note: Val=
ue stored to 'buf_addr1' is never read
   drivers/media/platform/samsung/s5p-mfc/s5p_mfc_opr_v5.c:635:3: warning: =
Value stored to 'buf_addr1' is never read [clang-analyzer-deadcode.DeadStor=
es]
                   buf_addr1 +=3D S5P_FIMV_ENC_ACDCCOEF_SIZE;
                   ^
   drivers/media/platform/samsung/s5p-mfc/s5p_mfc_opr_v5.c:635:3: note: Val=
ue stored to 'buf_addr1' is never read
   drivers/media/platform/samsung/s5p-mfc/s5p_mfc_opr_v5.c:661:3: warning: =
Value stored to 'buf_addr1' is never read [clang-analyzer-deadcode.DeadStor=
es]
                   buf_addr1 +=3D S5P_FIMV_ENC_ACDCCOEF_SIZE;
                   ^
   drivers/media/platform/samsung/s5p-mfc/s5p_mfc_opr_v5.c:661:3: note: Val=
ue stored to 'buf_addr1' is never read
   Suppressed 10 warnings (9 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (9 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (9 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (9 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (9 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   drivers/char/tpm/eventlog/tpm1.c:276:2: warning: Value stored to 'len' i=
s never read [clang-analyzer-deadcode.DeadStores]
           len +=3D get_event_name(eventname, event, event_entry);
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/tpm/eventlog/tpm1.c:276:2: note: Value stored to 'len' is n=
ever read
           len +=3D get_event_name(eventname, event, event_entry);
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 13 warnings (10 in non-user code, 3 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (10 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   drivers/leds/led-triggers.c:279:2: warning: Call to function 'strcpy' is=
 insecure as it does not provide bounding of the memory buffer. Replace unb=
ounded copy functions with analogous functions that support length argument=
s such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy((char *)trig->name, name);
           ^~~~~~
   drivers/leds/led-triggers.c:279:2: note: Call to function 'strcpy' is in=
secure as it does not provide bounding of the memory buffer. Replace unboun=
ded copy functions with analogous functions that support length arguments s=
uch as 'strlcpy'. CWE-119
           strcpy((char *)trig->name, name);
           ^~~~~~
   Suppressed 9 warnings (9 in non-user code).
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
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   drivers/phy/marvell/phy-mmp3-usb.c:143:16: warning: Value stored to 'bas=
e' during its initialization is never read [clang-analyzer-deadcode.DeadSto=
res]
           void __iomem *base =3D mmp3_usb_phy->base;
                         ^~~~   ~~~~~~~~~~~~~~~~~~
   drivers/phy/marvell/phy-mmp3-usb.c:143:16: note: Value stored to 'base' =
during its initialization is never read
           void __iomem *base =3D mmp3_usb_phy->base;
                         ^~~~   ~~~~~~~~~~~~~~~~~~
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.

vim +/ret +1516 drivers/media/platform/samsung/s5p-mfc/s5p_mfc_enc.c

af935746781088 drivers/media/video/s5p-mfc/s5p_mfc_enc.c    Kamil Debski  2=
011-06-21  1478  =

af935746781088 drivers/media/video/s5p-mfc/s5p_mfc_enc.c    Kamil Debski  2=
011-06-21  1479  static int vidioc_reqbufs(struct file *file, void *priv,
af935746781088 drivers/media/video/s5p-mfc/s5p_mfc_enc.c    Kamil Debski  2=
011-06-21  1480  					  struct v4l2_requestbuffers *reqbufs)
af935746781088 drivers/media/video/s5p-mfc/s5p_mfc_enc.c    Kamil Debski  2=
011-06-21  1481  {
f96f3cfa0bb8f7 drivers/media/platform/s5p-mfc/s5p_mfc_enc.c Jeongtae Park 2=
012-10-03  1482  	struct s5p_mfc_dev *dev =3D video_drvdata(file);
af935746781088 drivers/media/video/s5p-mfc/s5p_mfc_enc.c    Kamil Debski  2=
011-06-21  1483  	struct s5p_mfc_ctx *ctx =3D fh_to_ctx(priv);
af935746781088 drivers/media/video/s5p-mfc/s5p_mfc_enc.c    Kamil Debski  2=
011-06-21  1484  	int ret =3D 0;
af935746781088 drivers/media/video/s5p-mfc/s5p_mfc_enc.c    Kamil Debski  2=
011-06-21  1485  =

af935746781088 drivers/media/video/s5p-mfc/s5p_mfc_enc.c    Kamil Debski  2=
011-06-21  1486  	/* if memory is not mmp or userptr return error */
af935746781088 drivers/media/video/s5p-mfc/s5p_mfc_enc.c    Kamil Debski  2=
011-06-21  1487  	if ((reqbufs->memory !=3D V4L2_MEMORY_MMAP) &&
af935746781088 drivers/media/video/s5p-mfc/s5p_mfc_enc.c    Kamil Debski  2=
011-06-21  1488  		(reqbufs->memory !=3D V4L2_MEMORY_USERPTR))
af935746781088 drivers/media/video/s5p-mfc/s5p_mfc_enc.c    Kamil Debski  2=
011-06-21  1489  		return -EINVAL;
af935746781088 drivers/media/video/s5p-mfc/s5p_mfc_enc.c    Kamil Debski  2=
011-06-21  1490  	if (reqbufs->type =3D=3D V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLA=
NE) {
53c51492d6e800 drivers/media/platform/s5p-mfc/s5p_mfc_enc.c Pawel Osciak  2=
014-10-21  1491  		if (reqbufs->count =3D=3D 0) {
bcbf298669a88b drivers/media/platform/s5p-mfc/s5p_mfc_enc.c ayaka         2=
016-05-07  1492  			mfc_debug(2, "Freeing buffers\n");
53c51492d6e800 drivers/media/platform/s5p-mfc/s5p_mfc_enc.c Pawel Osciak  2=
014-10-21  1493  			ret =3D vb2_reqbufs(&ctx->vq_dst, reqbufs);
bcbf298669a88b drivers/media/platform/s5p-mfc/s5p_mfc_enc.c ayaka         2=
016-05-07  1494  			s5p_mfc_hw_call(dev->mfc_ops, release_codec_buffers,
bcbf298669a88b drivers/media/platform/s5p-mfc/s5p_mfc_enc.c ayaka         2=
016-05-07  1495  					ctx);
53c51492d6e800 drivers/media/platform/s5p-mfc/s5p_mfc_enc.c Pawel Osciak  2=
014-10-21  1496  			ctx->capture_state =3D QUEUE_FREE;
53c51492d6e800 drivers/media/platform/s5p-mfc/s5p_mfc_enc.c Pawel Osciak  2=
014-10-21  1497  			return ret;
53c51492d6e800 drivers/media/platform/s5p-mfc/s5p_mfc_enc.c Pawel Osciak  2=
014-10-21  1498  		}
af935746781088 drivers/media/video/s5p-mfc/s5p_mfc_enc.c    Kamil Debski  2=
011-06-21  1499  		if (ctx->capture_state !=3D QUEUE_FREE) {
af935746781088 drivers/media/video/s5p-mfc/s5p_mfc_enc.c    Kamil Debski  2=
011-06-21  1500  			mfc_err("invalid capture state: %d\n",
af935746781088 drivers/media/video/s5p-mfc/s5p_mfc_enc.c    Kamil Debski  2=
011-06-21  1501  							ctx->capture_state);
af935746781088 drivers/media/video/s5p-mfc/s5p_mfc_enc.c    Kamil Debski  2=
011-06-21  1502  			return -EINVAL;
af935746781088 drivers/media/video/s5p-mfc/s5p_mfc_enc.c    Kamil Debski  2=
011-06-21  1503  		}
af935746781088 drivers/media/video/s5p-mfc/s5p_mfc_enc.c    Kamil Debski  2=
011-06-21  1504  		ret =3D vb2_reqbufs(&ctx->vq_dst, reqbufs);
af935746781088 drivers/media/video/s5p-mfc/s5p_mfc_enc.c    Kamil Debski  2=
011-06-21  1505  		if (ret !=3D 0) {
af935746781088 drivers/media/video/s5p-mfc/s5p_mfc_enc.c    Kamil Debski  2=
011-06-21  1506  			mfc_err("error in vb2_reqbufs() for E(D)\n");
af935746781088 drivers/media/video/s5p-mfc/s5p_mfc_enc.c    Kamil Debski  2=
011-06-21  1507  			return ret;
af935746781088 drivers/media/video/s5p-mfc/s5p_mfc_enc.c    Kamil Debski  2=
011-06-21  1508  		}
af935746781088 drivers/media/video/s5p-mfc/s5p_mfc_enc.c    Kamil Debski  2=
011-06-21  1509  		ctx->capture_state =3D QUEUE_BUFS_REQUESTED;
f96f3cfa0bb8f7 drivers/media/platform/s5p-mfc/s5p_mfc_enc.c Jeongtae Park 2=
012-10-03  1510  =

f96f3cfa0bb8f7 drivers/media/platform/s5p-mfc/s5p_mfc_enc.c Jeongtae Park 2=
012-10-03  1511  		ret =3D s5p_mfc_hw_call(ctx->dev->mfc_ops,
f96f3cfa0bb8f7 drivers/media/platform/s5p-mfc/s5p_mfc_enc.c Jeongtae Park 2=
012-10-03  1512  				alloc_codec_buffers, ctx);
af935746781088 drivers/media/video/s5p-mfc/s5p_mfc_enc.c    Kamil Debski  2=
011-06-21  1513  		if (ret) {
af935746781088 drivers/media/video/s5p-mfc/s5p_mfc_enc.c    Kamil Debski  2=
011-06-21  1514  			mfc_err("Failed to allocate encoding buffers\n");
af935746781088 drivers/media/video/s5p-mfc/s5p_mfc_enc.c    Kamil Debski  2=
011-06-21  1515  			reqbufs->count =3D 0;
af935746781088 drivers/media/video/s5p-mfc/s5p_mfc_enc.c    Kamil Debski  2=
011-06-21 @1516  			ret =3D vb2_reqbufs(&ctx->vq_dst, reqbufs);
af935746781088 drivers/media/video/s5p-mfc/s5p_mfc_enc.c    Kamil Debski  2=
011-06-21  1517  			return -ENOMEM;
af935746781088 drivers/media/video/s5p-mfc/s5p_mfc_enc.c    Kamil Debski  2=
011-06-21  1518  		}
af935746781088 drivers/media/video/s5p-mfc/s5p_mfc_enc.c    Kamil Debski  2=
011-06-21  1519  	} else if (reqbufs->type =3D=3D V4L2_BUF_TYPE_VIDEO_OUTPU=
T_MPLANE) {
53c51492d6e800 drivers/media/platform/s5p-mfc/s5p_mfc_enc.c Pawel Osciak  2=
014-10-21  1520  		if (reqbufs->count =3D=3D 0) {
53c51492d6e800 drivers/media/platform/s5p-mfc/s5p_mfc_enc.c Pawel Osciak  2=
014-10-21  1521  			mfc_debug(2, "Freeing buffers\n");
53c51492d6e800 drivers/media/platform/s5p-mfc/s5p_mfc_enc.c Pawel Osciak  2=
014-10-21  1522  			ret =3D vb2_reqbufs(&ctx->vq_src, reqbufs);
fdd1d4b0a08d6d drivers/media/platform/s5p-mfc/s5p_mfc_enc.c Andrzej Hajda 2=
015-12-02  1523  			s5p_mfc_hw_call(dev->mfc_ops, release_codec_buffers,
53c51492d6e800 drivers/media/platform/s5p-mfc/s5p_mfc_enc.c Pawel Osciak  2=
014-10-21  1524  					ctx);
53c51492d6e800 drivers/media/platform/s5p-mfc/s5p_mfc_enc.c Pawel Osciak  2=
014-10-21  1525  			ctx->output_state =3D QUEUE_FREE;
53c51492d6e800 drivers/media/platform/s5p-mfc/s5p_mfc_enc.c Pawel Osciak  2=
014-10-21  1526  			return ret;
53c51492d6e800 drivers/media/platform/s5p-mfc/s5p_mfc_enc.c Pawel Osciak  2=
014-10-21  1527  		}
af935746781088 drivers/media/video/s5p-mfc/s5p_mfc_enc.c    Kamil Debski  2=
011-06-21  1528  		if (ctx->output_state !=3D QUEUE_FREE) {
af935746781088 drivers/media/video/s5p-mfc/s5p_mfc_enc.c    Kamil Debski  2=
011-06-21  1529  			mfc_err("invalid output state: %d\n",
af935746781088 drivers/media/video/s5p-mfc/s5p_mfc_enc.c    Kamil Debski  2=
011-06-21  1530  							ctx->output_state);
af935746781088 drivers/media/video/s5p-mfc/s5p_mfc_enc.c    Kamil Debski  2=
011-06-21  1531  			return -EINVAL;
af935746781088 drivers/media/video/s5p-mfc/s5p_mfc_enc.c    Kamil Debski  2=
011-06-21  1532  		}
e9d98ddc0a4e4e drivers/media/platform/s5p-mfc/s5p_mfc_enc.c Arun Kumar K  2=
013-04-24  1533  =

722b979e555d00 drivers/media/platform/s5p-mfc/s5p_mfc_enc.c Arun Kumar K  2=
013-07-09  1534  		if (IS_MFCV6_PLUS(dev)) {
e9d98ddc0a4e4e drivers/media/platform/s5p-mfc/s5p_mfc_enc.c Arun Kumar K  2=
013-04-24  1535  			/* Check for min encoder buffers */
e9d98ddc0a4e4e drivers/media/platform/s5p-mfc/s5p_mfc_enc.c Arun Kumar K  2=
013-04-24  1536  			if (ctx->pb_count &&
e9d98ddc0a4e4e drivers/media/platform/s5p-mfc/s5p_mfc_enc.c Arun Kumar K  2=
013-04-24  1537  				(reqbufs->count < ctx->pb_count)) {
e9d98ddc0a4e4e drivers/media/platform/s5p-mfc/s5p_mfc_enc.c Arun Kumar K  2=
013-04-24  1538  				reqbufs->count =3D ctx->pb_count;
e9d98ddc0a4e4e drivers/media/platform/s5p-mfc/s5p_mfc_enc.c Arun Kumar K  2=
013-04-24  1539  				mfc_debug(2, "Minimum %d output buffers needed\n",
e9d98ddc0a4e4e drivers/media/platform/s5p-mfc/s5p_mfc_enc.c Arun Kumar K  2=
013-04-24  1540  						ctx->pb_count);
e9d98ddc0a4e4e drivers/media/platform/s5p-mfc/s5p_mfc_enc.c Arun Kumar K  2=
013-04-24  1541  			} else {
e9d98ddc0a4e4e drivers/media/platform/s5p-mfc/s5p_mfc_enc.c Arun Kumar K  2=
013-04-24  1542  				ctx->pb_count =3D reqbufs->count;
e9d98ddc0a4e4e drivers/media/platform/s5p-mfc/s5p_mfc_enc.c Arun Kumar K  2=
013-04-24  1543  			}
e9d98ddc0a4e4e drivers/media/platform/s5p-mfc/s5p_mfc_enc.c Arun Kumar K  2=
013-04-24  1544  		}
e9d98ddc0a4e4e drivers/media/platform/s5p-mfc/s5p_mfc_enc.c Arun Kumar K  2=
013-04-24  1545  =

af935746781088 drivers/media/video/s5p-mfc/s5p_mfc_enc.c    Kamil Debski  2=
011-06-21  1546  		ret =3D vb2_reqbufs(&ctx->vq_src, reqbufs);
af935746781088 drivers/media/video/s5p-mfc/s5p_mfc_enc.c    Kamil Debski  2=
011-06-21  1547  		if (ret !=3D 0) {
af935746781088 drivers/media/video/s5p-mfc/s5p_mfc_enc.c    Kamil Debski  2=
011-06-21  1548  			mfc_err("error in vb2_reqbufs() for E(S)\n");
af935746781088 drivers/media/video/s5p-mfc/s5p_mfc_enc.c    Kamil Debski  2=
011-06-21  1549  			return ret;
af935746781088 drivers/media/video/s5p-mfc/s5p_mfc_enc.c    Kamil Debski  2=
011-06-21  1550  		}
af935746781088 drivers/media/video/s5p-mfc/s5p_mfc_enc.c    Kamil Debski  2=
011-06-21  1551  		ctx->output_state =3D QUEUE_BUFS_REQUESTED;
af935746781088 drivers/media/video/s5p-mfc/s5p_mfc_enc.c    Kamil Debski  2=
011-06-21  1552  	} else {
af935746781088 drivers/media/video/s5p-mfc/s5p_mfc_enc.c    Kamil Debski  2=
011-06-21  1553  		mfc_err("invalid buf type\n");
af935746781088 drivers/media/video/s5p-mfc/s5p_mfc_enc.c    Kamil Debski  2=
011-06-21  1554  		return -EINVAL;
af935746781088 drivers/media/video/s5p-mfc/s5p_mfc_enc.c    Kamil Debski  2=
011-06-21  1555  	}
af935746781088 drivers/media/video/s5p-mfc/s5p_mfc_enc.c    Kamil Debski  2=
011-06-21  1556  	return ret;
af935746781088 drivers/media/video/s5p-mfc/s5p_mfc_enc.c    Kamil Debski  2=
011-06-21  1557  }
af935746781088 drivers/media/video/s5p-mfc/s5p_mfc_enc.c    Kamil Debski  2=
011-06-21  1558  =


:::::: The code at line 1516 was first introduced by commit
:::::: af935746781088f28904601469671d244d2f653b [media] MFC: Add MFC 5.1 V4=
L2 driver

:::::: TO: Kamil Debski <k.debski@samsung.com>
:::::: CC: Mauro Carvalho Chehab <mchehab@redhat.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8733636171977230411==--

