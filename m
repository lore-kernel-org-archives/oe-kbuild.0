Content-Type: multipart/mixed; boundary="===============8620586207122992015=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 11408/13468] net/mac80211/mlme.c:4737:7: warning: Value stored to 'bssid' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Sun, 22 May 2022 01:21:51 +0800
Message-ID: <202205220128.bwNmsjhd-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8620586207122992015==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Johannes Berg <johannes.berg@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   18ecd30af1a8402c162cca1bd58771c0e5be7815
commit: 16d0364c722a246933ec4b39cbd5d17d7d4fe758 [11408/13468] mac80211: re=
move useless bssid copy
:::::: branch date: 28 hours ago
:::::: commit date: 5 days ago
config: riscv-randconfig-c006-20220519 (https://download.01.org/0day-ci/arc=
hive/20220522/202205220128.bwNmsjhd-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project e00cbb=
ec06c08dc616a0d52a20f678b8fbd4e304)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3D16d0364c722a246933ec4b39cbd5d17d7d4fe758
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 16d0364c722a246933ec4b39cbd5d17d7d4fe758
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   net/mac80211/mlme.c:3572:2: note: Taking true branch
           if (elems->he_operation && !(ifmgd->flags & IEEE80211_STA_DISABL=
E_HE) &&
           ^
   net/mac80211/mlme.c:3581:7: note: Assuming field 'rsnx' is null
                   if (elems->rsnx && elems->rsnx_len &&
                       ^~~~~~~~~~~
   net/mac80211/mlme.c:3581:19: note: Left side of '&&' is false
                   if (elems->rsnx && elems->rsnx_len &&
                                   ^
   net/mac80211/mlme.c:3589:14: note: Calling 'ieee80211_recalc_twt_req'
                   changed |=3D ieee80211_recalc_twt_req(sdata, sta, elems);
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/mlme.c:3343:13: note: Calling 'ieee80211_twt_req_supported'
           bool twt =3D ieee80211_twt_req_supported(sta, elems);
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/mlme.c:3329:6: note: Assuming field 'ext_capab_len' is >=3D=
 10
           if (elems->ext_capab_len < 10)
               ^~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/mlme.c:3329:2: note: Taking false branch
           if (elems->ext_capab_len < 10)
           ^
   net/mac80211/mlme.c:3332:8: note: Array access (via field 'ext_capab') r=
esults in a null pointer dereference
           if (!(elems->ext_capab[9] & WLAN_EXT_CAPA10_TWT_RESPONDER_SUPPOR=
T))
                 ^      ~~~~~~~~~
   net/mac80211/mlme.c:4259:5: warning: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
                                   memcpy(&bss_conf->p2p_noa_attr, &noa, si=
zeof(noa));
                                   ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   net/mac80211/mlme.c:4259:5: note: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11
                                   memcpy(&bss_conf->p2p_noa_attr, &noa, si=
zeof(noa));
                                   ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   net/mac80211/mlme.c:4270:4: warning: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memset(&bss_conf->p2p_noa_attr, 0, sizeof(bss_co=
nf->p2p_noa_attr));
                           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   net/mac80211/mlme.c:4270:4: note: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11
                           memset(&bss_conf->p2p_noa_attr, 0, sizeof(bss_co=
nf->p2p_noa_attr));
                           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   net/mac80211/mlme.c:4707:4: warning: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(bssid, ifmgd->auth_data->bss->bssid, ETH_=
ALEN);
                           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   net/mac80211/mlme.c:4707:4: note: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11
                           memcpy(bssid, ifmgd->auth_data->bss->bssid, ETH_=
ALEN);
                           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
>> net/mac80211/mlme.c:4737:7: warning: Value stored to 'bssid' during its =
initialization is never read [clang-analyzer-deadcode.DeadStores]
                   u8 *bssid =3D ifmgd->bssid;
                       ^~~~~   ~~~~~~~~~~~~
   net/mac80211/mlme.c:4737:7: note: Value stored to 'bssid' during its ini=
tialization is never read
                   u8 *bssid =3D ifmgd->bssid;
                       ^~~~~   ~~~~~~~~~~~~
   net/mac80211/mlme.c:4919:3: warning: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(bssid, ifmgd->bssid, ETH_ALEN);
                   ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   net/mac80211/mlme.c:4919:3: note: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11
                   memcpy(bssid, ifmgd->bssid, ETH_ALEN);
                   ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   net/mac80211/mlme.c:5400:5: warning: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
                                   memcpy(&bss_conf->tx_pwr_env[j], elems->=
tx_pwr_env[i],
                                   ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   net/mac80211/mlme.c:5400:5: note: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11
                                   memcpy(&bss_conf->tx_pwr_env[j], elems->=
tx_pwr_env[i],
                                   ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   net/mac80211/mlme.c:5642:3: warning: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(ifmgd->bssid, cbss->bssid, ETH_ALEN);
                   ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   net/mac80211/mlme.c:5642:3: note: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11
                   memcpy(ifmgd->bssid, cbss->bssid, ETH_ALEN);
                   ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   net/mac80211/mlme.c:5772:3: warning: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(auth_data->data, req->auth_data + 4,
                   ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   net/mac80211/mlme.c:5772:3: note: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11
                   memcpy(auth_data->data, req->auth_data + 4,
                   ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'

vim +/bssid +4737 net/mac80211/mlme.c

1672c0e31917f4 net/mac80211/mlme.c          Johannes Berg     2013-01-29  4=
648  =

1fa57d017366fb net/mac80211/mlme.c          Johannes Berg     2010-06-10  4=
649  void ieee80211_sta_work(struct ieee80211_sub_if_data *sdata)
f0706e828e96d0 net/mac80211/ieee80211_sta.c Jiri Benc         2007-05-05  4=
650  {
9c6bd79011b14a net/mac80211/mlme.c          Johannes Berg     2008-09-11  4=
651  	struct ieee80211_local *local =3D sdata->local;
1fa57d017366fb net/mac80211/mlme.c          Johannes Berg     2010-06-10  4=
652  	struct ieee80211_if_managed *ifmgd =3D &sdata->u.mgd;
9c6bd79011b14a net/mac80211/mlme.c          Johannes Berg     2008-09-11  4=
653  =

8d61ffa5e01c5f net/mac80211/mlme.c          Johannes Berg     2013-05-10  4=
654  	sdata_lock(sdata);
77fdaa12cea26c net/mac80211/mlme.c          Johannes Berg     2009-07-07  4=
655  =

1672c0e31917f4 net/mac80211/mlme.c          Johannes Berg     2013-01-29  4=
656  	if (ifmgd->status_received) {
1672c0e31917f4 net/mac80211/mlme.c          Johannes Berg     2013-01-29  4=
657  		__le16 fc =3D ifmgd->status_fc;
1672c0e31917f4 net/mac80211/mlme.c          Johannes Berg     2013-01-29  4=
658  		bool status_acked =3D ifmgd->status_acked;
1672c0e31917f4 net/mac80211/mlme.c          Johannes Berg     2013-01-29  4=
659  =

1672c0e31917f4 net/mac80211/mlme.c          Johannes Berg     2013-01-29  4=
660  		ifmgd->status_received =3D false;
46cad4b7a131a2 net/mac80211/mlme.c          Johannes Berg     2015-08-15  4=
661  		if (ifmgd->auth_data && ieee80211_is_auth(fc)) {
1672c0e31917f4 net/mac80211/mlme.c          Johannes Berg     2013-01-29  4=
662  			if (status_acked) {
407879b690ba3a net/mac80211/mlme.c          Ilan Peer         2018-04-20  4=
663  				if (ifmgd->auth_data->algorithm =3D=3D
407879b690ba3a net/mac80211/mlme.c          Ilan Peer         2018-04-20  4=
664  				    WLAN_AUTH_SAE)
407879b690ba3a net/mac80211/mlme.c          Ilan Peer         2018-04-20  4=
665  					ifmgd->auth_data->timeout =3D
407879b690ba3a net/mac80211/mlme.c          Ilan Peer         2018-04-20  4=
666  						jiffies +
407879b690ba3a net/mac80211/mlme.c          Ilan Peer         2018-04-20  4=
667  						IEEE80211_AUTH_TIMEOUT_SAE;
407879b690ba3a net/mac80211/mlme.c          Ilan Peer         2018-04-20  4=
668  				else
1672c0e31917f4 net/mac80211/mlme.c          Johannes Berg     2013-01-29  4=
669  					ifmgd->auth_data->timeout =3D
407879b690ba3a net/mac80211/mlme.c          Ilan Peer         2018-04-20  4=
670  						jiffies +
407879b690ba3a net/mac80211/mlme.c          Ilan Peer         2018-04-20  4=
671  						IEEE80211_AUTH_TIMEOUT_SHORT;
8d61ffa5e01c5f net/mac80211/mlme.c          Johannes Berg     2013-05-10  4=
672  				run_again(sdata, ifmgd->auth_data->timeout);
1672c0e31917f4 net/mac80211/mlme.c          Johannes Berg     2013-01-29  4=
673  			} else {
1672c0e31917f4 net/mac80211/mlme.c          Johannes Berg     2013-01-29  4=
674  				ifmgd->auth_data->timeout =3D jiffies - 1;
1672c0e31917f4 net/mac80211/mlme.c          Johannes Berg     2013-01-29  4=
675  			}
89afe614c0c737 net/mac80211/mlme.c          Johannes Berg     2013-02-13  4=
676  			ifmgd->auth_data->timeout_started =3D true;
1672c0e31917f4 net/mac80211/mlme.c          Johannes Berg     2013-01-29  4=
677  		} else if (ifmgd->assoc_data &&
1672c0e31917f4 net/mac80211/mlme.c          Johannes Berg     2013-01-29  4=
678  			   (ieee80211_is_assoc_req(fc) ||
1672c0e31917f4 net/mac80211/mlme.c          Johannes Berg     2013-01-29  4=
679  			    ieee80211_is_reassoc_req(fc))) {
1672c0e31917f4 net/mac80211/mlme.c          Johannes Berg     2013-01-29  4=
680  			if (status_acked) {
1672c0e31917f4 net/mac80211/mlme.c          Johannes Berg     2013-01-29  4=
681  				ifmgd->assoc_data->timeout =3D
1672c0e31917f4 net/mac80211/mlme.c          Johannes Berg     2013-01-29  4=
682  					jiffies + IEEE80211_ASSOC_TIMEOUT_SHORT;
8d61ffa5e01c5f net/mac80211/mlme.c          Johannes Berg     2013-05-10  4=
683  				run_again(sdata, ifmgd->assoc_data->timeout);
1672c0e31917f4 net/mac80211/mlme.c          Johannes Berg     2013-01-29  4=
684  			} else {
1672c0e31917f4 net/mac80211/mlme.c          Johannes Berg     2013-01-29  4=
685  				ifmgd->assoc_data->timeout =3D jiffies - 1;
1672c0e31917f4 net/mac80211/mlme.c          Johannes Berg     2013-01-29  4=
686  			}
89afe614c0c737 net/mac80211/mlme.c          Johannes Berg     2013-02-13  4=
687  			ifmgd->assoc_data->timeout_started =3D true;
1672c0e31917f4 net/mac80211/mlme.c          Johannes Berg     2013-01-29  4=
688  		}
1672c0e31917f4 net/mac80211/mlme.c          Johannes Berg     2013-01-29  4=
689  	}
1672c0e31917f4 net/mac80211/mlme.c          Johannes Berg     2013-01-29  4=
690  =

89afe614c0c737 net/mac80211/mlme.c          Johannes Berg     2013-02-13  4=
691  	if (ifmgd->auth_data && ifmgd->auth_data->timeout_started &&
66e67e41890844 net/mac80211/mlme.c          Johannes Berg     2012-01-20  4=
692  	    time_after(jiffies, ifmgd->auth_data->timeout)) {
94d9864cc86f57 net/mac80211/mlme.c          Johannes Berg     2022-02-24  4=
693  		if (ifmgd->auth_data->done || ifmgd->auth_data->waiting) {
66e67e41890844 net/mac80211/mlme.c          Johannes Berg     2012-01-20  4=
694  			/*
94d9864cc86f57 net/mac80211/mlme.c          Johannes Berg     2022-02-24  4=
695  			 * ok ... we waited for assoc or continuation but
94d9864cc86f57 net/mac80211/mlme.c          Johannes Berg     2022-02-24  4=
696  			 * userspace didn't do it, so kill the auth data
66e67e41890844 net/mac80211/mlme.c          Johannes Berg     2012-01-20  4=
697  			 */
66e67e41890844 net/mac80211/mlme.c          Johannes Berg     2012-01-20  4=
698  			ieee80211_destroy_auth_data(sdata, false);
46cad4b7a131a2 net/mac80211/mlme.c          Johannes Berg     2015-08-15  4=
699  		} else if (ieee80211_auth(sdata)) {
66e67e41890844 net/mac80211/mlme.c          Johannes Berg     2012-01-20  4=
700  			u8 bssid[ETH_ALEN];
a9409093d23c82 net/mac80211/mlme.c          Emmanuel Grumbach 2015-03-16  4=
701  			struct ieee80211_event event =3D {
a9409093d23c82 net/mac80211/mlme.c          Emmanuel Grumbach 2015-03-16  4=
702  				.type =3D MLME_EVENT,
a9409093d23c82 net/mac80211/mlme.c          Emmanuel Grumbach 2015-03-16  4=
703  				.u.mlme.data =3D AUTH_EVENT,
a9409093d23c82 net/mac80211/mlme.c          Emmanuel Grumbach 2015-03-16  4=
704  				.u.mlme.status =3D MLME_TIMEOUT,
a9409093d23c82 net/mac80211/mlme.c          Emmanuel Grumbach 2015-03-16  4=
705  			};
66e67e41890844 net/mac80211/mlme.c          Johannes Berg     2012-01-20  4=
706  =

66e67e41890844 net/mac80211/mlme.c          Johannes Berg     2012-01-20  4=
707  			memcpy(bssid, ifmgd->auth_data->bss->bssid, ETH_ALEN);
66e67e41890844 net/mac80211/mlme.c          Johannes Berg     2012-01-20  4=
708  =

66e67e41890844 net/mac80211/mlme.c          Johannes Berg     2012-01-20  4=
709  			ieee80211_destroy_auth_data(sdata, false);
66e67e41890844 net/mac80211/mlme.c          Johannes Berg     2012-01-20  4=
710  =

6ff57cf88807dd net/mac80211/mlme.c          Johannes Berg     2013-05-16  4=
711  			cfg80211_auth_timeout(sdata->dev, bssid);
a9409093d23c82 net/mac80211/mlme.c          Emmanuel Grumbach 2015-03-16  4=
712  			drv_event_callback(sdata->local, sdata, &event);
66e67e41890844 net/mac80211/mlme.c          Johannes Berg     2012-01-20  4=
713  		}
89afe614c0c737 net/mac80211/mlme.c          Johannes Berg     2013-02-13  4=
714  	} else if (ifmgd->auth_data && ifmgd->auth_data->timeout_started)
8d61ffa5e01c5f net/mac80211/mlme.c          Johannes Berg     2013-05-10  4=
715  		run_again(sdata, ifmgd->auth_data->timeout);
66e67e41890844 net/mac80211/mlme.c          Johannes Berg     2012-01-20  4=
716  =

89afe614c0c737 net/mac80211/mlme.c          Johannes Berg     2013-02-13  4=
717  	if (ifmgd->assoc_data && ifmgd->assoc_data->timeout_started &&
66e67e41890844 net/mac80211/mlme.c          Johannes Berg     2012-01-20  4=
718  	    time_after(jiffies, ifmgd->assoc_data->timeout)) {
989c6505cdda58 net/mac80211/mlme.c          Alexander Bondar  2013-05-16  4=
719  		if ((ifmgd->assoc_data->need_beacon && !ifmgd->have_beacon) ||
66e67e41890844 net/mac80211/mlme.c          Johannes Berg     2012-01-20  4=
720  		    ieee80211_do_assoc(sdata)) {
959867fa55d0cb net/mac80211/mlme.c          Johannes Berg     2013-06-19  4=
721  			struct cfg80211_bss *bss =3D ifmgd->assoc_data->bss;
d0d1a12f9cc665 net/mac80211/mlme.c          Emmanuel Grumbach 2015-03-16  4=
722  			struct ieee80211_event event =3D {
d0d1a12f9cc665 net/mac80211/mlme.c          Emmanuel Grumbach 2015-03-16  4=
723  				.type =3D MLME_EVENT,
d0d1a12f9cc665 net/mac80211/mlme.c          Emmanuel Grumbach 2015-03-16  4=
724  				.u.mlme.data =3D ASSOC_EVENT,
d0d1a12f9cc665 net/mac80211/mlme.c          Emmanuel Grumbach 2015-03-16  4=
725  				.u.mlme.status =3D MLME_TIMEOUT,
d0d1a12f9cc665 net/mac80211/mlme.c          Emmanuel Grumbach 2015-03-16  4=
726  			};
66e67e41890844 net/mac80211/mlme.c          Johannes Berg     2012-01-20  4=
727  =

e6f462df9acd2a net/mac80211/mlme.c          Johannes Berg     2016-12-08  4=
728  			ieee80211_destroy_assoc_data(sdata, false, false);
959867fa55d0cb net/mac80211/mlme.c          Johannes Berg     2013-06-19  4=
729  			cfg80211_assoc_timeout(sdata->dev, bss);
d0d1a12f9cc665 net/mac80211/mlme.c          Emmanuel Grumbach 2015-03-16  4=
730  			drv_event_callback(sdata->local, sdata, &event);
66e67e41890844 net/mac80211/mlme.c          Johannes Berg     2012-01-20  4=
731  		}
89afe614c0c737 net/mac80211/mlme.c          Johannes Berg     2013-02-13  4=
732  	} else if (ifmgd->assoc_data && ifmgd->assoc_data->timeout_started)
8d61ffa5e01c5f net/mac80211/mlme.c          Johannes Berg     2013-05-10  4=
733  		run_again(sdata, ifmgd->assoc_data->timeout);
66e67e41890844 net/mac80211/mlme.c          Johannes Berg     2012-01-20  4=
734  =

392b9ffb05b62f net/mac80211/mlme.c          Stanislaw Gruszka 2013-08-27  4=
735  	if (ifmgd->flags & IEEE80211_STA_CONNECTION_POLL &&
b291ba11181d46 net/mac80211/mlme.c          Johannes Berg     2009-07-10  4=
736  	    ifmgd->associated) {
16d0364c722a24 net/mac80211/mlme.c          Johannes Berg     2022-05-13 @4=
737  		u8 *bssid =3D ifmgd->bssid;
72a8a3edd63099 net/mac80211/mlme.c          Felix Fietkau     2010-11-23  4=
738  		int max_tries;
a43abf29396523 net/mac80211/mlme.c          Maxim Levitsky    2009-07-31  4=
739  =

30686bf7f5b3c3 net/mac80211/mlme.c          Johannes Berg     2015-06-02  4=
740  		if (ieee80211_hw_check(&local->hw, REPORTS_TX_ACK_STATUS))
180205bdb22b79 net/mac80211/mlme.c          Ben Greear        2011-02-04  4=
741  			max_tries =3D max_nullfunc_tries;
72a8a3edd63099 net/mac80211/mlme.c          Felix Fietkau     2010-11-23  4=
742  		else
180205bdb22b79 net/mac80211/mlme.c          Ben Greear        2011-02-04  4=
743  			max_tries =3D max_probe_tries;
72a8a3edd63099 net/mac80211/mlme.c          Felix Fietkau     2010-11-23  4=
744  =

4e5ff37692df35 net/mac80211/mlme.c          Felix Fietkau     2010-11-23  4=
745  		/* ACK received for nullfunc probing frame */
4e5ff37692df35 net/mac80211/mlme.c          Felix Fietkau     2010-11-23  4=
746  		if (!ifmgd->probe_send_count)
4e5ff37692df35 net/mac80211/mlme.c          Felix Fietkau     2010-11-23  4=
747  			ieee80211_reset_ap_probe(sdata);
04ac3c0ee2c773 net/mac80211/mlme.c          Felix Fietkau     2010-12-02  4=
748  		else if (ifmgd->nullfunc_failed) {
04ac3c0ee2c773 net/mac80211/mlme.c          Felix Fietkau     2010-12-02  4=
749  			if (ifmgd->probe_send_count < max_tries) {
bdcbd8e0e3ffda net/mac80211/mlme.c          Johannes Berg     2012-06-22  4=
750  				mlme_dbg(sdata,
bdcbd8e0e3ffda net/mac80211/mlme.c          Johannes Berg     2012-06-22  4=
751  					 "No ack for nullfunc frame to AP %pM, try %d/%i\n",
bdcbd8e0e3ffda net/mac80211/mlme.c          Johannes Berg     2012-06-22  4=
752  					 bssid, ifmgd->probe_send_count,
bdcbd8e0e3ffda net/mac80211/mlme.c          Johannes Berg     2012-06-22  4=
753  					 max_tries);
04ac3c0ee2c773 net/mac80211/mlme.c          Felix Fietkau     2010-12-02  4=
754  				ieee80211_mgd_probe_ap_send(sdata);
04ac3c0ee2c773 net/mac80211/mlme.c          Felix Fietkau     2010-12-02  4=
755  			} else {
bdcbd8e0e3ffda net/mac80211/mlme.c          Johannes Berg     2012-06-22  4=
756  				mlme_dbg(sdata,
bdcbd8e0e3ffda net/mac80211/mlme.c          Johannes Berg     2012-06-22  4=
757  					 "No ack for nullfunc frame to AP %pM, disconnecting.\n",
bdcbd8e0e3ffda net/mac80211/mlme.c          Johannes Berg     2012-06-22  4=
758  					 bssid);
53da4c45cadee4 net/mac80211/mlme.c          Johannes Berg     2022-05-13  4=
759  				ieee80211_sta_connection_lost(sdata,
6b684db1db0df4 net/mac80211/mlme.c          Johannes Berg     2013-01-29  4=
760  					WLAN_REASON_DISASSOC_DUE_TO_INACTIVITY,
6b684db1db0df4 net/mac80211/mlme.c          Johannes Berg     2013-01-29  4=
761  					false);
04ac3c0ee2c773 net/mac80211/mlme.c          Felix Fietkau     2010-12-02  4=
762  			}
04ac3c0ee2c773 net/mac80211/mlme.c          Felix Fietkau     2010-12-02  4=
763  		} else if (time_is_after_jiffies(ifmgd->probe_timeout))
8d61ffa5e01c5f net/mac80211/mlme.c          Johannes Berg     2013-05-10  4=
764  			run_again(sdata, ifmgd->probe_timeout);
30686bf7f5b3c3 net/mac80211/mlme.c          Johannes Berg     2015-06-02  4=
765  		else if (ieee80211_hw_check(&local->hw, REPORTS_TX_ACK_STATUS)) {
bdcbd8e0e3ffda net/mac80211/mlme.c          Johannes Berg     2012-06-22  4=
766  			mlme_dbg(sdata,
bdcbd8e0e3ffda net/mac80211/mlme.c          Johannes Berg     2012-06-22  4=
767  				 "Failed to send nullfunc to AP %pM after %dms, disconnecting\n",
180205bdb22b79 net/mac80211/mlme.c          Ben Greear        2011-02-04  4=
768  				 bssid, probe_wait_ms);
53da4c45cadee4 net/mac80211/mlme.c          Johannes Berg     2022-05-13  4=
769  			ieee80211_sta_connection_lost(sdata,
6b684db1db0df4 net/mac80211/mlme.c          Johannes Berg     2013-01-29  4=
770  				WLAN_REASON_DISASSOC_DUE_TO_INACTIVITY, false);
04ac3c0ee2c773 net/mac80211/mlme.c          Felix Fietkau     2010-12-02  4=
771  		} else if (ifmgd->probe_send_count < max_tries) {
bdcbd8e0e3ffda net/mac80211/mlme.c          Johannes Berg     2012-06-22  4=
772  			mlme_dbg(sdata,
bdcbd8e0e3ffda net/mac80211/mlme.c          Johannes Berg     2012-06-22  4=
773  				 "No probe response from AP %pM after %dms, try %d/%i\n",
180205bdb22b79 net/mac80211/mlme.c          Ben Greear        2011-02-04  4=
774  				 bssid, probe_wait_ms,
bfc31df33b1625 net/mac80211/mlme.c          Ben Greear        2011-01-14  4=
775  				 ifmgd->probe_send_count, max_tries);
a43abf29396523 net/mac80211/mlme.c          Maxim Levitsky    2009-07-31  4=
776  			ieee80211_mgd_probe_ap_send(sdata);
a43abf29396523 net/mac80211/mlme.c          Maxim Levitsky    2009-07-31  4=
777  		} else {
b291ba11181d46 net/mac80211/mlme.c          Johannes Berg     2009-07-10  4=
778  			/*
b291ba11181d46 net/mac80211/mlme.c          Johannes Berg     2009-07-10  4=
779  			 * We actually lost the connection ... or did we?
b291ba11181d46 net/mac80211/mlme.c          Johannes Berg     2009-07-10  4=
780  			 * Let's make sure!
b291ba11181d46 net/mac80211/mlme.c          Johannes Berg     2009-07-10  4=
781  			 */
89f774e6c41efd net/mac80211/mlme.c          Johannes Berg     2016-01-25  4=
782  			mlme_dbg(sdata,
89f774e6c41efd net/mac80211/mlme.c          Johannes Berg     2016-01-25  4=
783  				 "No probe response from AP %pM after %dms, disconnecting.\n",
180205bdb22b79 net/mac80211/mlme.c          Ben Greear        2011-02-04  4=
784  				 bssid, probe_wait_ms);
04ac3c0ee2c773 net/mac80211/mlme.c          Felix Fietkau     2010-12-02  4=
785  =

53da4c45cadee4 net/mac80211/mlme.c          Johannes Berg     2022-05-13  4=
786  			ieee80211_sta_connection_lost(sdata,
6b684db1db0df4 net/mac80211/mlme.c          Johannes Berg     2013-01-29  4=
787  				WLAN_REASON_DISASSOC_DUE_TO_INACTIVITY, false);
b291ba11181d46 net/mac80211/mlme.c          Johannes Berg     2009-07-10  4=
788  		}
b291ba11181d46 net/mac80211/mlme.c          Johannes Berg     2009-07-10  4=
789  	}
b291ba11181d46 net/mac80211/mlme.c          Johannes Berg     2009-07-10  4=
790  =

8d61ffa5e01c5f net/mac80211/mlme.c          Johannes Berg     2013-05-10  4=
791  	sdata_unlock(sdata);
f0706e828e96d0 net/mac80211/ieee80211_sta.c Jiri Benc         2007-05-05  4=
792  }
9c6bd79011b14a net/mac80211/mlme.c          Johannes Berg     2008-09-11  4=
793  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8620586207122992015==--

