Content-Type: multipart/mixed; boundary="===============3807865367574599398=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [kvalo-ath:pending 10/25] drivers/net/wireless/ath/ath11k/mac.c:1975 ath11k_peer_assoc_h_he() error: uninitialized symbol 'rx_mcs_80'.
Date: Mon, 29 Nov 2021 23:16:56 +0800
Message-ID: <202111292332.E9FELASS-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3807865367574599398==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: Kalle Valo <kvalo@codeaurora.org>
CC: ath10k(a)lists.infradead.org
CC: linux-kernel(a)vger.kernel.org
TO: Wen Gong <quic_wgong@quicinc.com>
CC: Kalle Valo <kvalo@codeaurora.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git pendi=
ng
head:   089690f0304adcb3c4d528ff4c930616219f3844
commit: 3db26ecf7114370e451e296e33a0af3303d32819 [10/25] ath11k: calculate =
the correct NSS of peer for HE capabilities
:::::: branch date: 3 days ago
:::::: commit date: 7 days ago
config: arm-randconfig-m031-20211128 (https://download.01.org/0day-ci/archi=
ve/20211129/202111292332.E9FELASS-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/net/wireless/ath/ath11k/mac.c:1975 ath11k_peer_assoc_h_he() error: =
uninitialized symbol 'rx_mcs_80'.
drivers/net/wireless/ath/ath11k/mac.c:1975 ath11k_peer_assoc_h_he() error: =
uninitialized symbol 'rx_mcs_160'.

Old smatch warnings:
drivers/net/wireless/ath/ath11k/mac.c:1977 ath11k_peer_assoc_h_he() error: =
uninitialized symbol 'rx_mcs_80'.

vim +/rx_mcs_80 +1975 drivers/net/wireless/ath/ath11k/mac.c

61fe43e7216df6 Miles Hu            2021-09-24  1914  =

d5c65159f28953 Kalle Valo          2019-11-23  1915  static void ath11k_pee=
r_assoc_h_he(struct ath11k *ar,
d5c65159f28953 Kalle Valo          2019-11-23  1916  				   struct ieee8021=
1_vif *vif,
d5c65159f28953 Kalle Valo          2019-11-23  1917  				   struct ieee8021=
1_sta *sta,
d5c65159f28953 Kalle Valo          2019-11-23  1918  				   struct peer_ass=
oc_params *arg)
d5c65159f28953 Kalle Valo          2019-11-23  1919  {
61fe43e7216df6 Miles Hu            2021-09-24  1920  	struct ath11k_vif *ar=
vif =3D (void *)vif->drv_priv;
61fe43e7216df6 Miles Hu            2021-09-24  1921  	struct cfg80211_chan_=
def def;
9f056ed8ee01ad John Crispin        2019-11-25  1922  	const struct ieee8021=
1_sta_he_cap *he_cap =3D &sta->he_cap;
61fe43e7216df6 Miles Hu            2021-09-24  1923  	enum nl80211_band ban=
d;
61fe43e7216df6 Miles Hu            2021-09-24  1924  	u16 *he_mcs_mask;
61fe43e7216df6 Miles Hu            2021-09-24  1925  	u8 max_nss, he_mcs;
61fe43e7216df6 Miles Hu            2021-09-24  1926  	u16 he_tx_mcs =3D 0, =
v =3D 0;
61fe43e7216df6 Miles Hu            2021-09-24  1927  	int i, he_nss, nss_id=
x;
61fe43e7216df6 Miles Hu            2021-09-24  1928  	bool user_rate_valid =
=3D true;
f552d6fd2f27ce P Praneesh          2021-09-24  1929  	u32 rx_nss, tx_nss, n=
ss_160;
3db26ecf711437 Wen Gong            2021-11-22  1930  	u8 ampdu_factor, rx_m=
cs_80, rx_mcs_160;
3db26ecf711437 Wen Gong            2021-11-22  1931  	u16 mcs_160_map, mcs_=
80_map;
3db26ecf711437 Wen Gong            2021-11-22  1932  	bool support_160;
61fe43e7216df6 Miles Hu            2021-09-24  1933  =

61fe43e7216df6 Miles Hu            2021-09-24  1934  	if (WARN_ON(ath11k_ma=
c_vif_chan(vif, &def)))
61fe43e7216df6 Miles Hu            2021-09-24  1935  		return;
9f056ed8ee01ad John Crispin        2019-11-25  1936  =

9f056ed8ee01ad John Crispin        2019-11-25  1937  	if (!he_cap->has_he)
9f056ed8ee01ad John Crispin        2019-11-25  1938  		return;
9f056ed8ee01ad John Crispin        2019-11-25  1939  =

61fe43e7216df6 Miles Hu            2021-09-24  1940  	band =3D def.chan->ba=
nd;
61fe43e7216df6 Miles Hu            2021-09-24  1941  	he_mcs_mask =3D arvif=
->bitrate_mask.control[band].he_mcs;
61fe43e7216df6 Miles Hu            2021-09-24  1942  =

61fe43e7216df6 Miles Hu            2021-09-24  1943  	if (ath11k_peer_assoc=
_h_he_masked(he_mcs_mask))
61fe43e7216df6 Miles Hu            2021-09-24  1944  		return;
61fe43e7216df6 Miles Hu            2021-09-24  1945  =

9f056ed8ee01ad John Crispin        2019-11-25  1946  	arg->he_flag =3D true;
3db26ecf711437 Wen Gong            2021-11-22  1947  	support_160 =3D !!(he=
_cap->he_cap_elem.phy_cap_info[0] &
3db26ecf711437 Wen Gong            2021-11-22  1948  		  IEEE80211_HE_PHY_C=
AP0_CHANNEL_WIDTH_SET_160MHZ_IN_5G);
3db26ecf711437 Wen Gong            2021-11-22  1949  =

3db26ecf711437 Wen Gong            2021-11-22  1950  	/* Supported HE-MCS a=
nd NSS Set of peer he_cap is intersection with self he_cp */
3db26ecf711437 Wen Gong            2021-11-22  1951  	mcs_160_map =3D le16_=
to_cpu(he_cap->he_mcs_nss_supp.rx_mcs_160);
3db26ecf711437 Wen Gong            2021-11-22  1952  	mcs_80_map =3D le16_t=
o_cpu(he_cap->he_mcs_nss_supp.rx_mcs_80);
3db26ecf711437 Wen Gong            2021-11-22  1953  =

3db26ecf711437 Wen Gong            2021-11-22  1954  	if (support_160) {
3db26ecf711437 Wen Gong            2021-11-22  1955  		for (i =3D 7; i >=3D=
 0; i--) {
3db26ecf711437 Wen Gong            2021-11-22  1956  			u8 mcs_160 =3D (mcs=
_160_map >> (2 * i)) & 3;
3db26ecf711437 Wen Gong            2021-11-22  1957  =

3db26ecf711437 Wen Gong            2021-11-22  1958  			if (mcs_160 !=3D IE=
EE80211_VHT_MCS_NOT_SUPPORTED) {
3db26ecf711437 Wen Gong            2021-11-22  1959  				rx_mcs_160 =3D i +=
 1;
3db26ecf711437 Wen Gong            2021-11-22  1960  				break;
3db26ecf711437 Wen Gong            2021-11-22  1961  			}
3db26ecf711437 Wen Gong            2021-11-22  1962  		}
3db26ecf711437 Wen Gong            2021-11-22  1963  	}
3db26ecf711437 Wen Gong            2021-11-22  1964  =

3db26ecf711437 Wen Gong            2021-11-22  1965  	for (i =3D 7; i >=3D =
0; i--) {
3db26ecf711437 Wen Gong            2021-11-22  1966  		u8 mcs_80 =3D (mcs_8=
0_map >> (2 * i)) & 3;
3db26ecf711437 Wen Gong            2021-11-22  1967  =

3db26ecf711437 Wen Gong            2021-11-22  1968  		if (mcs_80 !=3D IEEE=
80211_VHT_MCS_NOT_SUPPORTED) {
3db26ecf711437 Wen Gong            2021-11-22  1969  			rx_mcs_80 =3D i + 1;
3db26ecf711437 Wen Gong            2021-11-22  1970  			break;
3db26ecf711437 Wen Gong            2021-11-22  1971  		}
3db26ecf711437 Wen Gong            2021-11-22  1972  	}
3db26ecf711437 Wen Gong            2021-11-22  1973  =

3db26ecf711437 Wen Gong            2021-11-22  1974  	if (support_160)
3db26ecf711437 Wen Gong            2021-11-22 @1975  		max_nss =3D min(rx_m=
cs_80, rx_mcs_160);
3db26ecf711437 Wen Gong            2021-11-22  1976  	else
3db26ecf711437 Wen Gong            2021-11-22  1977  		max_nss =3D rx_mcs_8=
0;
3db26ecf711437 Wen Gong            2021-11-22  1978  =

3db26ecf711437 Wen Gong            2021-11-22  1979  	arg->peer_nss =3D min=
(sta->rx_nss, max_nss);
9f056ed8ee01ad John Crispin        2019-11-25  1980  =

c8bcd82a4efd05 Kees Cook           2021-06-16  1981  	memcpy_and_pad(&arg->=
peer_he_cap_macinfo,
c8bcd82a4efd05 Kees Cook           2021-06-16  1982  		       sizeof(arg->p=
eer_he_cap_macinfo),
c8bcd82a4efd05 Kees Cook           2021-06-16  1983  		       he_cap->he_ca=
p_elem.mac_cap_info,
c8bcd82a4efd05 Kees Cook           2021-06-16  1984  		       sizeof(he_cap=
->he_cap_elem.mac_cap_info),
c8bcd82a4efd05 Kees Cook           2021-06-16  1985  		       0);
c8bcd82a4efd05 Kees Cook           2021-06-16  1986  	memcpy_and_pad(&arg->=
peer_he_cap_phyinfo,
c8bcd82a4efd05 Kees Cook           2021-06-16  1987  		       sizeof(arg->p=
eer_he_cap_phyinfo),
c8bcd82a4efd05 Kees Cook           2021-06-16  1988  		       he_cap->he_ca=
p_elem.phy_cap_info,
c8bcd82a4efd05 Kees Cook           2021-06-16  1989  		       sizeof(he_cap=
->he_cap_elem.phy_cap_info),
c8bcd82a4efd05 Kees Cook           2021-06-16  1990  		       0);
60689de46c7f6a Rajkumar Manoharan  2020-04-24  1991  	arg->peer_he_ops =3D =
vif->bss_conf.he_oper.params;
9f056ed8ee01ad John Crispin        2019-11-25  1992  =

9f056ed8ee01ad John Crispin        2019-11-25  1993  	/* the top most byte =
is used to indicate BSS color info */
9f056ed8ee01ad John Crispin        2019-11-25  1994  	arg->peer_he_ops &=3D=
 0xffffff;
9f056ed8ee01ad John Crispin        2019-11-25  1995  =

af6d39db1b046a Tamizh Chelvam      2020-09-08  1996  	/* As per section 26.=
6.1 11ax Draft5.0, if the Max AMPDU Exponent Extension
af6d39db1b046a Tamizh Chelvam      2020-09-08  1997  	 * in HE cap is zero,=
 use the arg->peer_max_mpdu as calculated while parsing
af6d39db1b046a Tamizh Chelvam      2020-09-08  1998  	 * VHT caps(if VHT ca=
ps is present) or HT caps (if VHT caps is not present).
af6d39db1b046a Tamizh Chelvam      2020-09-08  1999  	 *
af6d39db1b046a Tamizh Chelvam      2020-09-08  2000  	 * For non-zero value=
 of Max AMPDU Extponent Extension in HE MAC caps,
af6d39db1b046a Tamizh Chelvam      2020-09-08  2001  	 * if a HE STA sends =
VHT cap and HE cap IE in assoc request then, use
af6d39db1b046a Tamizh Chelvam      2020-09-08  2002  	 * MAX_AMPDU_LEN_FACT=
OR as 20 to calculate max_ampdu length.
af6d39db1b046a Tamizh Chelvam      2020-09-08  2003  	 * If a HE STA that d=
oes not send VHT cap, but HE and HT cap in assoc
af6d39db1b046a Tamizh Chelvam      2020-09-08  2004  	 * request, then use =
MAX_AMPDU_LEN_FACTOR as 16 to calculate max_ampdu
af6d39db1b046a Tamizh Chelvam      2020-09-08  2005  	 * length.
af6d39db1b046a Tamizh Chelvam      2020-09-08  2006  	 */
1f851b8dfd76a0 Johannes Berg       2021-04-09  2007  	ampdu_factor =3D u8_g=
et_bits(he_cap->he_cap_elem.mac_cap_info[3],
1f851b8dfd76a0 Johannes Berg       2021-04-09  2008  				   IEEE80211_HE_MA=
C_CAP3_MAX_AMPDU_LEN_EXP_MASK);
af6d39db1b046a Tamizh Chelvam      2020-09-08  2009  =

af6d39db1b046a Tamizh Chelvam      2020-09-08  2010  	if (ampdu_factor) {
af6d39db1b046a Tamizh Chelvam      2020-09-08  2011  		if (sta->vht_cap.vht=
_supported)
af6d39db1b046a Tamizh Chelvam      2020-09-08  2012  			arg->peer_max_mpdu =
=3D (1 << (IEEE80211_HE_VHT_MAX_AMPDU_FACTOR +
af6d39db1b046a Tamizh Chelvam      2020-09-08  2013  						    ampdu_factor=
)) - 1;
af6d39db1b046a Tamizh Chelvam      2020-09-08  2014  		else if (sta->ht_cap=
.ht_supported)
af6d39db1b046a Tamizh Chelvam      2020-09-08  2015  			arg->peer_max_mpdu =
=3D (1 << (IEEE80211_HE_HT_MAX_AMPDU_FACTOR +
af6d39db1b046a Tamizh Chelvam      2020-09-08  2016  						    ampdu_factor=
)) - 1;
af6d39db1b046a Tamizh Chelvam      2020-09-08  2017  	}
af6d39db1b046a Tamizh Chelvam      2020-09-08  2018  =

9f056ed8ee01ad John Crispin        2019-11-25  2019  	if (he_cap->he_cap_el=
em.phy_cap_info[6] &
9f056ed8ee01ad John Crispin        2019-11-25  2020  	    IEEE80211_HE_PHY_=
CAP6_PPE_THRESHOLD_PRESENT) {
9f056ed8ee01ad John Crispin        2019-11-25  2021  		int bit =3D 7;
9f056ed8ee01ad John Crispin        2019-11-25  2022  		int nss, ru;
9f056ed8ee01ad John Crispin        2019-11-25  2023  =

9f056ed8ee01ad John Crispin        2019-11-25  2024  		arg->peer_ppet.numss=
_m1 =3D he_cap->ppe_thres[0] &
9f056ed8ee01ad John Crispin        2019-11-25  2025  					  IEEE80211_PPE_T=
HRES_NSS_MASK;
9f056ed8ee01ad John Crispin        2019-11-25  2026  		arg->peer_ppet.ru_bi=
t_mask =3D
9f056ed8ee01ad John Crispin        2019-11-25  2027  			(he_cap->ppe_thres[=
0] &
9f056ed8ee01ad John Crispin        2019-11-25  2028  			 IEEE80211_PPE_THRE=
S_RU_INDEX_BITMASK_MASK) >>
9f056ed8ee01ad John Crispin        2019-11-25  2029  			IEEE80211_PPE_THRES=
_RU_INDEX_BITMASK_POS;
9f056ed8ee01ad John Crispin        2019-11-25  2030  =

9f056ed8ee01ad John Crispin        2019-11-25  2031  		for (nss =3D 0; nss =
<=3D arg->peer_ppet.numss_m1; nss++) {
9f056ed8ee01ad John Crispin        2019-11-25  2032  			for (ru =3D 0; ru <=
 4; ru++) {
9f056ed8ee01ad John Crispin        2019-11-25  2033  				u32 val =3D 0;
9f056ed8ee01ad John Crispin        2019-11-25  2034  				int i;
9f056ed8ee01ad John Crispin        2019-11-25  2035  =

9f056ed8ee01ad John Crispin        2019-11-25  2036  				if ((arg->peer_ppe=
t.ru_bit_mask & BIT(ru)) =3D=3D 0)
9f056ed8ee01ad John Crispin        2019-11-25  2037  					continue;
9f056ed8ee01ad John Crispin        2019-11-25  2038  				for (i =3D 0; i < =
6; i++) {
9f056ed8ee01ad John Crispin        2019-11-25  2039  					val >>=3D 1;
9f056ed8ee01ad John Crispin        2019-11-25  2040  					val |=3D ((he_cap=
->ppe_thres[bit / 8] >>
9f056ed8ee01ad John Crispin        2019-11-25  2041  						 (bit % 8)) & 0x=
1) << 5;
9f056ed8ee01ad John Crispin        2019-11-25  2042  					bit++;
9f056ed8ee01ad John Crispin        2019-11-25  2043  				}
9f056ed8ee01ad John Crispin        2019-11-25  2044  				arg->peer_ppet.ppe=
t16_ppet8_ru3_ru0[nss] |=3D
9f056ed8ee01ad John Crispin        2019-11-25  2045  								val << (ru * 6=
);
9f056ed8ee01ad John Crispin        2019-11-25  2046  			}
9f056ed8ee01ad John Crispin        2019-11-25  2047  		}
9f056ed8ee01ad John Crispin        2019-11-25  2048  	}
9f056ed8ee01ad John Crispin        2019-11-25  2049  =

6d293d447670da John Crispin        2019-11-25  2050  	if (he_cap->he_cap_el=
em.mac_cap_info[0] & IEEE80211_HE_MAC_CAP0_TWT_RES)
6d293d447670da John Crispin        2019-11-25  2051  		arg->twt_responder =
=3D true;
6d293d447670da John Crispin        2019-11-25  2052  	if (he_cap->he_cap_el=
em.mac_cap_info[0] & IEEE80211_HE_MAC_CAP0_TWT_REQ)
6d293d447670da John Crispin        2019-11-25  2053  		arg->twt_requester =
=3D true;
6d293d447670da John Crispin        2019-11-25  2054  =

61fe43e7216df6 Miles Hu            2021-09-24  2055  	he_nss =3D  ath11k_ma=
c_max_he_nss(he_mcs_mask);
61fe43e7216df6 Miles Hu            2021-09-24  2056  =

61fe43e7216df6 Miles Hu            2021-09-24  2057  	if (he_nss > sta->rx_=
nss) {
61fe43e7216df6 Miles Hu            2021-09-24  2058  		user_rate_valid =3D =
false;
61fe43e7216df6 Miles Hu            2021-09-24  2059  		for (nss_idx =3D sta=
->rx_nss - 1; nss_idx >=3D 0; nss_idx--) {
61fe43e7216df6 Miles Hu            2021-09-24  2060  			if (he_mcs_mask[nss=
_idx]) {
61fe43e7216df6 Miles Hu            2021-09-24  2061  				user_rate_valid =
=3D true;
61fe43e7216df6 Miles Hu            2021-09-24  2062  				break;
61fe43e7216df6 Miles Hu            2021-09-24  2063  			}
61fe43e7216df6 Miles Hu            2021-09-24  2064  		}
61fe43e7216df6 Miles Hu            2021-09-24  2065  	}
61fe43e7216df6 Miles Hu            2021-09-24  2066  =

61fe43e7216df6 Miles Hu            2021-09-24  2067  	if (!user_rate_valid)=
 {
61fe43e7216df6 Miles Hu            2021-09-24  2068  		ath11k_dbg(ar->ab, A=
TH11K_DBG_MAC, "mac setting he range mcs value to peer supported nss %d for=
 peer %pM\n",
61fe43e7216df6 Miles Hu            2021-09-24  2069  			   sta->rx_nss, sta=
->addr);
61fe43e7216df6 Miles Hu            2021-09-24  2070  		he_mcs_mask[sta->rx_=
nss - 1] =3D he_mcs_mask[he_nss - 1];
61fe43e7216df6 Miles Hu            2021-09-24  2071  	}
61fe43e7216df6 Miles Hu            2021-09-24  2072  =

9f056ed8ee01ad John Crispin        2019-11-25  2073  	switch (sta->bandwidt=
h) {
9f056ed8ee01ad John Crispin        2019-11-25  2074  	case IEEE80211_STA_RX=
_BW_160:
9f056ed8ee01ad John Crispin        2019-11-25  2075  		if (he_cap->he_cap_e=
lem.phy_cap_info[0] &
9f056ed8ee01ad John Crispin        2019-11-25  2076  		    IEEE80211_HE_PHY=
_CAP0_CHANNEL_WIDTH_SET_80PLUS80_MHZ_IN_5G) {
9f056ed8ee01ad John Crispin        2019-11-25  2077  			v =3D le16_to_cpu(h=
e_cap->he_mcs_nss_supp.rx_mcs_80p80);
61fe43e7216df6 Miles Hu            2021-09-24  2078  			v =3D ath11k_peer_a=
ssoc_h_he_limit(v, he_mcs_mask);
9f056ed8ee01ad John Crispin        2019-11-25  2079  			arg->peer_he_rx_mcs=
_set[WMI_HECAP_TXRX_MCS_NSS_IDX_80_80] =3D v;
9f056ed8ee01ad John Crispin        2019-11-25  2080  =

9f056ed8ee01ad John Crispin        2019-11-25  2081  			v =3D le16_to_cpu(h=
e_cap->he_mcs_nss_supp.tx_mcs_80p80);
9f056ed8ee01ad John Crispin        2019-11-25  2082  			arg->peer_he_tx_mcs=
_set[WMI_HECAP_TXRX_MCS_NSS_IDX_80_80] =3D v;
9f056ed8ee01ad John Crispin        2019-11-25  2083  =

9f056ed8ee01ad John Crispin        2019-11-25  2084  			arg->peer_he_mcs_co=
unt++;
61fe43e7216df6 Miles Hu            2021-09-24  2085  			he_tx_mcs =3D v;
9f056ed8ee01ad John Crispin        2019-11-25  2086  		}
9f056ed8ee01ad John Crispin        2019-11-25  2087  		v =3D le16_to_cpu(he=
_cap->he_mcs_nss_supp.rx_mcs_160);
9f056ed8ee01ad John Crispin        2019-11-25  2088  		arg->peer_he_rx_mcs_=
set[WMI_HECAP_TXRX_MCS_NSS_IDX_160] =3D v;
9f056ed8ee01ad John Crispin        2019-11-25  2089  =

9f056ed8ee01ad John Crispin        2019-11-25  2090  		v =3D le16_to_cpu(he=
_cap->he_mcs_nss_supp.tx_mcs_160);
61fe43e7216df6 Miles Hu            2021-09-24  2091  		v =3D ath11k_peer_as=
soc_h_he_limit(v, he_mcs_mask);
9f056ed8ee01ad John Crispin        2019-11-25  2092  		arg->peer_he_tx_mcs_=
set[WMI_HECAP_TXRX_MCS_NSS_IDX_160] =3D v;
9f056ed8ee01ad John Crispin        2019-11-25  2093  =

9f056ed8ee01ad John Crispin        2019-11-25  2094  		arg->peer_he_mcs_cou=
nt++;
61fe43e7216df6 Miles Hu            2021-09-24  2095  		if (!he_tx_mcs)
61fe43e7216df6 Miles Hu            2021-09-24  2096  			he_tx_mcs =3D v;
0b294aebb6a00b Gustavo A. R. Silva 2020-07-27  2097  		fallthrough;
9f056ed8ee01ad John Crispin        2019-11-25  2098  =

9f056ed8ee01ad John Crispin        2019-11-25  2099  	default:
9f056ed8ee01ad John Crispin        2019-11-25  2100  		v =3D le16_to_cpu(he=
_cap->he_mcs_nss_supp.rx_mcs_80);
9f056ed8ee01ad John Crispin        2019-11-25  2101  		arg->peer_he_rx_mcs_=
set[WMI_HECAP_TXRX_MCS_NSS_IDX_80] =3D v;
9f056ed8ee01ad John Crispin        2019-11-25  2102  =

9f056ed8ee01ad John Crispin        2019-11-25  2103  		v =3D le16_to_cpu(he=
_cap->he_mcs_nss_supp.tx_mcs_80);
61fe43e7216df6 Miles Hu            2021-09-24  2104  		v =3D ath11k_peer_as=
soc_h_he_limit(v, he_mcs_mask);
9f056ed8ee01ad John Crispin        2019-11-25  2105  		arg->peer_he_tx_mcs_=
set[WMI_HECAP_TXRX_MCS_NSS_IDX_80] =3D v;
9f056ed8ee01ad John Crispin        2019-11-25  2106  =

9f056ed8ee01ad John Crispin        2019-11-25  2107  		arg->peer_he_mcs_cou=
nt++;
61fe43e7216df6 Miles Hu            2021-09-24  2108  		if (!he_tx_mcs)
61fe43e7216df6 Miles Hu            2021-09-24  2109  			he_tx_mcs =3D v;
9f056ed8ee01ad John Crispin        2019-11-25  2110  		break;
9f056ed8ee01ad John Crispin        2019-11-25  2111  	}
61fe43e7216df6 Miles Hu            2021-09-24  2112  =

61fe43e7216df6 Miles Hu            2021-09-24  2113  	/* Calculate peer NSS=
 capability from HE capabilities if STA
61fe43e7216df6 Miles Hu            2021-09-24  2114  	 * supports HE.
61fe43e7216df6 Miles Hu            2021-09-24  2115  	 */
61fe43e7216df6 Miles Hu            2021-09-24  2116  	for (i =3D 0, max_nss=
 =3D 0, he_mcs =3D 0; i < NL80211_HE_NSS_MAX; i++) {
61fe43e7216df6 Miles Hu            2021-09-24  2117  		he_mcs =3D he_tx_mcs=
 >> (2 * i) & 3;
61fe43e7216df6 Miles Hu            2021-09-24  2118  =

61fe43e7216df6 Miles Hu            2021-09-24  2119  		/* In case of fixed =
rates, MCS Range in he_tx_mcs might have
61fe43e7216df6 Miles Hu            2021-09-24  2120  		 * unsupported range=
, with he_mcs_mask set, so check either of them
61fe43e7216df6 Miles Hu            2021-09-24  2121  		 * to find nss.
61fe43e7216df6 Miles Hu            2021-09-24  2122  		 */
61fe43e7216df6 Miles Hu            2021-09-24  2123  		if (he_mcs !=3D IEEE=
80211_HE_MCS_NOT_SUPPORTED ||
61fe43e7216df6 Miles Hu            2021-09-24  2124  		    he_mcs_mask[i])
61fe43e7216df6 Miles Hu            2021-09-24  2125  			max_nss =3D i + 1;
61fe43e7216df6 Miles Hu            2021-09-24  2126  	}
61fe43e7216df6 Miles Hu            2021-09-24  2127  	arg->peer_nss =3D min=
(sta->rx_nss, max_nss);
61fe43e7216df6 Miles Hu            2021-09-24  2128  =

f552d6fd2f27ce P Praneesh          2021-09-24  2129  	if (arg->peer_phymode=
 =3D=3D MODE_11AX_HE160 ||
f552d6fd2f27ce P Praneesh          2021-09-24  2130  	    arg->peer_phymode=
 =3D=3D MODE_11AX_HE80_80) {
f552d6fd2f27ce P Praneesh          2021-09-24  2131  		tx_nss =3D ath11k_ge=
t_nss_160mhz(ar, max_nss);
f552d6fd2f27ce P Praneesh          2021-09-24  2132  		rx_nss =3D min(arg->=
peer_nss, tx_nss);
f552d6fd2f27ce P Praneesh          2021-09-24  2133  		arg->peer_bw_rxnss_o=
verride =3D ATH11K_BW_NSS_MAP_ENABLE;
f552d6fd2f27ce P Praneesh          2021-09-24  2134  =

f552d6fd2f27ce P Praneesh          2021-09-24  2135  		if (!rx_nss) {
f552d6fd2f27ce P Praneesh          2021-09-24  2136  			ath11k_warn(ar->ab,=
 "invalid max_nss\n");
f552d6fd2f27ce P Praneesh          2021-09-24  2137  			return;
f552d6fd2f27ce P Praneesh          2021-09-24  2138  		}
f552d6fd2f27ce P Praneesh          2021-09-24  2139  =

f552d6fd2f27ce P Praneesh          2021-09-24  2140  		if (arg->peer_phymod=
e =3D=3D MODE_11AX_HE160)
f552d6fd2f27ce P Praneesh          2021-09-24  2141  			nss_160 =3D FIELD_P=
REP(ATH11K_PEER_RX_NSS_160MHZ, rx_nss - 1);
f552d6fd2f27ce P Praneesh          2021-09-24  2142  		else
f552d6fd2f27ce P Praneesh          2021-09-24  2143  			nss_160 =3D FIELD_P=
REP(ATH11K_PEER_RX_NSS_80_80MHZ, rx_nss - 1);
f552d6fd2f27ce P Praneesh          2021-09-24  2144  =

f552d6fd2f27ce P Praneesh          2021-09-24  2145  		arg->peer_bw_rxnss_o=
verride |=3D nss_160;
f552d6fd2f27ce P Praneesh          2021-09-24  2146  	}
f552d6fd2f27ce P Praneesh          2021-09-24  2147  =

61fe43e7216df6 Miles Hu            2021-09-24  2148  	ath11k_dbg(ar->ab, AT=
H11K_DBG_MAC,
f552d6fd2f27ce P Praneesh          2021-09-24  2149  		   "mac he peer %pM =
nss %d mcs cnt %d nss_override 0x%x\n",
f552d6fd2f27ce P Praneesh          2021-09-24  2150  		   sta->addr, arg->p=
eer_nss,
f552d6fd2f27ce P Praneesh          2021-09-24  2151  		   arg->peer_he_mcs_=
count,
f552d6fd2f27ce P Praneesh          2021-09-24  2152  		   arg->peer_bw_rxns=
s_override);
d5c65159f28953 Kalle Valo          2019-11-23  2153  }
d5c65159f28953 Kalle Valo          2019-11-23  2154  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3807865367574599398==--

