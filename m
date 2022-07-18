Content-Type: multipart/mixed; boundary="===============4325840723889615981=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [axboe-block:for-5.20/io_uring 52/171] io_uring/rsrc.c:331:6-25: atomic_dec_and_test variation before object free at line 334.
Date: Mon, 18 Jul 2022 08:43:08 +0800
Message-ID: <202207180837.REKJTbXu-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4325840723889615981==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Jens Axboe <axboe@kernel.dk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.g=
it for-5.20/io_uring
head:   004523ebfe6de8dd664ddf6fc26c47801b3bdaf5
commit: 129ce6a148558b981c9b0c48a81a33a8c3c4c1c7 [52/171] io_uring: move rs=
rc related data, core, and commands
:::::: branch date: 9 days ago
:::::: commit date: 7 days ago
config: s390-randconfig-c043-20220717 (https://download.01.org/0day-ci/arch=
ive/20220718/202207180837.REKJTbXu-lkp(a)intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> io_uring/rsrc.c:331:6-25: atomic_dec_and_test variation before object fr=
ee at line 334.

vim +331 io_uring/rsrc.c

129ce6a148558b Jens Axboe 2022-06-13  313  =

129ce6a148558b Jens Axboe 2022-06-13  314  __cold static int io_rsrc_ref_qu=
iesce(struct io_rsrc_data *data,
129ce6a148558b Jens Axboe 2022-06-13  315  				      struct io_ring_ctx *ct=
x)
129ce6a148558b Jens Axboe 2022-06-13  316  {
129ce6a148558b Jens Axboe 2022-06-13  317  	int ret;
129ce6a148558b Jens Axboe 2022-06-13  318  =

129ce6a148558b Jens Axboe 2022-06-13  319  	/* As we may drop ->uring_lock,=
 other task may have started quiesce */
129ce6a148558b Jens Axboe 2022-06-13  320  	if (data->quiesce)
129ce6a148558b Jens Axboe 2022-06-13  321  		return -ENXIO;
129ce6a148558b Jens Axboe 2022-06-13  322  =

129ce6a148558b Jens Axboe 2022-06-13  323  	data->quiesce =3D true;
129ce6a148558b Jens Axboe 2022-06-13  324  	do {
129ce6a148558b Jens Axboe 2022-06-13  325  		ret =3D io_rsrc_node_switch_st=
art(ctx);
129ce6a148558b Jens Axboe 2022-06-13  326  		if (ret)
129ce6a148558b Jens Axboe 2022-06-13  327  			break;
129ce6a148558b Jens Axboe 2022-06-13  328  		io_rsrc_node_switch(ctx, data);
129ce6a148558b Jens Axboe 2022-06-13  329  =

129ce6a148558b Jens Axboe 2022-06-13  330  		/* kill initial ref, already q=
uiesced if zero */
129ce6a148558b Jens Axboe 2022-06-13 @331  		if (atomic_dec_and_test(&data-=
>refs))
129ce6a148558b Jens Axboe 2022-06-13  332  			break;
129ce6a148558b Jens Axboe 2022-06-13  333  		mutex_unlock(&ctx->uring_lock);
129ce6a148558b Jens Axboe 2022-06-13 @334  		flush_delayed_work(&ctx->rsrc_=
put_work);
129ce6a148558b Jens Axboe 2022-06-13  335  		ret =3D wait_for_completion_in=
terruptible(&data->done);
129ce6a148558b Jens Axboe 2022-06-13  336  		if (!ret) {
129ce6a148558b Jens Axboe 2022-06-13  337  			mutex_lock(&ctx->uring_lock);
129ce6a148558b Jens Axboe 2022-06-13  338  			if (atomic_read(&data->refs) =
> 0) {
129ce6a148558b Jens Axboe 2022-06-13  339  				/*
129ce6a148558b Jens Axboe 2022-06-13  340  				 * it has been revived by an=
other thread while
129ce6a148558b Jens Axboe 2022-06-13  341  				 * we were unlocked
129ce6a148558b Jens Axboe 2022-06-13  342  				 */
129ce6a148558b Jens Axboe 2022-06-13  343  				mutex_unlock(&ctx->uring_loc=
k);
129ce6a148558b Jens Axboe 2022-06-13  344  			} else {
129ce6a148558b Jens Axboe 2022-06-13  345  				break;
129ce6a148558b Jens Axboe 2022-06-13  346  			}
129ce6a148558b Jens Axboe 2022-06-13  347  		}
129ce6a148558b Jens Axboe 2022-06-13  348  =

129ce6a148558b Jens Axboe 2022-06-13  349  		atomic_inc(&data->refs);
129ce6a148558b Jens Axboe 2022-06-13  350  		/* wait for all works potentia=
lly completing data->done */
129ce6a148558b Jens Axboe 2022-06-13  351  		flush_delayed_work(&ctx->rsrc_=
put_work);
129ce6a148558b Jens Axboe 2022-06-13  352  		reinit_completion(&data->done);
129ce6a148558b Jens Axboe 2022-06-13  353  =

129ce6a148558b Jens Axboe 2022-06-13  354  		ret =3D io_run_task_work_sig();
129ce6a148558b Jens Axboe 2022-06-13  355  		mutex_lock(&ctx->uring_lock);
129ce6a148558b Jens Axboe 2022-06-13  356  	} while (ret >=3D 0);
129ce6a148558b Jens Axboe 2022-06-13  357  	data->quiesce =3D false;
129ce6a148558b Jens Axboe 2022-06-13  358  =

129ce6a148558b Jens Axboe 2022-06-13  359  	return ret;
129ce6a148558b Jens Axboe 2022-06-13  360  }
129ce6a148558b Jens Axboe 2022-06-13  361  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4325840723889615981==--

