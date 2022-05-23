Content-Type: multipart/mixed; boundary="===============3190467138463499486=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [wireless-next:mld 6/7] drivers/net/wireless/rsi/rsi_91x_hal.c:310:2: warning: Value stored to 'bss' is never read [clang-analyzer-deadcode.DeadStores]
Date: Mon, 23 May 2022 09:29:39 +0800
Message-ID: <202205230957.U8pTkdJT-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3190467138463499486==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Johannes Berg <johannes@sipsolutions.net>
CC: Kalle Valo <kvalo@kernel.org>
CC: linux-wireless(a)vger.kernel.org
TO: Johannes Berg <johannes.berg@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-n=
ext.git mld
head:   418110601b1711438b8c80cd605d7c65afb3bf40
commit: 3c2ce764e4bc9dc0e31fc58e0483663f85727561 [6/7] mac80211: move inter=
face config to new struct
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-c007 (https://download.01.org/0day-ci/archive/202=
20523/202205230957.U8pTkdJT-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 1443db=
aba6f0e57be066995db9164f89fb57b413)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless=
-next.git/commit/?id=3D3c2ce764e4bc9dc0e31fc58e0483663f85727561
        git remote add wireless-next https://git.kernel.org/pub/scm/linux/k=
ernel/git/wireless/wireless-next.git
        git fetch --no-tags wireless-next mld
        git checkout 3c2ce764e4bc9dc0e31fc58e0483663f85727561
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           memset(&evt, 0, sizeof(evt));
           ^
   include/linux/fortify-string.h:288:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:281:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   net/tipc/group.c:677:2: note: Call to function 'memset' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'memset_s' in case of C11
           memset(&evt, 0, sizeof(evt));
           ^
   include/linux/fortify-string.h:288:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:281:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   net/tipc/group.c:698:2: warning: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insec=
ureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(msg_data(hdr), &evt, sizeof(evt));
           ^
   include/linux/fortify-string.h:385:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:378:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   net/tipc/group.c:698:2: note: Call to function 'memcpy' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'memcpy_s' in case of C11
           memcpy(msg_data(hdr), &evt, sizeof(evt));
           ^
   include/linux/fortify-string.h:385:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:378:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   Suppressed 82 warnings (82 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   96 warnings generated.
   drivers/net/wireless/rsi/rsi_91x_hal.c:99:2: warning: Call to function '=
memset' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'memset_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&skb->data[0], 0, header_size);
           ^
   include/linux/fortify-string.h:288:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:281:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   drivers/net/wireless/rsi/rsi_91x_hal.c:99:2: note: Call to function 'mem=
set' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memset_s' in case of C11
           memset(&skb->data[0], 0, header_size);
           ^
   include/linux/fortify-string.h:288:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:281:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   drivers/net/wireless/rsi/rsi_91x_hal.c:187:2: warning: Call to function =
'memset' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'memset_s' in case of C11 [clang-a=
nalyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(data_desc, 0, header_size);
           ^
   include/linux/fortify-string.h:288:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:281:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   drivers/net/wireless/rsi/rsi_91x_hal.c:187:2: note: Call to function 'me=
mset' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memset_s' in case of C11
           memset(data_desc, 0, header_size);
           ^
   include/linux/fortify-string.h:288:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:281:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
>> drivers/net/wireless/rsi/rsi_91x_hal.c:310:2: warning: Value stored to '=
bss' is never read [clang-analyzer-deadcode.DeadStores]
           bss =3D &vif->bss_conf;
           ^     ~~~~~~~~~~~~~~
   drivers/net/wireless/rsi/rsi_91x_hal.c:310:2: note: Value stored to 'bss=
' is never read
           bss =3D &vif->bss_conf;
           ^     ~~~~~~~~~~~~~~
   drivers/net/wireless/rsi/rsi_91x_hal.c:364:2: warning: Value stored to '=
bss' is never read [clang-analyzer-deadcode.DeadStores]
           bss =3D &info->control.vif->bss_conf;
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/rsi/rsi_91x_hal.c:364:2: note: Value stored to 'bss=
' is never read
           bss =3D &info->control.vif->bss_conf;
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/rsi/rsi_91x_hal.c:409:2: warning: Call to function =
'memset' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'memset_s' in case of C11 [clang-a=
nalyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(skb->data, 0, header_size);
           ^
   include/linux/fortify-string.h:288:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:281:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   drivers/net/wireless/rsi/rsi_91x_hal.c:409:2: note: Call to function 'me=
mset' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memset_s' in case of C11
           memset(skb->data, 0, header_size);
           ^
   include/linux/fortify-string.h:288:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:281:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   drivers/net/wireless/rsi/rsi_91x_hal.c:483:2: warning: Call to function =
'memcpy' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'memcpy_s' in case of C11 [clang-a=
nalyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&skb->data[FRAME_DESC_SZ], mac_bcn->data, mac_bcn->len);
           ^
   include/linux/fortify-string.h:385:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:378:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   drivers/net/wireless/rsi/rsi_91x_hal.c:483:2: note: Call to function 'me=
mcpy' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&skb->data[FRAME_DESC_SZ], mac_bcn->data, mac_bcn->len);
           ^
   include/linux/fortify-string.h:385:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:378:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   drivers/net/wireless/rsi/rsi_91x_hal.c:593:31: warning: The result of th=
e left shift is undefined because the left operand is negative [clang-analy=
zer-core.UndefinedBinaryOperatorResult]
                                              (cmd | REGOUT_INVALID << 8), =
2);
                                                                    ^
   drivers/net/wireless/rsi/rsi_91x_hal.c:530:9: note: Assuming field 'blcm=
d_timer_expired' is false
           while (!adapter->blcmd_timer_expired) {
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/rsi/rsi_91x_hal.c:530:2: note: Loop condition is tr=
ue.  Entering loop body
           while (!adapter->blcmd_timer_expired) {
           ^
   drivers/net/wireless/rsi/rsi_91x_hal.c:534:7: note: Assuming 'status' is=
 >=3D 0
                   if (status < 0) {
                       ^~~~~~~~~~
   drivers/net/wireless/rsi/rsi_91x_hal.c:534:3: note: Taking false branch
                   if (status < 0) {
                   ^
   drivers/net/wireless/rsi/rsi_91x_hal.c:540:3: note: Left side of '&&' is=
 true
                   mdelay(1);
                   ^
   include/linux/delay.h:45:3: note: expanded from macro 'mdelay'
           (__builtin_constant_p(n) && (n)<=3DMAX_UDELAY_MS) ? udelay((n)*1=
000) : \
            ^
   drivers/net/wireless/rsi/rsi_91x_hal.c:540:3: note: 1 is <=3D 5
                   mdelay(1);
                   ^
   include/linux/delay.h:45:30: note: expanded from macro 'mdelay'
           (__builtin_constant_p(n) && (n)<=3DMAX_UDELAY_MS) ? udelay((n)*1=
000) : \
                                       ^~~
   drivers/net/wireless/rsi/rsi_91x_hal.c:540:3: note: '?' condition is true
                   mdelay(1);
                   ^
   include/linux/delay.h:45:2: note: expanded from macro 'mdelay'
           (__builtin_constant_p(n) && (n)<=3DMAX_UDELAY_MS) ? udelay((n)*1=
000) : \
           ^
   drivers/net/wireless/rsi/rsi_91x_hal.c:540:3: note: Taking true branch
                   mdelay(1);
                   ^
   include/linux/delay.h:45:52: note: expanded from macro 'mdelay'
           (__builtin_constant_p(n) && (n)<=3DMAX_UDELAY_MS) ? udelay((n)*1=
000) : \
                                                             ^

vim +/bss +310 drivers/net/wireless/rsi/rsi_91x_hal.c

ceb2e4eab9948a drivers/net/wireless/rsi/rsi_91x_hal.c Pavani Muthyala      =
   2017-07-06  291  =

ceb2e4eab9948a drivers/net/wireless/rsi/rsi_91x_hal.c Pavani Muthyala      =
   2017-07-06  292  /* This function sends received data packet from driver=
 to device */
ceb2e4eab9948a drivers/net/wireless/rsi/rsi_91x_hal.c Pavani Muthyala      =
   2017-07-06  293  int rsi_send_data_pkt(struct rsi_common *common, struct=
 sk_buff *skb)
ceb2e4eab9948a drivers/net/wireless/rsi/rsi_91x_hal.c Pavani Muthyala      =
   2017-07-06  294  {
ceb2e4eab9948a drivers/net/wireless/rsi/rsi_91x_hal.c Pavani Muthyala      =
   2017-07-06  295  	struct rsi_hw *adapter =3D common->priv;
eac4eed3224b1b drivers/net/wireless/rsi/rsi_91x_hal.c Prameela Rani Garnepu=
di 2017-08-30  296  	struct ieee80211_vif *vif;
ceb2e4eab9948a drivers/net/wireless/rsi/rsi_91x_hal.c Pavani Muthyala      =
   2017-07-06  297  	struct ieee80211_tx_info *info;
ceb2e4eab9948a drivers/net/wireless/rsi/rsi_91x_hal.c Pavani Muthyala      =
   2017-07-06  298  	struct ieee80211_bss_conf *bss;
19844c0a9a19ab drivers/net/wireless/rsi/rsi_91x_hal.c Prameela Rani Garnepu=
di 2017-08-16  299  	int status =3D -EINVAL;
19844c0a9a19ab drivers/net/wireless/rsi/rsi_91x_hal.c Prameela Rani Garnepu=
di 2017-08-16  300  =

19844c0a9a19ab drivers/net/wireless/rsi/rsi_91x_hal.c Prameela Rani Garnepu=
di 2017-08-16  301  	if (!skb)
19844c0a9a19ab drivers/net/wireless/rsi/rsi_91x_hal.c Prameela Rani Garnepu=
di 2017-08-16  302  		return 0;
19844c0a9a19ab drivers/net/wireless/rsi/rsi_91x_hal.c Prameela Rani Garnepu=
di 2017-08-16  303  	if (common->iface_down)
19844c0a9a19ab drivers/net/wireless/rsi/rsi_91x_hal.c Prameela Rani Garnepu=
di 2017-08-16  304  		goto err;
ceb2e4eab9948a drivers/net/wireless/rsi/rsi_91x_hal.c Pavani Muthyala      =
   2017-07-06  305  =

ceb2e4eab9948a drivers/net/wireless/rsi/rsi_91x_hal.c Pavani Muthyala      =
   2017-07-06  306  	info =3D IEEE80211_SKB_CB(skb);
19844c0a9a19ab drivers/net/wireless/rsi/rsi_91x_hal.c Prameela Rani Garnepu=
di 2017-08-16  307  	if (!info->control.vif)
19844c0a9a19ab drivers/net/wireless/rsi/rsi_91x_hal.c Prameela Rani Garnepu=
di 2017-08-16  308  		goto err;
eac4eed3224b1b drivers/net/wireless/rsi/rsi_91x_hal.c Prameela Rani Garnepu=
di 2017-08-30  309  	vif =3D info->control.vif;
eac4eed3224b1b drivers/net/wireless/rsi/rsi_91x_hal.c Prameela Rani Garnepu=
di 2017-08-30 @310  	bss =3D &vif->bss_conf;
ceb2e4eab9948a drivers/net/wireless/rsi/rsi_91x_hal.c Pavani Muthyala      =
   2017-07-06  311  =

eac4eed3224b1b drivers/net/wireless/rsi/rsi_91x_hal.c Prameela Rani Garnepu=
di 2017-08-30  312  	if (((vif->type =3D=3D NL80211_IFTYPE_STATION) ||
eac4eed3224b1b drivers/net/wireless/rsi/rsi_91x_hal.c Prameela Rani Garnepu=
di 2017-08-30  313  	     (vif->type =3D=3D NL80211_IFTYPE_P2P_CLIENT)) &&
3c2ce764e4bc9d drivers/net/wireless/rsi/rsi_91x_hal.c Johannes Berg        =
   2022-05-10  314  	    (!vif->cfg.assoc))
ceb2e4eab9948a drivers/net/wireless/rsi/rsi_91x_hal.c Pavani Muthyala      =
   2017-07-06  315  		goto err;
ceb2e4eab9948a drivers/net/wireless/rsi/rsi_91x_hal.c Pavani Muthyala      =
   2017-07-06  316  =

2108df3c4b1856 drivers/net/wireless/rsi/rsi_91x_hal.c Prameela Rani Garnepu=
di 2018-02-27  317  	status =3D rsi_send_pkt_to_bus(common, skb);
dad0d04fa7ba41 drivers/net/wireless/rsi/rsi_91x_pkt.c Fariya Fatima        =
   2014-03-16  318  	if (status)
ceb2e4eab9948a drivers/net/wireless/rsi/rsi_91x_hal.c Pavani Muthyala      =
   2017-07-06  319  		rsi_dbg(ERR_ZONE, "%s: Failed to write pkt\n", __func=
__);
dad0d04fa7ba41 drivers/net/wireless/rsi/rsi_91x_pkt.c Fariya Fatima        =
   2014-03-16  320  =

dad0d04fa7ba41 drivers/net/wireless/rsi/rsi_91x_pkt.c Fariya Fatima        =
   2014-03-16  321  err:
dad0d04fa7ba41 drivers/net/wireless/rsi/rsi_91x_pkt.c Fariya Fatima        =
   2014-03-16  322  	++common->tx_stats.total_tx_pkt_freed[skb->priority];
af193097767819 drivers/net/wireless/rsi/rsi_91x_hal.c Pavani Muthyala      =
   2017-07-06  323  	rsi_indicate_tx_status(adapter, skb, status);
dad0d04fa7ba41 drivers/net/wireless/rsi/rsi_91x_pkt.c Fariya Fatima        =
   2014-03-16  324  	return status;
dad0d04fa7ba41 drivers/net/wireless/rsi/rsi_91x_pkt.c Fariya Fatima        =
   2014-03-16  325  }
dad0d04fa7ba41 drivers/net/wireless/rsi/rsi_91x_pkt.c Fariya Fatima        =
   2014-03-16  326  =


:::::: The code at line 310 was first introduced by commit
:::::: eac4eed3224b1bc769489ae2e146105cbba3a8ad rsi: tx and rx path enhance=
ments for p2p mode

:::::: TO: Prameela Rani Garnepudi <prameela.j04cs@gmail.com>
:::::: CC: Kalle Valo <kvalo@codeaurora.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3190467138463499486==--

