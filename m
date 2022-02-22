Content-Type: multipart/mixed; boundary="===============0111525202939386491=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [chrome-os:chromeos-5.10 9973/9999] drivers/net/wireless/ath/ath11k/mac.c:7025:2: warning: Value stored to 'oper_freq' is never read [clang-analyzer-deadcode.DeadStores]
Date: Tue, 22 Feb 2022 12:07:34 +0800
Message-ID: <202202221233.8KEoDbYh-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0111525202939386491==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: cros-kernel-buildreports(a)googlegroups.com
TO: Guenter Roeck <groeck@google.com>

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chr=
omeos-5.10
head:   4a5e2ff1eb92058cd647d410d574d01796a8e852
commit: 86682dd467b610e054d75fe1830f7e7b851d3d26 [9973/9999] BACKPORT: FROM=
LIST: ath11k: fill parameters for vdev_set_tpc_power wmi command
:::::: branch date: 9 hours ago
:::::: commit date: 4 days ago
config: x86_64-randconfig-c007 (https://download.01.org/0day-ci/archive/202=
20222/202202221233.8KEoDbYh-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc=
04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add chrome-os https://chromium.googlesource.com/chromium=
os/third_party/kernel
        git fetch --no-tags chrome-os chromeos-5.10
        git checkout 86682dd467b610e054d75fe1830f7e7b851d3d26
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/pci/ac97/ac97_codec.c:2228:2: note: Taking false branch
           if (ac97->ext_id & AC97_EI_LDAC) {      /* LDAC support */
           ^
   sound/pci/ac97/ac97_codec.c:2233:6: note: Assuming field 'init' is null
           if (bus->ops->init)
               ^~~~~~~~~~~~~~
   sound/pci/ac97/ac97_codec.c:2233:2: note: Taking false branch
           if (bus->ops->init)
           ^
   sound/pci/ac97/ac97_codec.c:2237:6: note: Assuming field 'build_ops' is =
non-null
           if (! ac97->build_ops)
               ^~~~~~~~~~~~~~~~~
   sound/pci/ac97/ac97_codec.c:2237:2: note: Taking false branch
           if (! ac97->build_ops)
           ^
   sound/pci/ac97/ac97_codec.c:2240:6: note: Calling 'ac97_is_audio'
           if (ac97_is_audio(ac97)) {
               ^~~~~~~~~~~~~~~~~~~
   include/sound/ac97_codec.h:292:2: note: Returning zero, which participat=
es in a condition later
           return (ac97->scaps & AC97_SCAP_AUDIO);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/pci/ac97/ac97_codec.c:2240:6: note: Returning from 'ac97_is_audio'
           if (ac97_is_audio(ac97)) {
               ^~~~~~~~~~~~~~~~~~~
   sound/pci/ac97/ac97_codec.c:2240:2: note: Taking false branch
           if (ac97_is_audio(ac97)) {
           ^
   sound/pci/ac97/ac97_codec.c:2260:6: note: Assuming the condition is false
           if (ac97_is_modem(ac97)) {
               ^~~~~~~~~~~~~~~~~~~
   sound/pci/ac97/ac97_codec.c:2260:2: note: Taking false branch
           if (ac97_is_modem(ac97)) {
           ^
   sound/pci/ac97/ac97_codec.c:2280:2: note: Taking false branch
           if (ac97_is_audio(ac97))
           ^
   sound/pci/ac97/ac97_codec.c:2283:6: note: Assuming the condition is false
           if ((err =3D snd_device_new(card, SNDRV_DEV_CODEC, ac97, &ops)) =
< 0) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/pci/ac97/ac97_codec.c:2283:2: note: Taking false branch
           if ((err =3D snd_device_new(card, SNDRV_DEV_CODEC, ac97, &ops)) =
< 0) {
           ^
   sound/pci/ac97/ac97_codec.c:2287:9: note: Dereference of null pointer (l=
oaded from variable 'rac97')
           *rac97 =3D ac97;
            ~~~~~ ^
   sound/pci/ac97/ac97_codec.c:2594:3: warning: Call to function 'strcpy' i=
s insecure as it does not provide bounding of the memory buffer. Replace un=
bounded copy functions with analogous functions that support length argumen=
ts such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(dst, src);
                   ^~~~~~
   sound/pci/ac97/ac97_codec.c:2594:3: note: Call to function 'strcpy' is i=
nsecure as it does not provide bounding of the memory buffer. Replace unbou=
nded copy functions with analogous functions that support length arguments =
such as 'strlcpy'. CWE-119
                   strcpy(dst, src);
                   ^~~~~~
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   23 warnings generated.
   drivers/net/wireless/ath/ath11k/mac.c:1935:27: warning: Although the val=
ue stored to 'vht_mcs' is used in the enclosing expression, the value is ne=
ver actually read from 'vht_mcs' [clang-analyzer-deadcode.DeadStores]
           for (i =3D 0, max_nss =3D 0, vht_mcs =3D 0; i < NL80211_VHT_NSS_=
MAX; i++) {
                                    ^         ~
   drivers/net/wireless/ath/ath11k/mac.c:1935:27: note: Although the value =
stored to 'vht_mcs' is used in the enclosing expression, the value is never=
 actually read from 'vht_mcs'
           for (i =3D 0, max_nss =3D 0, vht_mcs =3D 0; i < NL80211_VHT_NSS_=
MAX; i++) {
                                    ^         ~
   drivers/net/wireless/ath/ath11k/mac.c:2256:27: warning: Although the val=
ue stored to 'he_mcs' is used in the enclosing expression, the value is nev=
er actually read from 'he_mcs' [clang-analyzer-deadcode.DeadStores]
           for (i =3D 0, max_nss =3D 0, he_mcs =3D 0; i < NL80211_HE_NSS_MA=
X; i++) {
                                    ^        ~
   drivers/net/wireless/ath/ath11k/mac.c:2256:27: note: Although the value =
stored to 'he_mcs' is used in the enclosing expression, the value is never =
actually read from 'he_mcs'
           for (i =3D 0, max_nss =3D 0, he_mcs =3D 0; i < NL80211_HE_NSS_MA=
X; i++) {
                                    ^        ~
   drivers/net/wireless/ath/ath11k/mac.c:3613:2: warning: 1st function call=
 argument is an uninitialized value [clang-analyzer-core.CallAndMessage]
           kfree(arg.chan_list);
           ^     ~~~~~~~~~~~~~
   drivers/net/wireless/ath/ath11k/mac.c:3534:2: note: Control jumps to 'ca=
se ATH11K_SCAN_ABORTING:' @line 3545
           switch (ar->scan.state) {
           ^
   drivers/net/wireless/ath/ath11k/mac.c:3547:3: note:  Execution continues=
 on line 3549
                   break;
                   ^
   drivers/net/wireless/ath/ath11k/mac.c:3551:6: note: 'ret' is -16
           if (ret)
               ^~~
   drivers/net/wireless/ath/ath11k/mac.c:3551:2: note: Taking true branch
           if (ret)
           ^
   drivers/net/wireless/ath/ath11k/mac.c:3552:3: note: Control jumps to lin=
e 3613
                   goto exit;
                   ^
   drivers/net/wireless/ath/ath11k/mac.c:3613:2: note: 1st function call ar=
gument is an uninitialized value
           kfree(arg.chan_list);
           ^     ~~~~~~~~~~~~~
   drivers/net/wireless/ath/ath11k/mac.c:4620:3: warning: Value stored to '=
bw' is never read [clang-analyzer-deadcode.DeadStores]
                   bw =3D WMI_PEER_CHWIDTH_20MHZ;
                   ^    ~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ath/ath11k/mac.c:4620:3: note: Value stored to 'bw'=
 is never read
                   bw =3D WMI_PEER_CHWIDTH_20MHZ;
                   ^    ~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ath/ath11k/mac.c:4649:3: warning: Value stored to '=
smps' is never read [clang-analyzer-deadcode.DeadStores]
                   smps =3D WMI_PEER_SMPS_PS_NONE;
                   ^      ~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ath/ath11k/mac.c:4649:3: note: Value stored to 'smp=
s' is never read
                   smps =3D WMI_PEER_SMPS_PS_NONE;
                   ^      ~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/wireless/ath/ath11k/mac.c:7025:2: warning: Value stored to '=
oper_freq' is never read [clang-analyzer-deadcode.DeadStores]
           oper_freq =3D ctx->def.chan->center_freq;
           ^           ~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ath/ath11k/mac.c:7025:2: note: Value stored to 'ope=
r_freq' is never read
           oper_freq =3D ctx->def.chan->center_freq;
           ^           ~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/wireless/ath/ath11k/mac.c:7173:27: warning: Assigned value i=
s garbage or undefined [clang-analyzer-core.uninitialized.Assign]
           reg_tpc_info->eirp_power =3D eirp_power;
                                    ^ ~~~~~~~~~~
   drivers/net/wireless/ath/ath11k/mac.c:7021:24: note: 'eirp_power' declar=
ed without an initial value
                   psd_power, tx_power, eirp_power;
                                        ^~~~~~~~~~
   drivers/net/wireless/ath/ath11k/mac.c:7029:6: note: Assuming field 'num_=
pwr_levels' is 0
           if (arvif->reg_tpc_info.num_pwr_levels) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ath/ath11k/mac.c:7029:2: note: Taking false branch
           if (arvif->reg_tpc_info.num_pwr_levels) {
           ^
   drivers/net/wireless/ath/ath11k/mac.c:7036:24: note: Assuming 'pwr_lvl_i=
dx' is >=3D 'num_pwr_levels'
           for (pwr_lvl_idx =3D 0; pwr_lvl_idx < num_pwr_levels; pwr_lvl_id=
x++) {
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ath/ath11k/mac.c:7036:2: note: Loop condition is fa=
lse. Execution continues on line 7171
           for (pwr_lvl_idx =3D 0; pwr_lvl_idx < num_pwr_levels; pwr_lvl_id=
x++) {
           ^
   drivers/net/wireless/ath/ath11k/mac.c:7173:27: note: Assigned value is g=
arbage or undefined
           reg_tpc_info->eirp_power =3D eirp_power;
                                    ^ ~~~~~~~~~~
   Suppressed 16 warnings (15 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   drivers/net/wireless/ti/wlcore/debugfs.c:949:3: warning: Value stored to=
 'ret' is never read [clang-analyzer-deadcode.DeadStores]
                   ret =3D wl1271_acx_beacon_filter_opt(wl, wlvif, !!value);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ti/wlcore/debugfs.c:949:3: note: Value stored to 'r=
et' is never read
                   ret =3D wl1271_acx_beacon_filter_opt(wl, wlvif, !!value);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ti/wlcore/debugfs.c:1266:2: warning: Value stored t=
o 'ret' is never read [clang-analyzer-deadcode.DeadStores]
           ret =3D wl12xx_cmd_config_fwlog(wl);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ti/wlcore/debugfs.c:1266:2: note: Value stored to '=
ret' is never read
           ret =3D wl12xx_cmd_config_fwlog(wl);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   net/sched/sch_htb.c:94:8: warning: Excessive padding in 'struct htb_clas=
s' (128 padding bytes, where 0 is optimal). =

   Optimal fields order: =

   drops, =

   prio, =

   buffer, =

   cbuffer, =

   mbuffer, =

   filter_list, =

   block, =

   parent, =

   rate_est, =

   tokens, =

   ctokens, =

   t_c, =

   pq_key, =

   bstats, =

   common, =

   rate, =

   ceil, =

   pq_node, =

   , =

   node, =

   quantum, =

   filter_cnt, =

   level, =

   children, =


vim +/oper_freq +7025 drivers/net/wireless/ath/ath11k/mac.c

86682dd467b610 Wen Gong 2021-12-24  7008  =

86682dd467b610 Wen Gong 2021-12-24  7009  void ath11k_mac_fill_reg_tpc_info=
(struct ath11k *ar,
86682dd467b610 Wen Gong 2021-12-24  7010  				  struct ieee80211_vif *vif,
86682dd467b610 Wen Gong 2021-12-24  7011  				  struct ieee80211_chanctx_co=
nf *ctx)
86682dd467b610 Wen Gong 2021-12-24  7012  {
86682dd467b610 Wen Gong 2021-12-24  7013  	struct ath11k_base *ab =3D ar->a=
b;
86682dd467b610 Wen Gong 2021-12-24  7014  	struct ath11k_vif *arvif =3D (vo=
id *)vif->drv_priv;
86682dd467b610 Wen Gong 2021-12-24  7015  	struct ieee80211_bss_conf *bss_c=
onf =3D &vif->bss_conf;
86682dd467b610 Wen Gong 2021-12-24  7016  	struct ath11k_reg_tpc_power_info=
 *reg_tpc_info =3D &arvif->reg_tpc_info;
86682dd467b610 Wen Gong 2021-12-24  7017  	struct ieee80211_channel *chan, =
*temp_chan;
86682dd467b610 Wen Gong 2021-12-24  7018  	u8 pwr_lvl_idx, num_pwr_levels, =
pwr_reduction;
86682dd467b610 Wen Gong 2021-12-24  7019  	bool is_psd_power =3D false, is_=
tpe_present =3D false;
86682dd467b610 Wen Gong 2021-12-24  7020  	s8 max_tx_power[IEEE80211_MAX_NU=
M_PWR_LEVEL],
86682dd467b610 Wen Gong 2021-12-24  7021  		psd_power, tx_power, eirp_power;
86682dd467b610 Wen Gong 2021-12-24  7022  	u16 oper_freq, start_freq, cente=
r_freq;
86682dd467b610 Wen Gong 2021-12-24  7023  =

86682dd467b610 Wen Gong 2021-12-24  7024  	chan =3D ctx->def.chan;
86682dd467b610 Wen Gong 2021-12-24 @7025  	oper_freq =3D ctx->def.chan->cen=
ter_freq;
86682dd467b610 Wen Gong 2021-12-24  7026  	start_freq =3D ath11k_mac_get_6g=
_start_frequency(&ctx->def);
86682dd467b610 Wen Gong 2021-12-24  7027  	pwr_reduction =3D bss_conf->pwr_=
reduction;
86682dd467b610 Wen Gong 2021-12-24  7028  =

86682dd467b610 Wen Gong 2021-12-24  7029  	if (arvif->reg_tpc_info.num_pwr_=
levels) {
86682dd467b610 Wen Gong 2021-12-24  7030  		is_tpe_present =3D true;
86682dd467b610 Wen Gong 2021-12-24  7031  		num_pwr_levels =3D arvif->reg_t=
pc_info.num_pwr_levels;
86682dd467b610 Wen Gong 2021-12-24  7032  	} else {
86682dd467b610 Wen Gong 2021-12-24  7033  		num_pwr_levels =3D ath11k_mac_g=
et_num_pwr_levels(&ctx->def);
86682dd467b610 Wen Gong 2021-12-24  7034  	}
86682dd467b610 Wen Gong 2021-12-24  7035  =

86682dd467b610 Wen Gong 2021-12-24  7036  	for (pwr_lvl_idx =3D 0; pwr_lvl_=
idx < num_pwr_levels; pwr_lvl_idx++) {
86682dd467b610 Wen Gong 2021-12-24  7037  		/* STA received TPE IE*/
86682dd467b610 Wen Gong 2021-12-24  7038  		if (is_tpe_present) {
86682dd467b610 Wen Gong 2021-12-24  7039  			/* local power is PSD power*/
86682dd467b610 Wen Gong 2021-12-24  7040  			if (chan->flags & IEEE80211_CH=
AN_PSD) {
86682dd467b610 Wen Gong 2021-12-24  7041  				/* Connecting AP is psd power=
 */
86682dd467b610 Wen Gong 2021-12-24  7042  				if (reg_tpc_info->is_psd_powe=
r) {
86682dd467b610 Wen Gong 2021-12-24  7043  					is_psd_power =3D true;
86682dd467b610 Wen Gong 2021-12-24  7044  					ath11k_mac_get_psd_channel(a=
r, 20,
86682dd467b610 Wen Gong 2021-12-24  7045  								   &start_freq,
86682dd467b610 Wen Gong 2021-12-24  7046  								   &center_freq,
86682dd467b610 Wen Gong 2021-12-24  7047  								   pwr_lvl_idx,
86682dd467b610 Wen Gong 2021-12-24  7048  								   &temp_chan,
86682dd467b610 Wen Gong 2021-12-24  7049  								   &tx_power);
86682dd467b610 Wen Gong 2021-12-24  7050  					psd_power =3D temp_chan->psd;
86682dd467b610 Wen Gong 2021-12-24  7051  					eirp_power =3D tx_power;
86682dd467b610 Wen Gong 2021-12-24  7052  					max_tx_power[pwr_lvl_idx] =
=3D
86682dd467b610 Wen Gong 2021-12-24  7053  						min_t(s8,
86682dd467b610 Wen Gong 2021-12-24  7054  						      psd_power,
86682dd467b610 Wen Gong 2021-12-24  7055  						      reg_tpc_info->tpe[pwr=
_lvl_idx]);
86682dd467b610 Wen Gong 2021-12-24  7056  				/* Connecting AP is not psd p=
ower */
86682dd467b610 Wen Gong 2021-12-24  7057  				} else {
86682dd467b610 Wen Gong 2021-12-24  7058  					ath11k_mac_get_eirp_power(ar,
86682dd467b610 Wen Gong 2021-12-24  7059  								  &start_freq,
86682dd467b610 Wen Gong 2021-12-24  7060  								  &center_freq,
86682dd467b610 Wen Gong 2021-12-24  7061  								  pwr_lvl_idx,
86682dd467b610 Wen Gong 2021-12-24  7062  								  &temp_chan,
86682dd467b610 Wen Gong 2021-12-24  7063  								  &ctx->def,
86682dd467b610 Wen Gong 2021-12-24  7064  								  &tx_power);
86682dd467b610 Wen Gong 2021-12-24  7065  					psd_power =3D temp_chan->psd;
86682dd467b610 Wen Gong 2021-12-24  7066  					/* convert psd power to EIRP=
 power based
86682dd467b610 Wen Gong 2021-12-24  7067  					 * on channel width
86682dd467b610 Wen Gong 2021-12-24  7068  					 */
86682dd467b610 Wen Gong 2021-12-24  7069  					tx_power =3D
86682dd467b610 Wen Gong 2021-12-24  7070  						min_t(s8, tx_power,
86682dd467b610 Wen Gong 2021-12-24  7071  						      psd_power + 13 + pwr_=
lvl_idx * 3);
86682dd467b610 Wen Gong 2021-12-24  7072  					max_tx_power[pwr_lvl_idx] =
=3D
86682dd467b610 Wen Gong 2021-12-24  7073  						min_t(s8,
86682dd467b610 Wen Gong 2021-12-24  7074  						      tx_power,
86682dd467b610 Wen Gong 2021-12-24  7075  						      reg_tpc_info->tpe[pwr=
_lvl_idx]);
86682dd467b610 Wen Gong 2021-12-24  7076  				}
86682dd467b610 Wen Gong 2021-12-24  7077  			/* local power is not PSD powe=
r */
86682dd467b610 Wen Gong 2021-12-24  7078  			} else {
86682dd467b610 Wen Gong 2021-12-24  7079  				/* Connecting AP is psd power=
 */
86682dd467b610 Wen Gong 2021-12-24  7080  				if (reg_tpc_info->is_psd_powe=
r) {
86682dd467b610 Wen Gong 2021-12-24  7081  					is_psd_power =3D true;
86682dd467b610 Wen Gong 2021-12-24  7082  					ath11k_mac_get_psd_channel(a=
r, 20,
86682dd467b610 Wen Gong 2021-12-24  7083  								   &start_freq,
86682dd467b610 Wen Gong 2021-12-24  7084  								   &center_freq,
86682dd467b610 Wen Gong 2021-12-24  7085  								   pwr_lvl_idx,
86682dd467b610 Wen Gong 2021-12-24  7086  								   &temp_chan,
86682dd467b610 Wen Gong 2021-12-24  7087  								   &tx_power);
86682dd467b610 Wen Gong 2021-12-24  7088  					eirp_power =3D tx_power;
86682dd467b610 Wen Gong 2021-12-24  7089  					max_tx_power[pwr_lvl_idx] =
=3D
86682dd467b610 Wen Gong 2021-12-24  7090  						reg_tpc_info->tpe[pwr_lvl_i=
dx];
86682dd467b610 Wen Gong 2021-12-24  7091  				/* Connecting AP is not psd p=
ower */
86682dd467b610 Wen Gong 2021-12-24  7092  				} else {
86682dd467b610 Wen Gong 2021-12-24  7093  					ath11k_mac_get_eirp_power(ar,
86682dd467b610 Wen Gong 2021-12-24  7094  								  &start_freq,
86682dd467b610 Wen Gong 2021-12-24  7095  								  &center_freq,
86682dd467b610 Wen Gong 2021-12-24  7096  								  pwr_lvl_idx,
86682dd467b610 Wen Gong 2021-12-24  7097  								  &temp_chan,
86682dd467b610 Wen Gong 2021-12-24  7098  								  &ctx->def,
86682dd467b610 Wen Gong 2021-12-24  7099  								  &tx_power);
86682dd467b610 Wen Gong 2021-12-24  7100  					max_tx_power[pwr_lvl_idx] =
=3D
86682dd467b610 Wen Gong 2021-12-24  7101  						min_t(s8,
86682dd467b610 Wen Gong 2021-12-24  7102  						      tx_power,
86682dd467b610 Wen Gong 2021-12-24  7103  						      reg_tpc_info->tpe[pwr=
_lvl_idx]);
86682dd467b610 Wen Gong 2021-12-24  7104  				}
86682dd467b610 Wen Gong 2021-12-24  7105  			}
86682dd467b610 Wen Gong 2021-12-24  7106  		/* STA not received TPE IE */
86682dd467b610 Wen Gong 2021-12-24  7107  		} else {
86682dd467b610 Wen Gong 2021-12-24  7108  			/* local power is PSD power*/
86682dd467b610 Wen Gong 2021-12-24  7109  			if (chan->flags & IEEE80211_CH=
AN_PSD) {
86682dd467b610 Wen Gong 2021-12-24  7110  				is_psd_power =3D true;
86682dd467b610 Wen Gong 2021-12-24  7111  				ath11k_mac_get_psd_channel(ar=
, 20,
86682dd467b610 Wen Gong 2021-12-24  7112  							   &start_freq,
86682dd467b610 Wen Gong 2021-12-24  7113  							   &center_freq,
86682dd467b610 Wen Gong 2021-12-24  7114  							   pwr_lvl_idx,
86682dd467b610 Wen Gong 2021-12-24  7115  							   &temp_chan,
86682dd467b610 Wen Gong 2021-12-24  7116  							   &tx_power);
86682dd467b610 Wen Gong 2021-12-24  7117  				psd_power =3D temp_chan->psd;
86682dd467b610 Wen Gong 2021-12-24  7118  				eirp_power =3D tx_power;
86682dd467b610 Wen Gong 2021-12-24  7119  				max_tx_power[pwr_lvl_idx] =3D=
 psd_power;
86682dd467b610 Wen Gong 2021-12-24  7120  			} else {
86682dd467b610 Wen Gong 2021-12-24  7121  				ath11k_mac_get_eirp_power(ar,
86682dd467b610 Wen Gong 2021-12-24  7122  							  &start_freq,
86682dd467b610 Wen Gong 2021-12-24  7123  							  &center_freq,
86682dd467b610 Wen Gong 2021-12-24  7124  							  pwr_lvl_idx,
86682dd467b610 Wen Gong 2021-12-24  7125  							  &temp_chan,
86682dd467b610 Wen Gong 2021-12-24  7126  							  &ctx->def,
86682dd467b610 Wen Gong 2021-12-24  7127  							  &tx_power);
86682dd467b610 Wen Gong 2021-12-24  7128  				max_tx_power[pwr_lvl_idx] =3D
86682dd467b610 Wen Gong 2021-12-24  7129  					min_t(s8,
86682dd467b610 Wen Gong 2021-12-24  7130  					      tx_power,
86682dd467b610 Wen Gong 2021-12-24  7131  					      reg_tpc_info->tpe[pwr_=
lvl_idx]);
86682dd467b610 Wen Gong 2021-12-24  7132  			}
86682dd467b610 Wen Gong 2021-12-24  7133  		}
86682dd467b610 Wen Gong 2021-12-24  7134  =

86682dd467b610 Wen Gong 2021-12-24  7135  		if (is_psd_power) {
86682dd467b610 Wen Gong 2021-12-24  7136  			/* If AP local power constrain=
t is present */
86682dd467b610 Wen Gong 2021-12-24  7137  			if (pwr_reduction)
86682dd467b610 Wen Gong 2021-12-24  7138  				eirp_power =3D eirp_power - p=
wr_reduction;
86682dd467b610 Wen Gong 2021-12-24  7139  =

86682dd467b610 Wen Gong 2021-12-24  7140  			/* If firmware updated max tx =
power is non zero, then take
86682dd467b610 Wen Gong 2021-12-24  7141  			 * the min of firmware updated=
 ap tx power
86682dd467b610 Wen Gong 2021-12-24  7142  			 * and max power derived from =
above mentioned parameters.
86682dd467b610 Wen Gong 2021-12-24  7143  			 */
86682dd467b610 Wen Gong 2021-12-24  7144  			ath11k_dbg(ab, ATH11K_DBG_MAC,
86682dd467b610 Wen Gong 2021-12-24  7145  				   "eirp power : %d firmware =
report power : %d\n",
86682dd467b610 Wen Gong 2021-12-24  7146  				   eirp_power, ar->max_allowe=
d_tx_power);
86682dd467b610 Wen Gong 2021-12-24  7147  			if (ar->max_allowed_tx_power)
86682dd467b610 Wen Gong 2021-12-24  7148  				eirp_power =3D min_t(s8,
86682dd467b610 Wen Gong 2021-12-24  7149  						   eirp_power,
86682dd467b610 Wen Gong 2021-12-24  7150  						   ar->max_allowed_tx_power=
);
86682dd467b610 Wen Gong 2021-12-24  7151  		} else {
86682dd467b610 Wen Gong 2021-12-24  7152  			/* If AP local power constrain=
t is present */
86682dd467b610 Wen Gong 2021-12-24  7153  			if (pwr_reduction)
86682dd467b610 Wen Gong 2021-12-24  7154  				max_tx_power[pwr_lvl_idx] =3D
86682dd467b610 Wen Gong 2021-12-24  7155  					max_tx_power[pwr_lvl_idx] - =
pwr_reduction;
86682dd467b610 Wen Gong 2021-12-24  7156  			/* If firmware updated max tx =
power is non zero, then take
86682dd467b610 Wen Gong 2021-12-24  7157  			 * the min of firmware updated=
 ap tx power
86682dd467b610 Wen Gong 2021-12-24  7158  			 * and max power derived from =
above mentioned parameters.
86682dd467b610 Wen Gong 2021-12-24  7159  			 */
86682dd467b610 Wen Gong 2021-12-24  7160  			if (ar->max_allowed_tx_power)
86682dd467b610 Wen Gong 2021-12-24  7161  				max_tx_power[pwr_lvl_idx] =3D
86682dd467b610 Wen Gong 2021-12-24  7162  					min_t(s8,
86682dd467b610 Wen Gong 2021-12-24  7163  					      max_tx_power[pwr_lvl_i=
dx],
86682dd467b610 Wen Gong 2021-12-24  7164  					      ar->max_allowed_tx_pow=
er);
86682dd467b610 Wen Gong 2021-12-24  7165  		}
86682dd467b610 Wen Gong 2021-12-24  7166  		reg_tpc_info->chan_power_info[p=
wr_lvl_idx].chan_cfreq =3D center_freq;
86682dd467b610 Wen Gong 2021-12-24  7167  		reg_tpc_info->chan_power_info[p=
wr_lvl_idx].tx_power =3D
86682dd467b610 Wen Gong 2021-12-24  7168  			max_tx_power[pwr_lvl_idx];
86682dd467b610 Wen Gong 2021-12-24  7169  	}
86682dd467b610 Wen Gong 2021-12-24  7170  =

86682dd467b610 Wen Gong 2021-12-24  7171  	reg_tpc_info->num_pwr_levels =3D=
 num_pwr_levels;
86682dd467b610 Wen Gong 2021-12-24  7172  	reg_tpc_info->is_psd_power =3D i=
s_psd_power;
86682dd467b610 Wen Gong 2021-12-24 @7173  	reg_tpc_info->eirp_power =3D eir=
p_power;
86682dd467b610 Wen Gong 2021-12-24  7174  	reg_tpc_info->power_type_6g =3D
86682dd467b610 Wen Gong 2021-12-24  7175  		ath11k_ieee80211_ap_pwr_type_co=
nvert(vif->bss_conf.power_type);
86682dd467b610 Wen Gong 2021-12-24  7176  }
86682dd467b610 Wen Gong 2021-12-24  7177  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0111525202939386491==--

