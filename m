Content-Type: multipart/mixed; boundary="===============7567134517850414667=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: io_uring/rsrc.c:452:13: warning: use of uninitialized value '<unknown>' [CWE-457]
Date: Mon, 08 Aug 2022 08:32:40 +0800
Message-ID: <202208080801.wK6w82xI-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7567134517850414667==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: io_uring/=
rsrc.c:452:13: warning: use of uninitialized value '<unknown>' [CWE-457] [-=
Wanalyzer-use-of-uninitialized-value]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Jens Axboe <axboe@kernel.dk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   3bc1bc0b59d04e997db25b84babf459ca1cd80b7
commit: 73572984481907d92673255b494c0ff4f77c8ed4 io_uring: move rsrc relate=
d data, core, and commands
date:   2 weeks ago
:::::: branch date: 7 hours ago
:::::: commit date: 2 weeks ago
config: arm-randconfig-c002-20220804 (https://download.01.org/0day-ci/archi=
ve/20220808/202208080801.wK6w82xI-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D73572984481907d92673255b494c0ff4f77c8ed4
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 73572984481907d92673255b494c0ff4f77c8ed4
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

gcc-analyzer warnings: (new ones prefixed by >>)
   In function '__io_sqe_buffers_update':
   cc1: warning: use of uninitialized value '<unknown>' [CWE-457] [-Wanalyz=
er-use-of-uninitialized-value]
     '__io_register_rsrc_update.part.0': events 1-4
       |
       |io_uring/rsrc.c:583:12:
       |  583 | static int __io_register_rsrc_update(struct io_ring_ctx *ct=
x, unsigned type,
       |      |            ^~~~~~~~~~~~~~~~~~~~~~~~~
       |      |            |
       |      |            (1) entry to '__io_register_rsrc_update.part.0'
       |......
       |  596 |         switch (type) {
       |      |         ~~~~~~
       |      |         |
       |      |         (2) following 'case 1:' branch...
       |......
       |  599 |         case IORING_RSRC_BUFFER:
       |      |         ~~~~
       |      |         |
       |      |         (3) ...to here
       |  600 |                 return __io_sqe_buffers_update(ctx, up, nr_=
args);
       |      |                        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
       |      |                        |
       |      |                        (4) calling '__io_sqe_buffers_update=
' from '__io_register_rsrc_update.part.0'
       |
       +--> '__io_sqe_buffers_update': events 5-8
              |
              |  523 | static int __io_sqe_buffers_update(struct io_ring_ct=
x *ctx,
              |      |            ^~~~~~~~~~~~~~~~~~~~~~~
              |      |            |
              |      |            (5) entry to '__io_sqe_buffers_update'
              |......
              |  534 |         if (!ctx->buf_data)
              |      |            ~
              |      |            |
              |      |            (6) following 'false' branch...
              |  535 |                 return -ENXIO;
              |  536 |         if (up->offset + nr_args > ctx->nr_user_bufs)
              |      |         ~~ ~
              |      |         |  |
              |      |         |  (8) following 'false' branch...
              |      |         (7) ...to here
              |
            '__io_sqe_buffers_update': event 9
              |
              |cc1:
              | (9): ...to here
              |
            '__io_sqe_buffers_update': events 10-14
              |
              |  539 |         for (done =3D 0; done < nr_args; done++) {
              |      |                        ~~~~~^~~~~~~~~
              |      |                             |
              |      |                             (10) following 'false' b=
ranch (when 'done >=3D nr_args')...
              |......
              |  578 |         if (needs_switch)
              |      |         ~~ ~                 =

              |      |         |  |
              |      |         |  (12) following 'false' branch (when 'need=
s_switch =3D=3D 0')...
              |      |         (11) ...to here
              |  579 |                 io_rsrc_node_switch(ctx, ctx->buf_da=
ta);
              |  580 |         return done ? done : err;
              |      |         ~~~~~~ ~~~~~~~~~~~~~~~~~
              |      |         |                  |
              |      |         (13) ...to here    (14) following 'false' br=
anch (when 'done =3D=3D 0')...
              |
            '__io_sqe_buffers_update': event 15
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
   io_uring/rsrc.c: In function '__io_sqe_files_update':
>> io_uring/rsrc.c:452:13: warning: use of uninitialized value '<unknown>' =
[CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     452 |         int fd, i, err =3D 0;
         |             ^~
     '__io_register_rsrc_update.part.0': events 1-4
       |
       |  583 | static int __io_register_rsrc_update(struct io_ring_ctx *ct=
x, unsigned type,
       |      |            ^~~~~~~~~~~~~~~~~~~~~~~~~
       |      |            |
       |      |            (1) entry to '__io_register_rsrc_update.part.0'
       |......
       |  596 |         switch (type) {
       |      |         ~~~~~~
       |      |         |
       |      |         (2) following 'case 0:' branch...
       |  597 |         case IORING_RSRC_FILE:
       |      |         ~~~~
       |      |         |
       |      |         (3) ...to here
       |  598 |                 return __io_sqe_files_update(ctx, up, nr_ar=
gs);
       |      |                        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
       |      |                        |
       |      |                        (4) calling '__io_sqe_files_update' =
from '__io_register_rsrc_update.part.0'
       |
       +--> '__io_sqe_files_update': events 5-6
              |
              |  443 | static int __io_sqe_files_update(struct io_ring_ctx =
*ctx,
              |      |            ^~~~~~~~~~~~~~~~~~~~~
              |      |            |
              |      |            (5) entry to '__io_sqe_files_update'
              |......
              |  452 |         int fd, i, err =3D 0;
              |      |             ~~
              |      |             |
              |      |             (6) use of uninitialized value '<unknown=
>' here
              |
   io_uring/rsrc.c: In function '__io_sqe_buffers_update':
   io_uring/rsrc.c:540:40: warning: use of uninitialized value '<unknown>' =
[CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     540 |                 struct io_mapped_ubuf *imu;
         |                                        ^~~
     '__io_register_rsrc_update.part.0': events 1-4
       |
       |  583 | static int __io_register_rsrc_update(struct io_ring_ctx *ct=
x, unsigned type,
       |      |            ^~~~~~~~~~~~~~~~~~~~~~~~~
       |      |            |
       |      |            (1) entry to '__io_register_rsrc_update.part.0'
       |......
       |  596 |         switch (type) {
       |      |         ~~~~~~
       |      |         |
       |      |         (2) following 'case 1:' branch...
       |......
       |  599 |         case IORING_RSRC_BUFFER:
       |      |         ~~~~
       |      |         |
       |      |         (3) ...to here
       |  600 |                 return __io_sqe_buffers_update(ctx, up, nr_=
args);
       |      |                        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
       |      |                        |
       |      |                        (4) calling '__io_sqe_buffers_update=
' from '__io_register_rsrc_update.part.0'
       |
       +--> '__io_sqe_buffers_update': events 5-8
              |
              |  523 | static int __io_sqe_buffers_update(struct io_ring_ct=
x *ctx,
              |      |            ^~~~~~~~~~~~~~~~~~~~~~~
              |      |            |
              |      |            (5) entry to '__io_sqe_buffers_update'
              |......
              |  534 |         if (!ctx->buf_data)
              |      |            ~
              |      |            |
              |      |            (6) following 'false' branch...
              |  535 |                 return -ENXIO;
              |  536 |         if (up->offset + nr_args > ctx->nr_user_bufs)
              |      |         ~~ ~
              |      |         |  |
              |      |         |  (8) following 'false' branch...
              |      |         (7) ...to here
              |
            '__io_sqe_buffers_update': event 9
              |
              |cc1:
              | (9): ...to here
              |
            '__io_sqe_buffers_update': events 10-12
              |
              |  539 |         for (done =3D 0; done < nr_args; done++) {
              |      |                        ~~~~~^~~~~~~~~
              |      |                             |
              |      |                             (10) following 'true' br=
anch (when 'done < nr_args')...
              |  540 |                 struct io_mapped_ubuf *imu;
              |      |                 ~~~~~~                 ~~~
              |      |                 |                      |
              |      |                 (11) ...to here        (12) use of u=
ninitialized value '<unknown>' here
              |
   io_uring/rsrc.c: In function 'io_sqe_buffer_register':
   io_uring/rsrc.c:1204:18: warning: use of uninitialized value '<unknown>'=
 [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
    1204 |         int ret, nr_pages, i;
         |                  ^~~~~~~~
     'io_sqe_buffer_register': event 1
       |
       | 1204 |         int ret, nr_pages, i;

vim +452 io_uring/rsrc.c

73572984481907 Jens Axboe 2022-06-13  442  =

73572984481907 Jens Axboe 2022-06-13  443  static int __io_sqe_files_update=
(struct io_ring_ctx *ctx,
73572984481907 Jens Axboe 2022-06-13  444  				 struct io_uring_rsrc_update=
2 *up,
73572984481907 Jens Axboe 2022-06-13  445  				 unsigned nr_args)
73572984481907 Jens Axboe 2022-06-13  446  {
73572984481907 Jens Axboe 2022-06-13  447  	u64 __user *tags =3D u64_to_use=
r_ptr(up->tags);
73572984481907 Jens Axboe 2022-06-13  448  	__s32 __user *fds =3D u64_to_us=
er_ptr(up->data);
73572984481907 Jens Axboe 2022-06-13  449  	struct io_rsrc_data *data =3D c=
tx->file_data;
73572984481907 Jens Axboe 2022-06-13  450  	struct io_fixed_file *file_slot;
73572984481907 Jens Axboe 2022-06-13  451  	struct file *file;
73572984481907 Jens Axboe 2022-06-13 @452  	int fd, i, err =3D 0;
73572984481907 Jens Axboe 2022-06-13  453  	unsigned int done;
73572984481907 Jens Axboe 2022-06-13  454  	bool needs_switch =3D false;
73572984481907 Jens Axboe 2022-06-13  455  =

73572984481907 Jens Axboe 2022-06-13  456  	if (!ctx->file_data)
73572984481907 Jens Axboe 2022-06-13  457  		return -ENXIO;
73572984481907 Jens Axboe 2022-06-13  458  	if (up->offset + nr_args > ctx-=
>nr_user_files)
73572984481907 Jens Axboe 2022-06-13  459  		return -EINVAL;
73572984481907 Jens Axboe 2022-06-13  460  =

73572984481907 Jens Axboe 2022-06-13  461  	for (done =3D 0; done < nr_args=
; done++) {
73572984481907 Jens Axboe 2022-06-13  462  		u64 tag =3D 0;
73572984481907 Jens Axboe 2022-06-13  463  =

73572984481907 Jens Axboe 2022-06-13  464  		if ((tags && copy_from_user(&t=
ag, &tags[done], sizeof(tag))) ||
73572984481907 Jens Axboe 2022-06-13  465  		    copy_from_user(&fd, &fds[d=
one], sizeof(fd))) {
73572984481907 Jens Axboe 2022-06-13  466  			err =3D -EFAULT;
73572984481907 Jens Axboe 2022-06-13  467  			break;
73572984481907 Jens Axboe 2022-06-13  468  		}
73572984481907 Jens Axboe 2022-06-13  469  		if ((fd =3D=3D IORING_REGISTER=
_FILES_SKIP || fd =3D=3D -1) && tag) {
73572984481907 Jens Axboe 2022-06-13  470  			err =3D -EINVAL;
73572984481907 Jens Axboe 2022-06-13  471  			break;
73572984481907 Jens Axboe 2022-06-13  472  		}
73572984481907 Jens Axboe 2022-06-13  473  		if (fd =3D=3D IORING_REGISTER_=
FILES_SKIP)
73572984481907 Jens Axboe 2022-06-13  474  			continue;
73572984481907 Jens Axboe 2022-06-13  475  =

73572984481907 Jens Axboe 2022-06-13  476  		i =3D array_index_nospec(up->o=
ffset + done, ctx->nr_user_files);
73572984481907 Jens Axboe 2022-06-13  477  		file_slot =3D io_fixed_file_sl=
ot(&ctx->file_table, i);
73572984481907 Jens Axboe 2022-06-13  478  =

73572984481907 Jens Axboe 2022-06-13  479  		if (file_slot->file_ptr) {
73572984481907 Jens Axboe 2022-06-13  480  			file =3D (struct file *)(file=
_slot->file_ptr & FFS_MASK);
73572984481907 Jens Axboe 2022-06-13  481  			err =3D io_queue_rsrc_removal=
(data, i, ctx->rsrc_node, file);
73572984481907 Jens Axboe 2022-06-13  482  			if (err)
73572984481907 Jens Axboe 2022-06-13  483  				break;
73572984481907 Jens Axboe 2022-06-13  484  			file_slot->file_ptr =3D 0;
73572984481907 Jens Axboe 2022-06-13  485  			io_file_bitmap_clear(&ctx->fi=
le_table, i);
73572984481907 Jens Axboe 2022-06-13  486  			needs_switch =3D true;
73572984481907 Jens Axboe 2022-06-13  487  		}
73572984481907 Jens Axboe 2022-06-13  488  		if (fd !=3D -1) {
73572984481907 Jens Axboe 2022-06-13  489  			file =3D fget(fd);
73572984481907 Jens Axboe 2022-06-13  490  			if (!file) {
73572984481907 Jens Axboe 2022-06-13  491  				err =3D -EBADF;
73572984481907 Jens Axboe 2022-06-13  492  				break;
73572984481907 Jens Axboe 2022-06-13  493  			}
73572984481907 Jens Axboe 2022-06-13  494  			/*
73572984481907 Jens Axboe 2022-06-13  495  			 * Don't allow io_uring insta=
nces to be registered. If
73572984481907 Jens Axboe 2022-06-13  496  			 * UNIX isn't enabled, then t=
his causes a reference
73572984481907 Jens Axboe 2022-06-13  497  			 * cycle and this instance ca=
n never get freed. If UNIX
73572984481907 Jens Axboe 2022-06-13  498  			 * is enabled we'll handle it=
 just fine, but there's
73572984481907 Jens Axboe 2022-06-13  499  			 * still no point in allowing=
 a ring fd as it doesn't
73572984481907 Jens Axboe 2022-06-13  500  			 * support regular read/write=
 anyway.
73572984481907 Jens Axboe 2022-06-13  501  			 */
73572984481907 Jens Axboe 2022-06-13  502  			if (io_is_uring_fops(file)) {
73572984481907 Jens Axboe 2022-06-13  503  				fput(file);
73572984481907 Jens Axboe 2022-06-13  504  				err =3D -EBADF;
73572984481907 Jens Axboe 2022-06-13  505  				break;
73572984481907 Jens Axboe 2022-06-13  506  			}
73572984481907 Jens Axboe 2022-06-13  507  			err =3D io_scm_file_account(c=
tx, file);
73572984481907 Jens Axboe 2022-06-13  508  			if (err) {
73572984481907 Jens Axboe 2022-06-13  509  				fput(file);
73572984481907 Jens Axboe 2022-06-13  510  				break;
73572984481907 Jens Axboe 2022-06-13  511  			}
73572984481907 Jens Axboe 2022-06-13  512  			*io_get_tag_slot(data, i) =3D=
 tag;
73572984481907 Jens Axboe 2022-06-13  513  			io_fixed_file_set(file_slot, =
file);
73572984481907 Jens Axboe 2022-06-13  514  			io_file_bitmap_set(&ctx->file=
_table, i);
73572984481907 Jens Axboe 2022-06-13  515  		}
73572984481907 Jens Axboe 2022-06-13  516  	}
73572984481907 Jens Axboe 2022-06-13  517  =

73572984481907 Jens Axboe 2022-06-13  518  	if (needs_switch)
73572984481907 Jens Axboe 2022-06-13  519  		io_rsrc_node_switch(ctx, data);
73572984481907 Jens Axboe 2022-06-13  520  	return done ? done : err;
73572984481907 Jens Axboe 2022-06-13  521  }
73572984481907 Jens Axboe 2022-06-13  522  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7567134517850414667==--

