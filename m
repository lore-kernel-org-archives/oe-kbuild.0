Content-Type: multipart/mixed; boundary="===============0396827752427730770=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1856 mt7915_mcu_beacon_mbss() warn: potential spectre issue 'sub_elem->data' [r] (local cap)
Date: Mon, 15 Aug 2022 16:26:00 +0800
Message-ID: <202208151652.kMUTYoWY-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0396827752427730770==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Lorenzo Bianconi <lorenzo@kernel.org>
CC: Felix Fietkau <nbd@nbd.name>
CC: Ryder Lee <ryder.lee@mediatek.com>
CC: Money Wang <money.wang@mediatek.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   568035b01cfb107af8d2e4bd2fb9aea22cf5b868
commit: 6b7f9aff7c673989c6adf601c7e3f3684d5acd44 mt76: mt7915: introduce 80=
2.11ax multi-bss support
date:   5 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 5 months ago
config: ia64-randconfig-m031-20220814 (https://download.01.org/0day-ci/arch=
ive/20220815/202208151652.kMUTYoWY-lkp(a)intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1856 mt7915_mcu_beacon_mbss=
() warn: potential spectre issue 'sub_elem->data' [r] (local cap)
drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1848 mt7915_mcu_beacon_mbss=
() warn: potential spectre issue 'elem->data' [r] (local cap)

Old smatch warnings:
drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:3540 mt7915_mcu_get_rx_rate=
() warn: potential spectre issue 'sband->bitrates' [r]

vim +1856 drivers/net/wireless/mediatek/mt76/mt7915/mcu.c

e57b7901469fc0 Ryder Lee        2020-04-25  1827  =

6b7f9aff7c6739 Lorenzo Bianconi 2022-03-15  1828  static void
6b7f9aff7c6739 Lorenzo Bianconi 2022-03-15  1829  mt7915_mcu_beacon_mbss(st=
ruct sk_buff *rskb, struct sk_buff *skb,
6b7f9aff7c6739 Lorenzo Bianconi 2022-03-15  1830  		       struct ieee80211=
_vif *vif, struct bss_info_bcn *bcn,
6b7f9aff7c6739 Lorenzo Bianconi 2022-03-15  1831  		       struct ieee80211=
_mutable_offsets *offs)
6b7f9aff7c6739 Lorenzo Bianconi 2022-03-15  1832  {
6b7f9aff7c6739 Lorenzo Bianconi 2022-03-15  1833  	struct bss_info_bcn_mbss=
 *mbss;
6b7f9aff7c6739 Lorenzo Bianconi 2022-03-15  1834  	const struct element *el=
em;
6b7f9aff7c6739 Lorenzo Bianconi 2022-03-15  1835  	struct tlv *tlv;
6b7f9aff7c6739 Lorenzo Bianconi 2022-03-15  1836  =

6b7f9aff7c6739 Lorenzo Bianconi 2022-03-15  1837  	if (!vif->bss_conf.bssid=
_indicator)
6b7f9aff7c6739 Lorenzo Bianconi 2022-03-15  1838  		return;
6b7f9aff7c6739 Lorenzo Bianconi 2022-03-15  1839  =

6b7f9aff7c6739 Lorenzo Bianconi 2022-03-15  1840  	tlv =3D mt7915_mcu_add_n=
ested_subtlv(rskb, BSS_INFO_BCN_MBSSID,
6b7f9aff7c6739 Lorenzo Bianconi 2022-03-15  1841  					   sizeof(*mbss), &b=
cn->sub_ntlv,
6b7f9aff7c6739 Lorenzo Bianconi 2022-03-15  1842  					   &bcn->len);
6b7f9aff7c6739 Lorenzo Bianconi 2022-03-15  1843  =

6b7f9aff7c6739 Lorenzo Bianconi 2022-03-15  1844  	mbss =3D (struct bss_inf=
o_bcn_mbss *)tlv;
6b7f9aff7c6739 Lorenzo Bianconi 2022-03-15  1845  	mbss->offset[0] =3D cpu_=
to_le16(offs->tim_offset);
6b7f9aff7c6739 Lorenzo Bianconi 2022-03-15  1846  	mbss->bitmap =3D cpu_to_=
le32(1);
6b7f9aff7c6739 Lorenzo Bianconi 2022-03-15  1847  =

6b7f9aff7c6739 Lorenzo Bianconi 2022-03-15 @1848  	for_each_element_id(elem=
, WLAN_EID_MULTIPLE_BSSID,
6b7f9aff7c6739 Lorenzo Bianconi 2022-03-15  1849  			    &skb->data[offs->m=
bssid_off],
6b7f9aff7c6739 Lorenzo Bianconi 2022-03-15  1850  			    skb->len - offs->m=
bssid_off) {
6b7f9aff7c6739 Lorenzo Bianconi 2022-03-15  1851  		const struct element *s=
ub_elem;
6b7f9aff7c6739 Lorenzo Bianconi 2022-03-15  1852  =

6b7f9aff7c6739 Lorenzo Bianconi 2022-03-15  1853  		if (elem->datalen < 2)
6b7f9aff7c6739 Lorenzo Bianconi 2022-03-15  1854  			continue;
6b7f9aff7c6739 Lorenzo Bianconi 2022-03-15  1855  =

6b7f9aff7c6739 Lorenzo Bianconi 2022-03-15 @1856  		for_each_element(sub_el=
em, elem->data + 1, elem->datalen - 1) {
6b7f9aff7c6739 Lorenzo Bianconi 2022-03-15  1857  			const u8 *data;
6b7f9aff7c6739 Lorenzo Bianconi 2022-03-15  1858  =

6b7f9aff7c6739 Lorenzo Bianconi 2022-03-15  1859  			if (sub_elem->id || su=
b_elem->datalen < 4)
6b7f9aff7c6739 Lorenzo Bianconi 2022-03-15  1860  				continue; /* not a va=
lid BSS profile */
6b7f9aff7c6739 Lorenzo Bianconi 2022-03-15  1861  =

6b7f9aff7c6739 Lorenzo Bianconi 2022-03-15  1862  			/* Find WLAN_EID_MULTI=
_BSSID_IDX
6b7f9aff7c6739 Lorenzo Bianconi 2022-03-15  1863  			 * in the merged nontr=
ansmitted profile
6b7f9aff7c6739 Lorenzo Bianconi 2022-03-15  1864  			 */
6b7f9aff7c6739 Lorenzo Bianconi 2022-03-15  1865  			data =3D cfg80211_find=
_ie(WLAN_EID_MULTI_BSSID_IDX,
6b7f9aff7c6739 Lorenzo Bianconi 2022-03-15  1866  						sub_elem->data,
6b7f9aff7c6739 Lorenzo Bianconi 2022-03-15  1867  						sub_elem->datalen);
6b7f9aff7c6739 Lorenzo Bianconi 2022-03-15  1868  			if (!data || data[1] <=
 1 || !data[2])
6b7f9aff7c6739 Lorenzo Bianconi 2022-03-15  1869  				continue;
6b7f9aff7c6739 Lorenzo Bianconi 2022-03-15  1870  =

6b7f9aff7c6739 Lorenzo Bianconi 2022-03-15  1871  			mbss->offset[data[2]] =
=3D cpu_to_le16(data - skb->data);
6b7f9aff7c6739 Lorenzo Bianconi 2022-03-15  1872  			mbss->bitmap |=3D cpu_=
to_le32(BIT(data[2]));
6b7f9aff7c6739 Lorenzo Bianconi 2022-03-15  1873  		}
6b7f9aff7c6739 Lorenzo Bianconi 2022-03-15  1874  	}
6b7f9aff7c6739 Lorenzo Bianconi 2022-03-15  1875  }
6b7f9aff7c6739 Lorenzo Bianconi 2022-03-15  1876  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0396827752427730770==--

