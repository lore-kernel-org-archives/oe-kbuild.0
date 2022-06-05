Content-Type: multipart/mixed; boundary="===============0159796424541922205=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/wireless/marvell/mwifiex/sdio.c:3081:8: warning: Call to function 'sprintf' is insecure as it does not provide bounding of the memory buffer or security checks introduced in the C11 standard. Replace with analogous functions that support lengt...
Date: Sun, 05 Jun 2022 18:08:03 +0800
Message-ID: <202206051809.FU8hIG8w-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0159796424541922205==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check first_new_problem:=
 drivers/net/wireless/marvell/mwifiex/sdio.c:3081:8: warning: Call to funct=
ion 'sprintf' is insecure as it does not provide bounding of the memory buf=
fer or security checks introduced in the C11 standard. Replace with analogo=
us functions that support length arguments or provides boundary checks such=
 as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.Depreca=
tedOrUnsafeBufferHandling]"
:::::: =


CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Arnd Bergmann <arnd@arndb.de>
CC: Masahiro Yamada <masahiroy@kernel.org>
CC: Alex Shi <alexs@kernel.org>
CC: Nick Desaulniers <ndesaulniers@google.com>
CC: Miguel Ojeda <ojeda@kernel.org>
CC: Nathan Chancellor <nathan@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   952923ddc01120190dcf671e7b354364ce1d1362
commit: e8c07082a810fbb9db303a2b66b66b8d7e588b53 Kbuild: move to -std=3Dgnu=
11
date:   3 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 3 months ago
config: riscv-randconfig-c006-20220531 (https://download.01.org/0day-ci/arc=
hive/20220605/202206051809.FU8hIG8w-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c825ab=
d6b0198fb088d9752f556a70705bc99dfd)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3De8c07082a810fbb9db303a2b66b66b8d7e588b53
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout e8c07082a810fbb9db303a2b66b66b8d7e588b53
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                   ^~~~~~
   drivers/net/wireless/marvell/mwifiex/sdio.c:1585:3: note: Call to functi=
on 'memcpy' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(skb_deaggr->data, data + SDIO_HEADER_OFFSET, pkt_=
len);
                   ^~~~~~
   drivers/net/wireless/marvell/mwifiex/sdio.c:1655:4: warning: Call to fun=
ction 'memcpy' is insecure as it does not provide security checks introduce=
d in the C11 standard. Replace with analogous functions that support length=
 arguments or provides boundary checks such as 'memcpy_s' in case of C11 [c=
lang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(cmd_buf, skb->data,
                           ^~~~~~
   drivers/net/wireless/marvell/mwifiex/sdio.c:1655:4: note: Call to functi=
on 'memcpy' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'memcpy_s' in case of C11
                           memcpy(cmd_buf, skb->data,
                           ^~~~~~
   drivers/net/wireless/marvell/mwifiex/sdio.c:1672:4: warning: Call to fun=
ction 'memcpy' is insecure as it does not provide security checks introduce=
d in the C11 standard. Replace with analogous functions that support length=
 arguments or provides boundary checks such as 'memcpy_s' in case of C11 [c=
lang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(adapter->event_body,
                           ^~~~~~
   drivers/net/wireless/marvell/mwifiex/sdio.c:1672:4: note: Call to functi=
on 'memcpy' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'memcpy_s' in case of C11
                           memcpy(adapter->event_body,
                           ^~~~~~
   drivers/net/wireless/marvell/mwifiex/sdio.c:1847:5: warning: Call to fun=
ction 'memcpy' is insecure as it does not provide security checks introduce=
d in the C11 standard. Replace with analogous functions that support length=
 arguments or provides boundary checks such as 'memcpy_s' in case of C11 [c=
lang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                                   memcpy(skb_deaggr->data, curr_ptr, pkt_l=
en);
                                   ^~~~~~
   drivers/net/wireless/marvell/mwifiex/sdio.c:1847:5: note: Call to functi=
on 'memcpy' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'memcpy_s' in case of C11
                                   memcpy(skb_deaggr->data, curr_ptr, pkt_l=
en);
                                   ^~~~~~
   drivers/net/wireless/marvell/mwifiex/sdio.c:2213:3: warning: Call to fun=
ction 'memmove' is insecure as it does not provide security checks introduc=
ed in the C11 standard. Replace with analogous functions that support lengt=
h arguments or provides boundary checks such as 'memmove_s' in case of C11 =
[clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   MP_TX_AGGR_BUF_PUT(card, payload, pkt_len, port);
                   ^
   drivers/net/wireless/marvell/mwifiex/sdio.h:113:2: note: expanded from m=
acro 'MP_TX_AGGR_BUF_PUT'
           memmove(&a->mpa_tx.buf[a->mpa_tx.buf_len],                      \
           ^~~~~~~
   drivers/net/wireless/marvell/mwifiex/sdio.c:2213:3: note: Call to functi=
on 'memmove' is insecure as it does not provide security checks introduced =
in the C11 standard. Replace with analogous functions that support length a=
rguments or provides boundary checks such as 'memmove_s' in case of C11
                   MP_TX_AGGR_BUF_PUT(card, payload, pkt_len, port);
                   ^
   drivers/net/wireless/marvell/mwifiex/sdio.h:113:2: note: expanded from m=
acro 'MP_TX_AGGR_BUF_PUT'
           memmove(&a->mpa_tx.buf[a->mpa_tx.buf_len],                      \
           ^~~~~~~
   drivers/net/wireless/marvell/mwifiex/sdio.c:2277:3: warning: Call to fun=
ction 'memmove' is insecure as it does not provide security checks introduc=
ed in the C11 standard. Replace with analogous functions that support lengt=
h arguments or provides boundary checks such as 'memmove_s' in case of C11 =
[clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   MP_TX_AGGR_BUF_PUT(card, payload, pkt_len, port);
                   ^
   drivers/net/wireless/marvell/mwifiex/sdio.h:113:2: note: expanded from m=
acro 'MP_TX_AGGR_BUF_PUT'
           memmove(&a->mpa_tx.buf[a->mpa_tx.buf_len],                      \
           ^~~~~~~
   drivers/net/wireless/marvell/mwifiex/sdio.c:2277:3: note: Call to functi=
on 'memmove' is insecure as it does not provide security checks introduced =
in the C11 standard. Replace with analogous functions that support length a=
rguments or provides boundary checks such as 'memmove_s' in case of C11
                   MP_TX_AGGR_BUF_PUT(card, payload, pkt_len, port);
                   ^
   drivers/net/wireless/marvell/mwifiex/sdio.h:113:2: note: expanded from m=
acro 'MP_TX_AGGR_BUF_PUT'
           memmove(&a->mpa_tx.buf[a->mpa_tx.buf_len],                      \
           ^~~~~~~
   drivers/net/wireless/marvell/mwifiex/sdio.c:2458:2: warning: Call to fun=
ction 'strcpy' is insecure as it does not provide bounding of the memory bu=
ffer. Replace unbounded copy functions with analogous functions that suppor=
t length arguments such as 'strlcpy'. CWE-119 [clang-analyzer-security.inse=
cureAPI.strcpy]
           strcpy(adapter->fw_name, card->firmware);
           ^~~~~~
   drivers/net/wireless/marvell/mwifiex/sdio.c:2458:2: note: Call to functi=
on 'strcpy' is insecure as it does not provide bounding of the memory buffe=
r. Replace unbounded copy functions with analogous functions that support l=
ength arguments such as 'strlcpy'. CWE-119
           strcpy(adapter->fw_name, card->firmware);
           ^~~~~~
   drivers/net/wireless/marvell/mwifiex/sdio.c:2914:5: warning: Call to fun=
ction 'memcpy' is insecure as it does not provide security checks introduce=
d in the C11 standard. Replace with analogous functions that support length=
 arguments or provides boundary checks such as 'memcpy_s' in case of C11 [c=
lang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                                   memcpy(tmp_ptr, entry->mem_ptr,
                                   ^~~~~~
   drivers/net/wireless/marvell/mwifiex/sdio.c:2914:5: note: Call to functi=
on 'memcpy' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'memcpy_s' in case of C11
                                   memcpy(tmp_ptr, entry->mem_ptr,
                                   ^~~~~~
   drivers/net/wireless/marvell/mwifiex/sdio.c:3021:3: warning: Call to fun=
ction 'memset' is insecure as it does not provide security checks introduce=
d in the C11 standard. Replace with analogous functions that support length=
 arguments or provides boundary checks such as 'memset_s' in case of C11 [c=
lang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(buf, 0, sizeof(buf));
                   ^~~~~~
   drivers/net/wireless/marvell/mwifiex/sdio.c:3021:3: note: Call to functi=
on 'memset' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'memset_s' in case of C11
                   memset(buf, 0, sizeof(buf));
                   ^~~~~~
   drivers/net/wireless/marvell/mwifiex/sdio.c:3054:11: warning: Call to fu=
nction 'sprintf' is insecure as it does not provide security checks introdu=
ced in the C11 standard. Replace with analogous functions that support leng=
th arguments or provides boundary checks such as 'sprintf_s' in case of C11=
 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           ptr +=3D sprintf(ptr, "SDIO Func%d (%#x-%#x): ",
                                  ^~~~~~~
   drivers/net/wireless/marvell/mwifiex/sdio.c:3054:11: note: Call to funct=
ion 'sprintf' is insecure as it does not provide security checks introduced=
 in the C11 standard. Replace with analogous functions that support length =
arguments or provides boundary checks such as 'sprintf_s' in case of C11
                           ptr +=3D sprintf(ptr, "SDIO Func%d (%#x-%#x): ",
                                  ^~~~~~~
   drivers/net/wireless/marvell/mwifiex/sdio.c:3057:11: warning: Call to fu=
nction 'sprintf' is insecure as it does not provide security checks introdu=
ced in the C11 standard. Replace with analogous functions that support leng=
th arguments or provides boundary checks such as 'sprintf_s' in case of C11=
 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           ptr +=3D sprintf(ptr, "SDIO Func%d: ", func);
                                  ^~~~~~~
   drivers/net/wireless/marvell/mwifiex/sdio.c:3057:11: note: Call to funct=
ion 'sprintf' is insecure as it does not provide security checks introduced=
 in the C11 standard. Replace with analogous functions that support length =
arguments or provides boundary checks such as 'sprintf_s' in case of C11
                           ptr +=3D sprintf(ptr, "SDIO Func%d: ", func);
                                  ^~~~~~~
   drivers/net/wireless/marvell/mwifiex/sdio.c:3066:12: warning: Call to fu=
nction 'sprintf' is insecure as it does not provide security checks introdu=
ced in the C11 standard. Replace with analogous functions that support leng=
th arguments or provides boundary checks such as 'sprintf_s' in case of C11=
 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                                   ptr +=3D sprintf(ptr, "(%#x) ", reg);
                                          ^~~~~~~
   drivers/net/wireless/marvell/mwifiex/sdio.c:3066:12: note: Call to funct=
ion 'sprintf' is insecure as it does not provide security checks introduced=
 in the C11 standard. Replace with analogous functions that support length =
arguments or provides boundary checks such as 'sprintf_s' in case of C11
                                   ptr +=3D sprintf(ptr, "(%#x) ", reg);
                                          ^~~~~~~
   drivers/net/wireless/marvell/mwifiex/sdio.c:3068:12: warning: Call to fu=
nction 'sprintf' is insecure as it does not provide security checks introdu=
ced in the C11 standard. Replace with analogous functions that support leng=
th arguments or provides boundary checks such as 'sprintf_s' in case of C11=
 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                                   ptr +=3D sprintf(ptr, "%02x ", data);
                                          ^~~~~~~
   drivers/net/wireless/marvell/mwifiex/sdio.c:3068:12: note: Call to funct=
ion 'sprintf' is insecure as it does not provide security checks introduced=
 in the C11 standard. Replace with analogous functions that support length =
arguments or provides boundary checks such as 'sprintf_s' in case of C11
                                   ptr +=3D sprintf(ptr, "%02x ", data);
                                          ^~~~~~~
   drivers/net/wireless/marvell/mwifiex/sdio.c:3070:5: warning: Value store=
d to 'ptr' is never read [clang-analyzer-deadcode.DeadStores]
                                   ptr +=3D sprintf(ptr, "ERR");
                                   ^      ~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/marvell/mwifiex/sdio.c:3070:5: note: Value stored t=
o 'ptr' is never read
                                   ptr +=3D sprintf(ptr, "ERR");
                                   ^      ~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/marvell/mwifiex/sdio.c:3070:12: warning: Call to fu=
nction 'sprintf' is insecure as it does not provide security checks introdu=
ced in the C11 standard. Replace with analogous functions that support leng=
th arguments or provides boundary checks such as 'sprintf_s' in case of C11=
 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                                   ptr +=3D sprintf(ptr, "ERR");
                                          ^~~~~~~
   drivers/net/wireless/marvell/mwifiex/sdio.c:3070:12: note: Call to funct=
ion 'sprintf' is insecure as it does not provide security checks introduced=
 in the C11 standard. Replace with analogous functions that support length =
arguments or provides boundary checks such as 'sprintf_s' in case of C11
                                   ptr +=3D sprintf(ptr, "ERR");
                                          ^~~~~~~
>> drivers/net/wireless/marvell/mwifiex/sdio.c:3081:8: warning: Call to fun=
ction 'sprintf' is insecure as it does not provide bounding of the memory b=
uffer or security checks introduced in the C11 standard. Replace with analo=
gous functions that support length arguments or provides boundary checks su=
ch as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.Depre=
catedOrUnsafeBufferHandling]
                   p +=3D sprintf(p, "%s\n", buf);
                        ^~~~~~~
   drivers/net/wireless/marvell/mwifiex/sdio.c:3081:8: note: Call to functi=
on 'sprintf' is insecure as it does not provide bounding of the memory buff=
er or security checks introduced in the C11 standard. Replace with analogou=
s functions that support length arguments or provides boundary checks such =
as 'sprintf_s' in case of C11
                   p +=3D sprintf(p, "%s\n", buf);
                        ^~~~~~~
   Suppressed 98 warnings (98 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   104 warnings generated.
   Suppressed 104 warnings (104 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   85 warnings generated.
   Suppressed 85 warnings (85 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   175 warnings generated.
   Suppressed 175 warnings (175 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   138 warnings generated.
   net/mac80211/mlme.c:160:2: warning: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(chandef, 0, sizeof(struct cfg80211_chan_def));
           ^~~~~~
   net/mac80211/mlme.c:160:2: note: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11
           memset(chandef, 0, sizeof(struct cfg80211_chan_def));
           ^~~~~~
   net/mac80211/mlme.c:192:2: warning: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&sta_ht_cap, &sband->ht_cap, sizeof(sta_ht_cap));
           ^~~~~~
   net/mac80211/mlme.c:192:2: note: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11
           memcpy(&sta_ht_cap, &sband->ht_cap, sizeof(sta_ht_cap));
           ^~~~~~
   net/mac80211/mlme.c:254:3: warning: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(&he_oper_vht_cap, he_oper->optional, 3);
                   ^~~~~~
   net/mac80211/mlme.c:254:3: note: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11
                   memcpy(&he_oper_vht_cap, he_oper->optional, 3);
                   ^~~~~~
   net/mac80211/mlme.c:487:2: warning: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&ht_cap, &sband->ht_cap, sizeof(ht_cap));
           ^~~~~~
   net/mac80211/mlme.c:487:2: note: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11
           memcpy(&ht_cap, &sband->ht_cap, sizeof(ht_cap));
           ^~~~~~
   net/mac80211/mlme.c:561:2: warning: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&vht_cap, &sband->vht_cap, sizeof(vht_cap));
           ^~~~~~
   net/mac80211/mlme.c:561:2: note: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11
           memcpy(&vht_cap, &sband->vht_cap, sizeof(vht_cap));
           ^~~~~~
   net/mac80211/mlme.c:775:2: warning: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(mgmt->da, assoc_data->bss->bssid, ETH_ALEN);
           ^~~~~~
   net/mac80211/mlme.c:775:2: note: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11
           memcpy(mgmt->da, assoc_data->bss->bssid, ETH_ALEN);
           ^~~~~~
   net/mac80211/mlme.c:776:2: warning: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(mgmt->sa, sdata->vif.addr, ETH_ALEN);
           ^~~~~~
   net/mac80211/mlme.c:776:2: note: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11
           memcpy(mgmt->sa, sdata->vif.addr, ETH_ALEN);
           ^~~~~~
   net/mac80211/mlme.c:777:2: warning: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(mgmt->bssid, assoc_data->bss->bssid, ETH_ALEN);
           ^~~~~~
   net/mac80211/mlme.c:777:2: note: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11
           memcpy(mgmt->bssid, assoc_data->bss->bssid, ETH_ALEN);
           ^~~~~~
   net/mac80211/mlme.c:788:3: warning: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(mgmt->u.reassoc_req.current_ap, assoc_data->prev_=
bssid,
                   ^~~~~~
   net/mac80211/mlme.c:788:3: note: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11
                   memcpy(mgmt->u.reassoc_req.current_ap, assoc_data->prev_=
bssid,
                   ^~~~~~
   net/mac80211/mlme.c:805:2: warning: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(pos, assoc_data->ssid, assoc_data->ssid_len);
           ^~~~~~
   net/mac80211/mlme.c:805:2: note: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11
           memcpy(pos, assoc_data->ssid, assoc_data->ssid_len);
           ^~~~~~
   net/mac80211/mlme.c:978:3: warning: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(pos, assoc_data->ie + offset, noffset - offset);
                   ^~~~~~
   net/mac80211/mlme.c:978:3: note: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11
                   memcpy(pos, assoc_data->ie + offset, noffset - offset);
                   ^~~~~~
   net/mac80211/mlme.c:1017:3: warning: Value stored to 'pos' is never read=
 [clang-analyzer-deadcode.DeadStores]
                   pos =3D ieee80211_add_wmm_info_ie(skb_put(skb, 9), qos_i=
nfo);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   net/mac80211/mlme.c:1017:3: note: Value stored to 'pos' is never read
                   pos =3D ieee80211_add_wmm_info_ie(skb_put(skb, 9), qos_i=
nfo);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   net/mac80211/mlme.c:1120:2: warning: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(nullfunc->addr1, sdata->u.mgd.bssid, ETH_ALEN);
           ^~~~~~
   net/mac80211/mlme.c:1120:2: note: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11
           memcpy(nullfunc->addr1, sdata->u.mgd.bssid, ETH_ALEN);
           ^~~~~~
   net/mac80211/mlme.c:1121:2: warning: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(nullfunc->addr2, sdata->vif.addr, ETH_ALEN);
           ^~~~~~
   net/mac80211/mlme.c:1121:2: note: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11
           memcpy(nullfunc->addr2, sdata->vif.addr, ETH_ALEN);

vim +3081 drivers/net/wireless/marvell/mwifiex/sdio.c

54881c6b37c8d6 drivers/net/wireless/mwifiex/sdio.c Amitkumar Karwar 2014-06=
-19  2997  =

809c6ea8abe9f1 drivers/net/wireless/mwifiex/sdio.c Xinming Hu       2014-12=
-23  2998  /* Function to dump SDIO function registers and SDIO scratch reg=
isters in case
809c6ea8abe9f1 drivers/net/wireless/mwifiex/sdio.c Xinming Hu       2014-12=
-23  2999   * of FW crash
809c6ea8abe9f1 drivers/net/wireless/mwifiex/sdio.c Xinming Hu       2014-12=
-23  3000   */
809c6ea8abe9f1 drivers/net/wireless/mwifiex/sdio.c Xinming Hu       2014-12=
-23  3001  static int
809c6ea8abe9f1 drivers/net/wireless/mwifiex/sdio.c Xinming Hu       2014-12=
-23  3002  mwifiex_sdio_reg_dump(struct mwifiex_adapter *adapter, char *drv=
_buf)
809c6ea8abe9f1 drivers/net/wireless/mwifiex/sdio.c Xinming Hu       2014-12=
-23  3003  {
809c6ea8abe9f1 drivers/net/wireless/mwifiex/sdio.c Xinming Hu       2014-12=
-23  3004  	char *p =3D drv_buf;
809c6ea8abe9f1 drivers/net/wireless/mwifiex/sdio.c Xinming Hu       2014-12=
-23  3005  	struct sdio_mmc_card *cardp =3D adapter->card;
809c6ea8abe9f1 drivers/net/wireless/mwifiex/sdio.c Xinming Hu       2014-12=
-23  3006  	int ret =3D 0;
809c6ea8abe9f1 drivers/net/wireless/mwifiex/sdio.c Xinming Hu       2014-12=
-23  3007  	u8 count, func, data, index =3D 0, size =3D 0;
809c6ea8abe9f1 drivers/net/wireless/mwifiex/sdio.c Xinming Hu       2014-12=
-23  3008  	u8 reg, reg_start, reg_end;
809c6ea8abe9f1 drivers/net/wireless/mwifiex/sdio.c Xinming Hu       2014-12=
-23  3009  	char buf[256], *ptr;
809c6ea8abe9f1 drivers/net/wireless/mwifiex/sdio.c Xinming Hu       2014-12=
-23  3010  =

809c6ea8abe9f1 drivers/net/wireless/mwifiex/sdio.c Xinming Hu       2014-12=
-23  3011  	if (!p)
809c6ea8abe9f1 drivers/net/wireless/mwifiex/sdio.c Xinming Hu       2014-12=
-23  3012  		return 0;
809c6ea8abe9f1 drivers/net/wireless/mwifiex/sdio.c Xinming Hu       2014-12=
-23  3013  =

9cc0dbf0436767 drivers/net/wireless/mwifiex/sdio.c Amitkumar Karwar 2015-05=
-26  3014  	mwifiex_dbg(adapter, MSG, "SDIO register dump start\n");
809c6ea8abe9f1 drivers/net/wireless/mwifiex/sdio.c Xinming Hu       2014-12=
-23  3015  =

809c6ea8abe9f1 drivers/net/wireless/mwifiex/sdio.c Xinming Hu       2014-12=
-23  3016  	mwifiex_pm_wakeup_card(adapter);
809c6ea8abe9f1 drivers/net/wireless/mwifiex/sdio.c Xinming Hu       2014-12=
-23  3017  =

809c6ea8abe9f1 drivers/net/wireless/mwifiex/sdio.c Xinming Hu       2014-12=
-23  3018  	sdio_claim_host(cardp->func);
809c6ea8abe9f1 drivers/net/wireless/mwifiex/sdio.c Xinming Hu       2014-12=
-23  3019  =

809c6ea8abe9f1 drivers/net/wireless/mwifiex/sdio.c Xinming Hu       2014-12=
-23  3020  	for (count =3D 0; count < 5; count++) {
809c6ea8abe9f1 drivers/net/wireless/mwifiex/sdio.c Xinming Hu       2014-12=
-23  3021  		memset(buf, 0, sizeof(buf));
809c6ea8abe9f1 drivers/net/wireless/mwifiex/sdio.c Xinming Hu       2014-12=
-23  3022  		ptr =3D buf;
809c6ea8abe9f1 drivers/net/wireless/mwifiex/sdio.c Xinming Hu       2014-12=
-23  3023  =

809c6ea8abe9f1 drivers/net/wireless/mwifiex/sdio.c Xinming Hu       2014-12=
-23  3024  		switch (count) {
809c6ea8abe9f1 drivers/net/wireless/mwifiex/sdio.c Xinming Hu       2014-12=
-23  3025  		case 0:
809c6ea8abe9f1 drivers/net/wireless/mwifiex/sdio.c Xinming Hu       2014-12=
-23  3026  			/* Read the registers of SDIO function0 */
809c6ea8abe9f1 drivers/net/wireless/mwifiex/sdio.c Xinming Hu       2014-12=
-23  3027  			func =3D count;
809c6ea8abe9f1 drivers/net/wireless/mwifiex/sdio.c Xinming Hu       2014-12=
-23  3028  			reg_start =3D 0;
809c6ea8abe9f1 drivers/net/wireless/mwifiex/sdio.c Xinming Hu       2014-12=
-23  3029  			reg_end =3D 9;
809c6ea8abe9f1 drivers/net/wireless/mwifiex/sdio.c Xinming Hu       2014-12=
-23  3030  			break;
809c6ea8abe9f1 drivers/net/wireless/mwifiex/sdio.c Xinming Hu       2014-12=
-23  3031  		case 1:
809c6ea8abe9f1 drivers/net/wireless/mwifiex/sdio.c Xinming Hu       2014-12=
-23  3032  			/* Read the registers of SDIO function1 */
809c6ea8abe9f1 drivers/net/wireless/mwifiex/sdio.c Xinming Hu       2014-12=
-23  3033  			func =3D count;
809c6ea8abe9f1 drivers/net/wireless/mwifiex/sdio.c Xinming Hu       2014-12=
-23  3034  			reg_start =3D cardp->reg->func1_dump_reg_start;
809c6ea8abe9f1 drivers/net/wireless/mwifiex/sdio.c Xinming Hu       2014-12=
-23  3035  			reg_end =3D cardp->reg->func1_dump_reg_end;
809c6ea8abe9f1 drivers/net/wireless/mwifiex/sdio.c Xinming Hu       2014-12=
-23  3036  			break;
809c6ea8abe9f1 drivers/net/wireless/mwifiex/sdio.c Xinming Hu       2014-12=
-23  3037  		case 2:
809c6ea8abe9f1 drivers/net/wireless/mwifiex/sdio.c Xinming Hu       2014-12=
-23  3038  			index =3D 0;
809c6ea8abe9f1 drivers/net/wireless/mwifiex/sdio.c Xinming Hu       2014-12=
-23  3039  			func =3D 1;
809c6ea8abe9f1 drivers/net/wireless/mwifiex/sdio.c Xinming Hu       2014-12=
-23  3040  			reg_start =3D cardp->reg->func1_spec_reg_table[index++];
809c6ea8abe9f1 drivers/net/wireless/mwifiex/sdio.c Xinming Hu       2014-12=
-23  3041  			size =3D cardp->reg->func1_spec_reg_num;
809c6ea8abe9f1 drivers/net/wireless/mwifiex/sdio.c Xinming Hu       2014-12=
-23  3042  			reg_end =3D cardp->reg->func1_spec_reg_table[size-1];
809c6ea8abe9f1 drivers/net/wireless/mwifiex/sdio.c Xinming Hu       2014-12=
-23  3043  			break;
809c6ea8abe9f1 drivers/net/wireless/mwifiex/sdio.c Xinming Hu       2014-12=
-23  3044  		default:
809c6ea8abe9f1 drivers/net/wireless/mwifiex/sdio.c Xinming Hu       2014-12=
-23  3045  			/* Read the scratch registers of SDIO function1 */
809c6ea8abe9f1 drivers/net/wireless/mwifiex/sdio.c Xinming Hu       2014-12=
-23  3046  			if (count =3D=3D 4)
809c6ea8abe9f1 drivers/net/wireless/mwifiex/sdio.c Xinming Hu       2014-12=
-23  3047  				mdelay(100);
809c6ea8abe9f1 drivers/net/wireless/mwifiex/sdio.c Xinming Hu       2014-12=
-23  3048  			func =3D 1;
809c6ea8abe9f1 drivers/net/wireless/mwifiex/sdio.c Xinming Hu       2014-12=
-23  3049  			reg_start =3D cardp->reg->func1_scratch_reg;
809c6ea8abe9f1 drivers/net/wireless/mwifiex/sdio.c Xinming Hu       2014-12=
-23  3050  			reg_end =3D reg_start + MWIFIEX_SDIO_SCRATCH_SIZE;
809c6ea8abe9f1 drivers/net/wireless/mwifiex/sdio.c Xinming Hu       2014-12=
-23  3051  		}
809c6ea8abe9f1 drivers/net/wireless/mwifiex/sdio.c Xinming Hu       2014-12=
-23  3052  =

809c6ea8abe9f1 drivers/net/wireless/mwifiex/sdio.c Xinming Hu       2014-12=
-23  3053  		if (count !=3D 2)
809c6ea8abe9f1 drivers/net/wireless/mwifiex/sdio.c Xinming Hu       2014-12=
-23  3054  			ptr +=3D sprintf(ptr, "SDIO Func%d (%#x-%#x): ",
809c6ea8abe9f1 drivers/net/wireless/mwifiex/sdio.c Xinming Hu       2014-12=
-23  3055  				       func, reg_start, reg_end);
809c6ea8abe9f1 drivers/net/wireless/mwifiex/sdio.c Xinming Hu       2014-12=
-23  3056  		else
809c6ea8abe9f1 drivers/net/wireless/mwifiex/sdio.c Xinming Hu       2014-12=
-23  3057  			ptr +=3D sprintf(ptr, "SDIO Func%d: ", func);
809c6ea8abe9f1 drivers/net/wireless/mwifiex/sdio.c Xinming Hu       2014-12=
-23  3058  =

809c6ea8abe9f1 drivers/net/wireless/mwifiex/sdio.c Xinming Hu       2014-12=
-23  3059  		for (reg =3D reg_start; reg <=3D reg_end;) {
809c6ea8abe9f1 drivers/net/wireless/mwifiex/sdio.c Xinming Hu       2014-12=
-23  3060  			if (func =3D=3D 0)
809c6ea8abe9f1 drivers/net/wireless/mwifiex/sdio.c Xinming Hu       2014-12=
-23  3061  				data =3D sdio_f0_readb(cardp->func, reg, &ret);
809c6ea8abe9f1 drivers/net/wireless/mwifiex/sdio.c Xinming Hu       2014-12=
-23  3062  			else
809c6ea8abe9f1 drivers/net/wireless/mwifiex/sdio.c Xinming Hu       2014-12=
-23  3063  				data =3D sdio_readb(cardp->func, reg, &ret);
809c6ea8abe9f1 drivers/net/wireless/mwifiex/sdio.c Xinming Hu       2014-12=
-23  3064  =

809c6ea8abe9f1 drivers/net/wireless/mwifiex/sdio.c Xinming Hu       2014-12=
-23  3065  			if (count =3D=3D 2)
809c6ea8abe9f1 drivers/net/wireless/mwifiex/sdio.c Xinming Hu       2014-12=
-23  3066  				ptr +=3D sprintf(ptr, "(%#x) ", reg);
809c6ea8abe9f1 drivers/net/wireless/mwifiex/sdio.c Xinming Hu       2014-12=
-23  3067  			if (!ret) {
809c6ea8abe9f1 drivers/net/wireless/mwifiex/sdio.c Xinming Hu       2014-12=
-23  3068  				ptr +=3D sprintf(ptr, "%02x ", data);
809c6ea8abe9f1 drivers/net/wireless/mwifiex/sdio.c Xinming Hu       2014-12=
-23  3069  			} else {
809c6ea8abe9f1 drivers/net/wireless/mwifiex/sdio.c Xinming Hu       2014-12=
-23  3070  				ptr +=3D sprintf(ptr, "ERR");
809c6ea8abe9f1 drivers/net/wireless/mwifiex/sdio.c Xinming Hu       2014-12=
-23  3071  				break;
809c6ea8abe9f1 drivers/net/wireless/mwifiex/sdio.c Xinming Hu       2014-12=
-23  3072  			}
809c6ea8abe9f1 drivers/net/wireless/mwifiex/sdio.c Xinming Hu       2014-12=
-23  3073  =

809c6ea8abe9f1 drivers/net/wireless/mwifiex/sdio.c Xinming Hu       2014-12=
-23  3074  			if (count =3D=3D 2 && reg < reg_end)
809c6ea8abe9f1 drivers/net/wireless/mwifiex/sdio.c Xinming Hu       2014-12=
-23  3075  				reg =3D cardp->reg->func1_spec_reg_table[index++];
809c6ea8abe9f1 drivers/net/wireless/mwifiex/sdio.c Xinming Hu       2014-12=
-23  3076  			else
809c6ea8abe9f1 drivers/net/wireless/mwifiex/sdio.c Xinming Hu       2014-12=
-23  3077  				reg++;
809c6ea8abe9f1 drivers/net/wireless/mwifiex/sdio.c Xinming Hu       2014-12=
-23  3078  		}
809c6ea8abe9f1 drivers/net/wireless/mwifiex/sdio.c Xinming Hu       2014-12=
-23  3079  =

acebe8c10a6eab drivers/net/wireless/mwifiex/sdio.c Zhaoyang Liu     2015-05=
-12  3080  		mwifiex_dbg(adapter, MSG, "%s\n", buf);
809c6ea8abe9f1 drivers/net/wireless/mwifiex/sdio.c Xinming Hu       2014-12=
-23 @3081  		p +=3D sprintf(p, "%s\n", buf);
809c6ea8abe9f1 drivers/net/wireless/mwifiex/sdio.c Xinming Hu       2014-12=
-23  3082  	}
809c6ea8abe9f1 drivers/net/wireless/mwifiex/sdio.c Xinming Hu       2014-12=
-23  3083  =

809c6ea8abe9f1 drivers/net/wireless/mwifiex/sdio.c Xinming Hu       2014-12=
-23  3084  	sdio_release_host(cardp->func);
809c6ea8abe9f1 drivers/net/wireless/mwifiex/sdio.c Xinming Hu       2014-12=
-23  3085  =

9cc0dbf0436767 drivers/net/wireless/mwifiex/sdio.c Amitkumar Karwar 2015-05=
-26  3086  	mwifiex_dbg(adapter, MSG, "SDIO register dump end\n");
809c6ea8abe9f1 drivers/net/wireless/mwifiex/sdio.c Xinming Hu       2014-12=
-23  3087  =

809c6ea8abe9f1 drivers/net/wireless/mwifiex/sdio.c Xinming Hu       2014-12=
-23  3088  	return p - drv_buf;
809c6ea8abe9f1 drivers/net/wireless/mwifiex/sdio.c Xinming Hu       2014-12=
-23  3089  }
809c6ea8abe9f1 drivers/net/wireless/mwifiex/sdio.c Xinming Hu       2014-12=
-23  3090  =


:::::: The code at line 3081 was first introduced by commit
:::::: 809c6ea8abe9f18b74253e6c8c7b23dd73f74b7a mwifiex: save sdio register=
 values before firmware dump

:::::: TO: Xinming Hu <huxm@marvell.com>
:::::: CC: Kalle Valo <kvalo@codeaurora.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0159796424541922205==--

