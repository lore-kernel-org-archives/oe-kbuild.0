Content-Type: multipart/mixed; boundary="===============7859514470507122124=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 9724/13542] net/mac80211/mlme.c:1161:4: warning: Value stored to 'at_extension' is never read [clang-analyzer-deadcode.DeadStores]
Date: Wed, 03 Aug 2022 08:44:44 +0800
Message-ID: <202208030858.knIauqwf-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7859514470507122124==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: net/mac80=
211/mlme.c:1161:4: warning: Value stored to 'at_extension' is never read [c=
lang-analyzer-deadcode.DeadStores]"
:::::: =


CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Johannes Berg <johannes.berg@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   7c5e07b73ff3011c9b82d4a3286a3362b951ad2b
commit: 81151ce462e533551f3284bfdb8e0f461c9220e6 [9724/13542] wifi: mac8021=
1: support MLO authentication/association with one link
:::::: branch date: 6 days ago
:::::: commit date: 3 weeks ago
config: x86_64-randconfig-c007 (https://download.01.org/0day-ci/archive/202=
20803/202208030858.knIauqwf-lkp(a)intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 52cd00=
cabf479aa7eb6dbb063b7ba41ea57bce9e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3D81151ce462e533551f3284bfdb8e0f461c9220e6
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 81151ce462e533551f3284bfdb8e0f461c9220e6
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
   net/mac80211/mlme.c:198:2: note: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11
           memcpy(&sta_ht_cap, &sband->ht_cap, sizeof(sta_ht_cap));
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
   net/mac80211/mlme.c:263:3: warning: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(&he_oper_vht_cap, he_oper->optional, 3);
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
   net/mac80211/mlme.c:263:3: note: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11
                   memcpy(&he_oper_vht_cap, he_oper->optional, 3);
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
   net/mac80211/mlme.c:544:2: warning: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&ht_cap, &sband->ht_cap, sizeof(ht_cap));
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
   net/mac80211/mlme.c:544:2: note: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11
           memcpy(&ht_cap, &sband->ht_cap, sizeof(ht_cap));
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
   net/mac80211/mlme.c:620:2: warning: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&vht_cap, &sband->vht_cap, sizeof(vht_cap));
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
   net/mac80211/mlme.c:620:2: note: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11
           memcpy(&vht_cap, &sband->vht_cap, sizeof(vht_cap));
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
>> net/mac80211/mlme.c:1161:4: warning: Value stored to 'at_extension' is n=
ever read [clang-analyzer-deadcode.DeadStores]
                           at_extension =3D true;
                           ^              ~~~~
   net/mac80211/mlme.c:1161:4: note: Value stored to 'at_extension' is neve=
r read
                           at_extension =3D true;
                           ^              ~~~~
   net/mac80211/mlme.c:1229:2: warning: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(common->mld_mac_addr, sdata->vif.addr, ETH_ALEN);
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
   net/mac80211/mlme.c:1229:2: note: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11
           memcpy(common->mld_mac_addr, sdata->vif.addr, ETH_ALEN);
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
   net/mac80211/mlme.c:1419:2: warning: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(mgmt->da, bssid, ETH_ALEN);
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
   net/mac80211/mlme.c:1419:2: note: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11
           memcpy(mgmt->da, bssid, ETH_ALEN);
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
   net/mac80211/mlme.c:1420:2: warning: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(mgmt->sa, link->conf->addr, ETH_ALEN);
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
   net/mac80211/mlme.c:1420:2: note: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11
           memcpy(mgmt->sa, link->conf->addr, ETH_ALEN);
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
   net/mac80211/mlme.c:1421:2: warning: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(mgmt->bssid, bssid, ETH_ALEN);
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
   net/mac80211/mlme.c:1421:2: note: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11
           memcpy(mgmt->bssid, bssid, ETH_ALEN);
           ^
   include/linux/fortify-string.h:385:26: note: expanded from macro 'memcpy'

vim +/at_extension +1161 net/mac80211/mlme.c

978420c2105ca9 Johannes Berg 2022-07-12  1137  =

81151ce462e533 Johannes Berg 2022-06-01  1138  static void ieee80211_add_no=
n_inheritance_elem(struct sk_buff *skb,
81151ce462e533 Johannes Berg 2022-06-01  1139  					       const u16 *outer,
81151ce462e533 Johannes Berg 2022-06-01  1140  					       const u16 *inner)
81151ce462e533 Johannes Berg 2022-06-01  1141  {
81151ce462e533 Johannes Berg 2022-06-01  1142  	unsigned int skb_len =3D sk=
b->len;
81151ce462e533 Johannes Berg 2022-06-01  1143  	bool added =3D false;
81151ce462e533 Johannes Berg 2022-06-01  1144  	int i, j;
81151ce462e533 Johannes Berg 2022-06-01  1145  	u8 *len, *list_len =3D NULL;
81151ce462e533 Johannes Berg 2022-06-01  1146  =

81151ce462e533 Johannes Berg 2022-06-01  1147  	skb_put_u8(skb, WLAN_EID_EX=
TENSION);
81151ce462e533 Johannes Berg 2022-06-01  1148  	len =3D skb_put(skb, 1);
81151ce462e533 Johannes Berg 2022-06-01  1149  	skb_put_u8(skb, WLAN_EID_EX=
T_NON_INHERITANCE);
81151ce462e533 Johannes Berg 2022-06-01  1150  =

81151ce462e533 Johannes Berg 2022-06-01  1151  	for (i =3D 0; i < PRESENT_E=
LEMS_MAX && outer[i]; i++) {
81151ce462e533 Johannes Berg 2022-06-01  1152  		u16 elem =3D outer[i];
81151ce462e533 Johannes Berg 2022-06-01  1153  		bool have_inner =3D false;
81151ce462e533 Johannes Berg 2022-06-01  1154  		bool at_extension =3D fals=
e;
81151ce462e533 Johannes Berg 2022-06-01  1155  =

81151ce462e533 Johannes Berg 2022-06-01  1156  		/* should@least be sort=
ed in the sense of normal -> ext */
81151ce462e533 Johannes Berg 2022-06-01  1157  		WARN_ON(at_extension && el=
em < PRESENT_ELEM_EXT_OFFS);
81151ce462e533 Johannes Berg 2022-06-01  1158  =

81151ce462e533 Johannes Berg 2022-06-01  1159  		/* switch to extension lis=
t */
81151ce462e533 Johannes Berg 2022-06-01  1160  		if (!at_extension && elem =
>=3D PRESENT_ELEM_EXT_OFFS) {
81151ce462e533 Johannes Berg 2022-06-01 @1161  			at_extension =3D true;
81151ce462e533 Johannes Berg 2022-06-01  1162  			if (!list_len)
81151ce462e533 Johannes Berg 2022-06-01  1163  				skb_put_u8(skb, 0);
81151ce462e533 Johannes Berg 2022-06-01  1164  			list_len =3D NULL;
81151ce462e533 Johannes Berg 2022-06-01  1165  		}
81151ce462e533 Johannes Berg 2022-06-01  1166  =

81151ce462e533 Johannes Berg 2022-06-01  1167  		for (j =3D 0; j < PRESENT_=
ELEMS_MAX && inner[j]; j++) {
81151ce462e533 Johannes Berg 2022-06-01  1168  			if (elem =3D=3D inner[j])=
 {
81151ce462e533 Johannes Berg 2022-06-01  1169  				have_inner =3D true;
81151ce462e533 Johannes Berg 2022-06-01  1170  				break;
81151ce462e533 Johannes Berg 2022-06-01  1171  			}
81151ce462e533 Johannes Berg 2022-06-01  1172  		}
81151ce462e533 Johannes Berg 2022-06-01  1173  =

81151ce462e533 Johannes Berg 2022-06-01  1174  		if (have_inner)
81151ce462e533 Johannes Berg 2022-06-01  1175  			continue;
81151ce462e533 Johannes Berg 2022-06-01  1176  =

81151ce462e533 Johannes Berg 2022-06-01  1177  		if (!list_len) {
81151ce462e533 Johannes Berg 2022-06-01  1178  			list_len =3D skb_put(skb,=
 1);
81151ce462e533 Johannes Berg 2022-06-01  1179  			*list_len =3D 0;
81151ce462e533 Johannes Berg 2022-06-01  1180  		}
81151ce462e533 Johannes Berg 2022-06-01  1181  		*list_len +=3D 1;
81151ce462e533 Johannes Berg 2022-06-01  1182  		skb_put_u8(skb, (u8)elem);
81151ce462e533 Johannes Berg 2022-06-01  1183  	}
81151ce462e533 Johannes Berg 2022-06-01  1184  =

81151ce462e533 Johannes Berg 2022-06-01  1185  	if (!added)
81151ce462e533 Johannes Berg 2022-06-01  1186  		skb_trim(skb, skb_len);
81151ce462e533 Johannes Berg 2022-06-01  1187  	else
81151ce462e533 Johannes Berg 2022-06-01  1188  		*len =3D skb->len - skb_le=
n - 2;
81151ce462e533 Johannes Berg 2022-06-01  1189  }
81151ce462e533 Johannes Berg 2022-06-01  1190  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7859514470507122124==--

