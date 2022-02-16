Content-Type: multipart/mixed; boundary="===============2730063916681596763=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 556/6237] drivers/net/wireless/ath/wcn36xx/main.c:409:7: warning: Branch condition evaluates to a garbage value [clang-analyzer-core.uninitialized.Branch]
Date: Thu, 17 Feb 2022 05:35:27 +0800
Message-ID: <202202170554.WYrgcFtq-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2730063916681596763==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
CC: Kalle Valo <quic_kvalo@quicinc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   763a906a02e961eedabab7dbedd16904a3bd0184
commit: d6f2746691cb10e484f15ab9e44e2cc2ccf9bd86 [556/6237] wcn36xx: Track =
the band and channel we are tuned to
:::::: branch date: 13 hours ago
:::::: commit date: 4 weeks ago
config: x86_64-randconfig-c007 (https://download.01.org/0day-ci/archive/202=
20217/202202170554.WYrgcFtq-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0e628a=
783b935c70c80815db6c061ec84f884af5)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3Dd6f2746691cb10e484f15ab9e44e2cc2ccf9bd86
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout d6f2746691cb10e484f15ab9e44e2cc2ccf9bd86
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
               ^~~~~~~~~
   net/ipv4/sysctl_net_ipv4.c:303:2: note: Taking false branch
           if (!tbl.data)
           ^
   net/ipv4/sysctl_net_ipv4.c:307:6: note: Assuming 'n_keys' is not equal t=
o 0
           if (!n_keys) {
               ^~~~~~~
   net/ipv4/sysctl_net_ipv4.c:307:2: note: Taking false branch
           if (!n_keys) {
           ^
   net/ipv4/sysctl_net_ipv4.c:312:14: note: Assuming the condition is true
           for (i =3D 0; i < n_keys * 4; i++)
                       ^~~~~~~~~~~~~~
   net/ipv4/sysctl_net_ipv4.c:312:2: note: Loop condition is true.  Enterin=
g loop body
           for (i =3D 0; i < n_keys * 4; i++)
           ^
   net/ipv4/sysctl_net_ipv4.c:312:14: note: Assuming the condition is true
           for (i =3D 0; i < n_keys * 4; i++)
                       ^~~~~~~~~~~~~~
   net/ipv4/sysctl_net_ipv4.c:312:2: note: Loop condition is true.  Enterin=
g loop body
           for (i =3D 0; i < n_keys * 4; i++)
           ^
   net/ipv4/sysctl_net_ipv4.c:312:14: note: Assuming the condition is false
           for (i =3D 0; i < n_keys * 4; i++)
                       ^~~~~~~~~~~~~~
   net/ipv4/sysctl_net_ipv4.c:312:2: note: Loop condition is false. Executi=
on continues on line 315
           for (i =3D 0; i < n_keys * 4; i++)
           ^
   net/ipv4/sysctl_net_ipv4.c:315:14: note: Assuming 'i' is < 'n_keys'
           for (i =3D 0; i < n_keys; i++) {
                       ^~~~~~~~~~
   net/ipv4/sysctl_net_ipv4.c:315:2: note: Loop condition is true.  Enterin=
g loop body
           for (i =3D 0; i < n_keys; i++) {
           ^
   net/ipv4/sysctl_net_ipv4.c:316:10: note: 6th function call argument is a=
n uninitialized value
                   off +=3D snprintf(tbl.data + off, tbl.maxlen - off,
                          ^
   net/ipv4/sysctl_net_ipv4.c:316:10: warning: 7th function call argument i=
s an uninitialized value [clang-analyzer-core.CallAndMessage]
                   off +=3D snprintf(tbl.data + off, tbl.maxlen - off,
                          ^
   net/ipv4/sysctl_net_ipv4.c:302:13: note: Calling 'kmalloc'
           tbl.data =3D kmalloc(tbl.maxlen, GFP_KERNEL);
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:578:2: note: Taking false branch
           if (__builtin_constant_p(size)) {
           ^
   include/linux/slab.h:595:2: note: Returning pointer, which participates =
in a condition later
           return __kmalloc(size, flags);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ipv4/sysctl_net_ipv4.c:302:13: note: Returning from 'kmalloc'
           tbl.data =3D kmalloc(tbl.maxlen, GFP_KERNEL);
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ipv4/sysctl_net_ipv4.c:303:6: note: Assuming field 'data' is non-null
           if (!tbl.data)
               ^~~~~~~~~
   net/ipv4/sysctl_net_ipv4.c:303:2: note: Taking false branch
           if (!tbl.data)
           ^
   net/ipv4/sysctl_net_ipv4.c:307:6: note: Assuming 'n_keys' is not equal t=
o 0
           if (!n_keys) {
               ^~~~~~~
   net/ipv4/sysctl_net_ipv4.c:307:2: note: Taking false branch
           if (!n_keys) {
           ^
   net/ipv4/sysctl_net_ipv4.c:312:14: note: Assuming the condition is true
           for (i =3D 0; i < n_keys * 4; i++)
                       ^~~~~~~~~~~~~~
   net/ipv4/sysctl_net_ipv4.c:312:2: note: Loop condition is true.  Enterin=
g loop body
           for (i =3D 0; i < n_keys * 4; i++)
           ^
   net/ipv4/sysctl_net_ipv4.c:312:14: note: Assuming the condition is true
           for (i =3D 0; i < n_keys * 4; i++)
                       ^~~~~~~~~~~~~~
   net/ipv4/sysctl_net_ipv4.c:312:2: note: Loop condition is true.  Enterin=
g loop body
           for (i =3D 0; i < n_keys * 4; i++)
           ^
   net/ipv4/sysctl_net_ipv4.c:312:14: note: Assuming the condition is true
           for (i =3D 0; i < n_keys * 4; i++)
                       ^~~~~~~~~~~~~~
   net/ipv4/sysctl_net_ipv4.c:312:2: note: Loop condition is true.  Enterin=
g loop body
           for (i =3D 0; i < n_keys * 4; i++)
           ^
   net/ipv4/sysctl_net_ipv4.c:312:14: note: Assuming the condition is false
           for (i =3D 0; i < n_keys * 4; i++)
                       ^~~~~~~~~~~~~~
   net/ipv4/sysctl_net_ipv4.c:312:2: note: Loop condition is false. Executi=
on continues on line 315
           for (i =3D 0; i < n_keys * 4; i++)
           ^
   net/ipv4/sysctl_net_ipv4.c:315:14: note: Assuming 'i' is < 'n_keys'
           for (i =3D 0; i < n_keys; i++) {
                       ^~~~~~~~~~
   net/ipv4/sysctl_net_ipv4.c:315:2: note: Loop condition is true.  Enterin=
g loop body
           for (i =3D 0; i < n_keys; i++) {
           ^
   net/ipv4/sysctl_net_ipv4.c:316:10: note: 7th function call argument is a=
n uninitialized value
                   off +=3D snprintf(tbl.data + off, tbl.maxlen - off,
                          ^
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
>> drivers/net/wireless/ath/wcn36xx/main.c:409:7: warning: Branch condition=
 evaluates to a garbage value [clang-analyzer-core.uninitialized.Branch]
                   if (channel)
                       ^
   drivers/net/wireless/ath/wcn36xx/main.c:434:2: note: Assuming the condit=
ion is false
           wcn36xx_dbg(WCN36XX_DBG_MAC, "mac config changed 0x%08x\n", chan=
ged);
           ^
   drivers/net/wireless/ath/wcn36xx/wcn36xx.h:69:6: note: expanded from mac=
ro 'wcn36xx_dbg'
           if (wcn36xx_dbg_mask & mask)                                    \
               ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ath/wcn36xx/main.c:434:2: note: Taking false branch
           wcn36xx_dbg(WCN36XX_DBG_MAC, "mac config changed 0x%08x\n", chan=
ged);
           ^
   drivers/net/wireless/ath/wcn36xx/wcn36xx.h:69:2: note: expanded from mac=
ro 'wcn36xx_dbg'
           if (wcn36xx_dbg_mask & mask)                                    \
           ^
   drivers/net/wireless/ath/wcn36xx/main.c:434:2: note: Loop condition is f=
alse.  Exiting loop
           wcn36xx_dbg(WCN36XX_DBG_MAC, "mac config changed 0x%08x\n", chan=
ged);
           ^
   drivers/net/wireless/ath/wcn36xx/wcn36xx.h:68:40: note: expanded from ma=
cro 'wcn36xx_dbg'
   #define wcn36xx_dbg(mask, fmt, arg...) do {                     \
                                          ^
   drivers/net/wireless/ath/wcn36xx/main.c:438:6: note: Assuming the condit=
ion is true
           if (changed & IEEE80211_CONF_CHANGE_CHANNEL) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ath/wcn36xx/main.c:438:2: note: Taking true branch
           if (changed & IEEE80211_CONF_CHANGE_CHANNEL) {
           ^
   drivers/net/wireless/ath/wcn36xx/main.c:440:3: note: Assuming the condit=
ion is false
                   wcn36xx_dbg(WCN36XX_DBG_MAC, "wcn36xx_config channel swi=
tch=3D%d\n",
                   ^
   drivers/net/wireless/ath/wcn36xx/wcn36xx.h:69:6: note: expanded from mac=
ro 'wcn36xx_dbg'
           if (wcn36xx_dbg_mask & mask)                                    \
               ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ath/wcn36xx/main.c:440:3: note: Taking false branch
                   wcn36xx_dbg(WCN36XX_DBG_MAC, "wcn36xx_config channel swi=
tch=3D%d\n",
                   ^
   drivers/net/wireless/ath/wcn36xx/wcn36xx.h:69:2: note: expanded from mac=
ro 'wcn36xx_dbg'
           if (wcn36xx_dbg_mask & mask)                                    \
           ^
   drivers/net/wireless/ath/wcn36xx/main.c:440:3: note: Loop condition is f=
alse.  Exiting loop
                   wcn36xx_dbg(WCN36XX_DBG_MAC, "wcn36xx_config channel swi=
tch=3D%d\n",
                   ^
   drivers/net/wireless/ath/wcn36xx/wcn36xx.h:68:40: note: expanded from ma=
cro 'wcn36xx_dbg'
   #define wcn36xx_dbg(mask, fmt, arg...) do {                     \
                                          ^
   drivers/net/wireless/ath/wcn36xx/main.c:443:7: note: Assuming 'ch' is no=
t equal to field 'sw_scan_opchannel'
                   if (wcn->sw_scan_opchannel =3D=3D ch && wcn->sw_scan_cha=
nnel) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ath/wcn36xx/main.c:443:36: note: Left side of '&&' =
is false
                   if (wcn->sw_scan_opchannel =3D=3D ch && wcn->sw_scan_cha=
nnel) {
                                                    ^
   drivers/net/wireless/ath/wcn36xx/main.c:454:14: note: Assuming field 'sw=
_scan' is false
                   } else if (wcn->sw_scan) {
                              ^~~~~~~~~~~~
   drivers/net/wireless/ath/wcn36xx/main.c:454:10: note: Taking false branch
                   } else if (wcn->sw_scan) {
                          ^
   drivers/net/wireless/ath/wcn36xx/main.c:474:4: note: Calling 'wcn36xx_ch=
ange_opchannel'
                           wcn36xx_change_opchannel(wcn, ch);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ath/wcn36xx/main.c:396:2: note: 'channel' declared =
without an initial value
           struct ieee80211_channel *channel;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ath/wcn36xx/main.c:399:2: note: Loop condition is t=
rue.  Entering loop body
           for (i =3D 0; i < ARRAY_SIZE(wcn->hw->wiphy->bands); i++) {
           ^
   drivers/net/wireless/ath/wcn36xx/main.c:401:7: note: Assuming 'band' is =
non-null
                   if (!band)
                       ^~~~~
   drivers/net/wireless/ath/wcn36xx/main.c:401:3: note: Taking false branch
                   if (!band)
                   ^
   drivers/net/wireless/ath/wcn36xx/main.c:403:15: note: Assuming 'j' is >=
=3D field 'n_channels'
                   for (j =3D 0; j < band->n_channels; j++) {
                               ^~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ath/wcn36xx/main.c:403:3: note: Loop condition is f=
alse. Execution continues on line 409
                   for (j =3D 0; j < band->n_channels; j++) {
                   ^
   drivers/net/wireless/ath/wcn36xx/main.c:409:7: note: Branch condition ev=
aluates to a garbage value
                   if (channel)
                       ^~~~~~~
   drivers/net/wireless/ath/wcn36xx/main.c:413:6: warning: Branch condition=
 evaluates to a garbage value [clang-analyzer-core.uninitialized.Branch]
           if (!channel) {
               ^
   drivers/net/wireless/ath/wcn36xx/main.c:434:2: note: Assuming the condit=
ion is false
           wcn36xx_dbg(WCN36XX_DBG_MAC, "mac config changed 0x%08x\n", chan=
ged);
           ^
   drivers/net/wireless/ath/wcn36xx/wcn36xx.h:69:6: note: expanded from mac=
ro 'wcn36xx_dbg'
           if (wcn36xx_dbg_mask & mask)                                    \
               ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ath/wcn36xx/main.c:434:2: note: Taking false branch
           wcn36xx_dbg(WCN36XX_DBG_MAC, "mac config changed 0x%08x\n", chan=
ged);
           ^
   drivers/net/wireless/ath/wcn36xx/wcn36xx.h:69:2: note: expanded from mac=
ro 'wcn36xx_dbg'
           if (wcn36xx_dbg_mask & mask)                                    \
           ^
   drivers/net/wireless/ath/wcn36xx/main.c:434:2: note: Loop condition is f=
alse.  Exiting loop
           wcn36xx_dbg(WCN36XX_DBG_MAC, "mac config changed 0x%08x\n", chan=
ged);
           ^
   drivers/net/wireless/ath/wcn36xx/wcn36xx.h:68:40: note: expanded from ma=
cro 'wcn36xx_dbg'
   #define wcn36xx_dbg(mask, fmt, arg...) do {                     \

vim +409 drivers/net/wireless/ath/wcn36xx/main.c

5973a2947430a29 Loic Poulain     2020-08-24  390  =

5973a2947430a29 Loic Poulain     2020-08-24  391  static void wcn36xx_chang=
e_opchannel(struct wcn36xx *wcn, int ch)
5973a2947430a29 Loic Poulain     2020-08-24  392  {
5973a2947430a29 Loic Poulain     2020-08-24  393  	struct ieee80211_vif *vi=
f =3D NULL;
5973a2947430a29 Loic Poulain     2020-08-24  394  	struct wcn36xx_vif *tmp;
d6f2746691cb10e Bryan O'Donoghue 2022-01-15  395  	struct ieee80211_support=
ed_band *band;
d6f2746691cb10e Bryan O'Donoghue 2022-01-15  396  	struct ieee80211_channel=
 *channel;
d6f2746691cb10e Bryan O'Donoghue 2022-01-15  397  	int i, j;
d6f2746691cb10e Bryan O'Donoghue 2022-01-15  398  =

d6f2746691cb10e Bryan O'Donoghue 2022-01-15  399  	for (i =3D 0; i < ARRAY_=
SIZE(wcn->hw->wiphy->bands); i++) {
d6f2746691cb10e Bryan O'Donoghue 2022-01-15  400  		band =3D wcn->hw->wiphy=
->bands[i];
d6f2746691cb10e Bryan O'Donoghue 2022-01-15  401  		if (!band)
d6f2746691cb10e Bryan O'Donoghue 2022-01-15  402  			break;
d6f2746691cb10e Bryan O'Donoghue 2022-01-15  403  		for (j =3D 0; j < band-=
>n_channels; j++) {
d6f2746691cb10e Bryan O'Donoghue 2022-01-15  404  			if (HW_VALUE_CHANNEL(b=
and->channels[j].hw_value) =3D=3D ch) {
d6f2746691cb10e Bryan O'Donoghue 2022-01-15  405  				channel =3D &band->ch=
annels[j];
d6f2746691cb10e Bryan O'Donoghue 2022-01-15  406  				break;
d6f2746691cb10e Bryan O'Donoghue 2022-01-15  407  			}
d6f2746691cb10e Bryan O'Donoghue 2022-01-15  408  		}
d6f2746691cb10e Bryan O'Donoghue 2022-01-15 @409  		if (channel)
d6f2746691cb10e Bryan O'Donoghue 2022-01-15  410  			break;
d6f2746691cb10e Bryan O'Donoghue 2022-01-15  411  	}
d6f2746691cb10e Bryan O'Donoghue 2022-01-15  412  =

d6f2746691cb10e Bryan O'Donoghue 2022-01-15  413  	if (!channel) {
d6f2746691cb10e Bryan O'Donoghue 2022-01-15  414  		wcn36xx_err("Cannot tun=
e to channel %d\n", ch);
d6f2746691cb10e Bryan O'Donoghue 2022-01-15  415  		return;
d6f2746691cb10e Bryan O'Donoghue 2022-01-15  416  	}
d6f2746691cb10e Bryan O'Donoghue 2022-01-15  417  =

d6f2746691cb10e Bryan O'Donoghue 2022-01-15  418  	wcn->band =3D band;
d6f2746691cb10e Bryan O'Donoghue 2022-01-15  419  	wcn->channel =3D channel;
5973a2947430a29 Loic Poulain     2020-08-24  420  =

5973a2947430a29 Loic Poulain     2020-08-24  421  	list_for_each_entry(tmp,=
 &wcn->vif_list, list) {
5973a2947430a29 Loic Poulain     2020-08-24  422  		vif =3D wcn36xx_priv_to=
_vif(tmp);
5973a2947430a29 Loic Poulain     2020-08-24  423  		wcn36xx_smd_switch_chan=
nel(wcn, vif, ch);
5973a2947430a29 Loic Poulain     2020-08-24  424  	}
d6f2746691cb10e Bryan O'Donoghue 2022-01-15  425  =

d6f2746691cb10e Bryan O'Donoghue 2022-01-15  426  	return;
5973a2947430a29 Loic Poulain     2020-08-24  427  }
5973a2947430a29 Loic Poulain     2020-08-24  428  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2730063916681596763==--

