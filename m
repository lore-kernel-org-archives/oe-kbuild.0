Content-Type: multipart/mixed; boundary="===============2891361884091018779=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: net/mctp/test/route-test.c:296:24: warning: use of uninitialized value '<unknown>' [CWE-457]
Date: Sun, 21 Aug 2022 19:58:55 +0800
Message-ID: <202208211931.8afMVuSF-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2891361884091018779==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: net/mctp/=
test/route-test.c:296:24: warning: use of uninitialized value '<unknown>' [=
CWE-457] [-Wanalyzer-use-of-uninitialized-value]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Jeremy Kerr <jk@codeconstruct.com.au>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   15b3f48a4339e3c16acf18624e2b7f60bc5e9a2c
commit: 8892c0490779d6de921eb684e5504708fdbbcb68 mctp: Add route input to s=
ocket tests
date:   11 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 11 months ago
config: arm-randconfig-c002-20220820 (https://download.01.org/0day-ci/archi=
ve/20220821/202208211931.8afMVuSF-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D8892c0490779d6de921eb684e5504708fdbbcb68
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 8892c0490779d6de921eb684e5504708fdbbcb68
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

gcc-analyzer warnings: (new ones prefixed by >>)
              |      |         ~~~~~~~~~~~~~~~
              |      |         |
              |      |         (22) calling 'skb_orphan' from 'mctp_route_i=
nput'
              |
              +--> 'skb_orphan': events 23-25
                     |
                     |include/linux/skbuff.h:2781:20:
                     | 2781 | static inline void skb_orphan(struct sk_buff =
*skb)
                     |      |                    ^~~~~~~~~~
                     |      |                    |
                     |      |                    (23) entry to 'skb_orphan'
                     | 2782 | {
                     | 2783 |         if (skb->destructor) {
                     |      |            ~        =

                     |      |            |
                     |      |            (24) following 'true' branch...
                     | 2784 |                 skb->destructor(skb);
                     |      |                 ~~~~~~~~~~~~~~~~~~~~
                     |      |                 |
                     |      |                 (25) ...to here
                     |
              <------+
              |
            'mctp_route_input': events 26-27
              |
              |net/mctp/route.c:278:9:
              |  278 |         skb_orphan(skb);
              |      |         ^~~~~~~~~~~~~~~
              |      |         |
              |      |         (26) returning to 'mctp_route_input' from 's=
kb_orphan'
              |......
              |  281 |         if (skb->len < sizeof(struct mctp_hdr) + 1)
              |      |             ~~~~~~~~
              |      |                |
              |      |                (27) dereference of NULL 'skb'
              |
   net/mctp/route.c: In function 'mctp_newroute':
   net/mctp/route.c:1039:20: warning: use of uninitialized value '<unknown>=
' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
    1039 |         mctp_eid_t daddr_start;
         |                    ^~~~~~~~~~~
     'mctp_newroute': event 1
       |
       | 1039 |         mctp_eid_t daddr_start;
       |      |                    ^~~~~~~~~~~
       |      |                    |
       |      |                    (1) use of uninitialized value '<unknown=
>' here
       |
   net/mctp/route.c:1040:26: warning: use of uninitialized value '<unknown>=
' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
    1040 |         struct mctp_dev *mdev;
         |                          ^~~~
     'mctp_newroute': event 1
       |
       | 1040 |         struct mctp_dev *mdev;
       |      |                          ^~~~
       |      |                          |
       |      |                          (1) use of uninitialized value '<u=
nknown>' here
       |
   net/mctp/route.c:1041:23: warning: use of uninitialized value '<unknown>=
' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
    1041 |         struct rtmsg *rtm;
         |                       ^~~
     'mctp_newroute': event 1
       |
       | 1041 |         struct rtmsg *rtm;
       |      |                       ^~~
       |      |                       |
       |      |                       (1) use of uninitialized value '<unkn=
own>' here
       |
   net/mctp/route.c: In function 'mctp_delroute':
   net/mctp/route.c:1077:20: warning: use of uninitialized value '<unknown>=
' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
    1077 |         mctp_eid_t daddr_start;
         |                    ^~~~~~~~~~~
     'mctp_delroute': event 1
       |
       | 1077 |         mctp_eid_t daddr_start;
       |      |                    ^~~~~~~~~~~
       |      |                    |
       |      |                    (1) use of uninitialized value '<unknown=
>' here
       |
   net/mctp/route.c:1078:26: warning: use of uninitialized value '<unknown>=
' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
    1078 |         struct mctp_dev *mdev;
         |                          ^~~~
     'mctp_delroute': event 1
       |
       | 1078 |         struct mctp_dev *mdev;
       |      |                          ^~~~
       |      |                          |
       |      |                          (1) use of uninitialized value '<u=
nknown>' here
       |
   net/mctp/route.c:1079:23: warning: use of uninitialized value '<unknown>=
' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
    1079 |         struct rtmsg *rtm;
         |                       ^~~
     'mctp_delroute': event 1
       |
       | 1079 |         struct rtmsg *rtm;
       |      |                       ^~~
       |      |                       |
       |      |                       (1) use of uninitialized value '<unkn=
own>' here
       |
   In file included from net/mctp/route.c:1234:
   net/mctp/test/route-test.c: In function '__mctp_route_test_init':
>> net/mctp/test/route-test.c:296:24: warning: use of uninitialized value '=
<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     296 |         struct socket *sock;
         |                        ^~~~
     '__mctp_route_test_init': event 1
       |
       |  296 |         struct socket *sock;
       |      |                        ^~~~
       |      |                        |
       |      |                        (1) use of uninitialized value '<unk=
nown>' here
       |
   net/mctp/test/route-test.c: In function 'mctp_test_route_input_sk':
   net/mctp/test/route-test.c:340:33: warning: use of uninitialized value '=
<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     340 |         struct mctp_test_route *rt;
         |                                 ^~
     'mctp_test_route_input_sk': event 1
       |
       |  340 |         struct mctp_test_route *rt;
       |      |                                 ^~
       |      |                                 |
       |      |                                 (1) use of uninitialized va=
lue '<unknown>' here
       |
   net/mctp/test/route-test.c:341:31: warning: use of uninitialized value '=
<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     341 |         struct mctp_test_dev *dev;
         |                               ^~~
     'mctp_test_route_input_sk': event 1
       |
       |  341 |         struct mctp_test_dev *dev;
       |      |                               ^~~
       |      |                               |
       |      |                               (1) use of uninitialized valu=
e '<unknown>' here
       |
   net/mctp/test/route-test.c:342:24: warning: use of uninitialized value '=
<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     342 |         struct socket *sock;
         |                        ^~~~
     'mctp_test_route_input_sk': event 1
       |
       |  342 |         struct socket *sock;
       |      |                        ^~~~
       |      |                        |
       |      |                        (1) use of uninitialized value '<unk=
nown>' here
       |
   net/mctp/test/route-test.c:343:13: warning: use of uninitialized value '=
<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     343 |         int rc;
         |             ^~
     'mctp_test_route_input_sk': event 1
       |
       |  343 |         int rc;
       |      |             ^~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
       |
   In file included from net/mctp/test/route-test.c:3:
   include/kunit/test.h:866:22: warning: dereference of NULL 'skb' [CWE-476=
] [-Wanalyzer-null-dereference]
     866 |         typeof(left) __left =3D (left);                         =
                 \
         |                      ^~~~~~
   include/kunit/test.h:891:9: note: in expansion of macro 'KUNIT_BASE_BINA=
RY_ASSERTION'
     891 |         KUNIT_BASE_BINARY_ASSERTION(test,                       =
               \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:980:9: note: in expansion of macro 'KUNIT_BASE_EQ_M=
SG_ASSERTION'
     980 |         KUNIT_BASE_EQ_MSG_ASSERTION(test,                       =
               \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:990:9: note: in expansion of macro 'KUNIT_BINARY_EQ=
_MSG_ASSERTION'
     990 |         KUNIT_BINARY_EQ_MSG_ASSERTION(test,                     =
               \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1353:9: note: in expansion of macro 'KUNIT_BINARY_E=
Q_ASSERTION'
    1353 |         KUNIT_BINARY_EQ_ASSERTION(test, KUNIT_EXPECTATION, left,=
 right)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   net/mctp/test/route-test.c:362:17: note: in expansion of macro 'KUNIT_EX=
PECT_EQ'
     362 |                 KUNIT_EXPECT_EQ(test, skb->len, 1);
         |                 ^~~~~~~~~~~~~~~
     'mctp_test_route_input_sk': events 1-2
       |
       |  336 | static void mctp_test_route_input_sk(struct kunit *test)
       |      |             ^~~~~~~~~~~~~~~~~~~~~~~~
       |      |             |
       |      |             (1) entry to 'mctp_test_route_input_sk'
       |......
       |  347 |         __mctp_route_test_init(test, &dev, &rt, &sock);
       |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |         |
       |      |         (2) calling '__mctp_route_test_init' from 'mctp_tes=
t_route_input_sk'
       |
       +--> '__mctp_route_test_init': events 3-4
              |
              |  288 | static void __mctp_route_test_init(struct kunit *tes=
t,
              |      |             ^~~~~~~~~~~~~~~~~~~~~~
              |      |             |
              |      |             (3) entry to '__mctp_route_test_init'
              |......
              |  302 |         rt =3D mctp_test_create_route(&init_net, dev=
->mdev, 8, 68);
              |      |              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~
              |      |              |
              |      |              (4) calling 'mctp_test_create_route' fr=
om '__mctp_route_test_init'
              |
              +--> 'mctp_test_create_route': events 5-6
                     |
                     |   39 | static struct mctp_test_route *mctp_test_crea=
te_route(struct net *net,
                     |      |                                ^~~~~~~~~~~~~~=
~~~~~~~~
                     |      |                                |
                     |      |                                (5) entry to '=
mctp_test_create_route'
                     |......

vim +296 net/mctp/test/route-test.c

b504db408c34e0 Jeremy Kerr 2021-10-03  283  =

b504db408c34e0 Jeremy Kerr 2021-10-03  284  KUNIT_ARRAY_PARAM(mctp_rx_input=
, mctp_rx_input_tests,
b504db408c34e0 Jeremy Kerr 2021-10-03  285  		  mctp_rx_input_test_to_desc);
b504db408c34e0 Jeremy Kerr 2021-10-03  286  =

8892c0490779d6 Jeremy Kerr 2021-10-03  287  /* set up a local dev, route on=
 EID 8, and a socket listening on type 0 */
8892c0490779d6 Jeremy Kerr 2021-10-03  288  static void __mctp_route_test_i=
nit(struct kunit *test,
8892c0490779d6 Jeremy Kerr 2021-10-03  289  				   struct mctp_test_dev **d=
evp,
8892c0490779d6 Jeremy Kerr 2021-10-03  290  				   struct mctp_test_route *=
*rtp,
8892c0490779d6 Jeremy Kerr 2021-10-03  291  				   struct socket **sockp)
8892c0490779d6 Jeremy Kerr 2021-10-03  292  {
8892c0490779d6 Jeremy Kerr 2021-10-03  293  	struct sockaddr_mctp addr;
8892c0490779d6 Jeremy Kerr 2021-10-03  294  	struct mctp_test_route *rt;
8892c0490779d6 Jeremy Kerr 2021-10-03  295  	struct mctp_test_dev *dev;
8892c0490779d6 Jeremy Kerr 2021-10-03 @296  	struct socket *sock;
8892c0490779d6 Jeremy Kerr 2021-10-03  297  	int rc;
8892c0490779d6 Jeremy Kerr 2021-10-03  298  =

8892c0490779d6 Jeremy Kerr 2021-10-03  299  	dev =3D mctp_test_create_dev();
8892c0490779d6 Jeremy Kerr 2021-10-03  300  	KUNIT_ASSERT_NOT_ERR_OR_NULL(t=
est, dev);
8892c0490779d6 Jeremy Kerr 2021-10-03  301  =

8892c0490779d6 Jeremy Kerr 2021-10-03  302  	rt =3D mctp_test_create_route(=
&init_net, dev->mdev, 8, 68);
8892c0490779d6 Jeremy Kerr 2021-10-03  303  	KUNIT_ASSERT_NOT_ERR_OR_NULL(t=
est, rt);
8892c0490779d6 Jeremy Kerr 2021-10-03  304  =

8892c0490779d6 Jeremy Kerr 2021-10-03  305  	rc =3D sock_create_kern(&init_=
net, AF_MCTP, SOCK_DGRAM, 0, &sock);
8892c0490779d6 Jeremy Kerr 2021-10-03  306  	KUNIT_ASSERT_EQ(test, rc, 0);
8892c0490779d6 Jeremy Kerr 2021-10-03  307  =

8892c0490779d6 Jeremy Kerr 2021-10-03  308  	addr.smctp_family =3D AF_MCTP;
8892c0490779d6 Jeremy Kerr 2021-10-03  309  	addr.smctp_network =3D MCTP_NE=
T_ANY;
8892c0490779d6 Jeremy Kerr 2021-10-03  310  	addr.smctp_addr.s_addr =3D 8;
8892c0490779d6 Jeremy Kerr 2021-10-03  311  	addr.smctp_type =3D 0;
8892c0490779d6 Jeremy Kerr 2021-10-03  312  	rc =3D kernel_bind(sock, (stru=
ct sockaddr *)&addr, sizeof(addr));
8892c0490779d6 Jeremy Kerr 2021-10-03  313  	KUNIT_ASSERT_EQ(test, rc, 0);
8892c0490779d6 Jeremy Kerr 2021-10-03  314  =

8892c0490779d6 Jeremy Kerr 2021-10-03  315  	*rtp =3D rt;
8892c0490779d6 Jeremy Kerr 2021-10-03  316  	*devp =3D dev;
8892c0490779d6 Jeremy Kerr 2021-10-03  317  	*sockp =3D sock;
8892c0490779d6 Jeremy Kerr 2021-10-03  318  }
8892c0490779d6 Jeremy Kerr 2021-10-03  319  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2891361884091018779==--

