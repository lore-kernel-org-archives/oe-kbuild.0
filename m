Content-Type: multipart/mixed; boundary="===============4580111384841253874=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: include/linux/etherdevice.h:126:13: warning: dereference of NULL 'addr' [CWE-476]
Date: Tue, 14 Jun 2022 22:19:42 +0800
Message-ID: <202206142237.0z1ayZwd-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4580111384841253874==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check first_new_problem:=
 include/linux/etherdevice.h:126:13: warning: dereference of NULL 'addr' [C=
WE-476] [-Wanalyzer-null-dereference]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Nikolay Aleksandrov <razor@blackwall.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   b13baccc3850ca8b8cccbf8ed9912dbaa0fdf7f3
commit: 9e83425993f38bb89e0ea07849ba0039a748e85b net: rtnetlink: add NLM_F_=
BULK support to rtnl_fdb_del
date:   9 weeks ago
:::::: branch date: 2 days ago
:::::: commit date: 9 weeks ago
config: x86_64-randconfig-c001-20220613 (https://download.01.org/0day-ci/ar=
chive/20220614/202206142237.0z1ayZwd-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D9e83425993f38bb89e0ea07849ba0039a748e85b
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 9e83425993f38bb89e0ea07849ba0039a748e85b
        # save the config file
         ARCH=3Dx86_64 KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


gcc-analyzer warnings: (new ones prefixed by >>)
   In file included from include/linux/if_vlan.h:11,
                    from net/core/rtnetlink.c:36:
   net/core/rtnetlink.c: In function 'ndo_dflt_fdb_del':
>> include/linux/etherdevice.h:126:13: warning: dereference of NULL 'addr' =
[CWE-476] [-Wanalyzer-null-dereference]
     126 |         u32 a =3D *(const u32 *)addr;
         |             ^
     'rtnl_fdb_del': events 1-4
       |
       |net/core/rtnetlink.c:4177:12:
       | 4177 | static int rtnl_fdb_del(struct sk_buff *skb, struct nlmsghd=
r *nlh,
       |      |            ^~~~~~~~~~~~
       |      |            |
       |      |            (1) entry to 'rtnl_fdb_del'
       |......
       | 4190 |         if (!netlink_capable(skb, CAP_NET_ADMIN))
       |      |            ~
       |      |            |
       |      |            (2) following 'true' branch...
       |......
       | 4193 |         if (!del_bulk) {
       |      |            ~
       |      |            |
       |      |            (3) ...to here
       |......
       | 4200 |         if (err < 0)
       |      |            ~
       |      |            |
       |      |            (4) following 'false' branch (when 'err >=3D 0')=
...
       |
     'rtnl_fdb_del': event 5
       |
       |include/net/netlink.h:570:38:
       |  570 |         return (unsigned char *) nlh + NLMSG_HDRLEN;
       |
     'rtnl_fdb_del': events 6-22
       |
       |net/core/rtnetlink.c:4204:12:
       | 4204 |         if (ndm->ndm_ifindex =3D=3D 0) {
       |      |            ^
       |      |            |
       |      |            (6) following 'false' branch...
       |......
       | 4209 |         dev =3D __dev_get_by_index(net, ndm->ndm_ifindex);
       |      |               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |               |
       |      |               (7) ...to here
       | 4210 |         if (dev =3D=3D NULL) {
       |      |            ~
       |      |            |
       |      |            (8) following 'false' branch (when 'dev' is non-=
NULL)...
       |......
       | 4215 |         if (!del_bulk) {
       |      |            ~
       |      |            |
       |      |            (9) ...to here
       |      |            (10) following 'false' branch...
       |......
       | 4223 |         if (dev->type !=3D ARPHRD_ETHER) {
       |      |            ~~~~~~~~~~
       |      |            |   |
       |      |            |   (11) ...to here
       |      |            (12) following 'false' branch...
       |......
       | 4228 |         err =3D fdb_vid_parse(tb[NDA_VLAN], &vid, extack);
       |      |               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |               |
       |      |               (13) ...to here
       | 4229 |         if (err)
       |      |            ~
       |      |            |
       |      |            (14) following 'false' branch (when 'err =3D=3D =
0')...
       |......
       | 4235 |         if ((!ndm->ndm_flags || ndm->ndm_flags & NTF_MASTER=
) &&
       |      |               ~~~~~~~~~~~~~~
       |      |                  |
       |      |                  (15) ...to here
       |......
       | 4256 |         if (ndm->ndm_flags & NTF_SELF) {
       |      |            ~
       |      |            |
       |      |            (16) following 'true' branch...
       | 4257 |                 ops =3D dev->netdev_ops;
       |      |                 ~~~~~~~~~~~~~~~~~~~~~
       |      |                     |
       |      |                     (17) ...to here
       | 4258 |                 if (!del_bulk) {
       |      |                    ~
       |      |                    |
       |      |                    (18) following 'true' branch...
       | 4259 |                         if (ops->ndo_fdb_del)
       |      |                            ~~~~~~~~~~~~~~~~~
       |      |                            |   |
       |      |                            |   (19) ...to here
       |      |                            (20) following 'false' branch...
       |......
       | 4262 |                                 err =3D ndo_dflt_fdb_del(nd=
m, tb, dev, addr, vid);
       |      |                                       ~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~
       |      |                                       |
       |      |                                       (21) ...to here
       |      |                                       (22) calling 'ndo_dfl=
t_fdb_del' from 'rtnl_fdb_del'
       |
       +--> 'ndo_dflt_fdb_del': events 23-24
              |
              | 4148 | int ndo_dflt_fdb_del(struct ndmsg *ndm,

vim +/addr +126 include/linux/etherdevice.h

^1da177e4c3f41 Linus Torvalds    2005-04-16  115  =

79165121bc09c2 Michael Ellerman  2005-05-29  116  /**
c2da8acaf488b8 Stephen Hemminger 2005-11-01  117   * is_multicast_ether_add=
r - Determine if the Ethernet address is a multicast.
79165121bc09c2 Michael Ellerman  2005-05-29  118   * @addr: Pointer to a si=
x-byte array containing the Ethernet address
79165121bc09c2 Michael Ellerman  2005-05-29  119   *
79165121bc09c2 Michael Ellerman  2005-05-29  120   * Return true if the add=
ress is a multicast address.
88df8ef59a3eb5 Stephen Hemminger 2006-01-03  121   * By definition the broa=
dcast address is also a multicast address.
79165121bc09c2 Michael Ellerman  2005-05-29  122   */
b44907e64cc198 Joe Perches       2012-05-08  123  static inline bool is_mul=
ticast_ether_addr(const u8 *addr)
79165121bc09c2 Michael Ellerman  2005-05-29  124  {
d54385ce68cd18 Alexander Duyck   2015-04-30  125  #if defined(CONFIG_HAVE_E=
FFICIENT_UNALIGNED_ACCESS)
d54385ce68cd18 Alexander Duyck   2015-04-30 @126  	u32 a =3D *(const u32 *)=
addr;
d54385ce68cd18 Alexander Duyck   2015-04-30  127  #else
d54385ce68cd18 Alexander Duyck   2015-04-30  128  	u16 a =3D *(const u16 *)=
addr;
d54385ce68cd18 Alexander Duyck   2015-04-30  129  #endif
d54385ce68cd18 Alexander Duyck   2015-04-30  130  #ifdef __BIG_ENDIAN
d54385ce68cd18 Alexander Duyck   2015-04-30  131  	return 0x01 & (a >> ((si=
zeof(a) * 8) - 8));
d54385ce68cd18 Alexander Duyck   2015-04-30  132  #else
d54385ce68cd18 Alexander Duyck   2015-04-30  133  	return 0x01 & a;
d54385ce68cd18 Alexander Duyck   2015-04-30  134  #endif
d54385ce68cd18 Alexander Duyck   2015-04-30  135  }
d54385ce68cd18 Alexander Duyck   2015-04-30  136  =


:::::: The code at line 126 was first introduced by commit
:::::: d54385ce68cd18ab002b46f61246ad197cec92de etherdev: Process is_multic=
ast_ether_addr at same size as other operations

:::::: TO: Alexander Duyck <alexander.h.duyck@redhat.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4580111384841253874==--

