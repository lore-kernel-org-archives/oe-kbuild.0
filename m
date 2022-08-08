Content-Type: multipart/mixed; boundary="===============3661965670276435809=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: io_uring/rw.c:382:17: warning: use of uninitialized value '<unknown>' [CWE-457]
Date: Mon, 08 Aug 2022 16:33:42 +0800
Message-ID: <202208081640.uCDfbp65-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3661965670276435809==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: io_uring/=
rw.c:382:17: warning: use of uninitialized value '<unknown>' [CWE-457] [-Wa=
nalyzer-use-of-uninitialized-value]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Jens Axboe <axboe@kernel.dk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   4e23eeebb2e57f5a28b36221aa776b5a1122dde5
commit: f3b44f92e59a804cf375479bda0bccbf4b6e6ef6 io_uring: move read/write =
related opcodes to its own file
date:   2 weeks ago
:::::: branch date: 8 hours ago
:::::: commit date: 2 weeks ago
config: arm-randconfig-c002-20220804 (https://download.01.org/0day-ci/archi=
ve/20220808/202208081640.uCDfbp65-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Df3b44f92e59a804cf375479bda0bccbf4b6e6ef6
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout f3b44f92e59a804cf375479bda0bccbf4b6e6ef6
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

gcc-analyzer warnings: (new ones prefixed by >>)
       |
     'io_do_iopoll': event 5
       |
       |cc1:
       | (5): ...to here
       |
     'io_do_iopoll': event 6
       |
       | 1076 |         wq_list_for_each_resume(pos, prev) {
       |      |                                 ^~~
       |      |                                 |
       |      |                                 (6) following 'true' branch=
 (when 'pos' is non-NULL)...
   io_uring/io-wq.h:36:16: note: in definition of macro 'wq_list_for_each_r=
esume'
       |   36 |         for (; pos; prv =3D pos, pos =3D (pos)->next)
       |      |                ^~~
       |
     'io_do_iopoll': events 7-12
       |
       |io_uring/rw.c:1077:17:
       | 1077 |                 struct io_kiocb *req =3D container_of(pos, =
struct io_kiocb, comp_list);
       |      |                 ^~~~~~
       |      |                 |
       |      |                 (7) ...to here
       |......
       | 1080 |                 if (!smp_load_acquire(&req->iopoll_complete=
d))
       |      |                    ~
       |      |                    |
       |      |                    (8) following 'false' branch...
       | 1081 |                         break;
       | 1082 |                 nr_events++;
       |      |                 ~~~~~~~~~
       |      |                 |
       |      |                 (9) ...to here
       | 1083 |                 if (unlikely(req->flags & REQ_F_CQE_SKIP))
       |      |                    ~
       |      |                    |
       |      |                    (10) following 'false' branch...
       |......
       | 1086 |                 req->cqe.flags =3D io_put_kbuf(req, 0);
       |      |                 ~~~              ~~~~~~~~~~~~~~~~~~~
       |      |                 |                |
       |      |                 (11) ...to here  (12) calling 'io_put_kbuf'=
 from 'io_do_iopoll'
       |
       +--> 'io_put_kbuf': events 13-18
              |
              |io_uring/kbuf.h:105:28:
              |  105 | static inline unsigned int io_put_kbuf(struct io_kio=
cb *req,
              |      |                            ^~~~~~~~~~~
              |      |                            |
              |      |                            (13) entry to 'io_put_kbu=
f'
              |......
              |  110 |         if (!(req->flags & (REQ_F_BUFFER_SELECTED|RE=
Q_F_BUFFER_RING)))
              |      |            ~                =

              |      |            |
              |      |            (14) following 'false' branch...
              |......
              |  125 |         if (req->flags & REQ_F_BUFFER_RING) {
              |      |         ~~ ~                =

              |      |         |  |
              |      |         |  (16) following 'true' branch...
              |      |         (15) ...to here
              |  126 |                 /* no buffers to recycle for this ca=
se */
              |  127 |                 cflags =3D __io_put_kbuf(req, NULL);
              |      |                 ~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~
              |      |                 |        |
              |      |                 |        (18) calling '__io_put_kbuf=
' from 'io_put_kbuf'
              |      |                 (17) ...to here
              |
              +--> '__io_put_kbuf': events 19-22
                     |
                     |   82 | static unsigned int __io_put_kbuf(struct io_k=
iocb *req, struct list_head *list)
                     |      |                     ^~~~~~~~~~~~~
                     |      |                     |
                     |      |                     (19) entry to '__io_put_k=
buf'
                     |   83 | {
                     |   84 |         if (req->flags & REQ_F_BUFFER_RING) {
                     |      |            ~         =

                     |      |            |
                     |      |            (20) following 'false' branch...
                     |......
                     |   89 |                 list_add(&req->kbuf->list, li=
st);
                     |      |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
                     |      |                 |
                     |      |                 (21) ...to here
                     |      |                 (22) calling 'list_add' from =
'__io_put_kbuf'
                     |
                     +--> 'list_add': events 23-24
                            |
                            |include/linux/list.h:86:20:
                            |   86 | static inline void list_add(struct lis=
t_head *new, struct list_head *head)
                            |      |                    ^~~~~~~~
                            |      |                    |
                            |      |                    (23) entry to 'list=
_add'
                            |   87 | {
                            |   88 |         __list_add(new, head, head->ne=
xt);
                            |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
                            |      |         |
                            |      |         (24) dereference of NULL 'head'
                            |
   io_uring/rw.c: In function '__io_iov_buffer_select':
>> io_uring/rw.c:382:17: warning: use of uninitialized value '<unknown>' [C=
WE-457] [-Wanalyzer-use-of-uninitialized-value]
     382 |         ssize_t len;
         |                 ^~~
     'io_write': events 1-4
       |
       |  916 | int io_write(struct io_kiocb *req, unsigned int issue_flags)
       |      |     ^~~~~~~~
       |      |     |
       |      |     (1) entry to 'io_write'
       |......
       |  926 |         if (!req_has_async_data(req)) {
       |      |            ~
       |      |            |
       |      |            (2) following 'true' branch...
       |  927 |                 ret =3D io_import_iovec(WRITE, req, &iovec,=
 s, issue_flags);
       |      |                 ~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~
       |      |                 |     |
       |      |                 |     (4) calling 'io_import_iovec' from 'i=
o_write'
       |      |                 (3) ...to here
       |
       +--> 'io_import_iovec': events 5-6
              |
              |  473 | static inline int io_import_iovec(int rw, struct io_=
kiocb *req,
              |      |                   ^~~~~~~~~~~~~~~
              |      |                   |
              |      |                   (5) entry to 'io_import_iovec'
              |......
              |  477 |         *iovec =3D __io_import_iovec(rw, req, s, iss=
ue_flags);
              |      |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
              |      |                  |
              |      |                  (6) calling '__io_import_iovec' fro=
m 'io_import_iovec'
              |
              +--> '__io_import_iovec': events 7-14
                     |
                     |  420 | static struct iovec *__io_import_iovec(int dd=
ir, struct io_kiocb *req,
                     |      |                      ^~~~~~~~~~~~~~~~~
                     |      |                      |
                     |      |                      (7) entry to '__io_impor=
t_iovec'
                     |......
                     |  432 |         if (opcode =3D=3D IORING_OP_READ_FIXE=
D || opcode =3D=3D IORING_OP_WRITE_FIXED) {
                     |      |            ~          =

                     |      |            |
                     |      |            (8) following 'false' branch...
                     |......
                     |  439 |         buf =3D u64_to_user_ptr(rw->addr);
                     |      |         ~~~           =

                     |      |         |
                     |      |         (9) ...to here
                     |......
                     |  442 |         if (opcode =3D=3D IORING_OP_READ || o=
pcode =3D=3D IORING_OP_WRITE) {
                     |      |            ~          =

                     |      |            |
                     |      |            (10) following 'false' branch...
                     |......
                     |  457 |         iovec =3D s->fast_iov;
                     |      |         ~~~~~         =

                     |      |         |
                     |      |         (11) ...to here
                     |  458 |         if (req->flags & REQ_F_BUFFER_SELECT)=
 {
                     |      |            ~          =

                     |      |            |
                     |      |            (12) following 'true' branch...
                     |  459 |                 ret =3D io_iov_buffer_select(=
req, iovec, issue_flags);
                     |      |                 ~~~   ~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~
                     |      |                 |     |
                     |      |                 |     (14) calling 'io_iov_bu=
ffer_select' from '__io_import_iovec'
                     |      |                 (13) ...to here
                     |
                     +--> 'io_iov_buffer_select': events 15-20
                            |
                            |  399 | static ssize_t io_iov_buffer_select(st=
ruct io_kiocb *req, struct iovec *iov,
                            |      |                ^~~~~~~~~~~~~~~~~~~~
                            |      |                |
                            |      |                (15) entry to 'io_iov_b=
uffer_select'
                            |......
                            |  404 |         if (req->flags & (REQ_F_BUFFER=
_SELECTED|REQ_F_BUFFER_RING)) {
                            |      |            ~    =

                            |      |            |
                            |      |            (16) following 'false' bran=
ch...
                            |......
                            |  409 |         if (rw->len !=3D 1)
                            |      |         ~~ ~    =

                            |      |         |  |
                            |      |         |  (18) following 'false' bran=
ch...
                            |      |         (17) ...to here
                            |......
                            |  417 |         return __io_iov_buffer_select(=
req, iov, issue_flags);
                            |      |         ~~~~~~ ~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~
                            |      |         |      |
                            |      |         |      (20) calling '__io_iov_=
buffer_select' from 'io_iov_buffer_select'
                            |      |         (19) ...to here
                            |
                            +--> '__io_iov_buffer_select': events 21-22
                                   |
                                   |  376 | static ssize_t __io_iov_buffer_=
select(struct io_kiocb *req, struct iovec *iov,
                                   |      |                ^~~~~~~~~~~~~~~~=
~~~~~~
                                   |      |                |
                                   |      |                (21) entry to '_=
_io_iov_buffer_select'
                                   |......
                                   |  382 |         ssize_t len;
                                   |      |                 ~~~

vim +382 io_uring/rw.c

f3b44f92e59a80 Jens Axboe 2022-06-13  375  =

f3b44f92e59a80 Jens Axboe 2022-06-13  376  static ssize_t __io_iov_buffer_s=
elect(struct io_kiocb *req, struct iovec *iov,
f3b44f92e59a80 Jens Axboe 2022-06-13  377  				      unsigned int issue_fla=
gs)
f3b44f92e59a80 Jens Axboe 2022-06-13  378  {
f3b44f92e59a80 Jens Axboe 2022-06-13  379  	struct io_rw *rw =3D io_kiocb_t=
o_cmd(req);
f3b44f92e59a80 Jens Axboe 2022-06-13  380  	struct iovec __user *uiov =3D u=
64_to_user_ptr(rw->addr);
f3b44f92e59a80 Jens Axboe 2022-06-13  381  	void __user *buf;
f3b44f92e59a80 Jens Axboe 2022-06-13 @382  	ssize_t len;
f3b44f92e59a80 Jens Axboe 2022-06-13  383  =

f3b44f92e59a80 Jens Axboe 2022-06-13  384  	if (copy_from_user(iov, uiov, s=
izeof(*uiov)))
f3b44f92e59a80 Jens Axboe 2022-06-13  385  		return -EFAULT;
f3b44f92e59a80 Jens Axboe 2022-06-13  386  =

f3b44f92e59a80 Jens Axboe 2022-06-13  387  	len =3D iov[0].iov_len;
f3b44f92e59a80 Jens Axboe 2022-06-13  388  	if (len < 0)
f3b44f92e59a80 Jens Axboe 2022-06-13  389  		return -EINVAL;
f3b44f92e59a80 Jens Axboe 2022-06-13  390  	buf =3D io_buffer_select(req, &=
len, issue_flags);
f3b44f92e59a80 Jens Axboe 2022-06-13  391  	if (!buf)
f3b44f92e59a80 Jens Axboe 2022-06-13  392  		return -ENOBUFS;
f3b44f92e59a80 Jens Axboe 2022-06-13  393  	rw->addr =3D (unsigned long) bu=
f;
f3b44f92e59a80 Jens Axboe 2022-06-13  394  	iov[0].iov_base =3D buf;
f3b44f92e59a80 Jens Axboe 2022-06-13  395  	rw->len =3D iov[0].iov_len =3D =
len;
f3b44f92e59a80 Jens Axboe 2022-06-13  396  	return 0;
f3b44f92e59a80 Jens Axboe 2022-06-13  397  }
f3b44f92e59a80 Jens Axboe 2022-06-13  398  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3661965670276435809==--

