Content-Type: multipart/mixed; boundary="===============5305515937786342928=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/media/dvb-frontends/drxk_hard.c:6686:12: warning: Assigned value is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
Date: Thu, 10 Mar 2022 16:55:22 +0800
Message-ID: <202203101605.TPGiDmyE-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5305515937786342928==
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
head:   3bf7edc84a9eb4007dd9a0cb8878a7e1d5ec6a3b
commit: 337015573718b161891a3473d25f59273f2e626b printk: Userspace format i=
ndexing support
date:   8 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 8 months ago
config: arm-randconfig-c002-20220309 (https://download.01.org/0day-ci/archi=
ve/20220310/202203101605.TPGiDmyE-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 276ca8=
7382b8f16a65bddac700202924228982f6)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D337015573718b161891a3473d25f59273f2e626b
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 337015573718b161891a3473d25f59273f2e626b
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   Suppressed 7 warnings (7 in non-user code).
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
   Suppressed 7 warnings (7 in non-user code).
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
   sound/soc/soc-ops.c:370:26: warning: The result of the left shift is und=
efined because the right operand is negative [clang-analyzer-core.Undefined=
BinaryOperatorResult]
           unsigned int mask =3D (1U << (fls(min + max) - 1)) - 1;
                                   ^  ~~~~~~~~~~~~~~~~~~~~
   sound/soc/soc-ops.c:370:26: note: The result of the left shift is undefi=
ned because the right operand is negative
           unsigned int mask =3D (1U << (fls(min + max) - 1)) - 1;
                                   ^  ~~~~~~~~~~~~~~~~~~~~
   sound/soc/soc-ops.c:408:26: warning: The result of the left shift is und=
efined because the right operand is negative [clang-analyzer-core.Undefined=
BinaryOperatorResult]
           unsigned int mask =3D (1U << (fls(min + max) - 1)) - 1;
                                   ^  ~~~~~~~~~~~~~~~~~~~~
   sound/soc/soc-ops.c:408:26: note: The result of the left shift is undefi=
ned because the right operand is negative
           unsigned int mask =3D (1U << (fls(min + max) - 1)) - 1;
                                   ^  ~~~~~~~~~~~~~~~~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   drivers/media/dvb-frontends/stv0367.c:1103:2: warning: Value stored to '=
temp' is never read [clang-analyzer-deadcode.DeadStores]
           temp =3D stv0367_readbits(state, F367TER_TRL_NOMRATE_HI) * 512 +
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/stv0367.c:1103:2: note: Value stored to 'tem=
p' is never read
           temp =3D stv0367_readbits(state, F367TER_TRL_NOMRATE_HI) * 512 +
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/stv0367.c:1109:2: warning: Value stored to '=
temp' is never read [clang-analyzer-deadcode.DeadStores]
           temp =3D stv0367_readbits(state, F367TER_GAIN_SRC_HI) * 256 +
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/stv0367.c:1109:2: note: Value stored to 'tem=
p' is never read
           temp =3D stv0367_readbits(state, F367TER_GAIN_SRC_HI) * 256 +
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/stv0367.c:1530:3: warning: Value stored to '=
tber' is never read [clang-analyzer-deadcode.DeadStores]
                   tber =3D ter_state->pBER;
                   ^      ~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/stv0367.c:1530:3: note: Value stored to 'tbe=
r' is never read
                   tber =3D ter_state->pBER;
                   ^      ~~~~~~~~~~~~~~~
   Suppressed 8 warnings (7 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (7 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (7 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (7 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (7 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (7 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   drivers/media/dvb-frontends/drxk_hard.c:1378:2: warning: Value stored to=
 'status' is never read [clang-analyzer-deadcode.DeadStores]
           status =3D write16(state, SIO_OFDM_SH_OFDM_RING_ENABLE__A, desir=
ed_ctrl);
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   drivers/media/dvb-frontends/drxk_hard.c:1378:2: note: Value stored to 's=
tatus' is never read
           status =3D write16(state, SIO_OFDM_SH_OFDM_RING_ENABLE__A, desir=
ed_ctrl);
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   drivers/media/dvb-frontends/drxk_hard.c:3861:3: warning: Value stored to=
 'operation_mode' is never read [clang-analyzer-deadcode.DeadStores]
                   operation_mode |=3D OFDM_SC_RA_RAM_OP_AUTO_RATE__M;
                   ^
   drivers/media/dvb-frontends/drxk_hard.c:3861:3: note: Value stored to 'o=
peration_mode' is never read
   drivers/media/dvb-frontends/drxk_hard.c:4185:2: warning: Value stored to=
 'fec_rs_prescale' is never read [clang-analyzer-deadcode.DeadStores]
           fec_rs_prescale =3D 1;
           ^                 ~
   drivers/media/dvb-frontends/drxk_hard.c:4185:2: note: Value stored to 'f=
ec_rs_prescale' is never read
           fec_rs_prescale =3D 1;
           ^                 ~
>> drivers/media/dvb-frontends/drxk_hard.c:6686:12: warning: Assigned value=
 is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
           *ucblocks =3D (u32) err;
                     ^ ~~~~~~~~~
   drivers/media/dvb-frontends/drxk_hard.c:6676:2: note: 'err' declared wit=
hout an initial value
           u16 err;
           ^~~~~~~
   drivers/media/dvb-frontends/drxk_hard.c:6678:2: note: Assuming 'debug' i=
s < 1
           dprintk(1, "\n");
           ^
   drivers/media/dvb-frontends/drxk_hard.c:154:5: note: expanded from macro=
 'dprintk'
   if (debug >=3D level)                                                   =
  \
       ^~~~~~~~~~~~~~
   drivers/media/dvb-frontends/drxk_hard.c:6678:2: note: Taking false branch
           dprintk(1, "\n");
           ^
   drivers/media/dvb-frontends/drxk_hard.c:153:45: note: expanded from macr=
o 'dprintk'
   #define dprintk(level, fmt, arg...) do {                                \
                                                                           ^
   drivers/media/dvb-frontends/drxk_hard.c:6678:2: note: Loop condition is =
false.  Exiting loop
           dprintk(1, "\n");
           ^
   drivers/media/dvb-frontends/drxk_hard.c:153:37: note: expanded from macr=
o 'dprintk'
   #define dprintk(level, fmt, arg...) do {                                \
                                       ^
   drivers/media/dvb-frontends/drxk_hard.c:6680:6: note: Assuming field 'm_=
drxk_state' is not equal to DRXK_NO_DEV
           if (state->m_drxk_state =3D=3D DRXK_NO_DEV)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/drxk_hard.c:6680:2: note: Taking false branch
           if (state->m_drxk_state =3D=3D DRXK_NO_DEV)
           ^
   drivers/media/dvb-frontends/drxk_hard.c:6682:6: note: Assuming field 'm_=
drxk_state' is not equal to DRXK_UNINITIALIZED
           if (state->m_drxk_state =3D=3D DRXK_UNINITIALIZED)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/drxk_hard.c:6682:2: note: Taking false branch
           if (state->m_drxk_state =3D=3D DRXK_UNINITIALIZED)
           ^
   drivers/media/dvb-frontends/drxk_hard.c:6685:2: note: Calling 'dvbtqam_g=
et_acc_pkt_err'
           dvbtqam_get_acc_pkt_err(state, &err);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/drxk_hard.c:3184:2: note: 'debug' is < 1
           dprintk(1, "\n");
           ^
   drivers/media/dvb-frontends/drxk_hard.c:154:5: note: expanded from macro=
 'dprintk'
   if (debug >=3D level)                                                   =
  \
       ^~~~~
   drivers/media/dvb-frontends/drxk_hard.c:3184:2: note: Taking false branch
           dprintk(1, "\n");
           ^
   drivers/media/dvb-frontends/drxk_hard.c:153:45: note: expanded from macr=
o 'dprintk'
   #define dprintk(level, fmt, arg...) do {                                \
                                                                           ^
   drivers/media/dvb-frontends/drxk_hard.c:3184:2: note: Loop condition is =
false.  Exiting loop
           dprintk(1, "\n");
           ^
   drivers/media/dvb-frontends/drxk_hard.c:153:37: note: expanded from macr=
o 'dprintk'
   #define dprintk(level, fmt, arg...) do {                                \
                                       ^
   drivers/media/dvb-frontends/drxk_hard.c:3185:6: note: 'packet_err' is no=
t equal to NULL
           if (packet_err =3D=3D NULL)
               ^~~~~~~~~~
   drivers/media/dvb-frontends/drxk_hard.c:3185:2: note: Taking false branch
           if (packet_err =3D=3D NULL)
           ^
   drivers/media/dvb-frontends/drxk_hard.c:3188:12: note: Calling 'read16'
                   status =3D read16(state, SCU_RAM_FEC_ACCUM_PKT_FAILURES_=
_A,
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/drxk_hard.c:314:9: note: Calling 'read16_fla=
gs'
           return read16_flags(state, reg, data, 0);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/drxk_hard.c:288:6: note: Assuming field 'sin=
gle_master' is false
           if (state->single_master)
               ^~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/drxk_hard.c:288:2: note: Taking false branch
           if (state->single_master)
           ^
   drivers/media/dvb-frontends/drxk_hard.c:291:35: note: Left side of '||' =
is true
           if (DRXDAP_FASI_LONG_FORMAT(reg) || (flags !=3D 0)) {
                                            ^
   drivers/media/dvb-frontends/drxk_hard.c:302:2: note: 'debug' is < 2
           dprintk(2, "(0x%08x, 0x%02x)\n", reg, flags);
           ^
   drivers/media/dvb-frontends/drxk_hard.c:154:5: note: expanded from macro=
 'dprintk'
   if (debug >=3D level)                                                   =
  \
       ^~~~~
   drivers/media/dvb-frontends/drxk_hard.c:302:2: note: Taking false branch
           dprintk(2, "(0x%08x, 0x%02x)\n", reg, flags);
           ^
   drivers/media/dvb-frontends/drxk_hard.c:153:45: note: expanded from macr=
o 'dprintk'
   #define dprintk(level, fmt, arg...) do {                                \
                                                                           ^
   drivers/media/dvb-frontends/drxk_hard.c:302:2: note: Loop condition is f=
alse.  Exiting loop
           dprintk(2, "(0x%08x, 0x%02x)\n", reg, flags);
           ^
   drivers/media/dvb-frontends/drxk_hard.c:153:37: note: expanded from macr=
o 'dprintk'
   #define dprintk(level, fmt, arg...) do {                                \
                                       ^
   drivers/media/dvb-frontends/drxk_hard.c:304:6: note: Assuming 'status' i=
s < 0
           if (status < 0)
               ^~~~~~~~~~
   drivers/media/dvb-frontends/drxk_hard.c:304:2: note: Taking true branch
           if (status < 0)

vim +6686 drivers/media/dvb-frontends/drxk_hard.c

43dd07f758d81f drivers/media/dvb/frontends/drxk_hard.c Ralph Metzler       =
  2011-07-03  6672  =

43dd07f758d81f drivers/media/dvb/frontends/drxk_hard.c Ralph Metzler       =
  2011-07-03  6673  static int drxk_read_ucblocks(struct dvb_frontend *fe, =
u32 *ucblocks)
43dd07f758d81f drivers/media/dvb/frontends/drxk_hard.c Ralph Metzler       =
  2011-07-03  6674  {
43dd07f758d81f drivers/media/dvb/frontends/drxk_hard.c Ralph Metzler       =
  2011-07-03  6675  	struct drxk_state *state =3D fe->demodulator_priv;
43dd07f758d81f drivers/media/dvb/frontends/drxk_hard.c Ralph Metzler       =
  2011-07-03  6676  	u16 err;
43dd07f758d81f drivers/media/dvb/frontends/drxk_hard.c Ralph Metzler       =
  2011-07-03  6677  =

2da6750117c8fc drivers/media/dvb/frontends/drxk_hard.c Mauro Carvalho Cheha=
b 2011-07-04  6678  	dprintk(1, "\n");
704a28e88ab6c9 drivers/media/dvb/frontends/drxk_hard.c Mauro Carvalho Cheha=
b 2012-06-29  6679  =

cd7a67a4f18047 drivers/media/dvb-frontends/drxk_hard.c Mauro Carvalho Cheha=
b 2013-04-28  6680  	if (state->m_drxk_state =3D=3D DRXK_NO_DEV)
704a28e88ab6c9 drivers/media/dvb/frontends/drxk_hard.c Mauro Carvalho Cheha=
b 2012-06-29  6681  		return -ENODEV;
cd7a67a4f18047 drivers/media/dvb-frontends/drxk_hard.c Mauro Carvalho Cheha=
b 2013-04-28  6682  	if (state->m_drxk_state =3D=3D DRXK_UNINITIALIZED)
704a28e88ab6c9 drivers/media/dvb/frontends/drxk_hard.c Mauro Carvalho Cheha=
b 2012-06-29  6683  		return -EAGAIN;
704a28e88ab6c9 drivers/media/dvb/frontends/drxk_hard.c Mauro Carvalho Cheha=
b 2012-06-29  6684  =

cd7a67a4f18047 drivers/media/dvb-frontends/drxk_hard.c Mauro Carvalho Cheha=
b 2013-04-28  6685  	dvbtqam_get_acc_pkt_err(state, &err);
43dd07f758d81f drivers/media/dvb/frontends/drxk_hard.c Ralph Metzler       =
  2011-07-03 @6686  	*ucblocks =3D (u32) err;
43dd07f758d81f drivers/media/dvb/frontends/drxk_hard.c Ralph Metzler       =
  2011-07-03  6687  	return 0;
43dd07f758d81f drivers/media/dvb/frontends/drxk_hard.c Ralph Metzler       =
  2011-07-03  6688  }
43dd07f758d81f drivers/media/dvb/frontends/drxk_hard.c Ralph Metzler       =
  2011-07-03  6689  =


:::::: The code at line 6686 was first introduced by commit
:::::: 43dd07f758d81fc55a7a1ff24b7689b10cc75bf2 [media] DRX-K: Initial chec=
k-in

:::::: TO: Ralph Metzler <rjkm@metzlerbros.de>
:::::: CC: Mauro Carvalho Chehab <mchehab@redhat.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5305515937786342928==--

