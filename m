Content-Type: multipart/mixed; boundary="===============6663405531572077434=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ammarfaizi2-block:dhowells/linux-fs/afs-fixes 1/2] fs/afs/cell.c:558:21: warning: use of uninitialized value '<unknown>' [CWE-457]
Date: Tue, 02 Aug 2022 21:12:09 +0800
Message-ID: <202208022156.z6cBojeL-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6663405531572077434==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: fs/afs/ce=
ll.c:558:21: warning: use of uninitialized value '<unknown>' [CWE-457] [-Wa=
nalyzer-use-of-uninitialized-value]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Ammar Faizi <ammarfaizi2@gnuweeb.org>
CC: "GNU/Weeb Mailing List" <gwml@vger.gnuweeb.org>
CC: linux-kernel(a)vger.kernel.org
TO: David Howells <dhowells@redhat.com>

tree:   https://github.com/ammarfaizi2/linux-block dhowells/linux-fs/afs-fi=
xes
head:   86015f6f89dee00e73161f59fba80c24c4a13aa8
commit: 9f2b4b411c331e699ce9fe3b762234e6415ceb09 [1/2] afs: Use refcount_t =
rather than atomic_t
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm-randconfig-c002-20220731 (https://download.01.org/0day-ci/archi=
ve/20220802/202208022156.z6cBojeL-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/ammarfaizi2/linux-block/commit/9f2b4b411c331e6=
99ce9fe3b762234e6415ceb09
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/lin=
ux-block
        git fetch --no-tags ammarfaizi2-block dhowells/linux-fs/afs-fixes
        git checkout 9f2b4b411c331e699ce9fe3b762234e6415ceb09
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

gcc-analyzer warnings: (new ones prefixed by >>)
   fs/afs/cell.c: In function 'afs_put_cell.part.0':
>> fs/afs/cell.c:558:21: warning: use of uninitialized value '<unknown>' [C=
WE-457] [-Wanalyzer-use-of-uninitialized-value]
     558 |                 int r;
         |                     ^
     'afs_put_cell.part.0': event 1
       |
       |  558 |                 int r;
       |      |                     ^
       |      |                     |
       |      |                     (1) use of uninitialized value '<unknow=
n>' here
       |
--
       |      |         |       |
       |      |         |       (14) calling 'afs_vl_lookup_addrs' from 'af=
s_lookup_server'
       |      |         (13) ...to here
       |
       +--> 'afs_vl_lookup_addrs': events 15-16
              |
              |  258 | static struct afs_addr_list *afs_vl_lookup_addrs(str=
uct afs_cell *cell,
              |      |                              ^~~~~~~~~~~~~~~~~~~
              |      |                              |
              |      |                              (15) entry to 'afs_vl_l=
ookup_addrs'
              |......
              |  266 |         if (afs_begin_vlserver_operation(&vc, cell, =
key)) {
              |      |            ~                  =

              |      |            |
              |      |            (16) following 'true' branch...
              |
            'afs_vl_lookup_addrs': event 17
              |
              |cc1:
              | (17): ...to here
              |
            'afs_vl_lookup_addrs': events 18-21
              |
              |  267 |                 while (afs_select_vlserver(&vc)) {
              |      |                        ^~~~~~~~~~~~~~~~~~~
              |      |                        |
              |      |                        (18) following 'false' branch=
...
              |......
              |  274 |                 ret =3D afs_end_vlserver_operation(&=
vc);
              |      |                 ~~~     =

              |      |                 |
              |      |                 (19) ...to here
              |......
              |  277 |         return ret < 0 ? ERR_PTR(ret) : alist;
              |      |                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |                                       |
              |      |                                       (20) following=
 'false' branch (when 'ret >=3D 0')...
              |      |                                       (21) ...to here
              |
       <------+
       |
     'afs_lookup_server': events 22-25
       |
       |  298 |         alist =3D afs_vl_lookup_addrs(cell, key, uuid);
       |      |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                 |
       |      |                 (22) returning to 'afs_lookup_server' from =
'afs_vl_lookup_addrs'
       |  299 |         if (IS_ERR(alist))
       |      |            ~     =

       |      |            |
       |      |            (23) following 'false' branch...
       |......
       |  302 |         candidate =3D afs_alloc_server(cell, uuid, alist);
       |      |         ~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |         |           |
       |      |         |           (25) calling 'afs_alloc_server' from 'a=
fs_lookup_server'
       |      |         (24) ...to here
       |
       +--> 'afs_alloc_server': events 26-28
              |
              |  218 | static struct afs_server *afs_alloc_server(struct af=
s_cell *cell,
              |      |                           ^~~~~~~~~~~~~~~~
              |      |                           |
              |      |                           (26) entry to 'afs_alloc_s=
erver'
              |......
              |  228 |         if (!server)
              |      |            ~               =

              |      |            |
              |      |            (27) following 'false' branch...
              |......
              |  231 |         refcount_set(&server->ref, 1);
              |      |         ~~~~~~~~~~~~       =

              |      |         |
              |      |         (28) ...to here
              |
            'afs_alloc_server': event 29
              |
              |include/asm-generic/rwonce.h:55:37:
              |   55 |         *(volatile typeof(x) *)&(x) =3D (val);      =
                      \
              |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
              |      |                                     |
              |      |                                     (29) 'alist' is =
NULL
   include/asm-generic/rwonce.h:61:9: note: in expansion of macro '__WRITE_=
ONCE'
              |   61 |         __WRITE_ONCE(x, val);                       =
                    \
              |      |         ^~~~~~~~~~~~
   include/linux/rcupdate.h:861:17: note: in expansion of macro 'WRITE_ONCE'
              |  861 |                 WRITE_ONCE(p, RCU_INITIALIZER(v)); \
              |      |                 ^~~~~~~~~~
   fs/afs/server.c:234:9: note: in expansion of macro 'RCU_INIT_POINTER'
              |  234 |         RCU_INIT_POINTER(server->addresses, alist);
              |      |         ^~~~~~~~~~~~~~~~
              |
            'afs_alloc_server': event 30
              |
              |  235 |         server->addr_version =3D alist->version;
              |      |                                ~~~~~^~~~~~~~~
              |      |                                     |
              |      |                                     (30) dereference=
 of NULL 'alist'
              |
   fs/afs/server.c: In function 'afs_maybe_use_server':
>> fs/afs/server.c:369:13: warning: use of uninitialized value '<unknown>' =
[CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     369 |         int r;
         |             ^
     'afs_maybe_use_server': event 1
       |
       |  369 |         int r;
       |      |             ^
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
       |
   fs/afs/server.c: In function 'afs_use_server':
   fs/afs/server.c:385:13: warning: use of uninitialized value '<unknown>' =
[CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     385 |         int r;
         |             ^
     'afs_use_server': event 1
       |
       |  385 |         int r;
       |      |             ^
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
       |
   fs/afs/server.c: In function 'afs_put_server':
   fs/afs/server.c:401:13: warning: use of uninitialized value '<unknown>' =
[CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     401 |         int r;
         |             ^
     'afs_put_server': event 1
       |
       |  401 |         int r;
       |      |             ^
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
       |
   fs/afs/server.c: In function 'afs_update_server_record':
   fs/afs/server.c:660:42: warning: dereference of NULL 'alist' [CWE-476] [=
-Wanalyzer-null-dereference]
     660 |         if (server->addr_version !=3D alist->version) {
         |                                     ~~~~~^~~~~~~~~
     'afs_update_server_record': events 1-2
       |
       |  634 | static noinline bool afs_update_server_record(struct afs_op=
eration *op,
       |      |                      ^~~~~~~~~~~~~~~~~~~~~~~~
       |      |                      |
       |      |                      (1) entry to 'afs_update_server_record'
       |......
       |  645 |         alist =3D afs_vl_lookup_addrs(op->volume->cell, op-=
>key, &server->uuid);
       |      |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~
       |      |                 |
       |      |                 (2) calling 'afs_vl_lookup_addrs' from 'afs=
_update_server_record'
       |
       +--> 'afs_vl_lookup_addrs': events 3-4
              |
              |  258 | static struct afs_addr_list *afs_vl_lookup_addrs(str=
uct afs_cell *cell,
              |      |                              ^~~~~~~~~~~~~~~~~~~
              |      |                              |
              |      |                              (3) entry to 'afs_vl_lo=
okup_addrs'
              |......
              |  266 |         if (afs_begin_vlserver_operation(&vc, cell, =
key)) {
              |      |            ~                  =

              |      |            |
              |      |            (4) following 'true' branch...
              |
            'afs_vl_lookup_addrs': event 5
              |
              |cc1:
              | (5): ...to here
              |
            'afs_vl_lookup_addrs': events 6-9
              |
              |  267 |                 while (afs_select_vlserver(&vc)) {
              |      |                        ^~~~~~~~~~~~~~~~~~~
              |      |                        |
              |      |                        (6) following 'false' branch.=
..
              |......
              |  274 |                 ret =3D afs_end_vlserver_operation(&=
vc);
              |      |                 ~~~     =

              |      |                 |
              |      |                 (7) ...to here
              |......
              |  277 |         return ret < 0 ? ERR_PTR(ret) : alist;
              |      |                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |                                       |
              |      |                                       (8) following =
'false' branch (when 'ret >=3D 0')...
              |      |                                       (9) ...to here
              |
       <------+
       |
     'afs_update_server_record': events 10-13
       |
       |  645 |         alist =3D afs_vl_lookup_addrs(op->volume->cell, op-=
>key, &server->uuid);
       |      |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~
       |      |                 |
       |      |                 (10) return of NULL to 'afs_update_server_r=
ecord' from 'afs_vl_lookup_addrs'
       |  646 |         if (IS_ERR(alist)) {
       |      |            ~     =

       |      |            |
       |      |            (11) following 'false' branch...
       |......
       |  659 |         discard =3D alist;
       |      |         ~~~~~~~  =

       |      |         |
       |      |         (12) ...to here
       |  660 |         if (server->addr_version !=3D alist->version) {

vim +558 fs/afs/cell.c

8b2a464ced77fe David Howells  2017-11-02  548  =

^1da177e4c3f41 Linus Torvalds 2005-04-16  549  /*
989782dcdc91a5 David Howells  2017-11-02  550   * Drop a reference on a cel=
l record.
^1da177e4c3f41 Linus Torvalds 2005-04-16  551   */
dca54a7bbb8ca9 David Howells  2020-10-13  552  void afs_put_cell(struct afs=
_cell *cell, enum afs_cell_trace reason)
88c853c3f5c0a0 David Howells  2019-07-23  553  {
88c853c3f5c0a0 David Howells  2019-07-23  554  	if (cell) {
dca54a7bbb8ca9 David Howells  2020-10-13  555  		unsigned int debug_id =3D =
cell->debug_id;
9f2b4b411c331e David Howells  2022-07-06  556  		unsigned int a;
9f2b4b411c331e David Howells  2022-07-06  557  		bool zero;
9f2b4b411c331e David Howells  2022-07-06 @558  		int r;
88c853c3f5c0a0 David Howells  2019-07-23  559  =

dca54a7bbb8ca9 David Howells  2020-10-13  560  		a =3D atomic_read(&cell->a=
ctive);
9f2b4b411c331e David Howells  2022-07-06  561  		zero =3D __refcount_dec_an=
d_test(&cell->ref, &r);
9f2b4b411c331e David Howells  2022-07-06  562  		trace_afs_cell(debug_id, r=
 - 1, a, reason);
9f2b4b411c331e David Howells  2022-07-06  563  		if (zero) {
88c853c3f5c0a0 David Howells  2019-07-23  564  			a =3D atomic_read(&cell->=
active);
88c853c3f5c0a0 David Howells  2019-07-23  565  			WARN(a !=3D 0, "Cell acti=
ve count %u > 0\n", a);
88c853c3f5c0a0 David Howells  2019-07-23  566  			call_rcu(&cell->rcu, afs_=
cell_destroy);
88c853c3f5c0a0 David Howells  2019-07-23  567  		}
88c853c3f5c0a0 David Howells  2019-07-23  568  	}
88c853c3f5c0a0 David Howells  2019-07-23  569  }
88c853c3f5c0a0 David Howells  2019-07-23  570  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6663405531572077434==--

