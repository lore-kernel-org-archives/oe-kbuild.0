Content-Type: multipart/mixed; boundary="===============3166573080360704654=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/mctp/mctp-i2c.c:996:2: warning: There is an unknown macro here somewhere. Configuration is required. If list_for_each_entry_safe is a macro then please configure it. [unknownMacro]
Date: Tue, 05 Apr 2022 15:53:24 +0800
Message-ID: <202204051553.3a08Fku3-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3166573080360704654==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Matt Johnston <matt@codeconstruct.com.au>
CC: Jeremy Kerr <jk@codeconstruct.com.au>
CC: Wolfram Sang <wsa-dev@sang-engineering.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   3123109284176b1532874591f7c81f3837bbdc17
commit: f5b8abf9fc3dacd7529d363e26fe8230935d65f8 mctp i2c: MCTP I2C binding=
 driver
date:   6 weeks ago
:::::: branch date: 35 hours ago
:::::: commit date: 6 weeks ago
compiler: hppa-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)
>> drivers/staging/rtl8723bs/core/rtw_mlme_ext.c:5656:16: warning: Local va=
riable 'null_addr' shadows outer variable [shadowVariable]
    unsigned char null_addr[] =3D {0x00, 0x00, 0x00, 0x00, 0x00, 0x00};
                  ^
   drivers/staging/rtl8723bs/core/rtw_mlme_ext.c:52:11: note: Shadowed decl=
aration
   static u8 null_addr[ETH_ALEN] =3D {0, 0, 0, 0, 0, 0};
             ^
   drivers/staging/rtl8723bs/core/rtw_mlme_ext.c:5656:16: note: Shadow vari=
able
    unsigned char null_addr[] =3D {0x00, 0x00, 0x00, 0x00, 0x00, 0x00};
                  ^

cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/staging/rtl8723bs/core/rtw_efuse.c:365:11: warning: Parameter 's=
ourdata' can be declared with const [constParameter]
         u8 *sourdata,
             ^
>> drivers/net/mctp/mctp-i2c.c:996:2: warning: There is an unknown macro he=
re somewhere. Configuration is required. If list_for_each_entry_safe is a m=
acro then please configure it. [unknownMacro]
    list_for_each_entry_safe(midev, tmp, &mcli->devs, list)
    ^
--
>> drivers/staging/rtl8723bs/core/rtw_ieee80211.c:58:16: warning: Variable =
'dot11_rate_table' can be declared with const [constVariable]
    unsigned char dot11_rate_table[] =3D {2, 4, 11, 22, 12, 18, 24, 36, 48,=
 72, 96, 108, 0}; /*  last element must be zero!! */
                  ^
>> drivers/staging/rtl8723bs/core/rtw_ieee80211.c:278:30: warning: Paramete=
r 'rateset' can be declared with const [constParameter]
   uint rtw_get_rateset_len(u8 *rateset)
                                ^
>> drivers/staging/rtl8723bs/core/rtw_ieee80211.c:1109:59: warning: Paramet=
er 'MCS_rate' can be declared with const [constParameter]
   u16 rtw_mcs_rate(u8 bw_40MHz, u8 short_GI, unsigned char *MCS_rate)
                                                             ^
>> drivers/net/phy/micrel.c:1574:9: warning: Uninitialized variable: ret [u=
ninitvar]
    return ret;
           ^
   drivers/net/phy/micrel.c:1555:19: note: Assuming condition is false
    while (pair_mask && retries--) {
                     ^
   drivers/net/phy/micrel.c:1574:9: note: Uninitialized variable: ret
    return ret;
           ^
--
>> drivers/staging/rtl8723bs/core/rtw_cmd.c:88:2: warning: There is an unkn=
own macro here somewhere. Configuration is required. If GEN_DRV_CMD_HANDLER=
 is a macro then please configure it. [unknownMacro]
    GEN_DRV_CMD_HANDLER(0, NULL) /*0*/
    ^
--
>> drivers/staging/rtl8723bs/core/rtw_mlme.c:1998:54: warning: Parameter 'i=
n_ie' can be declared with const [constParameter]
   int rtw_restruct_wmm_ie(struct adapter *adapter, u8 *in_ie, u8 *out_ie, =
uint in_len, uint initial_out_len)
                                                        ^
--
>> drivers/staging/rtl8723bs/core/rtw_mlme_ext.c:5897:57: warning: Paramete=
r 'pbuf' can be declared with const [constParameter]
   u8 h2c_msg_hdl(struct adapter *padapter, unsigned char *pbuf)
                                                           ^

vim +996 drivers/net/mctp/mctp-i2c.c

f5b8abf9fc3dac Matt Johnston 2022-02-18   987  =

f5b8abf9fc3dac Matt Johnston 2022-02-18   988  static int mctp_i2c_remove(s=
truct i2c_client *client)
f5b8abf9fc3dac Matt Johnston 2022-02-18   989  {
f5b8abf9fc3dac Matt Johnston 2022-02-18   990  	struct mctp_i2c_client *mcl=
i =3D i2c_get_clientdata(client);
f5b8abf9fc3dac Matt Johnston 2022-02-18   991  	struct mctp_i2c_dev *midev =
=3D NULL, *tmp =3D NULL;
f5b8abf9fc3dac Matt Johnston 2022-02-18   992  =

f5b8abf9fc3dac Matt Johnston 2022-02-18   993  	mutex_lock(&driver_clients_=
lock);
f5b8abf9fc3dac Matt Johnston 2022-02-18   994  	list_del(&mcli->list);
f5b8abf9fc3dac Matt Johnston 2022-02-18   995  	/* Remove all child adapter=
 netdevs */
f5b8abf9fc3dac Matt Johnston 2022-02-18  @996  	list_for_each_entry_safe(mi=
dev, tmp, &mcli->devs, list)
f5b8abf9fc3dac Matt Johnston 2022-02-18   997  		mctp_i2c_unregister(midev);
f5b8abf9fc3dac Matt Johnston 2022-02-18   998  =

f5b8abf9fc3dac Matt Johnston 2022-02-18   999  	mctp_i2c_free_client(mcli);
f5b8abf9fc3dac Matt Johnston 2022-02-18  1000  	mutex_unlock(&driver_client=
s_lock);
f5b8abf9fc3dac Matt Johnston 2022-02-18  1001  	/* Callers ignore return co=
de */
f5b8abf9fc3dac Matt Johnston 2022-02-18  1002  	return 0;
f5b8abf9fc3dac Matt Johnston 2022-02-18  1003  }
f5b8abf9fc3dac Matt Johnston 2022-02-18  1004  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3166573080360704654==--

