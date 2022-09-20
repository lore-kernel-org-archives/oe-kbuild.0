Content-Type: multipart/mixed; boundary="===============0795510301866015710=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: fs/afs/cell.c:558:21: warning: use of uninitialized value '<unknown>' [CWE-457]
Date: Tue, 20 Sep 2022 08:40:57 +0800
Message-ID: <202209200839.HnHrDGAT-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0795510301866015710==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: fs/afs/ce=
ll.c:558:21: warning: use of uninitialized value '<unknown>' [CWE-457] [-Wa=
nalyzer-use-of-uninitialized-value]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: David Howells <dhowells@redhat.com>
CC: Marc Dionne <marc.dionne@auristor.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   521a547ced6477c54b4b0cc206000406c221b4d6
commit: c56f9ec8b20f931014574b943590c4d830109380 afs: Use refcount_t rather=
 than atomic_t
date:   7 weeks ago
:::::: branch date: 28 hours ago
:::::: commit date: 7 weeks ago
config: arm-randconfig-c002-20220917 (https://download.01.org/0day-ci/archi=
ve/20220920/202209200839.HnHrDGAT-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Dc56f9ec8b20f931014574b943590c4d830109380
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout c56f9ec8b20f931014574b943590c4d830109380
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

gcc_analyzer warnings: (new ones prefixed by >>)
   fs/afs/cell.c: In function 'afs_put_cell':
>> fs/afs/cell.c:558:21: warning: use of uninitialized value '<unknown>' [C=
WE-457] [-Wanalyzer-use-of-uninitialized-value]
     558 |                 int r;
         |                     ^
     'afs_put_cell': events 1-3
       |
       |  554 |         if (cell) {
       |      |            ^
       |      |            |
       |      |            (1) following 'true' branch (when 'cell' is non-=
NULL)...
       |......
       |  558 |                 int r;
       |      |                     ~
       |      |                     |
       |      |                     (2) ...to here
       |      |                     (3) use of uninitialized value '<unknow=
n>' here
       |

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
c56f9ec8b20f93 David Howells  2022-07-06  556  		unsigned int a;
c56f9ec8b20f93 David Howells  2022-07-06  557  		bool zero;
c56f9ec8b20f93 David Howells  2022-07-06 @558  		int r;
88c853c3f5c0a0 David Howells  2019-07-23  559  =

dca54a7bbb8ca9 David Howells  2020-10-13  560  		a =3D atomic_read(&cell->a=
ctive);
c56f9ec8b20f93 David Howells  2022-07-06  561  		zero =3D __refcount_dec_an=
d_test(&cell->ref, &r);
c56f9ec8b20f93 David Howells  2022-07-06  562  		trace_afs_cell(debug_id, r=
 - 1, a, reason);
c56f9ec8b20f93 David Howells  2022-07-06  563  		if (zero) {
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
--===============0795510301866015710==--

