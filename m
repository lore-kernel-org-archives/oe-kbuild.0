Content-Type: multipart/mixed; boundary="===============6822849685242831045=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: net/openvswitch/flow.c:920:9: warning: Opposite inner 'if' condition leads to a dead code block. [oppositeInnerCondition]
Date: Sun, 08 May 2022 07:07:08 +0800
Message-ID: <202205080702.xBHdSI4a-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6822849685242831045==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Paul Blakey <paulb@nvidia.com>
CC: Jakub Kicinski <kuba@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   30c8e80f79329617012f07b09b70114592092ea4
commit: 6f022c2ddbcefaee79502ce5386dfe351d457070 net: openvswitch: Fix ct_s=
tate nat flags for conns arriving from tc
date:   4 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 4 months ago
compiler: sparc64-linux-gcc (GCC) 11.3.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 6f022c2ddbcefaee79502ce5386dfe351d457070
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> net/openvswitch/flow.c:920:9: warning: Opposite inner 'if' condition lea=
ds to a dead code block. [oppositeInnerCondition]
       if (!post_ct_dnat)
           ^
   net/openvswitch/flow.c:862:61: note: 'post_ct_dnat' is assigned value 'f=
alse' here.
    bool post_ct =3D false, post_ct_snat =3D false, post_ct_dnat =3D false;
                                                               ^
   net/openvswitch/flow.c:862:17: note: 'post_ct' is assigned value 'false'=
 here.
    bool post_ct =3D false, post_ct_snat =3D false, post_ct_dnat =3D false;
                   ^
   net/openvswitch/flow.c:916:7: note: outer condition: post_ct
     if (post_ct) {
         ^
   net/openvswitch/flow.c:920:9: note: opposite inner condition: !post_ct_d=
nat
       if (!post_ct_dnat)
           ^
   net/openvswitch/flow.c:922:9: warning: Opposite inner 'if' condition lea=
ds to a dead code block. [oppositeInnerCondition]
       if (!post_ct_snat)
           ^
   net/openvswitch/flow.c:862:39: note: 'post_ct_snat' is assigned value 'f=
alse' here.
    bool post_ct =3D false, post_ct_snat =3D false, post_ct_dnat =3D false;
                                         ^
   net/openvswitch/flow.c:862:17: note: 'post_ct' is assigned value 'false'=
 here.
    bool post_ct =3D false, post_ct_snat =3D false, post_ct_dnat =3D false;
                   ^
   net/openvswitch/flow.c:916:7: note: outer condition: post_ct
     if (post_ct) {
         ^
   net/openvswitch/flow.c:922:9: note: opposite inner condition: !post_ct_s=
nat
       if (!post_ct_snat)
           ^

vim +/if +920 net/openvswitch/flow.c

0714812134d7dc Jesse Gross     2014-10-03  912  =

9dd7f8907c3705 Jarno Rajahalme 2017-02-09  913  	err =3D key_extract(skb, k=
ey);
635d448a1cce4b Paul Blakey     2021-12-14  914  	if (!err) {
d29334c15d33a6 wenxu           2021-03-16  915  		ovs_ct_fill_key(skb, key,=
 post_ct);   /* Must be after key_extract(). */
6f022c2ddbcefa Paul Blakey     2022-01-06  916  		if (post_ct) {
6f022c2ddbcefa Paul Blakey     2022-01-06  917  			if (!skb_get_nfct(skb)) {
635d448a1cce4b Paul Blakey     2021-12-14  918  				key->ct_zone =3D zone;
6f022c2ddbcefa Paul Blakey     2022-01-06  919  			} else {
6f022c2ddbcefa Paul Blakey     2022-01-06 @920  				if (!post_ct_dnat)
6f022c2ddbcefa Paul Blakey     2022-01-06  921  					key->ct_state &=3D ~OV=
S_CS_F_DST_NAT;
6f022c2ddbcefa Paul Blakey     2022-01-06  922  				if (!post_ct_snat)
6f022c2ddbcefa Paul Blakey     2022-01-06  923  					key->ct_state &=3D ~OV=
S_CS_F_SRC_NAT;
6f022c2ddbcefa Paul Blakey     2022-01-06  924  			}
6f022c2ddbcefa Paul Blakey     2022-01-06  925  		}
635d448a1cce4b Paul Blakey     2021-12-14  926  	}
9dd7f8907c3705 Jarno Rajahalme 2017-02-09  927  	return err;
83c8df26a3b654 Pravin B Shelar 2014-09-15  928  }
83c8df26a3b654 Pravin B Shelar 2014-09-15  929  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6822849685242831045==--

