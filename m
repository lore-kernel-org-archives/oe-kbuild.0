Content-Type: multipart/mixed; boundary="===============6375328760072116768=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/staging/rtl8723bs/core/rtw_wlan_util.c:1380:30: warning: Either the condition 'p' is redundant or there is pointer arithmetic with NULL pointer.
Date: Tue, 08 Dec 2020 19:24:43 +0800
Message-ID: <202012081938.W1jWKoKu-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6375328760072116768==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Denis Straghkov <d.straghkov@ispras.ru>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: Dan Carpenter <error27@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   cd796ed3345030aa1bb332fe5c793b3dddaf56e7
commit: 370730894bece52b2bbd4eb727fbb39840cc0e14 Staging: rtl8723bs: rtw_wl=
an_util: Add size check of SSID IE
date:   8 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 8 months ago
compiler: or1k-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/staging/rtl8723bs/core/rtw_wlan_util.c:1380:30: warning: Either =
the condition 'p' is redundant or there is pointer arithmetic with NULL poi=
nter. [nullPointerArithmeticRedundantCheck]
    memcpy(bssid->Ssid.Ssid, (p + 2), ssid_len);
                                ^
   drivers/staging/rtl8723bs/core/rtw_wlan_util.c:1375:6: note: Assuming th=
at condition 'p' is not redundant
    if (p) {
        ^
   drivers/staging/rtl8723bs/core/rtw_wlan_util.c:1380:30: note: Null point=
er addition
    memcpy(bssid->Ssid.Ssid, (p + 2), ssid_len);
                                ^
>> drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c:201:3: warning: Assignment =
of function parameter has no effect outside the function. Did you forget de=
referencing it? [uselessAssignmentPtrArg]
     pframe =3D rtw_set_ie(pframe, _EXT_SUPPORTEDRATES_IE_, (rate_len - 8),=
 (cur_network->SupportedRates + 8), &pktlen);
     ^
   drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c:816:4: warning: Assignment =
of function parameter has no effect outside the function. Did you forget de=
referencing it? [uselessAssignmentPtrArg]
      pframe +=3D ssid_ielen_diff;
      ^
   drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c:706:3: warning: Assignment =
of function parameter has no effect outside the function. Did you forget de=
referencing it? [uselessAssignmentPtrArg]
     pframe =3D rtw_set_ie(pframe, _SUPPORTEDRATES_IE_, bssrate_len, bssrat=
e, &pktlen);
     ^
>> drivers/staging/rtl8723bs/os_dep/ioctl_linux.c:2930:23: warning: Express=
ion '(X & 0x3) > 0x3' is always false. [comparisonError]
          if ((extra_arg & 0x03) > 0x03)
                         ^

vim +/p +1380 drivers/staging/rtl8723bs/core/rtw_wlan_util.c

554c0a3abf216c Hans de Goede       2017-03-29  1259  =

554c0a3abf216c Hans de Goede       2017-03-29  1260  int rtw_check_bcn_info=
(struct adapter *Adapter, u8 *pframe, u32 packet_len)
554c0a3abf216c Hans de Goede       2017-03-29  1261  {
554c0a3abf216c Hans de Goede       2017-03-29  1262  	unsigned int		len;
554c0a3abf216c Hans de Goede       2017-03-29  1263  	unsigned char 	*p;
554c0a3abf216c Hans de Goede       2017-03-29  1264  	unsigned short	val16,=
 subtype;
554c0a3abf216c Hans de Goede       2017-03-29  1265  	struct wlan_network *=
cur_network =3D &(Adapter->mlmepriv.cur_network);
554c0a3abf216c Hans de Goede       2017-03-29  1266  	/* u8 wpa_ie[255], rs=
n_ie[255]; */
554c0a3abf216c Hans de Goede       2017-03-29  1267  	u16 wpa_len =3D 0, rs=
n_len =3D 0;
554c0a3abf216c Hans de Goede       2017-03-29  1268  	u8 encryp_protocol =
=3D 0;
554c0a3abf216c Hans de Goede       2017-03-29  1269  	struct wlan_bssid_ex =
*bssid;
554c0a3abf216c Hans de Goede       2017-03-29  1270  	int group_cipher =3D =
0, pairwise_cipher =3D 0, is_8021x =3D 0;
554c0a3abf216c Hans de Goede       2017-03-29  1271  	unsigned char *pbuf;
554c0a3abf216c Hans de Goede       2017-03-29  1272  	u32 wpa_ielen =3D 0;
554c0a3abf216c Hans de Goede       2017-03-29  1273  	u8 *pbssid =3D GetAdd=
r3Ptr(pframe);
554c0a3abf216c Hans de Goede       2017-03-29  1274  	struct HT_info_elemen=
t *pht_info =3D NULL;
554c0a3abf216c Hans de Goede       2017-03-29  1275  	struct rtw_ieee80211_=
ht_cap *pht_cap =3D NULL;
554c0a3abf216c Hans de Goede       2017-03-29  1276  	u32 bcn_channel;
554c0a3abf216c Hans de Goede       2017-03-29  1277  	unsigned short	ht_cap=
_info;
554c0a3abf216c Hans de Goede       2017-03-29  1278  	unsigned char ht_info=
_infos_0;
554c0a3abf216c Hans de Goede       2017-03-29  1279  	struct mlme_priv *pml=
mepriv =3D &Adapter->mlmepriv;
370730894bece5 Denis Straghkov     2020-04-22  1280  	int ssid_len;
554c0a3abf216c Hans de Goede       2017-03-29  1281  =

554c0a3abf216c Hans de Goede       2017-03-29  1282  	if (is_client_associa=
ted_to_ap(Adapter) =3D=3D false)
554c0a3abf216c Hans de Goede       2017-03-29  1283  		return true;
554c0a3abf216c Hans de Goede       2017-03-29  1284  =

554c0a3abf216c Hans de Goede       2017-03-29  1285  	len =3D packet_len - =
sizeof(struct ieee80211_hdr_3addr);
554c0a3abf216c Hans de Goede       2017-03-29  1286  =

554c0a3abf216c Hans de Goede       2017-03-29  1287  	if (len > MAX_IE_SZ) {
554c0a3abf216c Hans de Goede       2017-03-29  1288  		DBG_871X("%s IE too =
long for survey event\n", __func__);
554c0a3abf216c Hans de Goede       2017-03-29  1289  		return _FAIL;
554c0a3abf216c Hans de Goede       2017-03-29  1290  	}
554c0a3abf216c Hans de Goede       2017-03-29  1291  =

554c0a3abf216c Hans de Goede       2017-03-29  1292  	if (memcmp(cur_networ=
k->network.MacAddress, pbssid, 6)) {
554c0a3abf216c Hans de Goede       2017-03-29  1293  		DBG_871X("Oops: rtw_=
check_network_encrypt linked but recv other bssid bcn\n" MAC_FMT MAC_FMT,
554c0a3abf216c Hans de Goede       2017-03-29  1294  				MAC_ARG(pbssid), M=
AC_ARG(cur_network->network.MacAddress));
554c0a3abf216c Hans de Goede       2017-03-29  1295  		return true;
554c0a3abf216c Hans de Goede       2017-03-29  1296  	}
554c0a3abf216c Hans de Goede       2017-03-29  1297  =

2ef2b7c21fc877 Joe Perches         2017-09-09  1298  	bssid =3D rtw_zmalloc=
(sizeof(struct wlan_bssid_ex));
c9d19e68a7963f Michael Straube     2018-07-11  1299  	if (!bssid) {
554c0a3abf216c Hans de Goede       2017-03-29  1300  		DBG_871X("%s rtw_zma=
lloc fail !!!\n", __func__);
554c0a3abf216c Hans de Goede       2017-03-29  1301  		return true;
554c0a3abf216c Hans de Goede       2017-03-29  1302  	}
554c0a3abf216c Hans de Goede       2017-03-29  1303  =

554c0a3abf216c Hans de Goede       2017-03-29  1304  	if ((pmlmepriv->timeB=
cnInfoChkStart !=3D 0) && (jiffies_to_msecs(jiffies - pmlmepriv->timeBcnInf=
oChkStart) > DISCONNECT_BY_CHK_BCN_FAIL_OBSERV_PERIOD_IN_MS)) {
554c0a3abf216c Hans de Goede       2017-03-29  1305  		pmlmepriv->timeBcnIn=
foChkStart =3D 0;
554c0a3abf216c Hans de Goede       2017-03-29  1306  		pmlmepriv->NumOfBcnI=
nfoChkFail =3D 0;
554c0a3abf216c Hans de Goede       2017-03-29  1307  	}
554c0a3abf216c Hans de Goede       2017-03-29  1308  =

554c0a3abf216c Hans de Goede       2017-03-29  1309  	subtype =3D GetFrameS=
ubType(pframe) >> 4;
554c0a3abf216c Hans de Goede       2017-03-29  1310  =

554c0a3abf216c Hans de Goede       2017-03-29  1311  	if (subtype =3D=3D WI=
FI_BEACON)
554c0a3abf216c Hans de Goede       2017-03-29  1312  		bssid->Reserved[0] =
=3D 1;
554c0a3abf216c Hans de Goede       2017-03-29  1313  =

554c0a3abf216c Hans de Goede       2017-03-29  1314  	bssid->Length =3D siz=
eof(struct wlan_bssid_ex) - MAX_IE_SZ + len;
554c0a3abf216c Hans de Goede       2017-03-29  1315  =

554c0a3abf216c Hans de Goede       2017-03-29  1316  	/* below is to copy t=
he information element */
554c0a3abf216c Hans de Goede       2017-03-29  1317  	bssid->IELength =3D l=
en;
554c0a3abf216c Hans de Goede       2017-03-29  1318  	memcpy(bssid->IEs, (p=
frame + sizeof(struct ieee80211_hdr_3addr)), bssid->IELength);
554c0a3abf216c Hans de Goede       2017-03-29  1319  =

554c0a3abf216c Hans de Goede       2017-03-29  1320  	/* check bw and chann=
el offset */
554c0a3abf216c Hans de Goede       2017-03-29  1321  	/* parsing HT_CAP_IE =
*/
554c0a3abf216c Hans de Goede       2017-03-29  1322  	p =3D rtw_get_ie(bssi=
d->IEs + _FIXED_IE_LENGTH_, _HT_CAPABILITY_IE_, &len, bssid->IELength - _FI=
XED_IE_LENGTH_);
554c0a3abf216c Hans de Goede       2017-03-29  1323  	if (p && len > 0) {
554c0a3abf216c Hans de Goede       2017-03-29  1324  			pht_cap =3D (struct=
 rtw_ieee80211_ht_cap *)(p + 2);
554c0a3abf216c Hans de Goede       2017-03-29  1325  			ht_cap_info =3D le1=
6_to_cpu(pht_cap->cap_info);
554c0a3abf216c Hans de Goede       2017-03-29  1326  	} else {
554c0a3abf216c Hans de Goede       2017-03-29  1327  			ht_cap_info =3D 0;
554c0a3abf216c Hans de Goede       2017-03-29  1328  	}
554c0a3abf216c Hans de Goede       2017-03-29  1329  	/* parsing HT_INFO_IE=
 */
554c0a3abf216c Hans de Goede       2017-03-29  1330  	p =3D rtw_get_ie(bssi=
d->IEs + _FIXED_IE_LENGTH_, _HT_ADD_INFO_IE_, &len, bssid->IELength - _FIXE=
D_IE_LENGTH_);
554c0a3abf216c Hans de Goede       2017-03-29  1331  	if (p && len > 0) {
554c0a3abf216c Hans de Goede       2017-03-29  1332  			pht_info =3D (struc=
t HT_info_element *)(p + 2);
554c0a3abf216c Hans de Goede       2017-03-29  1333  			ht_info_infos_0 =3D=
 pht_info->infos[0];
554c0a3abf216c Hans de Goede       2017-03-29  1334  	} else {
554c0a3abf216c Hans de Goede       2017-03-29  1335  			ht_info_infos_0 =3D=
 0;
554c0a3abf216c Hans de Goede       2017-03-29  1336  	}
554c0a3abf216c Hans de Goede       2017-03-29  1337  	if (ht_cap_info !=3D =
cur_network->BcnInfo.ht_cap_info ||
554c0a3abf216c Hans de Goede       2017-03-29  1338  		((ht_info_infos_0&0x=
03) !=3D (cur_network->BcnInfo.ht_info_infos_0&0x03))) {
554c0a3abf216c Hans de Goede       2017-03-29  1339  			DBG_871X("%s bcn no=
w: ht_cap_info:%x ht_info_infos_0:%x\n", __func__,
554c0a3abf216c Hans de Goede       2017-03-29  1340  							ht_cap_info, ht=
_info_infos_0);
554c0a3abf216c Hans de Goede       2017-03-29  1341  			DBG_871X("%s bcn li=
nk: ht_cap_info:%x ht_info_infos_0:%x\n", __func__,
554c0a3abf216c Hans de Goede       2017-03-29  1342  							cur_network->Bc=
nInfo.ht_cap_info, cur_network->BcnInfo.ht_info_infos_0);
554c0a3abf216c Hans de Goede       2017-03-29  1343  			DBG_871X("%s bw mod=
e change\n", __func__);
554c0a3abf216c Hans de Goede       2017-03-29  1344  			{
554c0a3abf216c Hans de Goede       2017-03-29  1345  				/* bcn_info_update=
 */
554c0a3abf216c Hans de Goede       2017-03-29  1346  				cur_network->BcnIn=
fo.ht_cap_info =3D ht_cap_info;
554c0a3abf216c Hans de Goede       2017-03-29  1347  				cur_network->BcnIn=
fo.ht_info_infos_0 =3D ht_info_infos_0;
554c0a3abf216c Hans de Goede       2017-03-29  1348  				/* to do : need to=
 check that whether modify related register of BB or not */
554c0a3abf216c Hans de Goede       2017-03-29  1349  			}
554c0a3abf216c Hans de Goede       2017-03-29  1350  			/* goto _mismatch; =
*/
554c0a3abf216c Hans de Goede       2017-03-29  1351  	}
554c0a3abf216c Hans de Goede       2017-03-29  1352  =

554c0a3abf216c Hans de Goede       2017-03-29  1353  	/* Checking for chann=
el */
554c0a3abf216c Hans de Goede       2017-03-29  1354  	p =3D rtw_get_ie(bssi=
d->IEs + _FIXED_IE_LENGTH_, _DSSET_IE_, &len, bssid->IELength - _FIXED_IE_L=
ENGTH_);
554c0a3abf216c Hans de Goede       2017-03-29  1355  	if (p) {
554c0a3abf216c Hans de Goede       2017-03-29  1356  			bcn_channel =3D *(p=
 + 2);
554c0a3abf216c Hans de Goede       2017-03-29  1357  	} else {/* In 5G, som=
e ap do not have DSSET IE checking HT info for channel */
554c0a3abf216c Hans de Goede       2017-03-29  1358  			rtw_get_ie(bssid->I=
Es + _FIXED_IE_LENGTH_, _HT_ADD_INFO_IE_, &len, bssid->IELength - _FIXED_IE=
_LENGTH_);
554c0a3abf216c Hans de Goede       2017-03-29  1359  			if (pht_info) {
554c0a3abf216c Hans de Goede       2017-03-29  1360  					bcn_channel =3D p=
ht_info->primary_channel;
554c0a3abf216c Hans de Goede       2017-03-29  1361  			} else { /* we don'=
t find channel IE, so don't check it */
554c0a3abf216c Hans de Goede       2017-03-29  1362  					/* DBG_871X("Oops=
: %s we don't find channel IE, so don't check it\n", __func__); */
554c0a3abf216c Hans de Goede       2017-03-29  1363  					bcn_channel =3D A=
dapter->mlmeextpriv.cur_channel;
554c0a3abf216c Hans de Goede       2017-03-29  1364  			}
554c0a3abf216c Hans de Goede       2017-03-29  1365  	}
554c0a3abf216c Hans de Goede       2017-03-29  1366  	if (bcn_channel !=3D =
Adapter->mlmeextpriv.cur_channel) {
554c0a3abf216c Hans de Goede       2017-03-29  1367  			DBG_871X("%s beacon=
 channel:%d cur channel:%d disconnect\n", __func__,
554c0a3abf216c Hans de Goede       2017-03-29  1368  						   bcn_channel, =
Adapter->mlmeextpriv.cur_channel);
554c0a3abf216c Hans de Goede       2017-03-29  1369  			goto _mismatch;
554c0a3abf216c Hans de Goede       2017-03-29  1370  	}
554c0a3abf216c Hans de Goede       2017-03-29  1371  =

554c0a3abf216c Hans de Goede       2017-03-29  1372  	/* checking SSID */
370730894bece5 Denis Straghkov     2020-04-22  1373  	ssid_len =3D 0;
554c0a3abf216c Hans de Goede       2017-03-29  1374  	p =3D rtw_get_ie(bssi=
d->IEs + _FIXED_IE_LENGTH_, _SSID_IE_, &len, bssid->IELength - _FIXED_IE_LE=
NGTH_);
370730894bece5 Denis Straghkov     2020-04-22  1375  	if (p) {
370730894bece5 Denis Straghkov     2020-04-22  1376  		ssid_len =3D *(p + 1=
);
370730894bece5 Denis Straghkov     2020-04-22  1377  		if (ssid_len > NDIS_=
802_11_LENGTH_SSID)
370730894bece5 Denis Straghkov     2020-04-22  1378  			ssid_len =3D 0;
554c0a3abf216c Hans de Goede       2017-03-29  1379  	}
370730894bece5 Denis Straghkov     2020-04-22 @1380  	memcpy(bssid->Ssid.Ss=
id, (p + 2), ssid_len);
370730894bece5 Denis Straghkov     2020-04-22  1381  	bssid->Ssid.SsidLengt=
h =3D ssid_len;
554c0a3abf216c Hans de Goede       2017-03-29  1382  =

554c0a3abf216c Hans de Goede       2017-03-29  1383  	RT_TRACE(_module_rtl8=
71x_mlme_c_, _drv_info_, ("%s bssid.Ssid.Ssid:%s bssid.Ssid.SsidLength:%d "
554c0a3abf216c Hans de Goede       2017-03-29  1384  				"cur_network->netw=
ork.Ssid.Ssid:%s len:%d\n", __func__, bssid->Ssid.Ssid,
554c0a3abf216c Hans de Goede       2017-03-29  1385  				bssid->Ssid.SsidLe=
ngth, cur_network->network.Ssid.Ssid,
554c0a3abf216c Hans de Goede       2017-03-29  1386  				cur_network->netwo=
rk.Ssid.SsidLength));
554c0a3abf216c Hans de Goede       2017-03-29  1387  =

554c0a3abf216c Hans de Goede       2017-03-29  1388  	if (memcmp(bssid->Ssi=
d.Ssid, cur_network->network.Ssid.Ssid, 32) ||
554c0a3abf216c Hans de Goede       2017-03-29  1389  			bssid->Ssid.SsidLen=
gth !=3D cur_network->network.Ssid.SsidLength) {
554c0a3abf216c Hans de Goede       2017-03-29  1390  		if (bssid->Ssid.Ssid=
[0] !=3D '\0' && bssid->Ssid.SsidLength !=3D 0) { /* not hidden ssid */
554c0a3abf216c Hans de Goede       2017-03-29  1391  			DBG_871X("%s(), SSI=
D is not match\n", __func__);
554c0a3abf216c Hans de Goede       2017-03-29  1392  			goto _mismatch;
554c0a3abf216c Hans de Goede       2017-03-29  1393  		}
554c0a3abf216c Hans de Goede       2017-03-29  1394  	}
554c0a3abf216c Hans de Goede       2017-03-29  1395  =

554c0a3abf216c Hans de Goede       2017-03-29  1396  	/* check encryption i=
nfo */
554c0a3abf216c Hans de Goede       2017-03-29  1397  	val16 =3D rtw_get_cap=
ability((struct wlan_bssid_ex *)bssid);
554c0a3abf216c Hans de Goede       2017-03-29  1398  =

554c0a3abf216c Hans de Goede       2017-03-29  1399  	if (val16 & BIT(4))
554c0a3abf216c Hans de Goede       2017-03-29  1400  		bssid->Privacy =3D 1;
554c0a3abf216c Hans de Goede       2017-03-29  1401  	else
554c0a3abf216c Hans de Goede       2017-03-29  1402  		bssid->Privacy =3D 0;
554c0a3abf216c Hans de Goede       2017-03-29  1403  =

554c0a3abf216c Hans de Goede       2017-03-29  1404  	RT_TRACE(_module_rtl8=
71x_mlme_c_, _drv_info_,
554c0a3abf216c Hans de Goede       2017-03-29  1405  			("%s(): cur_network=
->network.Privacy is %d, bssid.Privacy is %d\n",
554c0a3abf216c Hans de Goede       2017-03-29  1406  			 __func__, cur_netw=
ork->network.Privacy, bssid->Privacy));
554c0a3abf216c Hans de Goede       2017-03-29  1407  	if (cur_network->netw=
ork.Privacy !=3D bssid->Privacy) {
554c0a3abf216c Hans de Goede       2017-03-29  1408  		DBG_871X("%s(), priv=
acy is not match\n", __func__);
554c0a3abf216c Hans de Goede       2017-03-29  1409  		goto _mismatch;
554c0a3abf216c Hans de Goede       2017-03-29  1410  	}
554c0a3abf216c Hans de Goede       2017-03-29  1411  =

554c0a3abf216c Hans de Goede       2017-03-29  1412  	rtw_get_sec_ie(bssid-=
>IEs, bssid->IELength, NULL, &rsn_len, NULL, &wpa_len);
554c0a3abf216c Hans de Goede       2017-03-29  1413  =

554c0a3abf216c Hans de Goede       2017-03-29  1414  	if (rsn_len > 0) {
554c0a3abf216c Hans de Goede       2017-03-29  1415  		encryp_protocol =3D =
ENCRYP_PROTOCOL_WPA2;
554c0a3abf216c Hans de Goede       2017-03-29  1416  	} else if (wpa_len > =
0) {
554c0a3abf216c Hans de Goede       2017-03-29  1417  		encryp_protocol =3D =
ENCRYP_PROTOCOL_WPA;
554c0a3abf216c Hans de Goede       2017-03-29  1418  	} else {
554c0a3abf216c Hans de Goede       2017-03-29  1419  		if (bssid->Privacy)
554c0a3abf216c Hans de Goede       2017-03-29  1420  			encryp_protocol =3D=
 ENCRYP_PROTOCOL_WEP;
554c0a3abf216c Hans de Goede       2017-03-29  1421  	}
554c0a3abf216c Hans de Goede       2017-03-29  1422  =

554c0a3abf216c Hans de Goede       2017-03-29  1423  	if (cur_network->BcnI=
nfo.encryp_protocol !=3D encryp_protocol) {
554c0a3abf216c Hans de Goede       2017-03-29  1424  		DBG_871X("%s(): enct=
yp is not match\n", __func__);
554c0a3abf216c Hans de Goede       2017-03-29  1425  		goto _mismatch;
554c0a3abf216c Hans de Goede       2017-03-29  1426  	}
554c0a3abf216c Hans de Goede       2017-03-29  1427  =

554c0a3abf216c Hans de Goede       2017-03-29  1428  	if (encryp_protocol =
=3D=3D ENCRYP_PROTOCOL_WPA || encryp_protocol =3D=3D ENCRYP_PROTOCOL_WPA2) {
554c0a3abf216c Hans de Goede       2017-03-29  1429  		pbuf =3D rtw_get_wpa=
_ie(&bssid->IEs[12], &wpa_ielen, bssid->IELength-12);
554c0a3abf216c Hans de Goede       2017-03-29  1430  		if (pbuf && (wpa_iel=
en > 0)) {
554c0a3abf216c Hans de Goede       2017-03-29  1431  			if (_SUCCESS =3D=3D=
 rtw_parse_wpa_ie(pbuf, wpa_ielen+2, &group_cipher, &pairwise_cipher, &is_8=
021x)) {
554c0a3abf216c Hans de Goede       2017-03-29  1432  				RT_TRACE(_module_r=
tl871x_mlme_c_, _drv_info_,
554c0a3abf216c Hans de Goede       2017-03-29  1433  						("%s pnetwork->p=
airwise_cipher: %d, group_cipher is %d, is_8021x is %d\n", __func__,
554c0a3abf216c Hans de Goede       2017-03-29  1434  						 pairwise_cipher=
, group_cipher, is_8021x));
554c0a3abf216c Hans de Goede       2017-03-29  1435  			}
554c0a3abf216c Hans de Goede       2017-03-29  1436  		} else {
554c0a3abf216c Hans de Goede       2017-03-29  1437  			pbuf =3D rtw_get_wp=
a2_ie(&bssid->IEs[12], &wpa_ielen, bssid->IELength-12);
554c0a3abf216c Hans de Goede       2017-03-29  1438  =

554c0a3abf216c Hans de Goede       2017-03-29  1439  			if (pbuf && (wpa_ie=
len > 0)) {
554c0a3abf216c Hans de Goede       2017-03-29  1440  				if (_SUCCESS =3D=
=3D rtw_parse_wpa2_ie(pbuf, wpa_ielen+2, &group_cipher, &pairwise_cipher, &=
is_8021x)) {
554c0a3abf216c Hans de Goede       2017-03-29  1441  					RT_TRACE(_module_=
rtl871x_mlme_c_, _drv_info_,
554c0a3abf216c Hans de Goede       2017-03-29  1442  							("%s pnetwork->=
pairwise_cipher: %d, pnetwork->group_cipher is %d, is_802x is %d\n",
554c0a3abf216c Hans de Goede       2017-03-29  1443  							 __func__, pair=
wise_cipher, group_cipher, is_8021x));
554c0a3abf216c Hans de Goede       2017-03-29  1444  				}
554c0a3abf216c Hans de Goede       2017-03-29  1445  			}
554c0a3abf216c Hans de Goede       2017-03-29  1446  		}
554c0a3abf216c Hans de Goede       2017-03-29  1447  =

554c0a3abf216c Hans de Goede       2017-03-29  1448  		RT_TRACE(_module_rtl=
871x_mlme_c_, _drv_err_,
554c0a3abf216c Hans de Goede       2017-03-29  1449  				("%s cur_network->=
group_cipher is %d: %d\n", __func__, cur_network->BcnInfo.group_cipher, gro=
up_cipher));
554c0a3abf216c Hans de Goede       2017-03-29  1450  		if (pairwise_cipher =
!=3D cur_network->BcnInfo.pairwise_cipher || group_cipher !=3D cur_network-=
>BcnInfo.group_cipher) {
554c0a3abf216c Hans de Goede       2017-03-29  1451  			DBG_871X("%s pairwi=
se_cipher(%x:%x) or group_cipher(%x:%x) is not match\n", __func__,
554c0a3abf216c Hans de Goede       2017-03-29  1452  					pairwise_cipher, =
cur_network->BcnInfo.pairwise_cipher,
554c0a3abf216c Hans de Goede       2017-03-29  1453  					group_cipher, cur=
_network->BcnInfo.group_cipher);
554c0a3abf216c Hans de Goede       2017-03-29  1454  			goto _mismatch;
554c0a3abf216c Hans de Goede       2017-03-29  1455  		}
554c0a3abf216c Hans de Goede       2017-03-29  1456  =

554c0a3abf216c Hans de Goede       2017-03-29  1457  		if (is_8021x !=3D cu=
r_network->BcnInfo.is_8021x) {
554c0a3abf216c Hans de Goede       2017-03-29  1458  			DBG_871X("%s authen=
tication is not match\n", __func__);
554c0a3abf216c Hans de Goede       2017-03-29  1459  			goto _mismatch;
554c0a3abf216c Hans de Goede       2017-03-29  1460  		}
554c0a3abf216c Hans de Goede       2017-03-29  1461  	}
554c0a3abf216c Hans de Goede       2017-03-29  1462  =

2dac96b334aad2 Nachammai Karuppiah 2019-10-08  1463  	kfree(bssid);
554c0a3abf216c Hans de Goede       2017-03-29  1464  	return _SUCCESS;
554c0a3abf216c Hans de Goede       2017-03-29  1465  =

554c0a3abf216c Hans de Goede       2017-03-29  1466  _mismatch:
2dac96b334aad2 Nachammai Karuppiah 2019-10-08  1467  	kfree(bssid);
554c0a3abf216c Hans de Goede       2017-03-29  1468  =

554c0a3abf216c Hans de Goede       2017-03-29  1469  	if (pmlmepriv->NumOfB=
cnInfoChkFail =3D=3D 0)
554c0a3abf216c Hans de Goede       2017-03-29  1470  		pmlmepriv->timeBcnIn=
foChkStart =3D jiffies;
554c0a3abf216c Hans de Goede       2017-03-29  1471  =

554c0a3abf216c Hans de Goede       2017-03-29  1472  	pmlmepriv->NumOfBcnIn=
foChkFail++;
554c0a3abf216c Hans de Goede       2017-03-29  1473  	DBG_871X("%s by "ADPT=
_FMT" - NumOfChkFail =3D %d (SeqNum of this Beacon frame =3D %d).\n", __fun=
c__, ADPT_ARG(Adapter), pmlmepriv->NumOfBcnInfoChkFail, GetSequence(pframe)=
);
554c0a3abf216c Hans de Goede       2017-03-29  1474  =

554c0a3abf216c Hans de Goede       2017-03-29  1475  	if ((pmlmepriv->timeB=
cnInfoChkStart !=3D 0) && (jiffies_to_msecs(jiffies - pmlmepriv->timeBcnInf=
oChkStart) <=3D DISCONNECT_BY_CHK_BCN_FAIL_OBSERV_PERIOD_IN_MS)
554c0a3abf216c Hans de Goede       2017-03-29  1476  		&& (pmlmepriv->NumOf=
BcnInfoChkFail >=3D DISCONNECT_BY_CHK_BCN_FAIL_THRESHOLD)) {
554c0a3abf216c Hans de Goede       2017-03-29  1477  		DBG_871X("%s by "ADP=
T_FMT" - NumOfChkFail =3D %d >=3D threshold : %d (in %d ms), return FAIL.\n=
", __func__, ADPT_ARG(Adapter), pmlmepriv->NumOfBcnInfoChkFail,
554c0a3abf216c Hans de Goede       2017-03-29  1478  			DISCONNECT_BY_CHK_B=
CN_FAIL_THRESHOLD, jiffies_to_msecs(jiffies - pmlmepriv->timeBcnInfoChkStar=
t));
554c0a3abf216c Hans de Goede       2017-03-29  1479  		pmlmepriv->timeBcnIn=
foChkStart =3D 0;
554c0a3abf216c Hans de Goede       2017-03-29  1480  		pmlmepriv->NumOfBcnI=
nfoChkFail =3D 0;
554c0a3abf216c Hans de Goede       2017-03-29  1481  		return _FAIL;
554c0a3abf216c Hans de Goede       2017-03-29  1482  	}
554c0a3abf216c Hans de Goede       2017-03-29  1483  =

554c0a3abf216c Hans de Goede       2017-03-29  1484  	return _SUCCESS;
554c0a3abf216c Hans de Goede       2017-03-29  1485  }
554c0a3abf216c Hans de Goede       2017-03-29  1486  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6375328760072116768==--

