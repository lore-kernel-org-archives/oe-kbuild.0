Content-Type: multipart/mixed; boundary="===============7405214736735543001=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [alobakin:ip_tunnel 7/12] include/linux/bitmap.h:266:24: warning: use of uninitialized value '((const long unsigned int *)p)[16]' [CWE-457]
Date: Mon, 29 Aug 2022 02:32:59 +0800
Message-ID: <202208290215.EQAmMSJG-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7405214736735543001==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check first_new_problem:=
 include/linux/bitmap.h:266:24: warning: use of uninitialized value '((cons=
t long unsigned int *)p)[16]' [CWE-457] [-Wanalyzer-use-of-uninitialized-va=
lue]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Alexander Lobakin <alexandr.lobakin@intel.com>

tree:   https://github.com/alobakin/linux ip_tunnel
head:   5d8054afed13f6faea01f1940458165a8868dded
commit: 8b558c42c5837bf174f1fd6416a013308162ac97 [7/12] ip_tunnel: convert =
__be16 tunnel flags to bitmaps
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm-randconfig-c002-20220828 (https://download.01.org/0day-ci/archi=
ve/20220829/202208290215.EQAmMSJG-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/alobakin/linux/commit/8b558c42c5837bf174f1fd64=
16a013308162ac97
        git remote add alobakin https://github.com/alobakin/linux
        git fetch --no-tags alobakin ip_tunnel
        git checkout 8b558c42c5837bf174f1fd6416a013308162ac97
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

gcc-analyzer warnings: (new ones prefixed by >>)
   In file included from include/linux/cpumask.h:12,
                    from include/linux/mm_types_task.h:14,
                    from include/linux/mm_types.h:5,
                    from include/linux/buildid.h:5,
                    from include/linux/module.h:14,
                    from net/ipv6/ip6_gre.c:11:
   In function 'bitmap_copy',
       inlined from 'ip6gre_tnl_copy_tnl_parm' at net/ipv6/ip6_gre.c:1221:2:
>> include/linux/bitmap.h:266:24: warning: use of uninitialized value '((co=
nst long unsigned int *)p)[16]' [CWE-457] [-Wanalyzer-use-of-uninitialized-=
value]
     266 |                 *dst =3D *src;
         |                        ^~~~
     'ip6gre_changelink': events 1-3
       |
       |net/ipv6/ip6_gre.c:2080:12:
       | 2080 | static int ip6gre_changelink(struct net_device *dev, struct=
 nlattr *tb[],
       |      |            ^~~~~~~~~~~~~~~~~
       |      |            |
       |      |            (1) entry to 'ip6gre_changelink'
       |......
       | 2086 |         struct __ip6_tnl_parm p;
       |      |                               ~
       |      |                               |
       |      |                               (2) region created on stack h=
ere
       | 2087 | =

       | 2088 |         t =3D ip6gre_changelink_common(dev, tb, data, &p, e=
xtack);
       |      |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
       |      |             |
       |      |             (3) calling 'ip6gre_changelink_common' from 'ip=
6gre_changelink'
       |
       +--> 'ip6gre_changelink_common': events 4-10
              |
              | 2047 | ip6gre_changelink_common(struct net_device *dev, str=
uct nlattr *tb[],
              |      | ^~~~~~~~~~~~~~~~~~~~~~~~
              |      | |
              |      | (4) entry to 'ip6gre_changelink_common'
              |......
              | 2056 |         if (dev =3D=3D ign->fb_tunnel_dev)
              |      |            ~
              |      |            |
              |      |            (5) following 'false' branch...
              |......
              | 2059 |         if (ip6gre_netlink_encap_parms(data, &ipenca=
p)) {
              |      |         ~~ ~
              |      |         |  |
              |      |         |  (7) following 'true' branch...
              |      |         (6) ...to here
              | 2060 |                 int err =3D ip6_tnl_encap_setup(nt, =
&ipencap);
              |      |                 ~~~
              |      |                 |
              |      |                 (8) ...to here
              | 2061 | =

              | 2062 |                 if (err < 0)
              |      |                    ~
              |      |                    |
              |      |                    (9) following 'true' branch (when=
 'err < 0')...
              | 2063 |                         return ERR_PTR(err);
              |      |                         ~~~~~~
              |      |                         |
              |      |                         (10) ...to here
              |
       <------+
       |
     'ip6gre_changelink': events 11-14
       |
       | 2088 |         t =3D ip6gre_changelink_common(dev, tb, data, &p, e=
xtack);
       |      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
       |      |             |
       |      |             (11) returning to 'ip6gre_changelink' from 'ip6=
gre_changelink_common'
       | 2089 |         if (IS_ERR(t))
       |      |            ~ =

       |      |            |
       |      |            (12) following 'false' branch...
       |......
       | 2092 |         ip6gre_tunnel_unlink_md(ign, t);
       |      |         ~~~~~~~~~~~~~~~~~~~~~~~
       |      |         |
       |      |         (13) ...to here
       | 2093 |         ip6gre_tunnel_unlink(ign, t);
       |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |         |
       |      |         (14) calling 'ip6gre_tunnel_unlink' from 'ip6gre_ch=
angelink'
       |
       +--> 'ip6gre_tunnel_unlink': events 15-16
              |
              |  295 |         return __ip6gre_bucket(ign, &t->parms);
              |      |                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |                |
              |      |                (16) calling '__ip6gre_bucket' from '=
ip6gre_tunnel_unlink'
              |......
              |  306 | static void ip6gre_tunnel_unlink(struct ip6gre_net *=
ign, struct ip6_tnl *t)
              |      |             ^~~~~~~~~~~~~~~~~~~~
              |      |             |
              |      |             (15) entry to 'ip6gre_tunnel_unlink'
              |
              +--> '__ip6gre_bucket': events 17-19
                     |
                     |  249 | static struct ip6_tnl __rcu **__ip6gre_bucket=
(struct ip6gre_net *ign,
                     |      |                               ^~~~~~~~~~~~~~~
                     |      |                               |
                     |      |                               (17) entry to '=
__ip6gre_bucket'
                     |......
                     |  257 |         if (!ipv6_addr_any(local))
                     |      |            ~                   =

                     |      |            |
                     |      |            (18) following 'false' branch...
                     |  258 |                 prio |=3D 1;
                     |  259 |         if (!ipv6_addr_any(remote) && !ipv6_a=
ddr_is_multicast(remote)) {
                     |      |         ~~                     =

                     |      |         |

vim +266 include/linux/bitmap.h

^1da177e4c3f41 Linus Torvalds    2005-04-16  259  =

^1da177e4c3f41 Linus Torvalds    2005-04-16  260  static inline void bitmap=
_copy(unsigned long *dst, const unsigned long *src,
8b4daad52fee77 Rasmus Villemoes  2015-02-12  261  			unsigned int nbits)
^1da177e4c3f41 Linus Torvalds    2005-04-16  262  {
8b4daad52fee77 Rasmus Villemoes  2015-02-12  263  	unsigned int len =3D BIT=
S_TO_LONGS(nbits) * sizeof(unsigned long);
3e7e5baaaba780 Alexander Lobakin 2022-06-24  264  =

3e7e5baaaba780 Alexander Lobakin 2022-06-24  265  	if (small_const_nbits(nb=
its))
3e7e5baaaba780 Alexander Lobakin 2022-06-24 @266  		*dst =3D *src;
3e7e5baaaba780 Alexander Lobakin 2022-06-24  267  	else
^1da177e4c3f41 Linus Torvalds    2005-04-16  268  		memcpy(dst, src, len);
^1da177e4c3f41 Linus Torvalds    2005-04-16  269  }
^1da177e4c3f41 Linus Torvalds    2005-04-16  270  =


:::::: The code at line 266 was first introduced by commit
:::::: 3e7e5baaaba78075a7f3a57432609e363bf2a486 bitmap: don't assume compil=
er evaluates small mem*() builtins calls

:::::: TO: Alexander Lobakin <alexandr.lobakin@intel.com>
:::::: CC: Yury Norov <yury.norov@gmail.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7405214736735543001==--

