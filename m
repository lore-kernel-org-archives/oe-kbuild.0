Content-Type: multipart/mixed; boundary="===============4620288339562545919=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ceph-client:testing 18/67] net/ceph/osd_client.c:5699:24: warning: use of uninitialized value '<unknown>' [CWE-457]
Date: Wed, 27 Jul 2022 07:12:49 +0800
Message-ID: <202207270726.bbguNuKp-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4620288339562545919==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: net/ceph/=
osd_client.c:5699:24: warning: use of uninitialized value '<unknown>' [CWE-=
457] [-Wanalyzer-use-of-uninitialized-value]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: ceph-devel(a)vger.kernel.org
TO: Jeff Layton <jlayton@kernel.org>
CC: Ilya Dryomov <idryomov@gmail.com>
CC: Xiubo Li <xiubli@redhat.com>

tree:   https://github.com/ceph/ceph-client.git testing
head:   c8fb2aaa47a2883ead086cd33568fe3471b82bfd
commit: 6c1f9bcd67d0d2319684e93310f3388030ef47ca [18/67] libceph: add spars=
e read support to OSD client
:::::: branch date: 15 hours ago
:::::: commit date: 13 days ago
config: arm-randconfig-c002-20220724 (https://download.01.org/0day-ci/archi=
ve/20220727/202207270726.bbguNuKp-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/ceph/ceph-client/commit/6c1f9bcd67d0d2319684e9=
3310f3388030ef47ca
        git remote add ceph-client https://github.com/ceph/ceph-client.git
        git fetch --no-tags ceph-client testing
        git checkout 6c1f9bcd67d0d2319684e93310f3388030ef47ca
        # save the config file
         ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

gcc-analyzer warnings: (new ones prefixed by >>)
   In function 'osd_sparse_read':
   cc1: warning: use of uninitialized value '<unknown>' [CWE-457] [-Wanalyz=
er-use-of-uninitialized-value]
     'osd_sparse_read': event 1
       |
       |net/ceph/osd_client.c:5812:9:
       | 5812 |         switch (sr->sr_state) {
       |      |         ^~~~~~
       |      |         |
       |      |         (1) following 'default:' branch...
       |
     'osd_sparse_read': event 2
       |
       |cc1:
       | (2): ...to here
       |
     'osd_sparse_read': event 3
       |
       |cc1:
       | (3): use of uninitialized value '=1B[01m=1B[K<unknown>=1B[m=1B[K' =
here
       |
   net/ceph/osd_client.c: In function 'advance_cursor':
>> net/ceph/osd_client.c:5699:24: warning: use of uninitialized value '<unk=
nown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
    5699 |                 size_t poff, plen;
         |                        ^~~~
     'advance_cursor': events 1-3
       |
       | 5697 |         while (len) {
       |      |                ^~~
       |      |                |
       |      |                (1) following 'true' branch (when 'len !=3D =
0')...
       | 5698 |                 struct page *page;
       | 5699 |                 size_t poff, plen;
       |      |                        ~~~~
       |      |                        |
       |      |                        (2) ...to here
       |      |                        (3) use of uninitialized value '<unk=
nown>' here
       |
   net/ceph/osd_client.c:5699:30: warning: use of uninitialized value '<unk=
nown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
    5699 |                 size_t poff, plen;
         |                              ^~~~
     'advance_cursor': events 1-3
       |
       | 5697 |         while (len) {
       |      |                ^~~
       |      |                |
       |      |                (1) following 'true' branch (when 'len !=3D =
0')...
       | 5698 |                 struct page *page;
       | 5699 |                 size_t poff, plen;
       |      |                        ~~~~  ~~~~
       |      |                        |     |
       |      |                        |     (3) use of uninitialized value=
 '<unknown>' here
       |      |                        (2) ...to here
       |

vim +5699 net/ceph/osd_client.c

33d07337962c7bb Yan, Zheng  2014-11-04  5694  =

6c1f9bcd67d0d23 Jeff Layton 2022-02-11  5695  static void advance_cursor(st=
ruct ceph_msg_data_cursor *cursor, size_t len, bool zero)
6c1f9bcd67d0d23 Jeff Layton 2022-02-11  5696  {
6c1f9bcd67d0d23 Jeff Layton 2022-02-11  5697  	while (len) {
6c1f9bcd67d0d23 Jeff Layton 2022-02-11  5698  		struct page *page;
6c1f9bcd67d0d23 Jeff Layton 2022-02-11 @5699  		size_t poff, plen;
6c1f9bcd67d0d23 Jeff Layton 2022-02-11  5700  =

6c1f9bcd67d0d23 Jeff Layton 2022-02-11  5701  		page =3D ceph_msg_data_next=
(cursor, &poff, &plen);
6c1f9bcd67d0d23 Jeff Layton 2022-02-11  5702  		if (plen > len)
6c1f9bcd67d0d23 Jeff Layton 2022-02-11  5703  			plen =3D len;
6c1f9bcd67d0d23 Jeff Layton 2022-02-11  5704  		if (zero)
6c1f9bcd67d0d23 Jeff Layton 2022-02-11  5705  			zero_user_segment(page, po=
ff, poff + plen);
6c1f9bcd67d0d23 Jeff Layton 2022-02-11  5706  		len -=3D plen;
6c1f9bcd67d0d23 Jeff Layton 2022-02-11  5707  		ceph_msg_data_advance(curso=
r, plen);
6c1f9bcd67d0d23 Jeff Layton 2022-02-11  5708  	}
6c1f9bcd67d0d23 Jeff Layton 2022-02-11  5709  }
6c1f9bcd67d0d23 Jeff Layton 2022-02-11  5710  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4620288339562545919==--

