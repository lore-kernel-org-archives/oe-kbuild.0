Content-Type: multipart/mixed; boundary="===============6666710215592584050=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: io_uring/poll.c:719:14: warning: use of uninitialized value '<unknown>' [CWE-457]
Date: Sun, 07 Aug 2022 20:15:16 +0800
Message-ID: <202208072056.hvhPDI7z-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6666710215592584050==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: io_uring/=
poll.c:719:14: warning: use of uninitialized value '<unknown>' [CWE-457] [-=
Wanalyzer-use-of-uninitialized-value]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Jens Axboe <axboe@kernel.dk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   1612c382ffbdf1f673caec76502b1c00e6d35363
commit: 329061d3e2f9a0082a097e9558bd5497098586c6 io_uring: move poll handli=
ng into its own file
date:   2 weeks ago
:::::: branch date: 11 hours ago
:::::: commit date: 2 weeks ago
config: arm-randconfig-c002-20220804 (https://download.01.org/0day-ci/archi=
ve/20220807/202208072056.hvhPDI7z-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D329061d3e2f9a0082a097e9558bd5497098586c6
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 329061d3e2f9a0082a097e9558bd5497098586c6
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

gcc-analyzer warnings: (new ones prefixed by >>)
   io_uring/poll.c: In function 'io_poll_remove':
>> io_uring/poll.c:719:14: warning: use of uninitialized value '<unknown>' =
[CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     719 |         bool locked;
         |              ^~~~~~
     'io_poll_remove': event 1
       |
       |  719 |         bool locked;
       |      |              ^~~~~~
       |      |              |
       |      |              (1) use of uninitialized value '<unknown>' here
       |

vim +719 io_uring/poll.c

329061d3e2f9a0 Jens Axboe 2022-05-25  711  =

329061d3e2f9a0 Jens Axboe 2022-05-25  712  int io_poll_remove(struct io_kio=
cb *req, unsigned int issue_flags)
329061d3e2f9a0 Jens Axboe 2022-05-25  713  {
329061d3e2f9a0 Jens Axboe 2022-05-25  714  	struct io_poll_update *poll_upd=
ate =3D io_kiocb_to_cmd(req);
329061d3e2f9a0 Jens Axboe 2022-05-25  715  	struct io_cancel_data cd =3D { =
.data =3D poll_update->old_user_data, };
329061d3e2f9a0 Jens Axboe 2022-05-25  716  	struct io_ring_ctx *ctx =3D req=
->ctx;
329061d3e2f9a0 Jens Axboe 2022-05-25  717  	struct io_kiocb *preq;
329061d3e2f9a0 Jens Axboe 2022-05-25  718  	int ret2, ret =3D 0;
329061d3e2f9a0 Jens Axboe 2022-05-25 @719  	bool locked;

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6666710215592584050==--

