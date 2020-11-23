Content-Type: multipart/mixed; boundary="===============5274256352422872488=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/leds/leds-lp55xx-common.c:204:4: warning: Variable 'j' is modified but its new value is never used.
Date: Tue, 24 Nov 2020 01:40:18 +0800
Message-ID: <202011240143.tGqUpe2e-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5274256352422872488==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Dan Murphy <dmurphy@ti.com>
CC: Pavel Machek <pavel@ucw.cz>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   418baf2c28f3473039f2f7377760bd8f6897ae18
commit: 92a81562e695628086acb92f95090ab09d9b9ec0 leds: lp55xx: Add multicol=
or framework support to lp55xx
date:   4 months ago
:::::: branch date: 18 hours ago
:::::: commit date: 4 months ago
compiler: c6x-elf-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


"cppcheck warnings: (new ones prefixed by >>)"
>> net/atm/ioctl.c:208:40: warning: Uninitialized variable: number [uninitv=
ar]
     error =3D atm_dev_ioctl(cmd, buf, len, number, compat);
                                          ^
--
>> drivers/media/dvb-frontends/stv0900_core.c:913:8: warning: Logical conju=
nction always evaluates to false: mod_code >=3D 17 && mod_code <=3D 4. [inc=
orrectLogicOperator]
     if ((INRANGE(STV0900_QPSK_12, mod_code, STV0900_8PSK_910))
          ^
>> drivers/media/dvb-frontends/stv0900_core.c:1576:8: warning: Logical conj=
unction always evaluates to false: EXPR >=3D 70000000 && EXPR <=3D 100000. =
[incorrectLogicOperator]
    if (!(INRANGE(100000, c->symbol_rate, 70000000)))
          ^
>> drivers/media/dvb-frontends/stb0899_drv.c:1433:6: warning: Logical conju=
nction always evaluates to false: EXPR >=3D 45000000 && EXPR <=3D 1000000. =
[incorrectLogicOperator]
    if (INRANGE(i_params->srate, 1000000, 45000000)) {
        ^

cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> net/rxrpc/af_rxrpc.c:483:6: warning: Variable 'ret' is reassigned a valu=
e before the old one has been used. 'break;' missing? [redundantAssignInSwi=
tch]
    ret =3D 0;
        ^
   net/rxrpc/af_rxrpc.c:466:6: note: Variable 'ret' is reassigned a value b=
efore the old one has been used. 'break;' missing?
    ret =3D -EISCONN;
        ^
   net/rxrpc/af_rxrpc.c:483:6: note: Variable 'ret' is reassigned a value b=
efore the old one has been used. 'break;' missing?
    ret =3D 0;
        ^
   net/rxrpc/af_rxrpc.c:680:6: warning: Variable 'ret' is reassigned a valu=
e before the old one has been used. 'break;' missing? [redundantAssignInSwi=
tch]
    ret =3D 0;
        ^
   net/rxrpc/af_rxrpc.c:601:6: note: Variable 'ret' is reassigned a value b=
efore the old one has been used. 'break;' missing?
    ret =3D -EOPNOTSUPP;
        ^
   net/rxrpc/af_rxrpc.c:680:6: note: Variable 'ret' is reassigned a value b=
efore the old one has been used. 'break;' missing?
    ret =3D 0;
        ^
>> drivers/media/mc/mc-request.c:296:36: warning: Boolean result is used in=
 bitwise operation. Clarify expression with parentheses. [clarifyCondition]
    if (WARN_ON(!mdev->ops->req_alloc ^ !mdev->ops->req_free))
                                      ^
>> drivers/media/tuners/tuner-xc2028.c:1118:0: warning: Variable 'rc' is re=
assigned a value before the old one has been used. 'break;' missing? [redun=
dantAssignInSwitch]
     rc =3D send_seq(priv, {0x00, XREG_RF_FREQ, 0x00, 0x00});
   ^
   drivers/media/tuners/tuner-xc2028.c:1015:0: note: Variable 'rc' is reass=
igned a value before the old one has been used. 'break;' missing?
    int     rc =3D -EINVAL;
   ^
   drivers/media/tuners/tuner-xc2028.c:1118:0: note: Variable 'rc' is reass=
igned a value before the old one has been used. 'break;' missing?
     rc =3D send_seq(priv, {0x00, XREG_RF_FREQ, 0x00, 0x00});
   ^
>> drivers/media/tuners/tuner-xc2028.c:1118:0: warning: Variable 'rc' is re=
assigned a value before the old one has been used. 'break;' missing? [redun=
dantAssignInSwitch]
     rc =3D send_seq(priv, {0x00, XREG_RF_FREQ, 0x00, 0x00});
   ^
   drivers/media/tuners/tuner-xc2028.c:1037:0: note: Variable 'rc' is reass=
igned a value before the old one has been used. 'break;' missing?
     rc =3D send_seq(priv, {0x00, 0x00});
   ^
   drivers/media/tuners/tuner-xc2028.c:1118:0: note: Variable 'rc' is reass=
igned a value before the old one has been used. 'break;' missing?
     rc =3D send_seq(priv, {0x00, XREG_RF_FREQ, 0x00, 0x00});
   ^
--
>> lib/atomic64.c:29:7: warning: union member 'Anonymous0::pad' is never us=
ed. [unusedStructMember]
    char pad[L1_CACHE_BYTES];
         ^
--
>> drivers/media/v4l2-core/v4l2-flash-led-class.c:82:29: warning: Either th=
e condition 'if(v4l2_flash&&v4l2_flash->ops&&v4l2_flash->ops->intensity_to_=
led_brightness)' is redundant or there is possible null pointer dereference=
: v4l2_flash. [nullPointerRedundantCheck]
    struct v4l2_ctrl **ctrls =3D v4l2_flash->ctrls;
                               ^
   drivers/media/v4l2-core/v4l2-flash-led-class.c:85:5: note: Assuming that=
 condition 'if(v4l2_flash&&v4l2_flash->ops&&v4l2_flash->ops->intensity_to_l=
ed_brightness)' is not redundant
    if (has_flash_op(v4l2_flash, intensity_to_led_brightness))
       ^
   drivers/media/v4l2-core/v4l2-flash-led-class.c:82:29: note: Null pointer=
 dereference
    struct v4l2_ctrl **ctrls =3D v4l2_flash->ctrls;
                               ^
--
>> drivers/leds/leds-lp55xx-common.c:204:4: warning: Variable 'j' is modifi=
ed but its new value is never used. [unreadVariable]
      j++;
      ^
--
>> drivers/media/dvb-frontends/dib3000mc.c:545:8: warning: Same expression =
on both sides of '=3D=3D'. [duplicateExpression]
    if (1 =3D=3D 1)
          ^
   drivers/media/dvb-frontends/dib3000mc.c:547:35: warning: Same expression=
 on both sides of '=3D=3D'. [duplicateExpression]
    switch ((ch->hierarchy =3D=3D 0 || 1 =3D=3D 1) ? ch->code_rate_HP : ch-=
>code_rate_LP) {
                                     ^
--
>> drivers/media/dvb-frontends/dib7000m.c:886:8: warning: Same expression o=
n both sides of '=3D=3D'. [duplicateExpression]
    if (1 =3D=3D 1)
          ^
   drivers/media/dvb-frontends/dib7000m.c:888:35: warning: Same expression =
on both sides of '=3D=3D'. [duplicateExpression]
    switch ((ch->hierarchy =3D=3D 0 || 1 =3D=3D 1) ? ch->code_rate_HP : ch-=
>code_rate_LP) {
                                     ^
   drivers/media/dvb-frontends/dib7000m.c:930:8: warning: Same expression o=
n both sides of '=3D=3D'. [duplicateExpression]
    if (1 =3D=3D 1 || state->revision > 0x4000)
          ^
--
>> drivers/media/dvb-frontends/dib7000p.c:1040:8: warning: Same expression =
on both sides of '=3D=3D'. [duplicateExpression]
    if (1 =3D=3D 1)
          ^
   drivers/media/dvb-frontends/dib7000p.c:1042:35: warning: Same expression=
 on both sides of '=3D=3D'. [duplicateExpression]
    switch ((ch->hierarchy =3D=3D 0 || 1 =3D=3D 1) ? ch->code_rate_HP : ch-=
>code_rate_LP) {
                                     ^
   drivers/media/dvb-frontends/dib7000p.c:1847:34: warning: Same expression=
 on both sides of '=3D=3D'. [duplicateExpression]
    switch ((c->hierarchy =3D=3D 0 || 1 =3D=3D 1) ? c->code_rate_HP : c->co=
de_rate_LP) {
                                    ^
--
>> drivers/media/dvb-frontends/dib8000.c:288:84: warning: Shifting a negati=
ve value is technically undefined behaviour [shiftNegativeLHS]
    (832 << 5) | 0x10, (912 << 5) | 0x05, (900 << 5) | 0x12, (832 << 5) | 0=
x10, (-931 << 5) | 0x0f, (912 << 5) | 0x04, (807 << 5) | 0x11,
                                                                           =
           ^
   drivers/media/dvb-frontends/dib8000.c:289:9: warning: Shifting a negativ=
e value is technically undefined behaviour [shiftNegativeLHS]
     (-931 << 5) | 0x0f
           ^
   drivers/media/dvb-frontends/dib8000.c:298:84: warning: Shifting a negati=
ve value is technically undefined behaviour [shiftNegativeLHS]
    (699 << 5) | 0x14, (607 << 5) | 0x04, (944 << 5) | 0x13, (699 << 5) | 0=
x14, (-720 << 5) | 0x0d, (640 << 5) | 0x03, (866 << 5) | 0x12,
                                                                           =
           ^
   drivers/media/dvb-frontends/dib8000.c:299:9: warning: Shifting a negativ=
e value is technically undefined behaviour [shiftNegativeLHS]
     (-720 << 5) | 0x0d
           ^
   drivers/media/dvb-frontends/dib8000.c:303:84: warning: Shifting a negati=
ve value is technically undefined behaviour [shiftNegativeLHS]
    (664 << 5) | 0x0c, (925 << 5) | 0x03, (937 << 5) | 0x10, (664 << 5) | 0=
x0c, (-610 << 5) | 0x0a, (697 << 5) | 0x01, (836 << 5) | 0x0e,
                                                                           =
           ^
   drivers/media/dvb-frontends/dib8000.c:304:9: warning: Shifting a negativ=
e value is technically undefined behaviour [shiftNegativeLHS]
     (-610 << 5) | 0x0a
           ^
   drivers/media/dvb-frontends/dib8000.c:308:8: warning: Shifting a negativ=
e value is technically undefined behaviour [shiftNegativeLHS]
    (-955 << 5) | 0x0e, (687 << 5) | 0x04, (818 << 5) | 0x10, (-955 << 5) |=
 0x0e, (-922 << 5) | 0x0d, (750 << 5) | 0x03, (665 << 5) | 0x0f,
          ^
   drivers/media/dvb-frontends/dib8000.c:309:9: warning: Shifting a negativ=
e value is technically undefined behaviour [shiftNegativeLHS]
     (-922 << 5) | 0x0d
           ^
   drivers/media/dvb-frontends/dib8000.c:313:84: warning: Shifting a negati=
ve value is technically undefined behaviour [shiftNegativeLHS]
    (638 << 5) | 0x0d, (683 << 5) | 0x02, (638 << 5) | 0x0d, (638 << 5) | 0=
x0d, (-655 << 5) | 0x0a, (517 << 5) | 0x00, (698 << 5) | 0x0d,
                                                                           =
           ^
   drivers/media/dvb-frontends/dib8000.c:314:9: warning: Shifting a negativ=
e value is technically undefined behaviour [shiftNegativeLHS]
     (-655 << 5) | 0x0a
           ^
   drivers/media/dvb-frontends/dib8000.c:318:8: warning: Shifting a negativ=
e value is technically undefined behaviour [shiftNegativeLHS]
    (-707 << 5) | 0x14, (910 << 5) | 0x06, (889 << 5) | 0x16, (-707 << 5) |=
 0x14, (-958 << 5) | 0x13, (993 << 5) | 0x05, (523 << 5) | 0x14,
          ^
   drivers/media/dvb-frontends/dib8000.c:319:9: warning: Shifting a negativ=
e value is technically undefined behaviour [shiftNegativeLHS]
     (-958 << 5) | 0x13
           ^
   drivers/media/dvb-frontends/dib8000.c:323:8: warning: Shifting a negativ=
e value is technically undefined behaviour [shiftNegativeLHS]
    (-723 << 5) | 0x13, (910 << 5) | 0x05, (777 << 5) | 0x14, (-723 << 5) |=
 0x13, (-568 << 5) | 0x0f, (547 << 5) | 0x03, (696 << 5) | 0x12,
          ^
   drivers/media/dvb-frontends/dib8000.c:324:9: warning: Shifting a negativ=
e value is technically undefined behaviour [shiftNegativeLHS]
     (-568 << 5) | 0x0f
           ^
   drivers/media/dvb-frontends/dib8000.c:328:8: warning: Shifting a negativ=
e value is technically undefined behaviour [shiftNegativeLHS]
    (-940 << 5) | 0x15, (607 << 5) | 0x05, (915 << 5) | 0x16, (-940 << 5) |=
 0x15, (-848 << 5) | 0x13, (683 << 5) | 0x04, (543 << 5) | 0x14,
          ^
   drivers/media/dvb-frontends/dib8000.c:329:9: warning: Shifting a negativ=
e value is technically undefined behaviour [shiftNegativeLHS]
     (-848 << 5) | 0x13
           ^
   drivers/media/dvb-frontends/dib8000.c:333:84: warning: Shifting a negati=
ve value is technically undefined behaviour [shiftNegativeLHS]
    (612 << 5) | 0x12, (910 << 5) | 0x04, (864 << 5) | 0x14, (612 << 5) | 0=
x12, (-869 << 5) | 0x13, (683 << 5) | 0x02, (869 << 5) | 0x12,
                                                                           =
           ^
   drivers/media/dvb-frontends/dib8000.c:334:9: warning: Shifting a negativ=
e value is technically undefined behaviour [shiftNegativeLHS]
     (-869 << 5) | 0x13
           ^
   drivers/media/dvb-frontends/dib8000.c:338:8: warning: Shifting a negativ=
e value is technically undefined behaviour [shiftNegativeLHS]
    (-835 << 5) | 0x12, (684 << 5) | 0x05, (735 << 5) | 0x14, (-835 << 5) |=
 0x12, (-598 << 5) | 0x10, (781 << 5) | 0x04, (739 << 5) | 0x13,
          ^
   drivers/media/dvb-frontends/dib8000.c:339:9: warning: Shifting a negativ=
e value is technically undefined behaviour [shiftNegativeLHS]
     (-598 << 5) | 0x10
           ^
   drivers/media/dvb-frontends/dib8000.c:353:8: warning: Shifting a negativ=
e value is technically undefined behaviour [shiftNegativeLHS]
    (-924 << 5) | 0x17, (910 << 5) | 0x06, (774 << 5) | 0x17, (-924 << 5) |=
 0x17, (-877 << 5) | 0x15, (565 << 5) | 0x04, (553 << 5) | 0x15,
          ^
   drivers/media/dvb-frontends/dib8000.c:354:9: warning: Shifting a negativ=
e value is technically undefined behaviour [shiftNegativeLHS]
     (-877 << 5) | 0x15
           ^
   drivers/media/dvb-frontends/dib8000.c:358:8: warning: Shifting a negativ=
e value is technically undefined behaviour [shiftNegativeLHS]
    (-921 << 5) | 0x19, (607 << 5) | 0x06, (881 << 5) | 0x19, (-921 << 5) |=
 0x19, (-921 << 5) | 0x14, (713 << 5) | 0x05, (1018 << 5) | 0x18,
          ^
   drivers/media/dvb-frontends/dib8000.c:359:9: warning: Shifting a negativ=
e value is technically undefined behaviour [shiftNegativeLHS]
     (-921 << 5) | 0x14
           ^
>> net/netfilter/nft_fib.c:144:56: warning: Same expression in both branche=
s of ternary operator. [duplicateExpressionTernary]
     *dreg =3D (priv->flags & NFTA_FIB_F_PRESENT) ? !!index : index;
                                                          ^
--
>> net/appletalk/ddp.c:988:4: warning: Assignment of function parameter has=
 no effect outside the function. [uselessAssignmentArg]
      offset +=3D copy;
      ^
>> drivers/media/dvb-frontends/tda10021.c:483:0: warning: Syntax error in #=
if [preprocessorErrorDirective]
    #if 0
   ^
--
>> drivers/media/dvb-frontends/bcm3510.c:222:16: warning: Possible null poi=
nter dereference: obuf [nullPointer]
    memcpy(&ob[2],obuf,olen);
                  ^
   drivers/media/dvb-frontends/bcm3510.c:285:53: note: Calling function 'bc=
m3510_do_hab_cmd', 4th argument 'NULL' value is 0
     bcm3510_do_hab_cmd(st, CMD_STATUS, MSGID_STATUS1, NULL,0, (u8 *)&st->s=
tatus1, sizeof(st->status1));
                                                       ^
   drivers/media/dvb-frontends/bcm3510.c:222:16: note: Null pointer derefer=
ence
    memcpy(&ob[2],obuf,olen);
                  ^
>> drivers/media/dvb-frontends/bcm3510.c:239:9: warning: Possible null poin=
ter dereference: ibuf [nullPointer]
    memcpy(ibuf,&ib[2],ilen);
           ^
   drivers/media/dvb-frontends/bcm3510.c:449:73: note: Calling function 'bc=
m3510_do_hab_cmd', 6th argument 'NULL' value is 0
    return bcm3510_do_hab_cmd(st,CMD_TUNE, MSGID_TUNE,(u8 *) &c,sizeof(c), =
NULL, 0);
                                                                           ^
   drivers/media/dvb-frontends/bcm3510.c:239:9: note: Null pointer derefere=
nce
    memcpy(ibuf,&ib[2],ilen);
           ^
--
>> drivers/media/dvb-frontends/lg2160.c:1347:0: warning: Syntax error in #i=
f [preprocessorErrorDirective]
   #if 0
   ^
--
>> drivers/media/dvb-frontends/mb86a20s.c:1593:4: warning: Variable 'active=
_layers' is modified but its new value is never used. [unreadVariable]
      active_layers++;
      ^
--
>> drivers/media/dvb-frontends/tda18271c2dd.c:186:40: warning: Same express=
ion on both sides of '&'. [knownConditionTrueFalse]
    state->m_IFLevelDVBC =3D (ulIFLevelDVBC & 0x07) << 2;
                                          ^
   drivers/media/dvb-frontends/tda18271c2dd.c:174:24: note: 'ulIFLevelDVBC'=
 is assigned value '7' here.
    u32   ulIFLevelDVBC =3D 7;
                          ^
   drivers/media/dvb-frontends/tda18271c2dd.c:186:40: note: Same expression=
 on both sides of '&'.
    state->m_IFLevelDVBC =3D (ulIFLevelDVBC & 0x07) << 2;
                                          ^
--
>> drivers/media/dvb-frontends/stv0910.c:779:9: warning: Identical conditio=
n 'status', second condition is always false [identicalConditionAfterEarlyE=
xit]
    return status;
           ^
   drivers/media/dvb-frontends/stv0910.c:756:6: note: first condition
    if (status)
        ^
   drivers/media/dvb-frontends/stv0910.c:779:9: note: second condition
    return status;
           ^
>> drivers/media/dvb-frontends/mxl5xx.c:1684:9: warning: Identical conditio=
n 'status', second condition is always false [identicalConditionAfterEarlyE=
xit]
    return status;
           ^
   drivers/media/dvb-frontends/mxl5xx.c:1679:6: note: first condition
    if (status)
        ^
   drivers/media/dvb-frontends/mxl5xx.c:1684:9: note: second condition
    return status;
           ^
>> drivers/media/tuners/r820t.c:2350:5: warning: Variable 'rc' is reassigne=
d a value before the old one has been used. 'break;' missing? [redundantAss=
ignInSwitch]
    rc =3D r820t_read(priv, 0x00, data, sizeof(data));
       ^
   drivers/media/tuners/r820t.c:2318:0: note: Variable 'rc' is reassigned a=
 value before the old one has been used. 'break;' missing?
    int rc =3D -ENODEV;
   ^
   drivers/media/tuners/r820t.c:2350:5: note: Variable 'rc' is reassigned a=
 value before the old one has been used. 'break;' missing?
    rc =3D r820t_read(priv, 0x00, data, sizeof(data));
       ^
>> drivers/mfd/abx500-core.c:30:4: warning: Address of local auto-variable =
assigned to a function parameter. [autoVariables]
      *ops =3D &dev_entry->ops;
      ^

vim +/j +204 drivers/leds/leds-lp55xx-common.c

0e2023463a3c941 Milo(Woogyom  Kim 2013-02-05  158) =

9e9b3db1b2f725b Milo(Woogyom  Kim 2013-02-05  159) static int lp55xx_init_l=
ed(struct lp55xx_led *led,
9e9b3db1b2f725b Milo(Woogyom  Kim 2013-02-05  160) 			struct lp55xx_chip *c=
hip, int chan)
9e9b3db1b2f725b Milo(Woogyom  Kim 2013-02-05  161) {
0e2023463a3c941 Milo(Woogyom  Kim 2013-02-05  162) 	struct lp55xx_platform_=
data *pdata =3D chip->pdata;
0e2023463a3c941 Milo(Woogyom  Kim 2013-02-05  163) 	struct lp55xx_device_co=
nfig *cfg =3D chip->cfg;
0e2023463a3c941 Milo(Woogyom  Kim 2013-02-05  164) 	struct device *dev =3D =
&chip->cl->dev;
92a81562e695628 Dan Murphy        2020-07-16  165  	int max_channel =3D cfg=
->max_channel;
92a81562e695628 Dan Murphy        2020-07-16  166  	struct mc_subled *mc_le=
d_info;
92a81562e695628 Dan Murphy        2020-07-16  167  	struct led_classdev *le=
d_cdev;
0e2023463a3c941 Milo(Woogyom  Kim 2013-02-05  168) 	char name[32];
92a81562e695628 Dan Murphy        2020-07-16  169  	int i, j =3D 0;
0e2023463a3c941 Milo(Woogyom  Kim 2013-02-05  170) 	int ret;
0e2023463a3c941 Milo(Woogyom  Kim 2013-02-05  171) =

0e2023463a3c941 Milo(Woogyom  Kim 2013-02-05  172) 	if (chan >=3D max_chann=
el) {
0e2023463a3c941 Milo(Woogyom  Kim 2013-02-05  173) 		dev_err(dev, "invalid =
channel: %d / %d\n", chan, max_channel);
0e2023463a3c941 Milo(Woogyom  Kim 2013-02-05  174) 		return -EINVAL;
0e2023463a3c941 Milo(Woogyom  Kim 2013-02-05  175) 	}
0e2023463a3c941 Milo(Woogyom  Kim 2013-02-05  176) =

0e2023463a3c941 Milo(Woogyom  Kim 2013-02-05  177) 	if (pdata->led_config[c=
han].led_current =3D=3D 0)
0e2023463a3c941 Milo(Woogyom  Kim 2013-02-05  178) 		return 0;
0e2023463a3c941 Milo(Woogyom  Kim 2013-02-05  179) =

92a81562e695628 Dan Murphy        2020-07-16  180  	if (pdata->led_config[c=
han].name) {
92a81562e695628 Dan Murphy        2020-07-16  181  		led->cdev.name =3D pda=
ta->led_config[chan].name;
92a81562e695628 Dan Murphy        2020-07-16  182  	} else {
92a81562e695628 Dan Murphy        2020-07-16  183  		snprintf(name, sizeof(=
name), "%s:channel%d",
92a81562e695628 Dan Murphy        2020-07-16  184  			pdata->label ? : chip=
->cl->name, chan);
92a81562e695628 Dan Murphy        2020-07-16  185  		led->cdev.name =3D nam=
e;
92a81562e695628 Dan Murphy        2020-07-16  186  	}
92a81562e695628 Dan Murphy        2020-07-16  187  =

92a81562e695628 Dan Murphy        2020-07-16  188  	if (pdata->led_config[c=
han].num_colors > 1) {
92a81562e695628 Dan Murphy        2020-07-16  189  		mc_led_info =3D devm_k=
calloc(dev,
92a81562e695628 Dan Murphy        2020-07-16  190  					   pdata->led_confi=
g[chan].num_colors,
92a81562e695628 Dan Murphy        2020-07-16  191  					   sizeof(*mc_led_i=
nfo), GFP_KERNEL);
92a81562e695628 Dan Murphy        2020-07-16  192  		if (!mc_led_info)
92a81562e695628 Dan Murphy        2020-07-16  193  			return -ENOMEM;
92a81562e695628 Dan Murphy        2020-07-16  194  =

92a81562e695628 Dan Murphy        2020-07-16  195  		led_cdev =3D &led->mc_=
cdev.led_cdev;
92a81562e695628 Dan Murphy        2020-07-16  196  		led_cdev->name =3D led=
->cdev.name;
92a81562e695628 Dan Murphy        2020-07-16  197  		led_cdev->brightness_s=
et_blocking =3D lp55xx_set_mc_brightness;
92a81562e695628 Dan Murphy        2020-07-16  198  		led->mc_cdev.num_color=
s =3D pdata->led_config[chan].num_colors;
92a81562e695628 Dan Murphy        2020-07-16  199  		for (i =3D 0; i < led-=
>mc_cdev.num_colors; i++) {
92a81562e695628 Dan Murphy        2020-07-16  200  			mc_led_info[i].color_=
index =3D
92a81562e695628 Dan Murphy        2020-07-16  201  				pdata->led_config[ch=
an].color_id[i];
92a81562e695628 Dan Murphy        2020-07-16  202  			mc_led_info[i].channe=
l =3D
92a81562e695628 Dan Murphy        2020-07-16  203  					pdata->led_config[c=
han].output_num[i];
92a81562e695628 Dan Murphy        2020-07-16 @204  			j++;
92a81562e695628 Dan Murphy        2020-07-16  205  		}
92a81562e695628 Dan Murphy        2020-07-16  206  =

92a81562e695628 Dan Murphy        2020-07-16  207  		led->mc_cdev.subled_in=
fo =3D mc_led_info;
92a81562e695628 Dan Murphy        2020-07-16  208  	} else {
92a81562e695628 Dan Murphy        2020-07-16  209  		led->cdev.brightness_s=
et_blocking =3D lp55xx_set_brightness;
92a81562e695628 Dan Murphy        2020-07-16  210  	}
92a81562e695628 Dan Murphy        2020-07-16  211  =

92a81562e695628 Dan Murphy        2020-07-16  212  	led->cdev.groups =3D lp=
55xx_led_groups;
92a81562e695628 Dan Murphy        2020-07-16  213  	led->cdev.default_trigg=
er =3D pdata->led_config[chan].default_trigger;
0e2023463a3c941 Milo(Woogyom  Kim 2013-02-05  214) 	led->led_current =3D pd=
ata->led_config[chan].led_current;
0e2023463a3c941 Milo(Woogyom  Kim 2013-02-05  215) 	led->max_current =3D pd=
ata->led_config[chan].max_current;
0e2023463a3c941 Milo(Woogyom  Kim 2013-02-05  216) 	led->chan_nr =3D pdata-=
>led_config[chan].chan_nr;
0e2023463a3c941 Milo(Woogyom  Kim 2013-02-05  217) =

0e2023463a3c941 Milo(Woogyom  Kim 2013-02-05  218) 	if (led->chan_nr >=3D m=
ax_channel) {
0e2023463a3c941 Milo(Woogyom  Kim 2013-02-05  219) 		dev_err(dev, "Use chan=
nel numbers between 0 and %d\n",
0e2023463a3c941 Milo(Woogyom  Kim 2013-02-05  220) 			max_channel - 1);
0e2023463a3c941 Milo(Woogyom  Kim 2013-02-05  221) 		return -EINVAL;
0e2023463a3c941 Milo(Woogyom  Kim 2013-02-05  222) 	}
0e2023463a3c941 Milo(Woogyom  Kim 2013-02-05  223) =

92a81562e695628 Dan Murphy        2020-07-16  224  	if (pdata->led_config[c=
han].num_colors > 1)
92a81562e695628 Dan Murphy        2020-07-16  225  		ret =3D devm_led_class=
dev_multicolor_register(dev, &led->mc_cdev);
92a81562e695628 Dan Murphy        2020-07-16  226  	else
c732eaf01f9c213 Dan Murphy        2020-07-16  227  		ret =3D devm_led_class=
dev_register(dev, &led->cdev);
92a81562e695628 Dan Murphy        2020-07-16  228  =

0e2023463a3c941 Milo(Woogyom  Kim 2013-02-05  229) 	if (ret) {
0e2023463a3c941 Milo(Woogyom  Kim 2013-02-05  230) 		dev_err(dev, "led regi=
ster err: %d\n", ret);
0e2023463a3c941 Milo(Woogyom  Kim 2013-02-05  231) 		return ret;
0e2023463a3c941 Milo(Woogyom  Kim 2013-02-05  232) 	}
0e2023463a3c941 Milo(Woogyom  Kim 2013-02-05  233) =

9e9b3db1b2f725b Milo(Woogyom  Kim 2013-02-05  234) 	return 0;
9e9b3db1b2f725b Milo(Woogyom  Kim 2013-02-05  235) }
9e9b3db1b2f725b Milo(Woogyom  Kim 2013-02-05  236) =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5274256352422872488==--

