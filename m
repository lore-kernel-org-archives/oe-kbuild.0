Content-Type: multipart/mixed; boundary="===============8793788638515484456=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/arcnet/arcnet.c:1068:8: warning: union member 'Anonymous0::buf' is never used.
Date: Wed, 02 Sep 2020 23:24:17 +0800
Message-ID: <202009022348.oqNovkQ1%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8793788638515484456==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: "Uwe Kleine-K=C3=B6nig" <u.kleine-koenig@pengutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   9c7d619be5a002ea29c172df5e3c1227c22cbb41
commit: 02a07046834e64970f3bcd87a422ac2b0adb80de arcnet: provide a buffer b=
ig enough to actually receive packets
date:   11 months ago
:::::: branch date: 13 hours ago
:::::: commit date: 11 months ago
compiler: hppa-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> net/mac80211/mesh_plink.c:309:6: warning: Variable 'pos' is reassigned a=
 value before the old one has been used. 'break;' missing? [redundantAssign=
InSwitch]
    pos =3D skb_put(skb, 2 + ie_len);
        ^
   net/mac80211/mesh_plink.c:268:7: note: Variable 'pos' is reassigned a va=
lue before the old one has been used. 'break;' missing?
     pos =3D skb_put_zero(skb, 2);
         ^
   net/mac80211/mesh_plink.c:309:6: note: Variable 'pos' is reassigned a va=
lue before the old one has been used. 'break;' missing?
    pos =3D skb_put(skb, 2 + ie_len);
        ^
>> net/mac80211/mesh_plink.c:1049:10: warning: Variable 'event' is reassign=
ed a value before the old one has been used. [redundantAssignment]
      event =3D OPN_IGNR;
            ^
   net/mac80211/mesh_plink.c:1046:10: note: Variable 'event' is reassigned =
a value before the old one has been used.
      event =3D OPN_RJCT;
            ^
   net/mac80211/mesh_plink.c:1049:10: note: Variable 'event' is reassigned =
a value before the old one has been used.
      event =3D OPN_IGNR;
            ^
   net/mac80211/mesh_plink.c:1059:10: warning: Variable 'event' is reassign=
ed a value before the old one has been used. [redundantAssignment]
      event =3D CNF_IGNR;
            ^
   net/mac80211/mesh_plink.c:1055:10: note: Variable 'event' is reassigned =
a value before the old one has been used.
      event =3D CNF_RJCT;
            ^
   net/mac80211/mesh_plink.c:1059:10: note: Variable 'event' is reassigned =
a value before the old one has been used.
      event =3D CNF_IGNR;
            ^
>> drivers/net/arcnet/arcnet.c:1068:8: warning: union member 'Anonymous0::b=
uf' is never used. [unusedStructMember]
     char buf[512];
          ^
>> drivers/net/arcnet/arcnet.c:1068:8: warning: union member 'Anonymous2::b=
uf' is never used. [unusedStructMember]
     char buf[512];
          ^
--
>> net/mac80211/mesh_hwmp.c:511:14: warning: Variable 'fresh_info' is reass=
igned a value before the old one has been used. [redundantAssignment]
     fresh_info =3D false;
                ^
   net/mac80211/mesh_hwmp.c:437:14: note: Variable 'fresh_info' is reassign=
ed a value before the old one has been used.
     fresh_info =3D false;
                ^
   net/mac80211/mesh_hwmp.c:511:14: note: Variable 'fresh_info' is reassign=
ed a value before the old one has been used.
     fresh_info =3D false;
                ^
>> net/phonet/pn_netlink.c:34:6: warning: Variable 'err' is reassigned a va=
lue before the old one has been used. [redundantAssignment]
    err =3D fill_addr(skb, dev, addr, 0, 0, event);
        ^
   net/phonet/pn_netlink.c:28:0: note: Variable 'err' is reassigned a value=
 before the old one has been used.
    int err =3D -ENOBUFS;
   ^
   net/phonet/pn_netlink.c:34:6: note: Variable 'err' is reassigned a value=
 before the old one has been used.
    err =3D fill_addr(skb, dev, addr, 0, 0, event);
        ^
   net/phonet/pn_netlink.c:200:6: warning: Variable 'err' is reassigned a v=
alue before the old one has been used. [redundantAssignment]
    err =3D fill_route(skb, dev, dst, 0, 0, event);
        ^
   net/phonet/pn_netlink.c:194:0: note: Variable 'err' is reassigned a valu=
e before the old one has been used.
    int err =3D -ENOBUFS;
   ^
   net/phonet/pn_netlink.c:200:6: note: Variable 'err' is reassigned a valu=
e before the old one has been used.
    err =3D fill_route(skb, dev, dst, 0, 0, event);
        ^
--
>> drivers/net/ppp/pppox.c:82:6: warning: Variable 'rc' is reassigned a val=
ue before the old one has been used. [redundantAssignment]
     rc =3D -EINVAL;
        ^
   drivers/net/ppp/pppox.c:78:6: note: Variable 'rc' is reassigned a value =
before the old one has been used.
     rc =3D -ENOTCONN;
        ^
   drivers/net/ppp/pppox.c:82:6: note: Variable 'rc' is reassigned a value =
before the old one has been used.
     rc =3D -EINVAL;
        ^
   drivers/net/ppp/pppox.c:87:6: warning: Variable 'rc' is reassigned a val=
ue before the old one has been used. [redundantAssignment]
     rc =3D 0;
        ^
   drivers/net/ppp/pppox.c:82:6: note: Variable 'rc' is reassigned a value =
before the old one has been used.
     rc =3D -EINVAL;
        ^
   drivers/net/ppp/pppox.c:87:6: note: Variable 'rc' is reassigned a value =
before the old one has been used.
     rc =3D 0;
        ^
   drivers/net/ppp/pppox.c:122:5: warning: Variable 'rc' is reassigned a va=
lue before the old one has been used. [redundantAssignment]
    rc =3D -EPROTONOSUPPORT;
       ^
   drivers/net/ppp/pppox.c:117:0: note: Variable 'rc' is reassigned a value=
 before the old one has been used.
    int rc =3D -EPROTOTYPE;
   ^
   drivers/net/ppp/pppox.c:122:5: note: Variable 'rc' is reassigned a value=
 before the old one has been used.
    rc =3D -EPROTONOSUPPORT;
       ^
   drivers/net/ppp/pppox.c:129:5: warning: Variable 'rc' is reassigned a va=
lue before the old one has been used. [redundantAssignment]
    rc =3D pppox_protos[protocol]->create(net, sock, kern);
       ^
   drivers/net/ppp/pppox.c:122:5: note: Variable 'rc' is reassigned a value=
 before the old one has been used.
    rc =3D -EPROTONOSUPPORT;
       ^
   drivers/net/ppp/pppox.c:129:5: note: Variable 'rc' is reassigned a value=
 before the old one has been used.
    rc =3D pppox_protos[protocol]->create(net, sock, kern);
       ^
--
>> drivers/net/ppp/pppoe.c:630:8: warning: Variable 'error' is reassigned a=
 value before the old one has been used. [redundantAssignment]
    error =3D -EBUSY;
          ^
   drivers/net/ppp/pppoe.c:621:8: note: Variable 'error' is reassigned a va=
lue before the old one has been used.
    error =3D -EINVAL;
          ^
   drivers/net/ppp/pppoe.c:630:8: note: Variable 'error' is reassigned a va=
lue before the old one has been used.
    error =3D -EBUSY;
          ^
   drivers/net/ppp/pppoe.c:636:8: warning: Variable 'error' is reassigned a=
 value before the old one has been used. [redundantAssignment]
    error =3D -EALREADY;
          ^
   drivers/net/ppp/pppoe.c:630:8: note: Variable 'error' is reassigned a va=
lue before the old one has been used.
    error =3D -EBUSY;
          ^
   drivers/net/ppp/pppoe.c:636:8: note: Variable 'error' is reassigned a va=
lue before the old one has been used.
    error =3D -EALREADY;
          ^
   drivers/net/ppp/pppoe.c:641:8: warning: Variable 'error' is reassigned a=
 value before the old one has been used. [redundantAssignment]
    error =3D 0;
          ^
   drivers/net/ppp/pppoe.c:636:8: note: Variable 'error' is reassigned a va=
lue before the old one has been used.
    error =3D -EALREADY;
          ^
   drivers/net/ppp/pppoe.c:641:8: note: Variable 'error' is reassigned a va=
lue before the old one has been used.
    error =3D 0;
          ^
   drivers/net/ppp/pppoe.c:684:9: warning: Variable 'error' is reassigned a=
 value before the old one has been used. [redundantAssignment]
     error =3D __set_item(pn, po);
           ^
   drivers/net/ppp/pppoe.c:666:9: note: Variable 'error' is reassigned a va=
lue before the old one has been used.
     error =3D -ENODEV;
           ^
   drivers/net/ppp/pppoe.c:684:9: note: Variable 'error' is reassigned a va=
lue before the old one has been used.
     error =3D __set_item(pn, po);
           ^
>> drivers/net/ppp/pppoe.c:749:7: warning: Variable 'err' is reassigned a v=
alue before the old one has been used. [redundantAssignment]
     err =3D -EFAULT;
         ^
   drivers/net/ppp/pppoe.c:745:7: note: Variable 'err' is reassigned a valu=
e before the old one has been used.
     err =3D -ENXIO;
         ^
   drivers/net/ppp/pppoe.c:749:7: note: Variable 'err' is reassigned a valu=
e before the old one has been used.
     err =3D -EFAULT;
         ^
   drivers/net/ppp/pppoe.c:755:7: warning: Variable 'err' is reassigned a v=
alue before the old one has been used. [redundantAssignment]
     err =3D 0;
         ^
   drivers/net/ppp/pppoe.c:749:7: note: Variable 'err' is reassigned a valu=
e before the old one has been used.
     err =3D -EFAULT;
         ^
   drivers/net/ppp/pppoe.c:755:7: note: Variable 'err' is reassigned a valu=
e before the old one has been used.
     err =3D 0;
         ^
   drivers/net/ppp/pppoe.c:763:7: warning: Variable 'err' is reassigned a v=
alue before the old one has been used. [redundantAssignment]
     err =3D -EFAULT;
         ^
   drivers/net/ppp/pppoe.c:759:7: note: Variable 'err' is reassigned a valu=
e before the old one has been used.
     err =3D -ENXIO;
         ^
   drivers/net/ppp/pppoe.c:763:7: note: Variable 'err' is reassigned a valu=
e before the old one has been used.
     err =3D -EFAULT;
         ^
   drivers/net/ppp/pppoe.c:770:8: warning: Variable 'err' is reassigned a v=
alue before the old one has been used. [redundantAssignment]
      err =3D 0;
          ^
   drivers/net/ppp/pppoe.c:763:7: note: Variable 'err' is reassigned a valu=
e before the old one has been used.
     err =3D -EFAULT;
         ^
   drivers/net/ppp/pppoe.c:770:8: note: Variable 'err' is reassigned a valu=
e before the old one has been used.
      err =3D 0;
          ^
   drivers/net/ppp/pppoe.c:779:7: warning: Variable 'err' is reassigned a v=
alue before the old one has been used. [redundantAssignment]
     err =3D 0;
         ^
   drivers/net/ppp/pppoe.c:776:7: note: Variable 'err' is reassigned a valu=
e before the old one has been used.
     err =3D -EFAULT;
         ^
   drivers/net/ppp/pppoe.c:779:7: note: Variable 'err' is reassigned a valu=
e before the old one has been used.
     err =3D 0;
         ^
   drivers/net/ppp/pppoe.c:790:7: warning: Variable 'err' is reassigned a v=
alue before the old one has been used. [redundantAssignment]
     err =3D -ENOTCONN;
         ^
   drivers/net/ppp/pppoe.c:786:7: note: Variable 'err' is reassigned a valu=
e before the old one has been used.
     err =3D -EBUSY;
         ^
   drivers/net/ppp/pppoe.c:790:7: note: Variable 'err' is reassigned a valu=
e before the old one has been used.
     err =3D -ENOTCONN;
         ^
   drivers/net/ppp/pppoe.c:796:7: warning: Variable 'err' is reassigned a v=
alue before the old one has been used. [redundantAssignment]
     err =3D -EFAULT;
         ^
   drivers/net/ppp/pppoe.c:790:7: note: Variable 'err' is reassigned a valu=
e before the old one has been used.
     err =3D -ENOTCONN;
         ^
   drivers/net/ppp/pppoe.c:796:7: note: Variable 'err' is reassigned a valu=
e before the old one has been used.
     err =3D -EFAULT;
         ^
   drivers/net/ppp/pppoe.c:802:7: warning: Variable 'err' is reassigned a v=
alue before the old one has been used. [redundantAssignment]
     err =3D -EINVAL;
         ^
   drivers/net/ppp/pppoe.c:796:7: note: Variable 'err' is reassigned a valu=
e before the old one has been used.
     err =3D -EFAULT;
         ^
   drivers/net/ppp/pppoe.c:802:7: note: Variable 'err' is reassigned a valu=
e before the old one has been used.
     err =3D -EINVAL;
         ^
   drivers/net/ppp/pppoe.c:815:7: warning: Variable 'err' is reassigned a v=
alue before the old one has been used. [redundantAssignment]
     err =3D 0;
         ^
   drivers/net/ppp/pppoe.c:802:7: note: Variable 'err' is reassigned a valu=
e before the old one has been used.
     err =3D -EINVAL;
         ^
   drivers/net/ppp/pppoe.c:815:7: note: Variable 'err' is reassigned a valu=
e before the old one has been used.
     err =3D 0;
         ^
   drivers/net/ppp/pppoe.c:825:7: warning: Variable 'err' is reassigned a v=
alue before the old one has been used. [redundantAssignment]
     err =3D 0;
         ^
   drivers/net/ppp/pppoe.c:820:7: note: Variable 'err' is reassigned a valu=
e before the old one has been used.
     err =3D -EALREADY;
         ^
   drivers/net/ppp/pppoe.c:825:7: note: Variable 'err' is reassigned a valu=
e before the old one has been used.
     err =3D 0;
         ^
   drivers/net/ppp/pppoe.c:885:8: warning: Variable 'error' is reassigned a=
 value before the old one has been used. [redundantAssignment]
    error =3D memcpy_from_msg(start, m, total_len);
          ^
   drivers/net/ppp/pppoe.c:861:8: note: Variable 'error' is reassigned a va=
lue before the old one has been used.
    error =3D -EMSGSIZE;
          ^
   drivers/net/ppp/pppoe.c:885:8: note: Variable 'error' is reassigned a va=
lue before the old one has been used.
    error =3D memcpy_from_msg(start, m, total_len);
          ^
>> drivers/net/slip/slip.c:191:6: warning: Variable 'err' is reassigned a v=
alue before the old one has been used. [redundantAssignment]
    err =3D 0;
        ^
   drivers/net/slip/slip.c:131:0: note: Variable 'err' is reassigned a valu=
e before the old one has been used.
    int err =3D -ENOBUFS;
   ^
   drivers/net/slip/slip.c:191:6: note: Variable 'err' is reassigned a valu=
e before the old one has been used.
    err =3D 0;
        ^
   drivers/net/slip/slip.c:290:6: warning: Variable 'err' is reassigned a v=
alue before the old one has been used. [redundantAssignment]
    err =3D 0;
        ^
   drivers/net/slip/slip.c:259:6: note: Variable 'err' is reassigned a valu=
e before the old one has been used.
    err =3D -ENODEV;
        ^
   drivers/net/slip/slip.c:290:6: note: Variable 'err' is reassigned a valu=
e before the old one has been used.
    err =3D 0;
        ^
   drivers/net/slip/slip.c:811:6: warning: Variable 'err' is reassigned a v=
alue before the old one has been used. [redundantAssignment]
    err =3D -ENFILE;
        ^
   drivers/net/slip/slip.c:805:6: note: Variable 'err' is reassigned a valu=
e before the old one has been used.
    err =3D -EEXIST;
        ^
   drivers/net/slip/slip.c:811:6: note: Variable 'err' is reassigned a valu=
e before the old one has been used.
    err =3D -ENFILE;
        ^
>> drivers/net/wireless/broadcom/b43/sysfs.c:32:6: warning: Variable 'ret' =
is reassigned a value before the old one has been used. [redundantAssignmen=
t]
    ret =3D simple_strtol(tmp, NULL, 10);
        ^
   drivers/net/wireless/broadcom/b43/sysfs.c:26:0: note: Variable 'ret' is =
reassigned a value before the old one has been used.
    int ret =3D -EINVAL;
   ^
   drivers/net/wireless/broadcom/b43/sysfs.c:32:6: note: Variable 'ret' is =
reassigned a value before the old one has been used.
    ret =3D simple_strtol(tmp, NULL, 10);
        ^
--
>> net/llc/llc_if.c:50:5: warning: Variable 'rc' is reassigned a value befo=
re the old one has been used. [redundantAssignment]
    rc =3D -EBUSY;
       ^
   net/llc/llc_if.c:45:0: note: Variable 'rc' is reassigned a value before =
the old one has been used.
    int rc =3D -ECONNABORTED;
   ^
   net/llc/llc_if.c:50:5: note: Variable 'rc' is reassigned a value before =
the old one has been used.
    rc =3D -EBUSY;
       ^
   net/llc/llc_if.c:61:5: warning: Variable 'rc' is reassigned a value befo=
re the old one has been used. [redundantAssignment]
    rc =3D llc_conn_state_process(sk, skb);
       ^
   net/llc/llc_if.c:50:5: note: Variable 'rc' is reassigned a value before =
the old one has been used.
    rc =3D -EBUSY;
       ^
   net/llc/llc_if.c:61:5: note: Variable 'rc' is reassigned a value before =
the old one has been used.
    rc =3D llc_conn_state_process(sk, skb);
       ^
   net/llc/llc_if.c:100:5: warning: Variable 'rc' is reassigned a value bef=
ore the old one has been used. [redundantAssignment]
    rc =3D -ENOMEM;
       ^
   net/llc/llc_if.c:81:0: note: Variable 'rc' is reassigned a value before =
the old one has been used.
    int rc =3D -EISCONN;
   ^
   net/llc/llc_if.c:100:5: note: Variable 'rc' is reassigned a value before=
 the old one has been used.
    rc =3D -ENOMEM;
       ^
--
>> drivers/net/veth.c:1127:18: warning: Boolean result is used in bitwise o=
peration. Clarify expression with parentheses. [clarifyCondition]
    if ((!!old_prog ^ !!prog) && peer)
                    ^
>> drivers/net/veth.c:126:5: warning: %u in format string (no. 1) requires =
'unsigned int' but the argument type is 'signed int'. [invalidPrintfArgType=
_uint]
       snprintf(p, ETH_GSTRING_LEN,
       ^
>> drivers/net/wireless/broadcom/b43/xmit.c:439:26: warning: Local variable=
 uninitialized_var shadows outer variable [shadowVar]
      struct ieee80211_cts *uninitialized_var(cts);
                            ^
   drivers/net/wireless/broadcom/b43/xmit.c:425:25: note: Shadowed declarat=
ion
     struct ieee80211_hdr *uninitialized_var(hdr);
                           ^
   drivers/net/wireless/broadcom/b43/xmit.c:439:26: note: Shadow variable
      struct ieee80211_cts *uninitialized_var(cts);
                            ^
   drivers/net/wireless/broadcom/b43/xmit.c:461:26: warning: Local variable=
 uninitialized_var shadows outer variable [shadowVar]
      struct ieee80211_rts *uninitialized_var(rts);
                            ^
   drivers/net/wireless/broadcom/b43/xmit.c:425:25: note: Shadowed declarat=
ion
     struct ieee80211_hdr *uninitialized_var(hdr);
                           ^
   drivers/net/wireless/broadcom/b43/xmit.c:461:26: note: Shadow variable
      struct ieee80211_rts *uninitialized_var(rts);
                            ^
--
>> net/llc/llc_c_ev.c:94:5: warning: Variable 'rc' is reassigned a value be=
fore the old one has been used. [redundantAssignment]
    rc =3D !llc_circular_between(nr1, nr, (nr2 + 1) % LLC_2_SEQ_NBR_MODULO);
       ^
   net/llc/llc_c_ev.c:85:5: note: Variable 'rc' is reassigned a value befor=
e the old one has been used.
    rc =3D 1;
       ^
   net/llc/llc_c_ev.c:94:5: note: Variable 'rc' is reassigned a value befor=
e the old one has been used.
    rc =3D !llc_circular_between(nr1, nr, (nr2 + 1) % LLC_2_SEQ_NBR_MODULO);
       ^
--
>> drivers/net/wireless/broadcom/b43legacy/sysfs.c:34:6: warning: Variable =
'ret' is reassigned a value before the old one has been used. [redundantAss=
ignment]
    ret =3D simple_strtol(tmp, NULL, 10);
        ^
   drivers/net/wireless/broadcom/b43legacy/sysfs.c:28:0: note: Variable 're=
t' is reassigned a value before the old one has been used.
    int ret =3D -EINVAL;
   ^
   drivers/net/wireless/broadcom/b43legacy/sysfs.c:34:6: note: Variable 're=
t' is reassigned a value before the old one has been used.
    ret =3D simple_strtol(tmp, NULL, 10);
        ^
--
>> drivers/net/wireless/intersil/p54/eeprom.c:167:6: warning: Variable 'ret=
' is reassigned a value before the old one has been used. [redundantAssignm=
ent]
    ret =3D p54_fill_band_bitrates(dev, tmp, band);
        ^
   drivers/net/wireless/intersil/p54/eeprom.c:152:0: note: Variable 'ret' i=
s reassigned a value before the old one has been used.
    int ret =3D -ENOMEM;
   ^
   drivers/net/wireless/intersil/p54/eeprom.c:167:6: note: Variable 'ret' i=
s reassigned a value before the old one has been used.
    ret =3D p54_fill_band_bitrates(dev, tmp, band);
        ^
   drivers/net/wireless/intersil/p54/eeprom.c:976:6: warning: Variable 'ret=
' is reassigned a value before the old one has been used. [redundantAssignm=
ent]
    ret =3D p54_parse_eeprom(dev, eeprom, offset);
        ^
   drivers/net/wireless/intersil/p54/eeprom.c:952:0: note: Variable 'ret' i=
s reassigned a value before the old one has been used.
    int ret =3D -ENOMEM;
   ^
   drivers/net/wireless/intersil/p54/eeprom.c:976:6: note: Variable 'ret' i=
s reassigned a value before the old one has been used.
    ret =3D p54_parse_eeprom(dev, eeprom, offset);
        ^
>> drivers/net/wireless/intersil/p54/eeprom.c:476:35: warning: Variable 'ds=
t' is not assigned a value. [unassignedVariable]
    struct p54_pa_curve_data_sample *dst;
                                     ^
>> drivers/net/wireless/intersil/p54/eeprom.c:477:40: warning: Variable 'sr=
c' is not assigned a value. [unassignedVariable]
    struct pda_pa_curve_data_sample_rev1 *src;
                                          ^
>> drivers/net/wireless/rsi/rsi_91x_main.c:356:24: warning: Variable 'adapt=
er->device_model' is reassigned a value before the old one has been used. '=
break;' missing? [redundantAssignInSwitch]
    adapter->device_model =3D RSI_DEV_9113;
                          ^
   drivers/net/wireless/rsi/rsi_91x_main.c:329:24: note: Variable 'adapter-=
>device_model' is reassigned a value before the old one has been used. 'bre=
ak;' missing?
    adapter->device_model =3D RSI_DEV_9113;
                          ^
   drivers/net/wireless/rsi/rsi_91x_main.c:356:24: note: Variable 'adapter-=
>device_model' is reassigned a value before the old one has been used. 'bre=
ak;' missing?
    adapter->device_model =3D RSI_DEV_9113;
                          ^
--
>> drivers/net/wireless/rsi/rsi_91x_core.c:185:18: warning: Variable 'recon=
tend_queue' is reassigned a value before the old one has been used. [redund=
antAssignment]
    recontend_queue =3D rsi_recalculate_weights(common);
                    ^
   drivers/net/wireless/rsi/rsi_91x_core.c:164:18: note: Variable 'reconten=
d_queue' is reassigned a value before the old one has been used.
    recontend_queue =3D false;
                    ^
   drivers/net/wireless/rsi/rsi_91x_core.c:185:18: note: Variable 'reconten=
d_queue' is reassigned a value before the old one has been used.
    recontend_queue =3D rsi_recalculate_weights(common);
                    ^
>> drivers/net/wireless/rsi/rsi_91x_mac80211.c:1139:20: warning: Array 'com=
mon->vif_info[3]' accessed at index 3, which is out of bounds. [arrayIndexO=
utOfBounds]
      common->vif_info[ii].seq_start =3D seq_no;
                      ^
   drivers/net/wireless/rsi/rsi_91x_mac80211.c:1092:2: note: After for loop=
, ii has value 3
    for (ii =3D 0; ii < RSI_MAX_VIFS; ii++) {
    ^
   drivers/net/wireless/rsi/rsi_91x_mac80211.c:1139:20: note: Array index o=
ut of bounds
      common->vif_info[ii].seq_start =3D seq_no;
                      ^
>> drivers/net/wireless/rsi/rsi_91x_mac80211.c:613:9: warning: Variable 'st=
atus' is reassigned a value before the old one has been used. [redundantAss=
ignment]
    status =3D rsi_band_check(common, curchan);
           ^
   drivers/net/wireless/rsi/rsi_91x_mac80211.c:579:0: note: Variable 'statu=
s' is reassigned a value before the old one has been used.
    int status =3D -EOPNOTSUPP;
   ^
   drivers/net/wireless/rsi/rsi_91x_mac80211.c:613:9: note: Variable 'statu=
s' is reassigned a value before the old one has been used.
    status =3D rsi_band_check(common, curchan);
           ^
>> drivers/net/wireless/rsi/rsi_91x_mac80211.c:1139:12: warning: Array 'com=
mon.vif_info[3]' accessed at index 3, which is out of bounds. [arrayIndexOu=
tOfBounds]
      common->vif_info[ii].seq_start =3D seq_no;
              ^
--
>> net/llc/af_llc.c:272:5: warning: Variable 'rc' is reassigned a value bef=
ore the old one has been used. [redundantAssignment]
    rc =3D -ENODEV;
       ^
   net/llc/af_llc.c:268:0: note: Variable 'rc' is reassigned a value before=
 the old one has been used.
    int rc =3D -EINVAL;
   ^
   net/llc/af_llc.c:272:5: note: Variable 'rc' is reassigned a value before=
 the old one has been used.
    rc =3D -ENODEV;
       ^
   net/llc/af_llc.c:283:5: warning: Variable 'rc' is reassigned a value bef=
ore the old one has been used. [redundantAssignment]
    rc =3D -EUSERS;
       ^
   net/llc/af_llc.c:272:5: note: Variable 'rc' is reassigned a value before=
 the old one has been used.
    rc =3D -ENODEV;
       ^
   net/llc/af_llc.c:283:5: note: Variable 'rc' is reassigned a value before=
 the old one has been used.
    rc =3D -EUSERS;
       ^
   net/llc/af_llc.c:287:5: warning: Variable 'rc' is reassigned a value bef=
ore the old one has been used. [redundantAssignment]
    rc =3D -EBUSY; /* some other network layer is using the sap */
       ^
   net/llc/af_llc.c:283:5: note: Variable 'rc' is reassigned a value before=
 the old one has been used.
    rc =3D -EUSERS;
       ^
   net/llc/af_llc.c:287:5: note: Variable 'rc' is reassigned a value before=
 the old one has been used.
    rc =3D -EBUSY; /* some other network layer is using the sap */
       ^
   net/llc/af_llc.c:296:5: warning: Variable 'rc' is reassigned a value bef=
ore the old one has been used. [redundantAssignment]
    rc =3D 0;
       ^
   net/llc/af_llc.c:287:5: note: Variable 'rc' is reassigned a value before=
 the old one has been used.
    rc =3D -EBUSY; /* some other network layer is using the sap */
       ^
   net/llc/af_llc.c:296:5: note: Variable 'rc' is reassigned a value before=
 the old one has been used.
    rc =3D 0;
       ^
   net/llc/af_llc.c:326:5: warning: Variable 'rc' is reassigned a value bef=
ore the old one has been used. [redundantAssignment]
    rc =3D -EAFNOSUPPORT;
       ^
   net/llc/af_llc.c:321:0: note: Variable 'rc' is reassigned a value before=
 the old one has been used.
    int rc =3D -EINVAL;
   ^
   net/llc/af_llc.c:326:5: note: Variable 'rc' is reassigned a value before=
 the old one has been used.
    rc =3D -EAFNOSUPPORT;
       ^
   net/llc/af_llc.c:330:5: warning: Variable 'rc' is reassigned a value bef=
ore the old one has been used. [redundantAssignment]
    rc =3D -ENODEV;
       ^
   net/llc/af_llc.c:326:5: note: Variable 'rc' is reassigned a value before=
 the old one has been used.
    rc =3D -EAFNOSUPPORT;
       ^
   net/llc/af_llc.c:330:5: note: Variable 'rc' is reassigned a value before=
 the old one has been used.
    rc =3D -ENODEV;
       ^
   net/llc/af_llc.c:364:6: warning: Variable 'rc' is reassigned a value bef=
ore the old one has been used. [redundantAssignment]
     rc =3D -EBUSY; /* some other network layer is using the sap */
        ^
   net/llc/af_llc.c:330:5: note: Variable 'rc' is reassigned a value before=
 the old one has been used.
    rc =3D -ENODEV;
       ^
   net/llc/af_llc.c:364:6: note: Variable 'rc' is reassigned a value before=
 the old one has been used.
     rc =3D -EBUSY; /* some other network layer is using the sap */
        ^
   net/llc/af_llc.c:364:6: warning: Variable 'rc' is reassigned a value bef=
ore the old one has been used. [redundantAssignment]
     rc =3D -EBUSY; /* some other network layer is using the sap */
        ^
   net/llc/af_llc.c:343:8: note: Variable 'rc' is reassigned a value before=
 the old one has been used.
       rc =3D -EINVAL;
          ^
   net/llc/af_llc.c:364:6: note: Variable 'rc' is reassigned a value before=
 the old one has been used.
     rc =3D -EBUSY; /* some other network layer is using the sap */
        ^
   net/llc/af_llc.c:364:6: warning: Variable 'rc' is reassigned a value bef=
ore the old one has been used. [redundantAssignment]
     rc =3D -EBUSY; /* some other network layer is using the sap */
        ^
   net/llc/af_llc.c:356:6: note: Variable 'rc' is reassigned a value before=
 the old one has been used.
     rc =3D -EUSERS;
        ^
   net/llc/af_llc.c:364:6: note: Variable 'rc' is reassigned a value before=
 the old one has been used.
     rc =3D -EBUSY; /* some other network layer is using the sap */
        ^
   net/llc/af_llc.c:392:5: warning: Variable 'rc' is reassigned a value bef=
ore the old one has been used. [redundantAssignment]
    rc =3D 0;
       ^
   net/llc/af_llc.c:364:6: note: Variable 'rc' is reassigned a value before=
 the old one has been used.
     rc =3D -EBUSY; /* some other network layer is using the sap */
        ^
   net/llc/af_llc.c:392:5: note: Variable 'rc' is reassigned a value before=
 the old one has been used.
    rc =3D 0;
       ^
   net/llc/af_llc.c:392:5: warning: Variable 'rc' is reassigned a value bef=
ore the old one has been used. [redundantAssignment]
    rc =3D 0;
       ^
   net/llc/af_llc.c:379:6: note: Variable 'rc' is reassigned a value before=
 the old one has been used.
     rc =3D -EADDRINUSE; /* mac + sap clash. */
        ^
   net/llc/af_llc.c:392:5: note: Variable 'rc' is reassigned a value before=
 the old one has been used.
    rc =3D 0;
       ^
   net/llc/af_llc.c:419:5: warning: Variable 'rc' is reassigned a value bef=
ore the old one has been used. [redundantAssignment]
    rc =3D -EINVAL;
       ^
   net/llc/af_llc.c:414:0: note: Variable 'rc' is reassigned a value before=
 the old one has been used.
    int rc =3D -ENOTCONN;
   ^
   net/llc/af_llc.c:419:5: note: Variable 'rc' is reassigned a value before=
 the old one has been used.
    rc =3D -EINVAL;
       ^
   net/llc/af_llc.c:422:5: warning: Variable 'rc' is reassigned a value bef=
ore the old one has been used. [redundantAssignment]
    rc =3D llc_send_disc(sk);
       ^
   net/llc/af_llc.c:419:5: note: Variable 'rc' is reassigned a value before=
 the old one has been used.
    rc =3D -EINVAL;
       ^
   net/llc/af_llc.c:422:5: note: Variable 'rc' is reassigned a value before=
 the old one has been used.
    rc =3D llc_send_disc(sk);
       ^
   net/llc/af_llc.c:457:5: warning: Variable 'rc' is reassigned a value bef=
ore the old one has been used. [redundantAssignment]
    rc =3D -EAFNOSUPPORT;
       ^
   net/llc/af_llc.c:452:0: note: Variable 'rc' is reassigned a value before=
 the old one has been used.
    int rc =3D -EINVAL;
   ^
   net/llc/af_llc.c:457:5: note: Variable 'rc' is reassigned a value before=
 the old one has been used.
    rc =3D -EAFNOSUPPORT;
       ^
   net/llc/af_llc.c:462:5: warning: Variable 'rc' is reassigned a value bef=
ore the old one has been used. [redundantAssignment]
    rc =3D -EALREADY;
       ^
   net/llc/af_llc.c:457:5: note: Variable 'rc' is reassigned a value before=
 the old one has been used.
    rc =3D -EAFNOSUPPORT;
       ^
   net/llc/af_llc.c:462:5: note: Variable 'rc' is reassigned a value before=
 the old one has been used.
    rc =3D -EALREADY;
       ^
   net/llc/af_llc.c:477:5: warning: Variable 'rc' is reassigned a value bef=
ore the old one has been used. [redundantAssignment]
    rc =3D llc_establish_connection(sk, llc->dev->dev_addr,
       ^
   net/llc/af_llc.c:462:5: note: Variable 'rc' is reassigned a value before=
 the old one has been used.
    rc =3D -EALREADY;
       ^
   net/llc/af_llc.c:477:5: note: Variable 'rc' is reassigned a value before=
 the old one has been used.
    rc =3D llc_establish_connection(sk, llc->dev->dev_addr,
       ^
>> net/llc/af_llc.c:500:14: warning: Variable 'sock->state' is reassigned a=
 value before the old one has been used. [redundantAssignment]
    sock->state =3D SS_CONNECTED;
                ^
   net/llc/af_llc.c:474:14: note: Variable 'sock->state' is reassigned a va=
lue before the old one has been used.
    sock->state =3D SS_CONNECTING;
                ^
   net/llc/af_llc.c:500:14: note: Variable 'sock->state' is reassigned a va=
lue before the old one has been used.
    sock->state =3D SS_CONNECTED;
                ^
   net/llc/af_llc.c:501:5: warning: Variable 'rc' is reassigned a value bef=
ore the old one has been used. [redundantAssignment]
    rc =3D 0;
       ^
   net/llc/af_llc.c:492:6: note: Variable 'rc' is reassigned a value before=
 the old one has been used.
     rc =3D sock_intr_errno(timeo);
        ^
   net/llc/af_llc.c:501:5: note: Variable 'rc' is reassigned a value before=
 the old one has been used.
    rc =3D 0;
       ^
   net/llc/af_llc.c:527:5: warning: Variable 'rc' is reassigned a value bef=
ore the old one has been used. [redundantAssignment]
    rc =3D -EOPNOTSUPP;
       ^
   net/llc/af_llc.c:522:0: note: Variable 'rc' is reassigned a value before=
 the old one has been used.
    int rc =3D -EINVAL;
   ^
   net/llc/af_llc.c:527:5: note: Variable 'rc' is reassigned a value before=
 the old one has been used.
    rc =3D -EOPNOTSUPP;
       ^
   net/llc/af_llc.c:530:5: warning: Variable 'rc' is reassigned a value bef=
ore the old one has been used. [redundantAssignment]
    rc =3D -EAGAIN;
       ^
   net/llc/af_llc.c:527:5: note: Variable 'rc' is reassigned a value before=
 the old one has been used.
    rc =3D -EOPNOTSUPP;
       ^
   net/llc/af_llc.c:530:5: note: Variable 'rc' is reassigned a value before=
 the old one has been used.
    rc =3D -EAGAIN;
       ^
   net/llc/af_llc.c:533:5: warning: Variable 'rc' is reassigned a value bef=
ore the old one has been used. [redundantAssignment]
    rc =3D 0;
       ^
   net/llc/af_llc.c:530:5: note: Variable 'rc' is reassigned a value before=
 the old one has been used.
    rc =3D -EAGAIN;
       ^
   net/llc/af_llc.c:533:5: note: Variable 'rc' is reassigned a value before=
 the old one has been used.
    rc =3D 0;
       ^
   net/llc/af_llc.c:559:6: warning: Variable 'rc' is reassigned a value bef=
ore the old one has been used. [redundantAssignment]
     rc =3D -EAGAIN;
        ^
   net/llc/af_llc.c:556:6: note: Variable 'rc' is reassigned a value before=
 the old one has been used.
     rc =3D -ERESTARTSYS;
        ^
   net/llc/af_llc.c:559:6: note: Variable 'rc' is reassigned a value before=
 the old one has been used.
     rc =3D -EAGAIN;
        ^
   net/llc/af_llc.c:562:6: warning: Variable 'rc' is reassigned a value bef=
ore the old one has been used. [redundantAssignment]
     rc =3D 0;
        ^
   net/llc/af_llc.c:559:6: note: Variable 'rc' is reassigned a value before=
 the old one has been used.
     rc =3D -EAGAIN;
        ^
   net/llc/af_llc.c:562:6: note: Variable 'rc' is reassigned a value before=
 the old one has been used.
     rc =3D 0;
        ^
   net/llc/af_llc.c:601:6: warning: Variable 'rc' is reassigned a value bef=
ore the old one has been used. [redundantAssignment]
     rc =3D -EAGAIN;
        ^
   net/llc/af_llc.c:598:6: note: Variable 'rc' is reassigned a value before=
 the old one has been used.
     rc =3D -ERESTARTSYS;
        ^
   net/llc/af_llc.c:601:6: note: Variable 'rc' is reassigned a value before=
 the old one has been used.
     rc =3D -EAGAIN;
        ^
   net/llc/af_llc.c:626:6: warning: Variable 'rc' is reassigned a value bef=
ore the old one has been used. [redundantAssignment]
     rc =3D sock_intr_errno(timeo);
        ^
   net/llc/af_llc.c:623:6: note: Variable 'rc' is reassigned a value before=
 the old one has been used.
     rc =3D -EAGAIN;
        ^
   net/llc/af_llc.c:626:6: note: Variable 'rc' is reassigned a value before=
 the old one has been used.
     rc =3D sock_intr_errno(timeo);
        ^
   net/llc/af_llc.c:629:6: warning: Variable 'rc' is reassigned a value bef=
ore the old one has been used. [redundantAssignment]
     rc =3D 0;
        ^
   net/llc/af_llc.c:626:6: note: Variable 'rc' is reassigned a value before=
 the old one has been used.
     rc =3D sock_intr_errno(timeo);
        ^
   net/llc/af_llc.c:629:6: note: Variable 'rc' is reassigned a value before=
 the old one has been used.
     rc =3D 0;
        ^
   net/llc/af_llc.c:674:5: warning: Variable 'rc' is reassigned a value bef=
ore the old one has been used. [redundantAssignment]
    rc =3D -EINVAL;
       ^
   net/llc/af_llc.c:667:0: note: Variable 'rc' is reassigned a value before=
 the old one has been used.
    int rc =3D -EOPNOTSUPP;
   ^
   net/llc/af_llc.c:674:5: note: Variable 'rc' is reassigned a value before=
 the old one has been used.
    rc =3D -EINVAL;
       ^
   net/llc/af_llc.c:687:5: warning: Variable 'rc' is reassigned a value bef=
ore the old one has been used. [redundantAssignment]
    rc =3D -EINVAL;
       ^
   net/llc/af_llc.c:674:5: note: Variable 'rc' is reassigned a value before=
 the old one has been used.
    rc =3D -EINVAL;
       ^
   net/llc/af_llc.c:687:5: note: Variable 'rc' is reassigned a value before=
 the old one has been used.
    rc =3D -EINVAL;
       ^
   net/llc/af_llc.c:690:5: warning: Variable 'rc' is reassigned a value bef=
ore the old one has been used. [redundantAssignment]
    rc =3D 0;
       ^
   net/llc/af_llc.c:687:5: note: Variable 'rc' is reassigned a value before=
 the old one has been used.
    rc =3D -EINVAL;
       ^
   net/llc/af_llc.c:690:5: note: Variable 'rc' is reassigned a value before=
 the old one has been used.
    rc =3D 0;
       ^
>> net/llc/af_llc.c:753:9: warning: Variable 'copied' is reassigned a value=
 before the old one has been used. [redundantAssignment]
    copied =3D 0;
           ^
   net/llc/af_llc.c:740:9: note: Variable 'copied' is reassigned a value be=
fore the old one has been used.
    copied =3D -ENOTCONN;
           ^
   net/llc/af_llc.c:753:9: note: Variable 'copied' is reassigned a value be=
fore the old one has been used.
    copied =3D 0;
           ^
   net/llc/af_llc.c:929:5: warning: Variable 'rc' is reassigned a value bef=
ore the old one has been used. [redundantAssignment]
    rc =3D -EINVAL;
       ^
   net/llc/af_llc.c:904:0: note: Variable 'rc' is reassigned a value before=
 the old one has been used.
    int rc =3D -EINVAL, copied =3D 0, hdrlen;
   ^
   net/llc/af_llc.c:929:5: note: Variable 'rc' is reassigned a value before=
 the old one has been used.
    rc =3D -EINVAL;
       ^
   net/llc/af_llc.c:961:5: warning: Variable 'rc' is reassigned a value bef=
ore the old one has been used. [redundantAssignment]
    rc =3D llc_ui_send_data(sk, skb, noblock);
       ^
   net/llc/af_llc.c:958:5: note: Variable 'rc' is reassigned a value before=
 the old one has been used.
    rc =3D -ENOPROTOOPT;
       ^
   net/llc/af_llc.c:961:5: note: Variable 'rc' is reassigned a value before=
 the old one has been used.
    rc =3D llc_ui_send_data(sk, skb, noblock);
       ^
   net/llc/af_llc.c:995:6: warning: Variable 'rc' is reassigned a value bef=
ore the old one has been used. [redundantAssignment]
     rc =3D -ENOTCONN;
        ^
   net/llc/af_llc.c:988:0: note: Variable 'rc' is reassigned a value before=
 the old one has been used.
    int rc =3D -EBADF;
   ^
   net/llc/af_llc.c:995:6: note: Variable 'rc' is reassigned a value before=
 the old one has been used.
     rc =3D -ENOTCONN;
        ^
   net/llc/af_llc.c:1016:5: warning: Variable 'rc' is reassigned a value be=
fore the old one has been used. [redundantAssignment]
    rc =3D sizeof(sllc);
       ^
   net/llc/af_llc.c:995:6: note: Variable 'rc' is reassigned a value before=
 the old one has been used.
     rc =3D -ENOTCONN;
        ^
   net/llc/af_llc.c:1016:5: note: Variable 'rc' is reassigned a value befor=
e the old one has been used.
    rc =3D sizeof(sllc);
       ^
   net/llc/af_llc.c:1016:5: warning: Variable 'rc' is reassigned a value be=
fore the old one has been used. [redundantAssignment]
    rc =3D sizeof(sllc);
       ^
   net/llc/af_llc.c:1003:6: note: Variable 'rc' is reassigned a value befor=
e the old one has been used.
     rc =3D -EINVAL;
        ^
   net/llc/af_llc.c:1016:5: note: Variable 'rc' is reassigned a value befor=
e the old one has been used.
    rc =3D sizeof(sllc);
       ^
   net/llc/af_llc.c:1057:5: warning: Variable 'rc' is reassigned a value be=
fore the old one has been used. [redundantAssignment]
    rc =3D get_user(opt, (int __user *)optval);
       ^
   net/llc/af_llc.c:1052:0: note: Variable 'rc' is reassigned a value befor=
e the old one has been used.
    int rc =3D -EINVAL;
   ^
   net/llc/af_llc.c:1057:5: note: Variable 'rc' is reassigned a value befor=
e the old one has been used.
    rc =3D get_user(opt, (int __user *)optval);
       ^
>> net/llc/af_llc.c:1112:5: warning: Variable 'rc' is reassigned a value be=
fore the old one has been used. 'break;' missing? [redundantAssignInSwitch]
    rc =3D 0;
       ^
   net/llc/af_llc.c:1060:5: note: Variable 'rc' is reassigned a value befor=
e the old one has been used. 'break;' missing?
    rc =3D -EINVAL;
       ^
   net/llc/af_llc.c:1112:5: note: Variable 'rc' is reassigned a value befor=
e the old one has been used. 'break;' missing?
    rc =3D 0;
       ^
   net/llc/af_llc.c:1138:5: warning: Variable 'rc' is reassigned a value be=
fore the old one has been used. [redundantAssignment]
    rc =3D get_user(len, optlen);
       ^
   net/llc/af_llc.c:1133:0: note: Variable 'rc' is reassigned a value befor=
e the old one has been used.
    int val =3D 0, len =3D 0, rc =3D -EINVAL;
   ^
   net/llc/af_llc.c:1138:5: note: Variable 'rc' is reassigned a value befor=
e the old one has been used.
    rc =3D get_user(len, optlen);
       ^
   net/llc/af_llc.c:1168:5: warning: Variable 'rc' is reassigned a value be=
fore the old one has been used. 'break;' missing? [redundantAssignInSwitch]
    rc =3D 0;
       ^
   net/llc/af_llc.c:1141:5: note: Variable 'rc' is reassigned a value befor=
e the old one has been used. 'break;' missing?
    rc =3D -EINVAL;
       ^
   net/llc/af_llc.c:1168:5: note: Variable 'rc' is reassigned a value befor=
e the old one has been used. 'break;' missing?
    rc =3D 0;
       ^
>> drivers/net/wireless/rsi/rsi_91x_hal.c:314:9: warning: Variable 'status'=
 is reassigned a value before the old one has been used. [redundantAssignme=
nt]
    status =3D rsi_send_pkt_to_bus(common, skb);
           ^
   drivers/net/wireless/rsi/rsi_91x_hal.c:296:0: note: Variable 'status' is=
 reassigned a value before the old one has been used.
    int status =3D -EINVAL;
   ^
   drivers/net/wireless/rsi/rsi_91x_hal.c:314:9: note: Variable 'status' is=
 reassigned a value before the old one has been used.
    status =3D rsi_send_pkt_to_bus(common, skb);
           ^
   drivers/net/wireless/rsi/rsi_91x_hal.c:376:9: warning: Variable 'status'=
 is reassigned a value before the old one has been used. [redundantAssignme=
nt]
    status =3D rsi_send_pkt_to_bus(common, skb);
           ^
   drivers/net/wireless/rsi/rsi_91x_hal.c:342:0: note: Variable 'status' is=
 reassigned a value before the old one has been used.
    int status =3D -E2BIG;
   ^
   drivers/net/wireless/rsi/rsi_91x_hal.c:376:9: note: Variable 'status' is=
 reassigned a value before the old one has been used.
    status =3D rsi_send_pkt_to_bus(common, skb);
           ^
   drivers/net/wireless/rsi/rsi_91x_hal.c:412:9: warning: Variable 'status'=
 is reassigned a value before the old one has been used. [redundantAssignme=
nt]
    status =3D rsi_send_pkt_to_bus(common, skb);
           ^
   drivers/net/wireless/rsi/rsi_91x_hal.c:386:0: note: Variable 'status' is=
 reassigned a value before the old one has been used.
    int status =3D -EINVAL;
   ^
   drivers/net/wireless/rsi/rsi_91x_hal.c:412:9: note: Variable 'status' is=
 reassigned a value before the old one has been used.
    status =3D rsi_send_pkt_to_bus(common, skb);
           ^
>> drivers/net/wireless/rsi/rsi_91x_hal.c:589:31: warning: Shifting a negat=
ive value is technically undefined behaviour [shiftNegativeLHS]
           (cmd | REGOUT_INVALID << 8), 2);
                                 ^
   drivers/net/wireless/rsi/rsi_91x_hal.c:873:25: warning: Shifting a negat=
ive value is technically undefined behaviour [shiftNegativeLHS]
            REGOUT_INVALID << 8),
                           ^
--
>> net/atm/pppoatm.c:352:20: warning: Same value in both branches of ternar=
y operator. [duplicateValueTernary]
        ? DROP_PACKET : 1;
                      ^
--
>> net/bridge/br_mdb.c:428:6: warning: Variable 'err' is reassigned a value=
 before the old one has been used. [redundantAssignment]
    err =3D nlmsg_populate_mdb_fill(skb, dev, entry, 0, 0, type, NTF_SELF);
        ^
   net/bridge/br_mdb.c:396:0: note: Variable 'err' is reassigned a value be=
fore the old one has been used.
    int err =3D -ENOBUFS;
   ^
   net/bridge/br_mdb.c:428:6: note: Variable 'err' is reassigned a value be=
fore the old one has been used.
    err =3D nlmsg_populate_mdb_fill(skb, dev, entry, 0, 0, type, NTF_SELF);
        ^
   net/bridge/br_mdb.c:514:6: warning: Variable 'err' is reassigned a value=
 before the old one has been used. [redundantAssignment]
    err =3D nlmsg_populate_rtr_fill(skb, dev, ifindex, 0, 0, type, NTF_SELF=
);
        ^
   net/bridge/br_mdb.c:506:0: note: Variable 'err' is reassigned a value be=
fore the old one has been used.
    int err =3D -ENOBUFS;
   ^
   net/bridge/br_mdb.c:514:6: note: Variable 'err' is reassigned a value be=
fore the old one has been used.
    err =3D nlmsg_populate_rtr_fill(skb, dev, ifindex, 0, 0, type, NTF_SELF=
);
        ^
>> net/dcb/dcbnl.c:1735:29: warning: Either the condition 'skb?NETLINK_CB(s=
kb).portid:0' is redundant or there is possible null pointer dereference: s=
kb. [nullPointerRedundantCheck]
    struct net *net =3D sock_net(skb->sk);
                               ^
   net/dcb/dcbnl.c:1739:19: note: Assuming that condition 'skb?NETLINK_CB(s=
kb).portid:0' is not redundant
    u32 portid =3D skb ? NETLINK_CB(skb).portid : 0;
                     ^
   net/dcb/dcbnl.c:1735:29: note: Null pointer dereference
    struct net *net =3D sock_net(skb->sk);
                               ^
   net/dcb/dcbnl.c:1023:6: warning: Variable 'err' is reassigned a value be=
fore the old one has been used. [redundantAssignment]
    err =3D 0;
        ^
   net/dcb/dcbnl.c:1006:7: note: Variable 'err' is reassigned a value befor=
e the old one has been used.
     err =3D -EMSGSIZE;
         ^
   net/dcb/dcbnl.c:1023:6: note: Variable 'err' is reassigned a value befor=
e the old one has been used.
    err =3D 0;
        ^
   net/dcb/dcbnl.c:1748:6: warning: Variable 'ret' is reassigned a value be=
fore the old one has been used. [redundantAssignment]
    ret =3D nlmsg_parse_deprecated(nlh, sizeof(*dcb), tb, DCB_ATTR_MAX,
        ^
   net/dcb/dcbnl.c:1740:0: note: Variable 'ret' is reassigned a value befor=
e the old one has been used.
    int ret =3D -EINVAL;
   ^
   net/dcb/dcbnl.c:1748:6: note: Variable 'ret' is reassigned a value befor=
e the old one has been used.
    ret =3D nlmsg_parse_deprecated(nlh, sizeof(*dcb), tb, DCB_ATTR_MAX,
        ^
--
>> net/core/lwt_bpf.c:93:7: warning: Variable 'err' is reassigned a value b=
efore the old one has been used. [redundantAssignment]
     err =3D ip_route_input_noref(skb, iph->daddr, iph->saddr,
         ^
   net/core/lwt_bpf.c:88:0: note: Variable 'err' is reassigned a value befo=
re the old one has been used.
    int err =3D -EINVAL;
   ^
   net/core/lwt_bpf.c:93:7: note: Variable 'err' is reassigned a value befo=
re the old one has been used.
     err =3D ip_route_input_noref(skb, iph->daddr, iph->saddr,
         ^
   net/core/lwt_bpf.c:247:6: warning: Variable 'err' is reassigned a value =
before the old one has been used. [redundantAssignment]
    err =3D skb_cow_head(skb, LL_RESERVED_SPACE(dst->dev));
        ^
   net/core/lwt_bpf.c:175:0: note: Variable 'err' is reassigned a value bef=
ore the old one has been used.
    int err =3D -EAFNOSUPPORT;
   ^
   net/core/lwt_bpf.c:247:6: note: Variable 'err' is reassigned a value bef=
ore the old one has been used.
    err =3D skb_cow_head(skb, LL_RESERVED_SPACE(dst->dev));
        ^
>> net/llc/llc_proc.c:236:5: warning: Variable 'rc' is reassigned a value b=
efore the old one has been used. [redundantAssignment]
    rc =3D 0;
       ^
   net/llc/llc_proc.c:221:0: note: Variable 'rc' is reassigned a value befo=
re the old one has been used.
    int rc =3D -ENOMEM;
   ^
   net/llc/llc_proc.c:236:5: note: Variable 'rc' is reassigned a value befo=
re the old one has been used.
    rc =3D 0;
       ^

# https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3D02a07046834e64970f3bcd87a422ac2b0adb80de
git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torval=
ds/linux.git
git fetch --no-tags linus master
git checkout 02a07046834e64970f3bcd87a422ac2b0adb80de
vim +1068 drivers/net/arcnet/arcnet.c

^1da177e4c3f41 Linus Torvalds    2005-04-16  1059  =

f2f0a16bf89a1b Joe Perches       2015-05-05  1060  /* This is a generic pac=
ket receiver that calls arcnet??_rx depending on the
^1da177e4c3f41 Linus Torvalds    2005-04-16  1061   * protocol ID found.
^1da177e4c3f41 Linus Torvalds    2005-04-16  1062   */
f03aa2d89ad600 Adrian Bunk       2006-01-14  1063  static void arcnet_rx(st=
ruct net_device *dev, int bufnum)
^1da177e4c3f41 Linus Torvalds    2005-04-16  1064  {
454d7c9b14e20f Wang Chen         2008-11-12  1065  	struct arcnet_local *lp=
 =3D netdev_priv(dev);
02a07046834e64 Uwe Kleine-K=C3=B6nig  2019-09-20  1066  	union {
^1da177e4c3f41 Linus Torvalds    2005-04-16  1067  		struct archdr pkt;
02a07046834e64 Uwe Kleine-K=C3=B6nig  2019-09-20 @1068  		char buf[512];
02a07046834e64 Uwe Kleine-K=C3=B6nig  2019-09-20  1069  	} rxdata;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1070  	struct arc_rfc1201 *sof=
t;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1071  	int length, ofs;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1072  =

02a07046834e64 Uwe Kleine-K=C3=B6nig  2019-09-20  1073  	soft =3D &rxdata.p=
kt.soft.rfc1201;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1074  =

02a07046834e64 Uwe Kleine-K=C3=B6nig  2019-09-20  1075  	lp->hw.copy_from_c=
ard(dev, bufnum, 0, &rxdata.pkt, ARC_HDR_SIZE);
02a07046834e64 Uwe Kleine-K=C3=B6nig  2019-09-20  1076  	if (rxdata.pkt.har=
d.offset[0]) {
02a07046834e64 Uwe Kleine-K=C3=B6nig  2019-09-20  1077  		ofs =3D rxdata.pk=
t.hard.offset[0];
^1da177e4c3f41 Linus Torvalds    2005-04-16  1078  		length =3D 256 - ofs;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1079  	} else {
02a07046834e64 Uwe Kleine-K=C3=B6nig  2019-09-20  1080  		ofs =3D rxdata.pk=
t.hard.offset[1];
^1da177e4c3f41 Linus Torvalds    2005-04-16  1081  		length =3D 512 - ofs;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1082  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  1083  =

^1da177e4c3f41 Linus Torvalds    2005-04-16  1084  	/* get the full header,=
 if possible */
02a07046834e64 Uwe Kleine-K=C3=B6nig  2019-09-20  1085  	if (sizeof(rxdata.=
pkt.soft) <=3D length) {
02a07046834e64 Uwe Kleine-K=C3=B6nig  2019-09-20  1086  		lp->hw.copy_from_=
card(dev, bufnum, ofs, soft, sizeof(rxdata.pkt.soft));
7f5e760c1b2690 Joe Perches       2015-05-05  1087  	} else {
02a07046834e64 Uwe Kleine-K=C3=B6nig  2019-09-20  1088  		memset(&rxdata.pk=
t.soft, 0, sizeof(rxdata.pkt.soft));
^1da177e4c3f41 Linus Torvalds    2005-04-16  1089  		lp->hw.copy_from_card(=
dev, bufnum, ofs, soft, length);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1090  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  1091  =

a34c0932c3b2f2 Joe Perches       2015-05-05  1092  	arc_printk(D_DURING, de=
v, "Buffer #%d: received packet from %02Xh to %02Xh (%d+4 bytes)\n",
02a07046834e64 Uwe Kleine-K=C3=B6nig  2019-09-20  1093  		   bufnum, rxdata=
.pkt.hard.source, rxdata.pkt.hard.dest, length);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1094  =

5803c5122acb31 Stephen Hemminger 2009-01-09  1095  	dev->stats.rx_packets++;
5803c5122acb31 Stephen Hemminger 2009-01-09  1096  	dev->stats.rx_bytes +=
=3D length + ARC_HDR_SIZE;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1097  =

^1da177e4c3f41 Linus Torvalds    2005-04-16  1098  	/* call the right recei=
ver for the protocol */
^1da177e4c3f41 Linus Torvalds    2005-04-16  1099  	if (arc_proto_map[soft-=
>proto]->is_ip) {
72aeea4841c037 Joe Perches       2015-05-05  1100  		if (BUGLVL(D_PROTO)) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  1101  			struct ArcProto
02a07046834e64 Uwe Kleine-K=C3=B6nig  2019-09-20  1102  			*oldp =3D arc_pr=
oto_map[lp->default_proto[rxdata.pkt.hard.source]],
^1da177e4c3f41 Linus Torvalds    2005-04-16  1103  			*newp =3D arc_proto_m=
ap[soft->proto];
^1da177e4c3f41 Linus Torvalds    2005-04-16  1104  =

^1da177e4c3f41 Linus Torvalds    2005-04-16  1105  			if (oldp !=3D newp) {
a34c0932c3b2f2 Joe Perches       2015-05-05  1106  				arc_printk(D_PROTO, =
dev,
3b4e55510f3151 Joe Perches       2015-05-05  1107  					   "got protocol %0=
2Xh; encap for host %02Xh is now '%c' (was '%c')\n",
02a07046834e64 Uwe Kleine-K=C3=B6nig  2019-09-20  1108  					   soft->proto=
, rxdata.pkt.hard.source,
^1da177e4c3f41 Linus Torvalds    2005-04-16  1109  					   newp->suffix, ol=
dp->suffix);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1110  			}
^1da177e4c3f41 Linus Torvalds    2005-04-16  1111  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16  1112  =

^1da177e4c3f41 Linus Torvalds    2005-04-16  1113  		/* broadcasts will alw=
ays be done with the last-used encap. */
^1da177e4c3f41 Linus Torvalds    2005-04-16  1114  		lp->default_proto[0] =
=3D soft->proto;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1115  =

^1da177e4c3f41 Linus Torvalds    2005-04-16  1116  		/* in striking contras=
t, the following isn't a hack. */
02a07046834e64 Uwe Kleine-K=C3=B6nig  2019-09-20  1117  		lp->default_proto=
[rxdata.pkt.hard.source] =3D soft->proto;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1118  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  1119  	/* call the protocol-sp=
ecific receiver. */
02a07046834e64 Uwe Kleine-K=C3=B6nig  2019-09-20  1120  	arc_proto_map[soft=
->proto]->rx(dev, bufnum, &rxdata.pkt, length);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1121  }
^1da177e4c3f41 Linus Torvalds    2005-04-16  1122  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8793788638515484456==--

