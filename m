Content-Type: multipart/mixed; boundary="===============6088128731316865134=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH net-next v3 2/3] net/macsec: Add MACsec skb extension Rx Data path support
Date: Wed, 15 Jun 2022 21:16:52 +0800
Message-ID: <202206152156.8ckKlv4A-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6088128731316865134==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: net/core/=
gro.c:417:77: warning: dereference of NULL 'macsec_p_ext' [CWE-476] [-Wanal=
yzer-null-dereference]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220613111942.12726-3-liorna@nvidia.com>
References: <20220613111942.12726-3-liorna@nvidia.com>
TO: Lior Nahmanson <liorna@nvidia.com>
TO: edumazet(a)google.com
TO: kuba(a)kernel.org
TO: pabeni(a)redhat.com
CC: davem(a)davemloft.net
CC: netdev(a)vger.kernel.org
CC: Lior Nahmanson <liorna@nvidia.com>
CC: Raed Salem <raeds@nvidia.com>
CC: Jiri Pirko <jiri@nvidia.com>
CC: "Ben Ben-Ishay" <benishay@nvidia.com>

Hi Lior,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on net-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Lior-Nahmanson/Intro=
duce-MACsec-offload-SKB-extension/20220613-211703
base:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git =
5f30671d8dc6b7a489435ce8c40a2036e3c16d04
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-c001-20220613 (https://download.01.org/0day-ci/ar=
chive/20220615/202206152156.8ckKlv4A-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/9ee59a567b790747e39=
e7cdd959991b4d994fc52
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Lior-Nahmanson/Introduce-MACsec-of=
fload-SKB-extension/20220613-211703
        git checkout 9ee59a567b790747e39e7cdd959991b4d994fc52
        # save the config file
         ARCH=3Dx86_64 KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


gcc-analyzer warnings: (new ones prefixed by >>)
              |  487 | static enum gro_result dev_gro_receive(struct napi_s=
truct *napi, struct sk_buff *skb)
              |      |                        ^~~~~~~~~~~~~~~
              |      |                        |
              |      |                        (12) entry to 'dev_gro_receiv=
e'
              |
            'dev_gro_receive': event 13
              |
              |include/linux/netdevice.h:2340:12:
              | 2340 |         if (!(dev->features & NETIF_F_GRO) || dev->x=
dp_prog)
              |      |            ^
              |      |            |
              |      |            (13) following 'false' branch...
              |
            'dev_gro_receive': event 14
              |
              |net/core/gro.c:502:26:
              |  502 |         gro_list_prepare(&gro_list->list, skb);
              |      |                          ^~~~~~~~~~~~~~~
              |      |                          |
              |      |                          (14) ...to here
              |
            'dev_gro_receive': event 15
              |
              |include/linux/rculist.h:392:30:
              |  392 |                 &pos->member !=3D (head);           =
                      \
              |      |                 ~~~~~~~~~~~~~^~~~~~~~~
              |      |                              |
              |      |                              (15) following 'true' b=
ranch...
   net/core/gro.c:505:9: note: in expansion of macro 'list_for_each_entry_r=
cu'
              |  505 |         list_for_each_entry_rcu(ptype, head, list) {
              |      |         ^~~~~~~~~~~~~~~~~~~~~~~
              |
            'dev_gro_receive': events 16-19
              |
              |  506 |                 if (ptype->type !=3D type || !ptype-=
>callbacks.gro_receive)
              |      |                     ~~~~~^~~~~~
              |      |                          |
              |      |                          (16) ...to here
              |......
              |  536 |         if (&ptype->list =3D=3D head)
              |      |            ~              =

              |      |            |
              |      |            (17) following 'false' branch...
              |......
              |  539 |         if (PTR_ERR(pp) =3D=3D -EINPROGRESS) {
              |      |            ~              =

              |      |            |
              |      |            (18) ...to here
              |      |            (19) following 'false' branch (when 'pp !=
=3D 18446744073709551501')...
              |
            'dev_gro_receive': events 20-23
              |
              |  544 |         same_flow =3D NAPI_GRO_CB(skb)->same_flow;
              |......
              |  547 |         if (pp) {
              |      |            ~                         =

              |      |            |
              |      |            (21) following 'false' branch (when 'pp' =
is NULL)...
              |......
              |  553 |         if (same_flow)
              |      |            ~                         =

              |      |            |
              |      |            (22) ...to here
              |      |            (23) following 'false' branch...
              |
            'dev_gro_receive': events 24-25
              |
              |  556 |         if (NAPI_GRO_CB(skb)->flush)
              |      |            ~                 =

              |      |            |
              |      |            (25) following 'false' branch...
              |
            'dev_gro_receive': event 26
              |
              |  559 |         if (unlikely(gro_list->count >=3D MAX_GRO_SK=
BS))
              |      |                      ~~~~~~~~^~~~~~~
              |      |                              |
              |      |                              (26) ...to here
   include/linux/compiler.h:78:45: note: in definition of macro 'unlikely'
              |   78 | # define unlikely(x)    __builtin_expect(!!(x), 0)
              |      |                                             ^
              |
            'dev_gro_receive': event 27
              |
              |net/core/gro.c:566:32:
              |  566 |         NAPI_GRO_CB(skb)->last =3D skb;
              |
            'dev_gro_receive': event 28
              |
              |  566 |         NAPI_GRO_CB(skb)->last =3D skb;
              |
            'dev_gro_receive': event 29
              |
              |include/net/gro.h:128:19:
              |  128 |         return skb->len - NAPI_GRO_CB(skb)->data_off=
set;
              |      |                ~~~^~~~~
              |      |                   |
              |      |                   (29) dereference of NULL 'skb'
              |
   include/linux/skbuff.h: In function 'gro_list_prepare':
>> net/core/gro.c:417:77: warning: dereference of NULL 'macsec_p_ext' [CWE-=
476] [-Wanalyzer-null-dereference]
     417 |                                 diffs |=3D (__force unsigned lon=
g)macsec_p_ext->sci ^
         |                                                                 =
~~~~~~~~~~~~^~~~~
     'napi_gro_frags': events 1-2
       |
       |  773 | gro_result_t napi_gro_frags(struct napi_struct *napi)
       |      |              ^~~~~~~~~~~~~~
       |      |              |
       |      |              (1) entry to 'napi_gro_frags'
       |......
       |  776 |         struct sk_buff *skb =3D napi_frags_skb(napi);
       |      |                               ~~~~~~~~~~~~~~~~~~~~
       |      |                               |
       |      |                               (2) calling 'napi_frags_skb' =
from 'napi_gro_frags'
       |
       +--> 'napi_frags_skb': events 3-6
              |
              |  736 | static struct sk_buff *napi_frags_skb(struct napi_st=
ruct *napi)
              |      |                        ^~~~~~~~~~~~~~
              |      |                        |
              |      |                        (3) entry to 'napi_frags_skb'
              |......
              |  747 |         if (unlikely(skb_gro_header_hard(skb, hlen))=
) {
              |      |            ~            =

              |      |            |
              |      |            (4) following 'true' branch...
              |  748 |                 eth =3D skb_gro_header_slow(skb, hle=
n, 0);
              |      |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
              |      |                       |
              |      |                       (5) ...to here
              |  749 |                 if (unlikely(!eth)) {
              |      |                    ~    =

              |      |                    |
              |      |                    (6) following 'true' branch...
              |
            'napi_frags_skb': event 7
              |
              |include/linux/net.h:265:13:
              |  265 |         if (net_ratelimit())                        =
            \
              |      |             ^~~~~~~~~~~~~~~
              |      |             |
              |      |             (7) ...to here
   include/linux/net.h:280:9: note: in expansion of macro 'net_ratelimited_=
function'
              |  280 |         net_ratelimited_function(pr_warn, fmt, ##__V=
A_ARGS__)
              |      |         ^~~~~~~~~~~~~~~~~~~~~~~~
   net/core/gro.c:750:25: note: in expansion of macro 'net_warn_ratelimited'
              |  750 |                         net_warn_ratelimited("%s: dr=
opping impossible skb from %s\n",
              |      |                         ^~~~~~~~~~~~~~~~~~~~
              |
       <------+
       |
     'napi_gro_frags': events 8-9
       |
       |  776 |         struct sk_buff *skb =3D napi_frags_skb(napi);
       |      |                               ^~~~~~~~~~~~~~~~~~~~
       |      |                               |
       |      |                               (8) returning to 'napi_gro_fr=
ags' from 'napi_frags_skb'
       |......
       |  780 |         ret =3D napi_frags_finish(napi, skb, dev_gro_receiv=
e(napi, skb));
       |      |               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~
       |      |               |
       |      |               (9) calling 'dev_gro_receive' from 'napi_gro_=
frags'
       |
       +--> 'dev_gro_receive': event 10
              |
              |  487 | static enum gro_result dev_gro_receive(struct napi_s=
truct *napi, struct sk_buff *skb)
              |      |                        ^~~~~~~~~~~~~~~
              |      |                        |
              |      |                        (10) entry to 'dev_gro_receiv=
e'
              |
            'dev_gro_receive': event 11
              |
              |include/linux/netdevice.h:2340:12:
              | 2340 |         if (!(dev->features & NETIF_F_GRO) || dev->x=
dp_prog)
              |      |            ^
              |      |            |
              |      |            (11) following 'false' branch...
              |
            'dev_gro_receive': events 12-13
              |
              |net/core/gro.c:502:26:
              |  502 |         gro_list_prepare(&gro_list->list, skb);
              |      |         ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~
              |      |         |                |
              |      |         |                (12) ...to here
              |      |         (13) calling 'gro_list_prepare' from 'dev_gr=
o_receive'
              |
              +--> 'gro_list_prepare': event 14
                     |
                     |  354 | static void gro_list_prepare(const struct lis=
t_head *head,
                     |      |             ^~~~~~~~~~~~~~~~
                     |      |             |
                     |      |             (14) entry to 'gro_list_prepare'
                     |
                   'gro_list_prepare': event 15
                     |
                     |include/linux/list.h:675:14:
                     |  675 |              !list_entry_is_head(pos, head, m=
ember);                    \
                     |      |              ^
                     |      |              |
                     |      |              (15) following 'true' branch...

vim +/macsec_p_ext +417 net/core/gro.c

587652bbdd06ab Eric Dumazet   2021-11-15  398  =

587652bbdd06ab Eric Dumazet   2021-11-15  399  			diffs |=3D p->sk !=3D skb=
->sk;
587652bbdd06ab Eric Dumazet   2021-11-15  400  			diffs |=3D skb_metadata_d=
st_cmp(p, skb);
587652bbdd06ab Eric Dumazet   2021-11-15  401  			diffs |=3D skb_get_nfct(p=
) ^ skb_get_nfct(skb);
587652bbdd06ab Eric Dumazet   2021-11-15  402  =

587652bbdd06ab Eric Dumazet   2021-11-15  403  #if IS_ENABLED(CONFIG_SKB_EX=
TENSIONS) && IS_ENABLED(CONFIG_NET_TC_SKB_EXT)
587652bbdd06ab Eric Dumazet   2021-11-15  404  			skb_ext =3D skb_ext_find(=
skb, TC_SKB_EXT);
587652bbdd06ab Eric Dumazet   2021-11-15  405  			p_ext =3D skb_ext_find(p,=
 TC_SKB_EXT);
587652bbdd06ab Eric Dumazet   2021-11-15  406  =

587652bbdd06ab Eric Dumazet   2021-11-15  407  			diffs |=3D (!!p_ext) ^ (!=
!skb_ext);
587652bbdd06ab Eric Dumazet   2021-11-15  408  			if (!diffs && unlikely(sk=
b_ext))
587652bbdd06ab Eric Dumazet   2021-11-15  409  				diffs |=3D p_ext->chain =
^ skb_ext->chain;
9ee59a567b7907 Lior Nahmanson 2022-06-13  410  #endif
9ee59a567b7907 Lior Nahmanson 2022-06-13  411  #if IS_ENABLED(CONFIG_SKB_EX=
TENSIONS) && IS_ENABLED(CONFIG_MACSEC)
9ee59a567b7907 Lior Nahmanson 2022-06-13  412  			macsec_skb_ext =3D skb_ex=
t_find(skb, SKB_EXT_MACSEC);
9ee59a567b7907 Lior Nahmanson 2022-06-13  413  			macsec_p_ext =3D skb_ext_=
find(p, SKB_EXT_MACSEC);
9ee59a567b7907 Lior Nahmanson 2022-06-13  414  =

9ee59a567b7907 Lior Nahmanson 2022-06-13  415  			diffs |=3D (!!macsec_p_ex=
t) ^ (!!macsec_skb_ext);
9ee59a567b7907 Lior Nahmanson 2022-06-13  416  			if (!diffs && unlikely(ma=
csec_skb_ext)) {
9ee59a567b7907 Lior Nahmanson 2022-06-13 @417  				diffs |=3D (__force unsi=
gned long)macsec_p_ext->sci ^
9ee59a567b7907 Lior Nahmanson 2022-06-13  418  					 (__force unsigned long=
)macsec_skb_ext->sci;
9ee59a567b7907 Lior Nahmanson 2022-06-13  419  				diffs |=3D macsec_p_ext-=
>offloaded ^ macsec_skb_ext->offloaded;
9ee59a567b7907 Lior Nahmanson 2022-06-13  420  			}
587652bbdd06ab Eric Dumazet   2021-11-15  421  #endif
587652bbdd06ab Eric Dumazet   2021-11-15  422  		}
587652bbdd06ab Eric Dumazet   2021-11-15  423  =

587652bbdd06ab Eric Dumazet   2021-11-15  424  		NAPI_GRO_CB(p)->same_flow =
=3D !diffs;
587652bbdd06ab Eric Dumazet   2021-11-15  425  	}
587652bbdd06ab Eric Dumazet   2021-11-15  426  }
587652bbdd06ab Eric Dumazet   2021-11-15  427  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6088128731316865134==--

