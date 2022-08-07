Content-Type: multipart/mixed; boundary="===============0957208204557932418=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: io_uring/io_uring.c:3702:17: warning: use of uninitialized value '<unknown>' [CWE-457]
Date: Sun, 07 Aug 2022 09:27:10 +0800
Message-ID: <202208070947.hveuQ6Cq-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0957208204557932418==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: io_uring/=
io_uring.c:3702:17: warning: use of uninitialized value '<unknown>' [CWE-45=
7] [-Wanalyzer-use-of-uninitialized-value]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Jens Axboe <axboe@kernel.dk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   4d1044fcb996e8de9b9ab392f4a767890e45202d
commit: ed29b0b4fd835b058ddd151c49d021e28d631ee6 io_uring: move to separate=
 directory
date:   13 days ago
:::::: branch date: 3 hours ago
:::::: commit date: 13 days ago
config: arm-randconfig-c002-20220804 (https://download.01.org/0day-ci/archi=
ve/20220807/202208070947.hveuQ6Cq-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Ded29b0b4fd835b058ddd151c49d021e28d631ee6
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout ed29b0b4fd835b058ddd151c49d021e28d631ee6
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

gcc-analyzer warnings: (new ones prefixed by >>)
              |
              |cc1:
              | (15): ...to here
              |
            '__io_sqe_buffers_update': event 16
              |
              |cc1:
              | (16): use of uninitialized value '=1B[01m=1B[K<unknown>=1B[=
m=1B[K' here
              |
   In file included from include/linux/wait.h:7,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:6,
                    from include/uapi/linux/aio_abi.h:31,
                    from include/linux/syscalls.h:77,
                    from io_uring/io_uring.c:45:
   include/linux/list.h: In function 'list_add':
   include/linux/list.h:88:9: warning: dereference of NULL 'head' [CWE-476]=
 [-Wanalyzer-null-dereference]
      88 |         __list_add(new, head, head->next);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     'io_req_task_submit.part.0': events 1-2
       |
       |io_uring/io_uring.c:2841:13:
       | 2841 | static void io_req_task_submit(struct io_kiocb *req, bool *=
locked)
       |      |             ^~~~~~~~~~~~~~~~~~
       |      |             |
       |      |             (1) entry to 'io_req_task_submit.part.0'
       |......
       | 2848 |                 io_req_complete_failed(req, -EFAULT);
       |      |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                 |
       |      |                 (2) calling 'io_req_complete_failed' from '=
io_req_task_submit.part.0'
       |
       +--> 'io_req_complete_failed': events 3-4
              |
              | 2402 | static void io_req_complete_failed(struct io_kiocb *=
req, s32 res)
              |      |             ^~~~~~~~~~~~~~~~~~~~~~
              |      |             |
              |      |             (3) entry to 'io_req_complete_failed'
              |......
              | 2405 |         io_req_complete_post(req, res, io_put_kbuf(r=
eq, IO_URING_F_UNLOCKED));
              |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |         |
              |      |         (4) calling 'io_put_kbuf' from 'io_req_compl=
ete_failed'
              |
              +--> 'io_put_kbuf': events 5-10
                     |
                     | 1457 | static inline unsigned int io_put_kbuf(struct=
 io_kiocb *req,
                     |      |                            ^~~~~~~~~~~
                     |      |                            |
                     |      |                            (5) entry to 'io_p=
ut_kbuf'
                     |......
                     | 1462 |         if (!(req->flags & (REQ_F_BUFFER_SELE=
CTED|REQ_F_BUFFER_RING)))
                     |      |            ~                =

                     |      |            |
                     |      |            (6) following 'false' branch...
                     |......
                     | 1477 |         if (req->flags & REQ_F_BUFFER_RING) {
                     |      |         ~~ ~                =

                     |      |         |  |
                     |      |         |  (8) following 'true' branch...
                     |      |         (7) ...to here
                     | 1478 |                 /* no buffers to recycle for =
this case */
                     | 1479 |                 cflags =3D __io_put_kbuf(req,=
 NULL);
                     |      |                 ~~~~~~   ~~~~~~~~~~~~~~~~~~~~=
~~~~
                     |      |                 |        |
                     |      |                 |        (10) calling '__io_p=
ut_kbuf' from 'io_put_kbuf'
                     |      |                 (9) ...to here
                     |
                     +--> '__io_put_kbuf': events 11-14
                            |
                            | 1434 | static unsigned int __io_put_kbuf(stru=
ct io_kiocb *req, struct list_head *list)
                            |      |                     ^~~~~~~~~~~~~
                            |      |                     |
                            |      |                     (11) entry to '__i=
o_put_kbuf'
                            | 1435 | {
                            | 1436 |         if (req->flags & REQ_F_BUFFER_=
RING) {
                            |      |            ~         =

                            |      |            |
                            |      |            (12) following 'false' bran=
ch...
                            |......
                            | 1441 |                 list_add(&req->kbuf->l=
ist, list);
                            |      |                 ~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~
                            |      |                 |
                            |      |                 (13) ...to here
                            |      |                 (14) calling 'list_add=
' from '__io_put_kbuf'
                            |
                            +--> 'list_add': events 15-16
                                   |
                                   |include/linux/list.h:86:20:
                                   |   86 | static inline void list_add(str=
uct list_head *new, struct list_head *head)
                                   |      |                    ^~~~~~~~
                                   |      |                    |
                                   |      |                    (15) entry t=
o 'list_add'
                                   |   87 | {
                                   |   88 |         __list_add(new, head, h=
ead->next);
                                   |      |         ~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~
                                   |      |         |
                                   |      |         (16) dereference of NUL=
L 'head'
                                   |
   io_uring/io_uring.c: In function '__io_iov_buffer_select':
>> io_uring/io_uring.c:3702:17: warning: use of uninitialized value '<unkno=
wn>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
    3702 |         ssize_t len;
         |                 ^~~
     'io_req_prep_async.part.0': events 1-4
       |
       | 7824 | static int io_req_prep_async(struct io_kiocb *req)
       |      |            ^~~~~~~~~~~~~~~~~
       |      |            |
       |      |            (1) entry to 'io_req_prep_async.part.0'
       |......
       | 7833 |         if (WARN_ON_ONCE(req_has_async_data(req)))
       |      |            ~
       |      |            |
       |      |            (2) following 'false' branch...
       | 7834 |                 return -EFAULT;
       | 7835 |         if (io_alloc_async_data(req))
       |      |         ~~  ~~~~~~~~~~~~~~~~~~~~~~~~
       |      |         |   |
       |      |         |   (4) calling 'io_alloc_async_data' from 'io_req_=
prep_async.part.0'
       |      |         (3) ...to here
       |
       +--> 'io_alloc_async_data': events 5-7
              |
              | 3905 | static inline bool io_alloc_async_data(struct io_kio=
cb *req)
              |      |                    ^~~~~~~~~~~~~~~~~~~
              |      |                    |
              |      |                    (5) entry to 'io_alloc_async_data'
              |......
              | 3909 |         if (req->async_data) {
              |      |            ~        =

              |      |            |
              |      |            (6) following 'true' branch...
              | 3910 |                 req->flags |=3D REQ_F_ASYNC_DATA;
              |      |                 ~~~ =

              |      |                 |
              |      |                 (7) ...to here
              |
       <------+
       |
     'io_req_prep_async.part.0': events 8-13
       |
       | 7835 |         if (io_alloc_async_data(req))
       |      |            ~^~~~~~~~~~~~~~~~~~~~~~~~
       |      |            ||
       |      |            |(8) returning to 'io_req_prep_async.part.0' fro=
m 'io_alloc_async_data'
       |      |            (9) following 'false' branch...
       |......
       | 7838 |         switch (req->opcode) {
       |      |         ~~~~~~
       |      |         |
       |      |         (10) ...to here
       |      |         (11) following 'case 1:' branch...
       | 7839 |         case IORING_OP_READV:
       |      |         ~~~~ =

       |      |         |
       |      |         (12) ...to here
       | 7840 |                 return io_readv_prep_async(req);
       |      |                        ~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                        |
       |      |                        (13) calling 'io_readv_prep_async' f=
rom 'io_req_prep_async.part.0'
       |
       +--> 'io_readv_prep_async': events 14-15
              |
              | 3955 | static int io_readv_prep_async(struct io_kiocb *req)
              |      |            ^~~~~~~~~~~~~~~~~~~
              |      |            |
              |      |            (14) entry to 'io_readv_prep_async'
              | 3956 | {
              | 3957 |         return io_rw_prep_async(req, READ);
              |      |                ~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |                |
              |      |                (15) calling 'io_rw_prep_async' from =
'io_readv_prep_async'
              |
              +--> 'io_rw_prep_async': events 16-17
                     |
                     | 3937 | static inline int io_rw_prep_async(struct io_=
kiocb *req, int rw)
                     |      |                   ^~~~~~~~~~~~~~~~
                     |      |                   |
                     |      |                   (16) entry to 'io_rw_prep_a=
sync'
                     |......
                     | 3944 |         ret =3D io_import_iovec(rw, req, &iov=
, &iorw->s, 0);
                     |      |               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~
                     |      |               |
                     |      |               (17) calling 'io_import_iovec' =
from 'io_rw_prep_async'
                     |
                     +--> 'io_import_iovec': events 18-19
                            |
                            | 3797 | static inline int io_import_iovec(int =
rw, struct io_kiocb *req,
                            |      |                   ^~~~~~~~~~~~~~~
                            |      |                   |
                            |      |                   (18) entry to 'io_im=
port_iovec'
                            |......
                            | 3801 |         *iovec =3D __io_import_iovec(r=
w, req, s, issue_flags);
                            |      |                  ~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~
                            |      |                  |
                            |      |                  (19) calling '__io_im=
port_iovec' from 'io_import_iovec'
                            |
                            +--> '__io_import_iovec': events 20-27
                                   |
                                   | 3745 | static struct iovec *__io_impor=
t_iovec(int rw, struct io_kiocb *req,
                                   |      |                      ^~~~~~~~~~=
~~~~~~~

vim +3702 io_uring/io_uring.c

4d954c258a0c36 fs/io_uring.c Jens Axboe        2020-02-27  3696  =

4d954c258a0c36 fs/io_uring.c Jens Axboe        2020-02-27  3697  static ssi=
ze_t __io_iov_buffer_select(struct io_kiocb *req, struct iovec *iov,
51aac424aef980 fs/io_uring.c Pavel Begunkov    2021-10-14  3698  				      =
unsigned int issue_flags)
4d954c258a0c36 fs/io_uring.c Jens Axboe        2020-02-27  3699  {
4d954c258a0c36 fs/io_uring.c Jens Axboe        2020-02-27  3700  	struct io=
vec __user *uiov =3D u64_to_user_ptr(req->rw.addr);
4d954c258a0c36 fs/io_uring.c Jens Axboe        2020-02-27  3701  	void __us=
er *buf;
4d954c258a0c36 fs/io_uring.c Jens Axboe        2020-02-27 @3702  	ssize_t l=
en;
4d954c258a0c36 fs/io_uring.c Jens Axboe        2020-02-27  3703  =

4d954c258a0c36 fs/io_uring.c Jens Axboe        2020-02-27  3704  	if (copy_=
from_user(iov, uiov, sizeof(*uiov)))
4d954c258a0c36 fs/io_uring.c Jens Axboe        2020-02-27  3705  		return -=
EFAULT;
4d954c258a0c36 fs/io_uring.c Jens Axboe        2020-02-27  3706  =

4d954c258a0c36 fs/io_uring.c Jens Axboe        2020-02-27  3707  	len =3D i=
ov[0].iov_len;
4d954c258a0c36 fs/io_uring.c Jens Axboe        2020-02-27  3708  	if (len <=
 0)
4d954c258a0c36 fs/io_uring.c Jens Axboe        2020-02-27  3709  		return -=
EINVAL;
4e9067025259d1 fs/io_uring.c Jens Axboe        2022-04-28  3710  	buf =3D i=
o_buffer_select(req, &len, issue_flags);
984824db844a9b fs/io_uring.c Christoph Hellwig 2022-05-18  3711  	if (!buf)
984824db844a9b fs/io_uring.c Christoph Hellwig 2022-05-18  3712  		return -=
ENOBUFS;
b66e65f41426ec fs/io_uring.c Jens Axboe        2022-04-30  3713  	req->rw.a=
ddr =3D (unsigned long) buf;
4d954c258a0c36 fs/io_uring.c Jens Axboe        2020-02-27  3714  	iov[0].io=
v_base =3D buf;
b66e65f41426ec fs/io_uring.c Jens Axboe        2022-04-30  3715  	req->rw.l=
en =3D iov[0].iov_len =3D len;
4d954c258a0c36 fs/io_uring.c Jens Axboe        2020-02-27  3716  	return 0;
4d954c258a0c36 fs/io_uring.c Jens Axboe        2020-02-27  3717  }
4d954c258a0c36 fs/io_uring.c Jens Axboe        2020-02-27  3718  =


:::::: The code at line 3702 was first introduced by commit
:::::: 4d954c258a0c365a85a2d1b1cccf63aec38fca4c io_uring: add IOSQE_BUFFER_=
SELECT support for IORING_OP_READV

:::::: TO: Jens Axboe <axboe@kernel.dk>
:::::: CC: Jens Axboe <axboe@kernel.dk>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0957208204557932418==--

