Content-Type: multipart/mixed; boundary="===============3911416745408625211=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/media/platform/s5p-mfc/s5p_mfc.c:689:3: warning: Either the condition 'if(ctx)' is redundant or there is possible null pointer dereference: ctx.
Date: Wed, 20 Jan 2021 03:32:16 +0800
Message-ID: <202101200357.K1Hnr21C-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3911416745408625211==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media(a)vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   1e2a199f6ccdc15cf111d68d212e2fd4ce65682e
commit: a19f228b8dd9a67e8de4ebd4eac8a4c94ec39d1a media: Kconfig: not all V4=
L2 platform drivers are for camera
date:   9 months ago
:::::: branch date: 24 hours ago
:::::: commit date: 9 months ago
compiler: arm-linux-gnueabi-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/media/platform/s5p-mfc/s5p_mfc.c:689:3: warning: Either the cond=
ition 'if(ctx)' is redundant or there is possible null pointer dereference:=
 ctx. [nullPointerRedundantCheck]
     ctx->inst_no =3D s5p_mfc_hw_call(dev->mfc_ops, get_inst_no, dev);
     ^
   drivers/media/platform/s5p-mfc/s5p_mfc.c:702:6: note: Assuming that cond=
ition 'if(ctx)' is not redundant
     if (ctx)
        ^
   drivers/media/platform/s5p-mfc/s5p_mfc.c:689:3: note: Null pointer deref=
erence
     ctx->inst_no =3D s5p_mfc_hw_call(dev->mfc_ops, get_inst_no, dev);
     ^
   drivers/media/platform/s5p-mfc/s5p_mfc.c:690:3: warning: Either the cond=
ition 'if(ctx)' is redundant or there is possible null pointer dereference:=
 ctx. [nullPointerRedundantCheck]
     ctx->state =3D MFCINST_GOT_INST;
     ^
   drivers/media/platform/s5p-mfc/s5p_mfc.c:702:6: note: Assuming that cond=
ition 'if(ctx)' is not redundant
     if (ctx)
        ^
   drivers/media/platform/s5p-mfc/s5p_mfc.c:690:3: note: Null pointer deref=
erence
     ctx->state =3D MFCINST_GOT_INST;
     ^
   drivers/media/platform/s5p-mfc/s5p_mfc.c:694:3: warning: Either the cond=
ition 'if(ctx)' is redundant or there is possible null pointer dereference:=
 ctx. [nullPointerRedundantCheck]
     ctx->inst_no =3D MFC_NO_INSTANCE_SET;
     ^
   drivers/media/platform/s5p-mfc/s5p_mfc.c:702:6: note: Assuming that cond=
ition 'if(ctx)' is not redundant
     if (ctx)
        ^
   drivers/media/platform/s5p-mfc/s5p_mfc.c:694:3: note: Null pointer deref=
erence
     ctx->inst_no =3D MFC_NO_INSTANCE_SET;
     ^
   drivers/media/platform/s5p-mfc/s5p_mfc.c:695:3: warning: Either the cond=
ition 'if(ctx)' is redundant or there is possible null pointer dereference:=
 ctx. [nullPointerRedundantCheck]
     ctx->state =3D MFCINST_FREE;
     ^
   drivers/media/platform/s5p-mfc/s5p_mfc.c:702:6: note: Assuming that cond=
ition 'if(ctx)' is not redundant
     if (ctx)
        ^
   drivers/media/platform/s5p-mfc/s5p_mfc.c:695:3: note: Null pointer deref=
erence
     ctx->state =3D MFCINST_FREE;
     ^

vim +689 drivers/media/platform/s5p-mfc/s5p_mfc.c

f9f715a95d07d386 drivers/media/platform/s5p-mfc/s5p_mfc.c Andrzej Hajda    =
 2012-08-21  628  =

af935746781088f2 drivers/media/video/s5p-mfc/s5p_mfc.c    Kamil Debski     =
 2011-06-21  629  /* Interrupt processing */
af935746781088f2 drivers/media/video/s5p-mfc/s5p_mfc.c    Kamil Debski     =
 2011-06-21  630  static irqreturn_t s5p_mfc_irq(int irq, void *priv)
af935746781088f2 drivers/media/video/s5p-mfc/s5p_mfc.c    Kamil Debski     =
 2011-06-21  631  {
af935746781088f2 drivers/media/video/s5p-mfc/s5p_mfc.c    Kamil Debski     =
 2011-06-21  632  	struct s5p_mfc_dev *dev =3D priv;
af935746781088f2 drivers/media/video/s5p-mfc/s5p_mfc.c    Kamil Debski     =
 2011-06-21  633  	struct s5p_mfc_ctx *ctx;
af935746781088f2 drivers/media/video/s5p-mfc/s5p_mfc.c    Kamil Debski     =
 2011-06-21  634  	unsigned int reason;
af935746781088f2 drivers/media/video/s5p-mfc/s5p_mfc.c    Kamil Debski     =
 2011-06-21  635  	unsigned int err;
af935746781088f2 drivers/media/video/s5p-mfc/s5p_mfc.c    Kamil Debski     =
 2011-06-21  636  =

af935746781088f2 drivers/media/video/s5p-mfc/s5p_mfc.c    Kamil Debski     =
 2011-06-21  637  	mfc_debug_enter();
af935746781088f2 drivers/media/video/s5p-mfc/s5p_mfc.c    Kamil Debski     =
 2011-06-21  638  	/* Reset the timeout watchdog */
af935746781088f2 drivers/media/video/s5p-mfc/s5p_mfc.c    Kamil Debski     =
 2011-06-21  639  	atomic_set(&dev->watchdog_cnt, 0);
7969b12523668d76 drivers/media/platform/s5p-mfc/s5p_mfc.c Andrzej Hajda    =
 2015-12-02  640  	spin_lock(&dev->irqlock);
af935746781088f2 drivers/media/video/s5p-mfc/s5p_mfc.c    Kamil Debski     =
 2011-06-21  641  	ctx =3D dev->ctx[dev->curr_ctx];
af935746781088f2 drivers/media/video/s5p-mfc/s5p_mfc.c    Kamil Debski     =
 2011-06-21  642  	/* Get the reason of interrupt and the error code */
43a1ea1f90382a6a drivers/media/platform/s5p-mfc/s5p_mfc.c Arun Kumar K     =
 2012-10-03  643  	reason =3D s5p_mfc_hw_call(dev->mfc_ops, get_int_reason,=
 dev);
43a1ea1f90382a6a drivers/media/platform/s5p-mfc/s5p_mfc.c Arun Kumar K     =
 2012-10-03  644  	err =3D s5p_mfc_hw_call(dev->mfc_ops, get_int_err, dev);
af935746781088f2 drivers/media/video/s5p-mfc/s5p_mfc.c    Kamil Debski     =
 2011-06-21  645  	mfc_debug(1, "Int reason: %d (err: %08x)\n", reason, err=
);
af935746781088f2 drivers/media/video/s5p-mfc/s5p_mfc.c    Kamil Debski     =
 2011-06-21  646  	switch (reason) {
43a1ea1f90382a6a drivers/media/platform/s5p-mfc/s5p_mfc.c Arun Kumar K     =
 2012-10-03  647  	case S5P_MFC_R2H_CMD_ERR_RET:
39c1cb2b191f56a9 drivers/media/platform/s5p-mfc/s5p_mfc.c Jonathan McCrohan=
 2013-10-20  648  		/* An error has occurred */
af935746781088f2 drivers/media/video/s5p-mfc/s5p_mfc.c    Kamil Debski     =
 2011-06-21  649  		if (ctx->state =3D=3D MFCINST_RUNNING &&
5d1ec73184e657fb drivers/media/platform/s5p-mfc/s5p_mfc.c Donghwa Lee      =
 2016-11-10  650  			(s5p_mfc_hw_call(dev->mfc_ops, err_dec, err) >=3D
5d1ec73184e657fb drivers/media/platform/s5p-mfc/s5p_mfc.c Donghwa Lee      =
 2016-11-10  651  				dev->warn_start ||
5d1ec73184e657fb drivers/media/platform/s5p-mfc/s5p_mfc.c Donghwa Lee      =
 2016-11-10  652  				err =3D=3D S5P_FIMV_ERR_NO_VALID_SEQ_HDR ||
5d1ec73184e657fb drivers/media/platform/s5p-mfc/s5p_mfc.c Donghwa Lee      =
 2016-11-10  653  				err =3D=3D S5P_FIMV_ERR_INCOMPLETE_FRAME ||
5d1ec73184e657fb drivers/media/platform/s5p-mfc/s5p_mfc.c Donghwa Lee      =
 2016-11-10  654  				err =3D=3D S5P_FIMV_ERR_TIMEOUT))
af935746781088f2 drivers/media/video/s5p-mfc/s5p_mfc.c    Kamil Debski     =
 2011-06-21  655  			s5p_mfc_handle_frame(ctx, reason, err);
af935746781088f2 drivers/media/video/s5p-mfc/s5p_mfc.c    Kamil Debski     =
 2011-06-21  656  		else
7296e25f6e76bedc drivers/media/platform/s5p-mfc/s5p_mfc.c Kamil Debski     =
 2012-12-21  657  			s5p_mfc_handle_error(dev, ctx, reason, err);
af935746781088f2 drivers/media/video/s5p-mfc/s5p_mfc.c    Kamil Debski     =
 2011-06-21  658  		clear_bit(0, &dev->enter_suspend);
af935746781088f2 drivers/media/video/s5p-mfc/s5p_mfc.c    Kamil Debski     =
 2011-06-21  659  		break;
af935746781088f2 drivers/media/video/s5p-mfc/s5p_mfc.c    Kamil Debski     =
 2011-06-21  660  =

43a1ea1f90382a6a drivers/media/platform/s5p-mfc/s5p_mfc.c Arun Kumar K     =
 2012-10-03  661  	case S5P_MFC_R2H_CMD_SLICE_DONE_RET:
43a1ea1f90382a6a drivers/media/platform/s5p-mfc/s5p_mfc.c Arun Kumar K     =
 2012-10-03  662  	case S5P_MFC_R2H_CMD_FIELD_DONE_RET:
43a1ea1f90382a6a drivers/media/platform/s5p-mfc/s5p_mfc.c Arun Kumar K     =
 2012-10-03  663  	case S5P_MFC_R2H_CMD_FRAME_DONE_RET:
af935746781088f2 drivers/media/video/s5p-mfc/s5p_mfc.c    Kamil Debski     =
 2011-06-21  664  		if (ctx->c_ops->post_frame_start) {
af935746781088f2 drivers/media/video/s5p-mfc/s5p_mfc.c    Kamil Debski     =
 2011-06-21  665  			if (ctx->c_ops->post_frame_start(ctx))
af935746781088f2 drivers/media/video/s5p-mfc/s5p_mfc.c    Kamil Debski     =
 2011-06-21  666  				mfc_err("post_frame_start() failed\n");
96c57776cd375ae1 drivers/media/platform/s5p-mfc/s5p_mfc.c Andrzej Hajda    =
 2015-10-07  667  =

96c57776cd375ae1 drivers/media/platform/s5p-mfc/s5p_mfc.c Andrzej Hajda    =
 2015-10-07  668  			if (ctx->state =3D=3D MFCINST_FINISHING &&
96c57776cd375ae1 drivers/media/platform/s5p-mfc/s5p_mfc.c Andrzej Hajda    =
 2015-10-07  669  						list_empty(&ctx->ref_queue)) {
fdd1d4b0a08d6d85 drivers/media/platform/s5p-mfc/s5p_mfc.c Andrzej Hajda    =
 2015-12-02  670  				s5p_mfc_hw_call(dev->mfc_ops, clear_int_flags, dev);
96c57776cd375ae1 drivers/media/platform/s5p-mfc/s5p_mfc.c Andrzej Hajda    =
 2015-10-07  671  				s5p_mfc_handle_stream_complete(ctx);
96c57776cd375ae1 drivers/media/platform/s5p-mfc/s5p_mfc.c Andrzej Hajda    =
 2015-10-07  672  				break;
96c57776cd375ae1 drivers/media/platform/s5p-mfc/s5p_mfc.c Andrzej Hajda    =
 2015-10-07  673  			}
fdd1d4b0a08d6d85 drivers/media/platform/s5p-mfc/s5p_mfc.c Andrzej Hajda    =
 2015-12-02  674  			s5p_mfc_hw_call(dev->mfc_ops, clear_int_flags, dev);
9a7bc6b0c456bdc6 drivers/media/platform/s5p-mfc/s5p_mfc.c Pawel Osciak     =
 2014-10-21  675  			WARN_ON(test_and_clear_bit(0, &dev->hw_lock) =3D=3D 0);
af935746781088f2 drivers/media/video/s5p-mfc/s5p_mfc.c    Kamil Debski     =
 2011-06-21  676  			s5p_mfc_clock_off();
0c32b8ec02832df1 drivers/media/platform/s5p-mfc/s5p_mfc.c Marek Szyprowski =
 2017-02-23  677  			wake_up_ctx(ctx, reason, err);
fdd1d4b0a08d6d85 drivers/media/platform/s5p-mfc/s5p_mfc.c Andrzej Hajda    =
 2015-12-02  678  			s5p_mfc_hw_call(dev->mfc_ops, try_run, dev);
af935746781088f2 drivers/media/video/s5p-mfc/s5p_mfc.c    Kamil Debski     =
 2011-06-21  679  		} else {
af935746781088f2 drivers/media/video/s5p-mfc/s5p_mfc.c    Kamil Debski     =
 2011-06-21  680  			s5p_mfc_handle_frame(ctx, reason, err);
af935746781088f2 drivers/media/video/s5p-mfc/s5p_mfc.c    Kamil Debski     =
 2011-06-21  681  		}
af935746781088f2 drivers/media/video/s5p-mfc/s5p_mfc.c    Kamil Debski     =
 2011-06-21  682  		break;
af935746781088f2 drivers/media/video/s5p-mfc/s5p_mfc.c    Kamil Debski     =
 2011-06-21  683  =

43a1ea1f90382a6a drivers/media/platform/s5p-mfc/s5p_mfc.c Arun Kumar K     =
 2012-10-03  684  	case S5P_MFC_R2H_CMD_SEQ_DONE_RET:
af935746781088f2 drivers/media/video/s5p-mfc/s5p_mfc.c    Kamil Debski     =
 2011-06-21  685  		s5p_mfc_handle_seq_done(ctx, reason, err);
af935746781088f2 drivers/media/video/s5p-mfc/s5p_mfc.c    Kamil Debski     =
 2011-06-21  686  		break;
af935746781088f2 drivers/media/video/s5p-mfc/s5p_mfc.c    Kamil Debski     =
 2011-06-21  687  =

43a1ea1f90382a6a drivers/media/platform/s5p-mfc/s5p_mfc.c Arun Kumar K     =
 2012-10-03  688  	case S5P_MFC_R2H_CMD_OPEN_INSTANCE_RET:
43a1ea1f90382a6a drivers/media/platform/s5p-mfc/s5p_mfc.c Arun Kumar K     =
 2012-10-03 @689  		ctx->inst_no =3D s5p_mfc_hw_call(dev->mfc_ops, get_inst=
_no, dev);
af935746781088f2 drivers/media/video/s5p-mfc/s5p_mfc.c    Kamil Debski     =
 2011-06-21  690  		ctx->state =3D MFCINST_GOT_INST;
af935746781088f2 drivers/media/video/s5p-mfc/s5p_mfc.c    Kamil Debski     =
 2011-06-21  691  		goto irq_cleanup_hw;
af935746781088f2 drivers/media/video/s5p-mfc/s5p_mfc.c    Kamil Debski     =
 2011-06-21  692  =

43a1ea1f90382a6a drivers/media/platform/s5p-mfc/s5p_mfc.c Arun Kumar K     =
 2012-10-03  693  	case S5P_MFC_R2H_CMD_CLOSE_INSTANCE_RET:
9d87e8375d2f9974 drivers/media/platform/s5p-mfc/s5p_mfc.c Pawel Osciak     =
 2014-05-19  694  		ctx->inst_no =3D MFC_NO_INSTANCE_SET;
af935746781088f2 drivers/media/video/s5p-mfc/s5p_mfc.c    Kamil Debski     =
 2011-06-21  695  		ctx->state =3D MFCINST_FREE;
af935746781088f2 drivers/media/video/s5p-mfc/s5p_mfc.c    Kamil Debski     =
 2011-06-21  696  		goto irq_cleanup_hw;
af935746781088f2 drivers/media/video/s5p-mfc/s5p_mfc.c    Kamil Debski     =
 2011-06-21  697  =

43a1ea1f90382a6a drivers/media/platform/s5p-mfc/s5p_mfc.c Arun Kumar K     =
 2012-10-03  698  	case S5P_MFC_R2H_CMD_SYS_INIT_RET:
43a1ea1f90382a6a drivers/media/platform/s5p-mfc/s5p_mfc.c Arun Kumar K     =
 2012-10-03  699  	case S5P_MFC_R2H_CMD_FW_STATUS_RET:
43a1ea1f90382a6a drivers/media/platform/s5p-mfc/s5p_mfc.c Arun Kumar K     =
 2012-10-03  700  	case S5P_MFC_R2H_CMD_SLEEP_RET:
43a1ea1f90382a6a drivers/media/platform/s5p-mfc/s5p_mfc.c Arun Kumar K     =
 2012-10-03  701  	case S5P_MFC_R2H_CMD_WAKEUP_RET:
af935746781088f2 drivers/media/video/s5p-mfc/s5p_mfc.c    Kamil Debski     =
 2011-06-21  702  		if (ctx)
af935746781088f2 drivers/media/video/s5p-mfc/s5p_mfc.c    Kamil Debski     =
 2011-06-21  703  			clear_work_bit(ctx);
fdd1d4b0a08d6d85 drivers/media/platform/s5p-mfc/s5p_mfc.c Andrzej Hajda    =
 2015-12-02  704  		s5p_mfc_hw_call(dev->mfc_ops, clear_int_flags, dev);
af935746781088f2 drivers/media/video/s5p-mfc/s5p_mfc.c    Kamil Debski     =
 2011-06-21  705  		clear_bit(0, &dev->hw_lock);
af935746781088f2 drivers/media/video/s5p-mfc/s5p_mfc.c    Kamil Debski     =
 2011-06-21  706  		clear_bit(0, &dev->enter_suspend);
0c32b8ec02832df1 drivers/media/platform/s5p-mfc/s5p_mfc.c Marek Szyprowski =
 2017-02-23  707  		wake_up_dev(dev, reason, err);
af935746781088f2 drivers/media/video/s5p-mfc/s5p_mfc.c    Kamil Debski     =
 2011-06-21  708  		break;
af935746781088f2 drivers/media/video/s5p-mfc/s5p_mfc.c    Kamil Debski     =
 2011-06-21  709  =

43a1ea1f90382a6a drivers/media/platform/s5p-mfc/s5p_mfc.c Arun Kumar K     =
 2012-10-03  710  	case S5P_MFC_R2H_CMD_INIT_BUFFERS_RET:
af935746781088f2 drivers/media/video/s5p-mfc/s5p_mfc.c    Kamil Debski     =
 2011-06-21  711  		s5p_mfc_handle_init_buffers(ctx, reason, err);
af935746781088f2 drivers/media/video/s5p-mfc/s5p_mfc.c    Kamil Debski     =
 2011-06-21  712  		break;
f9f715a95d07d386 drivers/media/platform/s5p-mfc/s5p_mfc.c Andrzej Hajda    =
 2012-08-21  713  =

43a1ea1f90382a6a drivers/media/platform/s5p-mfc/s5p_mfc.c Arun Kumar K     =
 2012-10-03  714  	case S5P_MFC_R2H_CMD_COMPLETE_SEQ_RET:
fdd1d4b0a08d6d85 drivers/media/platform/s5p-mfc/s5p_mfc.c Andrzej Hajda    =
 2015-12-02  715  		s5p_mfc_hw_call(dev->mfc_ops, clear_int_flags, dev);
96c57776cd375ae1 drivers/media/platform/s5p-mfc/s5p_mfc.c Andrzej Hajda    =
 2015-10-07  716  		ctx->int_type =3D reason;
96c57776cd375ae1 drivers/media/platform/s5p-mfc/s5p_mfc.c Andrzej Hajda    =
 2015-10-07  717  		ctx->int_err =3D err;
96c57776cd375ae1 drivers/media/platform/s5p-mfc/s5p_mfc.c Andrzej Hajda    =
 2015-10-07  718  		s5p_mfc_handle_stream_complete(ctx);
f9f715a95d07d386 drivers/media/platform/s5p-mfc/s5p_mfc.c Andrzej Hajda    =
 2012-08-21  719  		break;
f9f715a95d07d386 drivers/media/platform/s5p-mfc/s5p_mfc.c Andrzej Hajda    =
 2012-08-21  720  =

8f23cc0222a9fe9c drivers/media/platform/s5p-mfc/s5p_mfc.c Arun Kumar K     =
 2012-11-22  721  	case S5P_MFC_R2H_CMD_DPB_FLUSH_RET:
8f23cc0222a9fe9c drivers/media/platform/s5p-mfc/s5p_mfc.c Arun Kumar K     =
 2012-11-22  722  		ctx->state =3D MFCINST_RUNNING;
8f23cc0222a9fe9c drivers/media/platform/s5p-mfc/s5p_mfc.c Arun Kumar K     =
 2012-11-22  723  		goto irq_cleanup_hw;
8f23cc0222a9fe9c drivers/media/platform/s5p-mfc/s5p_mfc.c Arun Kumar K     =
 2012-11-22  724  =

af935746781088f2 drivers/media/video/s5p-mfc/s5p_mfc.c    Kamil Debski     =
 2011-06-21  725  	default:
af935746781088f2 drivers/media/video/s5p-mfc/s5p_mfc.c    Kamil Debski     =
 2011-06-21  726  		mfc_debug(2, "Unknown int reason\n");
fdd1d4b0a08d6d85 drivers/media/platform/s5p-mfc/s5p_mfc.c Andrzej Hajda    =
 2015-12-02  727  		s5p_mfc_hw_call(dev->mfc_ops, clear_int_flags, dev);
af935746781088f2 drivers/media/video/s5p-mfc/s5p_mfc.c    Kamil Debski     =
 2011-06-21  728  	}
7969b12523668d76 drivers/media/platform/s5p-mfc/s5p_mfc.c Andrzej Hajda    =
 2015-12-02  729  	spin_unlock(&dev->irqlock);
af935746781088f2 drivers/media/video/s5p-mfc/s5p_mfc.c    Kamil Debski     =
 2011-06-21  730  	mfc_debug_leave();
af935746781088f2 drivers/media/video/s5p-mfc/s5p_mfc.c    Kamil Debski     =
 2011-06-21  731  	return IRQ_HANDLED;
af935746781088f2 drivers/media/video/s5p-mfc/s5p_mfc.c    Kamil Debski     =
 2011-06-21  732  irq_cleanup_hw:
fdd1d4b0a08d6d85 drivers/media/platform/s5p-mfc/s5p_mfc.c Andrzej Hajda    =
 2015-12-02  733  	s5p_mfc_hw_call(dev->mfc_ops, clear_int_flags, dev);
af935746781088f2 drivers/media/video/s5p-mfc/s5p_mfc.c    Kamil Debski     =
 2011-06-21  734  	ctx->int_type =3D reason;
af935746781088f2 drivers/media/video/s5p-mfc/s5p_mfc.c    Kamil Debski     =
 2011-06-21  735  	ctx->int_err =3D err;
af935746781088f2 drivers/media/video/s5p-mfc/s5p_mfc.c    Kamil Debski     =
 2011-06-21  736  	ctx->int_cond =3D 1;
af935746781088f2 drivers/media/video/s5p-mfc/s5p_mfc.c    Kamil Debski     =
 2011-06-21  737  	if (test_and_clear_bit(0, &dev->hw_lock) =3D=3D 0)
af935746781088f2 drivers/media/video/s5p-mfc/s5p_mfc.c    Kamil Debski     =
 2011-06-21  738  		mfc_err("Failed to unlock hw\n");
af935746781088f2 drivers/media/video/s5p-mfc/s5p_mfc.c    Kamil Debski     =
 2011-06-21  739  =

af935746781088f2 drivers/media/video/s5p-mfc/s5p_mfc.c    Kamil Debski     =
 2011-06-21  740  	s5p_mfc_clock_off();
0c32b8ec02832df1 drivers/media/platform/s5p-mfc/s5p_mfc.c Marek Szyprowski =
 2017-02-23  741  	clear_work_bit(ctx);
0c32b8ec02832df1 drivers/media/platform/s5p-mfc/s5p_mfc.c Marek Szyprowski =
 2017-02-23  742  	wake_up(&ctx->queue);
af935746781088f2 drivers/media/video/s5p-mfc/s5p_mfc.c    Kamil Debski     =
 2011-06-21  743  =

fdd1d4b0a08d6d85 drivers/media/platform/s5p-mfc/s5p_mfc.c Andrzej Hajda    =
 2015-12-02  744  	s5p_mfc_hw_call(dev->mfc_ops, try_run, dev);
7969b12523668d76 drivers/media/platform/s5p-mfc/s5p_mfc.c Andrzej Hajda    =
 2015-12-02  745  	spin_unlock(&dev->irqlock);
af935746781088f2 drivers/media/video/s5p-mfc/s5p_mfc.c    Kamil Debski     =
 2011-06-21  746  	mfc_debug(2, "Exit via irq_cleanup_hw\n");
af935746781088f2 drivers/media/video/s5p-mfc/s5p_mfc.c    Kamil Debski     =
 2011-06-21  747  	return IRQ_HANDLED;
af935746781088f2 drivers/media/video/s5p-mfc/s5p_mfc.c    Kamil Debski     =
 2011-06-21  748  }
af935746781088f2 drivers/media/video/s5p-mfc/s5p_mfc.c    Kamil Debski     =
 2011-06-21  749  =


:::::: The code at line 689 was first introduced by commit
:::::: 43a1ea1f90382a6a8fcf5ed94835b8518ebdefc8 [media] s5p-mfc: Update MFC=
v5 driver for callback based architecture

:::::: TO: Arun Kumar K <arun.kk@samsung.com>
:::::: CC: Mauro Carvalho Chehab <mchehab@redhat.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3911416745408625211==--

