Content-Type: multipart/mixed; boundary="===============5805705343000809035=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: net/wireless/scan.c:666:2: warning: Address of stack memory associated with local variable 'ap_list' is still referred to by the stack variable 'coloc_ap_list' upon returning to the caller. This will be a dangling reference [clang-analyzer-core.StackAddr...
Date: Tue, 01 Feb 2022 15:22:02 +0800
Message-ID: <202202011503.h9YEP25L-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5805705343000809035==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Ilan Peer <ilan.peer@intel.com>
CC: Johannes Berg <johannes.berg@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   26291c54e111ff6ba87a164d85d4a4e134b7315c
commit: 8a16ffdc4cf37c1e6204054b0fb44052c8a48f0d cfg80211: Remove wrong RNR=
 IE validation check
date:   10 months ago
:::::: branch date: 2 days ago
:::::: commit date: 10 months ago
config: arm-randconfig-c002-20220121 (https://download.01.org/0day-ci/archi=
ve/20220201/202202011503.h9YEP25L-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project d4baf3=
b1322b84816aa623d8e8cb45a49cb68b84)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D8a16ffdc4cf37c1e6204054b0fb44052c8a48f0d
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 8a16ffdc4cf37c1e6204054b0fb44052c8a48f0d
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   net/core/page_pool.c:472:12: note: Field 'disconnect' is null
           if (pool->disconnect)
                     ^
   net/core/page_pool.c:472:2: note: '?' condition is false
           if (pool->disconnect)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   net/core/page_pool.c:472:2: note: Taking false branch
           if (pool->disconnect)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   net/core/page_pool.c:477:2: note: Assuming the condition is true
           if (pool->p.flags & PP_FLAG_DMA_MAP)
           ^
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   net/core/page_pool.c:477:2: note: '?' condition is false
           if (pool->p.flags & PP_FLAG_DMA_MAP)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   net/core/page_pool.c:477:2: note: '?' condition is false
           if (pool->p.flags & PP_FLAG_DMA_MAP)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   net/core/page_pool.c:477:2: note: Taking false branch
           if (pool->p.flags & PP_FLAG_DMA_MAP)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   net/core/page_pool.c:480:2: note: Memory is released
           kfree(pool);
           ^~~~~~~~~~~
   net/core/page_pool.c:518:3: note: Returning; memory was released via 1st=
 parameter
                   page_pool_free(pool);
                   ^~~~~~~~~~~~~~~~~~~~
   net/core/page_pool.c:560:7: note: Returning; memory was released via 1st=
 parameter
           if (!page_pool_release(pool))
                ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   net/core/page_pool.c:560:2: note: '?' condition is false
           if (!page_pool_release(pool))
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   net/core/page_pool.c:560:7: note: Use of memory after it is freed
           if (!page_pool_release(pool))
                ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                           =
             ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
>> net/wireless/scan.c:666:2: warning: Address of stack memory associated w=
ith local variable 'ap_list' is still referred to by the stack variable 'co=
loc_ap_list' upon returning to the caller.  This will be a dangling referen=
ce [clang-analyzer-core.StackAddressEscape]
           return n_coloc;
           ^
   net/wireless/scan.c:734:6: note: Assuming the condition is false
           if (!rdev->wiphy.bands[NL80211_BAND_6GHZ])
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   net/wireless/scan.c:734:2: note: '?' condition is false
           if (!rdev->wiphy.bands[NL80211_BAND_6GHZ])
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   net/wireless/scan.c:734:2: note: '?' condition is false
           if (!rdev->wiphy.bands[NL80211_BAND_6GHZ])
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   net/wireless/scan.c:734:2: note: Taking false branch
           if (!rdev->wiphy.bands[NL80211_BAND_6GHZ])
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   net/wireless/scan.c:739:7: note: 'iftd' is non-null
           if (!iftd || !iftd->he_cap.has_he)
                ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   net/wireless/scan.c:739:6: note: Left side of '||' is false
           if (!iftd || !iftd->he_cap.has_he)
               ^
   net/wireless/scan.c:739:15: note: Assuming field 'has_he' is true
           if (!iftd || !iftd->he_cap.has_he)
                        ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   net/wireless/scan.c:739:2: note: '?' condition is false
           if (!iftd || !iftd->he_cap.has_he)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   net/wireless/scan.c:739:7: note: 'iftd' is non-null
           if (!iftd || !iftd->he_cap.has_he)
                ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                           =
             ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   net/wireless/scan.c:739:6: note: Left side of '||' is false
           if (!iftd || !iftd->he_cap.has_he)
               ^
   net/wireless/scan.c:739:2: note: '?' condition is false
           if (!iftd || !iftd->he_cap.has_he)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   net/wireless/scan.c:739:2: note: Taking false branch
           if (!iftd || !iftd->he_cap.has_he)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )

vim +666 net/wireless/scan.c

c8cb5b854b40f2 Tova Mussai 2020-09-18  579  =

c8cb5b854b40f2 Tova Mussai 2020-09-18  580  static int cfg80211_parse_coloc=
ated_ap(const struct cfg80211_bss_ies *ies,
c8cb5b854b40f2 Tova Mussai 2020-09-18  581  				       struct list_head *li=
st)
c8cb5b854b40f2 Tova Mussai 2020-09-18  582  {
c8cb5b854b40f2 Tova Mussai 2020-09-18  583  	struct ieee80211_neighbor_ap_i=
nfo *ap_info;
c8cb5b854b40f2 Tova Mussai 2020-09-18  584  	const struct element *elem, *s=
sid_elem;
c8cb5b854b40f2 Tova Mussai 2020-09-18  585  	const u8 *pos, *end;
c8cb5b854b40f2 Tova Mussai 2020-09-18  586  	u32 s_ssid_tmp;
c8cb5b854b40f2 Tova Mussai 2020-09-18  587  	int n_coloc =3D 0, ret;
c8cb5b854b40f2 Tova Mussai 2020-09-18  588  	LIST_HEAD(ap_list);
c8cb5b854b40f2 Tova Mussai 2020-09-18  589  =

c8cb5b854b40f2 Tova Mussai 2020-09-18  590  	elem =3D cfg80211_find_elem(WL=
AN_EID_REDUCED_NEIGHBOR_REPORT, ies->data,
c8cb5b854b40f2 Tova Mussai 2020-09-18  591  				  ies->len);
8a16ffdc4cf37c Ilan Peer   2021-04-08  592  	if (!elem)
c8cb5b854b40f2 Tova Mussai 2020-09-18  593  		return 0;
c8cb5b854b40f2 Tova Mussai 2020-09-18  594  =

c8cb5b854b40f2 Tova Mussai 2020-09-18  595  	pos =3D elem->data;
c8cb5b854b40f2 Tova Mussai 2020-09-18  596  	end =3D pos + elem->datalen;
c8cb5b854b40f2 Tova Mussai 2020-09-18  597  =

c8cb5b854b40f2 Tova Mussai 2020-09-18  598  	ret =3D cfg80211_calc_short_ss=
id(ies, &ssid_elem, &s_ssid_tmp);
c8cb5b854b40f2 Tova Mussai 2020-09-18  599  	if (ret)
c8cb5b854b40f2 Tova Mussai 2020-09-18  600  		return ret;
c8cb5b854b40f2 Tova Mussai 2020-09-18  601  =

c8cb5b854b40f2 Tova Mussai 2020-09-18  602  	/* RNR IE may contain more tha=
n one NEIGHBOR_AP_INFO */
c8cb5b854b40f2 Tova Mussai 2020-09-18  603  	while (pos + sizeof(*ap_info) =
<=3D end) {
c8cb5b854b40f2 Tova Mussai 2020-09-18  604  		enum nl80211_band band;
c8cb5b854b40f2 Tova Mussai 2020-09-18  605  		int freq;
c8cb5b854b40f2 Tova Mussai 2020-09-18  606  		u8 length, i, count;
c8cb5b854b40f2 Tova Mussai 2020-09-18  607  =

c8cb5b854b40f2 Tova Mussai 2020-09-18  608  		ap_info =3D (void *)pos;
c8cb5b854b40f2 Tova Mussai 2020-09-18  609  		count =3D u8_get_bits(ap_info=
->tbtt_info_hdr,
c8cb5b854b40f2 Tova Mussai 2020-09-18  610  				    IEEE80211_AP_INFO_TBTT_=
HDR_COUNT) + 1;
c8cb5b854b40f2 Tova Mussai 2020-09-18  611  		length =3D ap_info->tbtt_info=
_len;
c8cb5b854b40f2 Tova Mussai 2020-09-18  612  =

c8cb5b854b40f2 Tova Mussai 2020-09-18  613  		pos +=3D sizeof(*ap_info);
c8cb5b854b40f2 Tova Mussai 2020-09-18  614  =

c8cb5b854b40f2 Tova Mussai 2020-09-18  615  		if (!ieee80211_operating_clas=
s_to_band(ap_info->op_class,
c8cb5b854b40f2 Tova Mussai 2020-09-18  616  						       &band))
c8cb5b854b40f2 Tova Mussai 2020-09-18  617  			break;
c8cb5b854b40f2 Tova Mussai 2020-09-18  618  =

c8cb5b854b40f2 Tova Mussai 2020-09-18  619  		freq =3D ieee80211_channel_to=
_frequency(ap_info->channel, band);
c8cb5b854b40f2 Tova Mussai 2020-09-18  620  =

c8cb5b854b40f2 Tova Mussai 2020-09-18  621  		if (end - pos < count * ap_in=
fo->tbtt_info_len)
c8cb5b854b40f2 Tova Mussai 2020-09-18  622  			break;
c8cb5b854b40f2 Tova Mussai 2020-09-18  623  =

c8cb5b854b40f2 Tova Mussai 2020-09-18  624  		/*
c8cb5b854b40f2 Tova Mussai 2020-09-18  625  		 * TBTT info must include bss=
 param + BSSID +
c8cb5b854b40f2 Tova Mussai 2020-09-18  626  		 * (short SSID or same_ssid b=
it to be set).
c8cb5b854b40f2 Tova Mussai 2020-09-18  627  		 * ignore other options, and =
move to the
c8cb5b854b40f2 Tova Mussai 2020-09-18  628  		 * next AP info
c8cb5b854b40f2 Tova Mussai 2020-09-18  629  		 */
c8cb5b854b40f2 Tova Mussai 2020-09-18  630  		if (band !=3D NL80211_BAND_6G=
HZ ||
c8cb5b854b40f2 Tova Mussai 2020-09-18  631  		    (length !=3D IEEE80211_TB=
TT_INFO_OFFSET_BSSID_BSS_PARAM &&
c8cb5b854b40f2 Tova Mussai 2020-09-18  632  		     length < IEEE80211_TBTT_=
INFO_OFFSET_BSSID_SSSID_BSS_PARAM)) {
c8cb5b854b40f2 Tova Mussai 2020-09-18  633  			pos +=3D count * ap_info->tb=
tt_info_len;
c8cb5b854b40f2 Tova Mussai 2020-09-18  634  			continue;
c8cb5b854b40f2 Tova Mussai 2020-09-18  635  		}
c8cb5b854b40f2 Tova Mussai 2020-09-18  636  =

c8cb5b854b40f2 Tova Mussai 2020-09-18  637  		for (i =3D 0; i < count; i++)=
 {
c8cb5b854b40f2 Tova Mussai 2020-09-18  638  			struct cfg80211_colocated_ap=
 *entry;
c8cb5b854b40f2 Tova Mussai 2020-09-18  639  =

c8cb5b854b40f2 Tova Mussai 2020-09-18  640  			entry =3D kzalloc(sizeof(*en=
try) + IEEE80211_MAX_SSID_LEN,
c8cb5b854b40f2 Tova Mussai 2020-09-18  641  					GFP_ATOMIC);
c8cb5b854b40f2 Tova Mussai 2020-09-18  642  =

c8cb5b854b40f2 Tova Mussai 2020-09-18  643  			if (!entry)
c8cb5b854b40f2 Tova Mussai 2020-09-18  644  				break;
c8cb5b854b40f2 Tova Mussai 2020-09-18  645  =

c8cb5b854b40f2 Tova Mussai 2020-09-18  646  			entry->center_freq =3D freq;
c8cb5b854b40f2 Tova Mussai 2020-09-18  647  =

c8cb5b854b40f2 Tova Mussai 2020-09-18  648  			if (!cfg80211_parse_ap_info(=
entry, pos, length,
c8cb5b854b40f2 Tova Mussai 2020-09-18  649  						    ssid_elem, s_ssid_tmp=
)) {
c8cb5b854b40f2 Tova Mussai 2020-09-18  650  				n_coloc++;
c8cb5b854b40f2 Tova Mussai 2020-09-18  651  				list_add_tail(&entry->list,=
 &ap_list);
c8cb5b854b40f2 Tova Mussai 2020-09-18  652  			} else {
c8cb5b854b40f2 Tova Mussai 2020-09-18  653  				kfree(entry);
c8cb5b854b40f2 Tova Mussai 2020-09-18  654  			}
c8cb5b854b40f2 Tova Mussai 2020-09-18  655  =

c8cb5b854b40f2 Tova Mussai 2020-09-18  656  			pos +=3D ap_info->tbtt_info_=
len;
c8cb5b854b40f2 Tova Mussai 2020-09-18  657  		}
c8cb5b854b40f2 Tova Mussai 2020-09-18  658  	}
c8cb5b854b40f2 Tova Mussai 2020-09-18  659  =

c8cb5b854b40f2 Tova Mussai 2020-09-18  660  	if (pos !=3D end) {
c8cb5b854b40f2 Tova Mussai 2020-09-18  661  		cfg80211_free_coloc_ap_list(&=
ap_list);
c8cb5b854b40f2 Tova Mussai 2020-09-18  662  		return 0;
c8cb5b854b40f2 Tova Mussai 2020-09-18  663  	}
c8cb5b854b40f2 Tova Mussai 2020-09-18  664  =

c8cb5b854b40f2 Tova Mussai 2020-09-18  665  	list_splice_tail(&ap_list, lis=
t);
c8cb5b854b40f2 Tova Mussai 2020-09-18 @666  	return n_coloc;
c8cb5b854b40f2 Tova Mussai 2020-09-18  667  }
c8cb5b854b40f2 Tova Mussai 2020-09-18  668  =


:::::: The code at line 666 was first introduced by commit
:::::: c8cb5b854b40f2ce52ccd032fa19750f4181d5fc nl80211/cfg80211: support 6=
 GHz scanning

:::::: TO: Tova Mussai <tova.mussai@intel.com>
:::::: CC: Johannes Berg <johannes.berg@intel.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5805705343000809035==--

