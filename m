Content-Type: multipart/mixed; boundary="===============3939375051219399421=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/wireless/mediatek/mt76/mt7915/mac.c:2285 mt7915_mac_twt_sched_list_add() error: uninitialized symbol 'start_tsf'.
Date: Sun, 24 Apr 2022 15:24:15 +0800
Message-ID: <202204241533.aa2Xf2Kc-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3939375051219399421==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Lorenzo Bianconi <lorenzo@kernel.org>
CC: Felix Fietkau <nbd@nbd.name>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   22da5264abf497a10a4ed629f07f4ba28a7ed5eb
commit: 3782b69d03e714b8ff98b84c7426d8cef0e64d7c mt76: mt7915: introduce mt=
7915_mac_add_twt_setup routine
date:   6 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 6 months ago
config: x86_64-randconfig-m001-20220418 (https://download.01.org/0day-ci/ar=
chive/20220424/202204241533.aa2Xf2Kc-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.2.0-19) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/net/wireless/mediatek/mt76/mt7915/mac.c:2285 mt7915_mac_twt_sched_l=
ist_add() error: uninitialized symbol 'start_tsf'.

Old smatch warnings:
drivers/net/wireless/mediatek/mt76/mt7915/mac.c:1312 mt7915_mac_tx_free() w=
arn: potential spectre issue 'dev->mt76.wcid' [w]

vim +/start_tsf +2285 drivers/net/wireless/mediatek/mt76/mt7915/mac.c

3782b69d03e714 Lorenzo Bianconi 2021-09-23  2252  =

3782b69d03e714 Lorenzo Bianconi 2021-09-23  2253  static u64
3782b69d03e714 Lorenzo Bianconi 2021-09-23  2254  mt7915_mac_twt_sched_list=
_add(struct mt7915_dev *dev,
3782b69d03e714 Lorenzo Bianconi 2021-09-23  2255  			      struct mt7915_tw=
t_flow *flow)
3782b69d03e714 Lorenzo Bianconi 2021-09-23  2256  {
3782b69d03e714 Lorenzo Bianconi 2021-09-23  2257  	struct mt7915_twt_flow *=
iter, *iter_next;
3782b69d03e714 Lorenzo Bianconi 2021-09-23  2258  	u32 duration =3D flow->d=
uration << 8;
3782b69d03e714 Lorenzo Bianconi 2021-09-23  2259  	u64 start_tsf;
3782b69d03e714 Lorenzo Bianconi 2021-09-23  2260  =

3782b69d03e714 Lorenzo Bianconi 2021-09-23  2261  	iter =3D list_first_entr=
y_or_null(&dev->twt_list,
3782b69d03e714 Lorenzo Bianconi 2021-09-23  2262  					struct mt7915_twt_fl=
ow, list);
3782b69d03e714 Lorenzo Bianconi 2021-09-23  2263  	if (!iter || !iter->sche=
d || iter->start_tsf > duration) {
3782b69d03e714 Lorenzo Bianconi 2021-09-23  2264  		/* add flow as first en=
try in the list */
3782b69d03e714 Lorenzo Bianconi 2021-09-23  2265  		list_add(&flow->list, &=
dev->twt_list);
3782b69d03e714 Lorenzo Bianconi 2021-09-23  2266  		return 0;
3782b69d03e714 Lorenzo Bianconi 2021-09-23  2267  	}
3782b69d03e714 Lorenzo Bianconi 2021-09-23  2268  =

3782b69d03e714 Lorenzo Bianconi 2021-09-23  2269  	list_for_each_entry_safe=
(iter, iter_next, &dev->twt_list, list) {
3782b69d03e714 Lorenzo Bianconi 2021-09-23  2270  		start_tsf =3D iter->sta=
rt_tsf +
3782b69d03e714 Lorenzo Bianconi 2021-09-23  2271  			    mt7915_mac_twt_dur=
ation_align(iter->duration);
3782b69d03e714 Lorenzo Bianconi 2021-09-23  2272  		if (list_is_last(&iter-=
>list, &dev->twt_list))
3782b69d03e714 Lorenzo Bianconi 2021-09-23  2273  			break;
3782b69d03e714 Lorenzo Bianconi 2021-09-23  2274  =

3782b69d03e714 Lorenzo Bianconi 2021-09-23  2275  		if (!iter_next->sched ||
3782b69d03e714 Lorenzo Bianconi 2021-09-23  2276  		    iter_next->start_ts=
f > start_tsf + duration) {
3782b69d03e714 Lorenzo Bianconi 2021-09-23  2277  			list_add(&flow->list, =
&iter->list);
3782b69d03e714 Lorenzo Bianconi 2021-09-23  2278  			goto out;
3782b69d03e714 Lorenzo Bianconi 2021-09-23  2279  		}
3782b69d03e714 Lorenzo Bianconi 2021-09-23  2280  	}
3782b69d03e714 Lorenzo Bianconi 2021-09-23  2281  =

3782b69d03e714 Lorenzo Bianconi 2021-09-23  2282  	/* add flow as last entr=
y in the list */
3782b69d03e714 Lorenzo Bianconi 2021-09-23  2283  	list_add_tail(&flow->lis=
t, &dev->twt_list);
3782b69d03e714 Lorenzo Bianconi 2021-09-23  2284  out:
3782b69d03e714 Lorenzo Bianconi 2021-09-23 @2285  	return start_tsf;
3782b69d03e714 Lorenzo Bianconi 2021-09-23  2286  }
3782b69d03e714 Lorenzo Bianconi 2021-09-23  2287  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3939375051219399421==--

