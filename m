Content-Type: multipart/mixed; boundary="===============7448675503578674022=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 11404/14446] net/mac80211/sta_info.c:2781:3: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
Date: Thu, 04 Aug 2022 07:04:06 +0800
Message-ID: <202208040630.98s0uKqu-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7448675503578674022==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: net/mac80=
211/sta_info.c:2781:3: warning: Value stored to 'ret' is never read [clang-=
analyzer-deadcode.DeadStores]"
:::::: =


CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Johannes Berg <johannes.berg@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   861397378de91c64dec69a160595b891f443294f
commit: 177577dbd2235a3a65f34a6cd618fe961a4dcaba [11404/14446] wifi: mac802=
11: sta_info: fix link_sta insertion
:::::: branch date: 5 hours ago
:::::: commit date: 12 days ago
config: x86_64-randconfig-c007 (https://download.01.org/0day-ci/archive/202=
20804/202208040630.98s0uKqu-lkp(a)intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 52cd00=
cabf479aa7eb6dbb063b7ba41ea57bce9e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3D177577dbd2235a3a65f34a6cd618fe961a4dcaba
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 177577dbd2235a3a65f34a6cd618fe961a4dcaba
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

clang-analyzer warnings: (new ones prefixed by >>)
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
   net/mac80211/sta_info.c:529:2: note: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11
           memcpy(sta->sta.deflink.addr, link_addr, ETH_ALEN);
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
   net/mac80211/sta_info.c:1588:2: warning: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(nullfunc->addr1, sta->sta.addr, ETH_ALEN);
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
   net/mac80211/sta_info.c:1588:2: note: Call to function 'memcpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memcpy_s' in case of C11
           memcpy(nullfunc->addr1, sta->sta.addr, ETH_ALEN);
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
   net/mac80211/sta_info.c:1589:2: warning: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(nullfunc->addr2, sdata->vif.addr, ETH_ALEN);
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
   net/mac80211/sta_info.c:1589:2: note: Call to function 'memcpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memcpy_s' in case of C11
           memcpy(nullfunc->addr2, sdata->vif.addr, ETH_ALEN);
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
   net/mac80211/sta_info.c:1590:2: warning: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(nullfunc->addr3, sdata->vif.addr, ETH_ALEN);
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
   net/mac80211/sta_info.c:1590:2: note: Call to function 'memcpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memcpy_s' in case of C11
           memcpy(nullfunc->addr3, sdata->vif.addr, ETH_ALEN);
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
>> net/mac80211/sta_info.c:2781:3: warning: Value stored to 'ret' is never =
read [clang-analyzer-deadcode.DeadStores]
                   ret =3D 0;
                   ^     ~
   net/mac80211/sta_info.c:2781:3: note: Value stored to 'ret' is never read
                   ret =3D 0;
                   ^     ~
   Suppressed 76 warnings (76 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   79 warnings generated.
   Suppressed 79 warnings (79 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   80 warnings generated.
   drivers/net/wireless/ath/ath11k/dbring.c:366:3: warning: Call to functio=
n 'memset' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'memset_s' in case of C11 [clang=
-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(buff->payload, 0, size);
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
   drivers/net/wireless/ath/ath11k/dbring.c:366:3: note: Call to function '=
memset' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'memset_s' in case of C11
                   memset(buff->payload, 0, size);
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
   Suppressed 79 warnings (79 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   88 warnings generated.
   drivers/net/wireless/ath/ath11k/hw.c:356:2: warning: Call to function 'm=
emcpy' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memcpy_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy((u8 *)&fdesc->u.ipq8074.msdu_end, (u8 *)&ldesc->u.ipq8074=
.msdu_end,
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
   drivers/net/wireless/ath/ath11k/hw.c:356:2: note: Call to function 'memc=
py' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy((u8 *)&fdesc->u.ipq8074.msdu_end, (u8 *)&ldesc->u.ipq8074=
.msdu_end,
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
   drivers/net/wireless/ath/ath11k/hw.c:358:2: warning: Call to function 'm=
emcpy' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memcpy_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy((u8 *)&fdesc->u.ipq8074.attention, (u8 *)&ldesc->u.ipq807=
4.attention,
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
   drivers/net/wireless/ath/ath11k/hw.c:358:2: note: Call to function 'memc=
py' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy((u8 *)&fdesc->u.ipq8074.attention, (u8 *)&ldesc->u.ipq807=
4.attention,
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
   drivers/net/wireless/ath/ath11k/hw.c:360:2: warning: Call to function 'm=
emcpy' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memcpy_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy((u8 *)&fdesc->u.ipq8074.mpdu_end, (u8 *)&ldesc->u.ipq8074=
.mpdu_end,
           ^
   include/linux/fortify-string.h:385:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:378:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here

vim +/ret +2781 net/mac80211/sta_info.c

21476ad16d3ca36 Shaul Triebitz 2022-06-14  2755  =

cb71f1d136a635d Johannes Berg  2022-05-31  2756  int ieee80211_sta_activate=
_link(struct sta_info *sta, unsigned int link_id)
cb71f1d136a635d Johannes Berg  2022-05-31  2757  {
cb71f1d136a635d Johannes Berg  2022-05-31  2758  	struct ieee80211_sub_if_d=
ata *sdata =3D sta->sdata;
c71420db653aba3 Johannes Berg  2022-06-15  2759  	struct link_sta_info *lin=
k_sta;
cb71f1d136a635d Johannes Berg  2022-05-31  2760  	u16 old_links =3D sta->st=
a.valid_links;
cb71f1d136a635d Johannes Berg  2022-05-31  2761  	u16 new_links =3D old_lin=
ks | BIT(link_id);
cb71f1d136a635d Johannes Berg  2022-05-31  2762  	int ret;
cb71f1d136a635d Johannes Berg  2022-05-31  2763  =

c71420db653aba3 Johannes Berg  2022-06-15  2764  	link_sta =3D rcu_derefere=
nce_protected(sta->link[link_id],
c71420db653aba3 Johannes Berg  2022-06-15  2765  					     lockdep_is_held(=
&sdata->local->sta_mtx));
cb71f1d136a635d Johannes Berg  2022-05-31  2766  =

c71420db653aba3 Johannes Berg  2022-06-15  2767  	if (WARN_ON(old_links =3D=
=3D new_links || !link_sta))
cb71f1d136a635d Johannes Berg  2022-05-31  2768  		return -EINVAL;
cb71f1d136a635d Johannes Berg  2022-05-31  2769  =

177577dbd2235a3 Johannes Berg  2022-07-19  2770  	rcu_read_lock();
177577dbd2235a3 Johannes Berg  2022-07-19  2771  	if (link_sta_info_hash_lo=
okup(sdata->local, link_sta->addr)) {
177577dbd2235a3 Johannes Berg  2022-07-19  2772  		rcu_read_unlock();
177577dbd2235a3 Johannes Berg  2022-07-19  2773  		return -EALREADY;
177577dbd2235a3 Johannes Berg  2022-07-19  2774  	}
177577dbd2235a3 Johannes Berg  2022-07-19  2775  	/* we only modify under t=
he mutex so this is fine */
177577dbd2235a3 Johannes Berg  2022-07-19  2776  	rcu_read_unlock();
177577dbd2235a3 Johannes Berg  2022-07-19  2777  =

cb71f1d136a635d Johannes Berg  2022-05-31  2778  	sta->sta.valid_links =3D =
new_links;
cb71f1d136a635d Johannes Berg  2022-05-31  2779  =

ba6ddab94fc6381 Johannes Berg  2022-06-14  2780  	if (!test_sta_flag(sta, W=
LAN_STA_INSERTED)) {
ba6ddab94fc6381 Johannes Berg  2022-06-14 @2781  		ret =3D 0;
ba6ddab94fc6381 Johannes Berg  2022-06-14  2782  		goto hash;
ba6ddab94fc6381 Johannes Berg  2022-06-14  2783  	}
cb71f1d136a635d Johannes Berg  2022-05-31  2784  =

cb71f1d136a635d Johannes Berg  2022-05-31  2785  	ret =3D drv_change_sta_li=
nks(sdata->local, sdata, &sta->sta,
cb71f1d136a635d Johannes Berg  2022-05-31  2786  				   old_links, new_link=
s);
cb71f1d136a635d Johannes Berg  2022-05-31  2787  	if (ret) {
cb71f1d136a635d Johannes Berg  2022-05-31  2788  		sta->sta.valid_links =3D=
 old_links;
ba6ddab94fc6381 Johannes Berg  2022-06-14  2789  		sta_remove_link(sta, lin=
k_id, false);
177577dbd2235a3 Johannes Berg  2022-07-19  2790  		return ret;
cb71f1d136a635d Johannes Berg  2022-05-31  2791  	}
cb71f1d136a635d Johannes Berg  2022-05-31  2792  =

ba6ddab94fc6381 Johannes Berg  2022-06-14  2793  hash:
177577dbd2235a3 Johannes Berg  2022-07-19  2794  	ret =3D link_sta_info_has=
h_add(sdata->local, link_sta);
177577dbd2235a3 Johannes Berg  2022-07-19  2795  	WARN_ON(ret);
177577dbd2235a3 Johannes Berg  2022-07-19  2796  	return 0;
cb71f1d136a635d Johannes Berg  2022-05-31  2797  }
cb71f1d136a635d Johannes Berg  2022-05-31  2798  =


:::::: The code at line 2781 was first introduced by commit
:::::: ba6ddab94fc63813ad582c55dd95ed596420d101 wifi: mac80211: maintain li=
nk-sta hash table

:::::: TO: Johannes Berg <johannes.berg@intel.com>
:::::: CC: Johannes Berg <johannes.berg@intel.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7448675503578674022==--

