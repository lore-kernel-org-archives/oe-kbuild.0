Content-Type: multipart/mixed; boundary="===============3872568046888898421=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/firmware/arm_scmi/driver.c:812:17: warning: Value stored to 'dev' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Sat, 26 Mar 2022 20:36:22 +0800
Message-ID: <202203262022.JhMRTpho-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3872568046888898421==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Cristian Marussi <cristian.marussi@arm.com>
CC: Sudeep Holla <sudeep.holla@arm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   52d543b5497cf31d6baeb0bcfe5a5474c3238578
commit: 5a731aebd31bf840a93deae12bdfd831513e7211 firmware: arm_scmi: Refact=
or message response path
date:   3 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 3 months ago
config: arm-randconfig-c002-20220324 (https://download.01.org/0day-ci/archi=
ve/20220326/202203262022.JhMRTpho-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0f6d95=
01cf49ce02937099350d08f20c4af86f3d)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D5a731aebd31bf840a93deae12bdfd831513e7211
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 5a731aebd31bf840a93deae12bdfd831513e7211
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^
   drivers/input/mouse/cyapa_gen5.c:1897:41: note: Passing the value 32 via=
 2nd parameter 'num_bits'
                   value =3D twos_complement_to_s32(value, data_size * 8);
                                                         ^~~~~~~~~~~~~
   drivers/input/mouse/cyapa_gen5.c:1897:11: note: Calling 'twos_complement=
_to_s32'
                   value =3D twos_complement_to_s32(value, data_size * 8);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/input/mouse/cyapa_gen5.c:1855:6: note: Assuming the condition is=
 true
           if (value >> (num_bits - 1))
               ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/input/mouse/cyapa_gen5.c:1855:2: note: Taking true branch
           if (value >> (num_bits - 1))
           ^
   drivers/input/mouse/cyapa_gen5.c:1856:16: note: The result of the left s=
hift is undefined due to shifting by '32', which is greater or equal to the=
 width of type 'int'
                   value |=3D  -1 << num_bits;
                                ^  ~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/media/dvb-frontends/cx24117.c:1533:24: warning: Value stored to =
'state' during its initialization is never read [clang-analyzer-deadcode.De=
adStores]
           struct cx24117_state *state =3D fe->demodulator_priv;
                                 ^~~~~   ~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cx24117.c:1533:24: note: Value stored to 'st=
ate' during its initialization is never read
           struct cx24117_state *state =3D fe->demodulator_priv;
                                 ^~~~~   ~~~~~~~~~~~~~~~~~~~~
   Suppressed 3 warnings (2 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   drivers/media/dvb-frontends/cx24120.c:1225:2: warning: Value stored to '=
ret' is never read [clang-analyzer-deadcode.DeadStores]
           ret =3D cx24120_writereg(state, CX24120_REG_CLKDIV, state->dcur.=
clkdiv);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   drivers/media/dvb-frontends/cx24120.c:1225:2: note: Value stored to 'ret=
' is never read
           ret =3D cx24120_writereg(state, CX24120_REG_CLKDIV, state->dcur.=
clkdiv);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   drivers/media/dvb-frontends/cx24120.c:1229:2: warning: Value stored to '=
ret' is never read [clang-analyzer-deadcode.DeadStores]
           ret =3D cx24120_writereg(state, CX24120_REG_RATEDIV, ret);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cx24120.c:1229:2: note: Value stored to 'ret=
' is never read
           ret =3D cx24120_writereg(state, CX24120_REG_RATEDIV, ret);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cx24120.c:1471:24: warning: Value stored to =
'state' during its initialization is never read [clang-analyzer-deadcode.De=
adStores]
           struct cx24120_state *state =3D fe->demodulator_priv;
                                 ^~~~~   ~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cx24120.c:1471:24: note: Value stored to 'st=
ate' during its initialization is never read
           struct cx24120_state *state =3D fe->demodulator_priv;
                                 ^~~~~   ~~~~~~~~~~~~~~~~~~~~
   Suppressed 3 warnings (2 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   drivers/media/dvb-frontends/si21xx.c:830:2: warning: Value stored to 'st=
atus' is never read [clang-analyzer-deadcode.DeadStores]
           status |=3D si21_writeregs(state, PLL_DIVISOR_REG, &regs[0], 0x0=
4);
           ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/si21xx.c:830:2: note: Value stored to 'statu=
s' is never read
           status |=3D si21_writeregs(state, PLL_DIVISOR_REG, &regs[0], 0x0=
4);
           ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 4 warnings (2 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (2 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (2 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (2 in non-user code, 1 with check filters).
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
   drivers/leds/uleds.c:150:4: warning: Value stored to 'retval' is never r=
ead [clang-analyzer-deadcode.DeadStores]
                           retval =3D copy_to_user(buffer, &udev->brightnes=
s,
                           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/leds/uleds.c:150:4: note: Value stored to 'retval' is never read
                           retval =3D copy_to_user(buffer, &udev->brightnes=
s,
                           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (2 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (2 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (2 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
>> drivers/firmware/arm_scmi/driver.c:812:17: warning: Value stored to 'dev=
' during its initialization is never read [clang-analyzer-deadcode.DeadStor=
es]
           struct device *dev =3D info->dev;
                          ^~~   ~~~~~~~~~
   drivers/firmware/arm_scmi/driver.c:812:17: note: Value stored to 'dev' d=
uring its initialization is never read
           struct device *dev =3D info->dev;
                          ^~~   ~~~~~~~~~
   drivers/firmware/arm_scmi/driver.c:1818:2: warning: Value stored to 'ret=
' is never read [clang-analyzer-deadcode.DeadStores]
           ret =3D idr_for_each(idr, info->desc->ops->chan_free, idr);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/firmware/arm_scmi/driver.c:1818:2: note: Value stored to 'ret' i=
s never read
           ret =3D idr_for_each(idr, info->desc->ops->chan_free, idr);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   drivers/firmware/arm_scmi/notify.c:1425:2: warning: Use of memory after =
it is freed [clang-analyzer-unix.Malloc]
           scmi_put_handler(ni, hndl);
           ^
   drivers/firmware/arm_scmi/notify.c:1443:2: note: Calling 'scmi_notifier_=
unregister'
           scmi_notifier_unregister(dres->handle, dres->proto_id, dres->evt=
_id,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   drivers/firmware/arm_scmi/notify.c:1398:6: note: Assuming 'ni' is non-nu=
ll
           if (!ni)
               ^~~
   drivers/firmware/arm_scmi/notify.c:1398:2: note: Taking false branch
           if (!ni)
           ^
   drivers/firmware/arm_scmi/notify.c:1401:12: note: Taking false branch
           evt_key =3D MAKE_HASH_KEY(proto_id, evt_id,
                     ^
   drivers/firmware/arm_scmi/notify.c:108:3: note: expanded from macro 'MAK=
E_HASH_KEY'
           (FIELD_PREP(PROTO_ID_MASK, (p)) |       \
            ^
   include/linux/bitfield.h:94:3: note: expanded from macro 'FIELD_PREP'
                   __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
                   ^
   include/linux/bitfield.h:46:3: note: expanded from macro '__BF_FIELD_CHE=
CK'
                   BUILD_BUG_ON_MSG(!__builtin_constant_p(_mask),          \
                   ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:335:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:323:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:315:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/firmware/arm_scmi/notify.c:1401:12: note: Loop condition is fals=
e.  Exiting loop
           evt_key =3D MAKE_HASH_KEY(proto_id, evt_id,
                     ^
   drivers/firmware/arm_scmi/notify.c:108:3: note: expanded from macro 'MAK=
E_HASH_KEY'
           (FIELD_PREP(PROTO_ID_MASK, (p)) |       \
            ^
   include/linux/bitfield.h:94:3: note: expanded from macro 'FIELD_PREP'
                   __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
                   ^
   include/linux/bitfield.h:46:3: note: expanded from macro '__BF_FIELD_CHE=
CK'
                   BUILD_BUG_ON_MSG(!__builtin_constant_p(_mask),          \
                   ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:335:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:323:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:307:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/firmware/arm_scmi/notify.c:1401:12: note: Taking false branch
           evt_key =3D MAKE_HASH_KEY(proto_id, evt_id,
                     ^
   drivers/firmware/arm_scmi/notify.c:108:3: note: expanded from macro 'MAK=
E_HASH_KEY'
           (FIELD_PREP(PROTO_ID_MASK, (p)) |       \
            ^
   include/linux/bitfield.h:94:3: note: expanded from macro 'FIELD_PREP'
                   __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
                   ^
   include/linux/bitfield.h:48:3: note: expanded from macro '__BF_FIELD_CHE=
CK'
                   BUILD_BUG_ON_MSG((_mask) =3D=3D 0, _pfx "mask is zero");=
    \
                   ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:335:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:323:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:315:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/firmware/arm_scmi/notify.c:1401:12: note: Loop condition is fals=
e.  Exiting loop
           evt_key =3D MAKE_HASH_KEY(proto_id, evt_id,
                     ^
   drivers/firmware/arm_scmi/notify.c:108:3: note: expanded from macro 'MAK=
E_HASH_KEY'
           (FIELD_PREP(PROTO_ID_MASK, (p)) |       \
            ^
   include/linux/bitfield.h:94:3: note: expanded from macro 'FIELD_PREP'
                   __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \

vim +/dev +812 drivers/firmware/arm_scmi/driver.c

5a731aebd31bf8 Cristian Marussi 2021-11-29  795  =

aa4f886f3893f8 Sudeep Holla     2017-03-28  796  /**
a4a20b0975dc7b Cristian Marussi 2021-03-16  797   * do_xfer() - Do one tran=
sfer
aa4f886f3893f8 Sudeep Holla     2017-03-28  798   *
a4a20b0975dc7b Cristian Marussi 2021-03-16  799   * @ph: Pointer to SCMI pr=
otocol handle
aa4f886f3893f8 Sudeep Holla     2017-03-28  800   * @xfer: Transfer to init=
iate and wait for response
aa4f886f3893f8 Sudeep Holla     2017-03-28  801   *
aa4f886f3893f8 Sudeep Holla     2017-03-28  802   * Return: -ETIMEDOUT in c=
ase of no response, if transmit error,
aa4f886f3893f8 Sudeep Holla     2017-03-28  803   *	return corresponding er=
ror, else if all goes well,
aa4f886f3893f8 Sudeep Holla     2017-03-28  804   *	return 0.
aa4f886f3893f8 Sudeep Holla     2017-03-28  805   */
a4a20b0975dc7b Cristian Marussi 2021-03-16  806  static int do_xfer(const s=
truct scmi_protocol_handle *ph,
a4a20b0975dc7b Cristian Marussi 2021-03-16  807  		   struct scmi_xfer *xfe=
r)
aa4f886f3893f8 Sudeep Holla     2017-03-28  808  {
aa4f886f3893f8 Sudeep Holla     2017-03-28  809  	int ret;
a4a20b0975dc7b Cristian Marussi 2021-03-16  810  	const struct scmi_protoco=
l_instance *pi =3D ph_to_pi(ph);
a4a20b0975dc7b Cristian Marussi 2021-03-16  811  	struct scmi_info *info =
=3D handle_to_scmi_info(pi->handle);
aa4f886f3893f8 Sudeep Holla     2017-03-28 @812  	struct device *dev =3D in=
fo->dev;
907b6d14911db0 Sudeep Holla     2017-07-31  813  	struct scmi_chan_info *ci=
nfo;
907b6d14911db0 Sudeep Holla     2017-07-31  814  =

2930abcffd9f0b Cristian Marussi 2021-08-03  815  	if (xfer->hdr.poll_comple=
tion && !info->desc->ops->poll_done) {
2930abcffd9f0b Cristian Marussi 2021-08-03  816  		dev_warn_once(dev,
2930abcffd9f0b Cristian Marussi 2021-08-03  817  			      "Polling mode is =
not supported by transport.\n");
2930abcffd9f0b Cristian Marussi 2021-08-03  818  		return -EINVAL;
2930abcffd9f0b Cristian Marussi 2021-08-03  819  	}
2930abcffd9f0b Cristian Marussi 2021-08-03  820  =

d211ddeb511af5 Cristian Marussi 2021-11-29  821  	cinfo =3D idr_find(&info-=
>tx_idr, pi->proto->id);
d211ddeb511af5 Cristian Marussi 2021-11-29  822  	if (unlikely(!cinfo))
d211ddeb511af5 Cristian Marussi 2021-11-29  823  		return -EINVAL;
d211ddeb511af5 Cristian Marussi 2021-11-29  824  =

a4a20b0975dc7b Cristian Marussi 2021-03-16  825  	/*
61832b35b4d953 Sudeep Holla     2021-06-08  826  	 * Initialise protocol id=
 now from protocol handle to avoid it being
a4a20b0975dc7b Cristian Marussi 2021-03-16  827  	 * overridden by mistake =
(or malice) by the protocol code mangling with
61832b35b4d953 Sudeep Holla     2021-06-08  828  	 * the scmi_xfer structur=
e prior to this.
a4a20b0975dc7b Cristian Marussi 2021-03-16  829  	 */
a4a20b0975dc7b Cristian Marussi 2021-03-16  830  	xfer->hdr.protocol_id =3D=
 pi->proto->id;
e30d91d4ffda0b Cristian Marussi 2021-06-06  831  	reinit_completion(&xfer->=
done);
a4a20b0975dc7b Cristian Marussi 2021-03-16  832  =

729d3530a50417 Lukasz Luba      2019-12-17  833  	trace_scmi_xfer_begin(xfe=
r->transfer_id, xfer->hdr.id,
729d3530a50417 Lukasz Luba      2019-12-17  834  			      xfer->hdr.protoco=
l_id, xfer->hdr.seq,
729d3530a50417 Lukasz Luba      2019-12-17  835  			      xfer->hdr.poll_co=
mpletion);
729d3530a50417 Lukasz Luba      2019-12-17  836  =

ed7c04c1fea3b0 Cristian Marussi 2021-08-03  837  	xfer->state =3D SCMI_XFER=
_SENT_OK;
ed7c04c1fea3b0 Cristian Marussi 2021-08-03  838  	/*
ed7c04c1fea3b0 Cristian Marussi 2021-08-03  839  	 * Even though spinlockin=
g is not needed here since no race is possible
ed7c04c1fea3b0 Cristian Marussi 2021-08-03  840  	 * on xfer->state due to =
the monotonically increasing tokens allocation,
ed7c04c1fea3b0 Cristian Marussi 2021-08-03  841  	 * we must anyway ensure =
xfer->state initialization is not re-ordered
ed7c04c1fea3b0 Cristian Marussi 2021-08-03  842  	 * after the .send_messag=
e() to be sure that on the RX path an early
ed7c04c1fea3b0 Cristian Marussi 2021-08-03  843  	 * ISR calling scmi_rx_ca=
llback() cannot see an old stale xfer->state.
ed7c04c1fea3b0 Cristian Marussi 2021-08-03  844  	 */
ed7c04c1fea3b0 Cristian Marussi 2021-08-03  845  	smp_mb();
ed7c04c1fea3b0 Cristian Marussi 2021-08-03  846  =

5c8a47a5a91d4d Viresh Kumar     2020-01-31  847  	ret =3D info->desc->ops->=
send_message(cinfo, xfer);
aa4f886f3893f8 Sudeep Holla     2017-03-28  848  	if (ret < 0) {
5c8a47a5a91d4d Viresh Kumar     2020-01-31  849  		dev_dbg(dev, "Failed to =
send message %d\n", ret);
aa4f886f3893f8 Sudeep Holla     2017-03-28  850  		return ret;
aa4f886f3893f8 Sudeep Holla     2017-03-28  851  	}
aa4f886f3893f8 Sudeep Holla     2017-03-28  852  =

5a731aebd31bf8 Cristian Marussi 2021-11-29  853  	ret =3D scmi_wait_for_mes=
sage_response(cinfo, xfer);
d4c3751a8de2de Sudeep Holla     2017-07-20  854  	if (!ret && xfer->hdr.sta=
tus)
d4c3751a8de2de Sudeep Holla     2017-07-20  855  		ret =3D scmi_to_linux_er=
rno(xfer->hdr.status);
d4c3751a8de2de Sudeep Holla     2017-07-20  856  =

5c8a47a5a91d4d Viresh Kumar     2020-01-31  857  	if (info->desc->ops->mark=
_txdone)
5c8a47a5a91d4d Viresh Kumar     2020-01-31  858  		info->desc->ops->mark_tx=
done(cinfo, ret);
aa4f886f3893f8 Sudeep Holla     2017-03-28  859  =

729d3530a50417 Lukasz Luba      2019-12-17  860  	trace_scmi_xfer_end(xfer-=
>transfer_id, xfer->hdr.id,
bad0d73b657412 Sudeep Holla     2020-06-09  861  			    xfer->hdr.protocol_=
id, xfer->hdr.seq, ret);
729d3530a50417 Lukasz Luba      2019-12-17  862  =

aa4f886f3893f8 Sudeep Holla     2017-03-28  863  	return ret;
aa4f886f3893f8 Sudeep Holla     2017-03-28  864  }
aa4f886f3893f8 Sudeep Holla     2017-03-28  865  =


:::::: The code at line 812 was first introduced by commit
:::::: aa4f886f3893f88146e8e02fd1e9c5c9e43cbcc1 firmware: arm_scmi: add bas=
ic driver infrastructure for SCMI

:::::: TO: Sudeep Holla <sudeep.holla@arm.com>
:::::: CC: Sudeep Holla <sudeep.holla@arm.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3872568046888898421==--

