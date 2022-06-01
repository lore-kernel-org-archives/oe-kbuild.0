Content-Type: multipart/mixed; boundary="===============7102468878701760114=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/media/platform/renesas/rcar_drif.c:585:31: warning: Access to field 'addr' results in a dereference of an undefined pointer value [clang-analyzer-core.NullDereference]
Date: Thu, 02 Jun 2022 03:05:23 +0800
Message-ID: <202206020308.16xg6mSC-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7102468878701760114==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: drivers/m=
edia/platform/renesas/rcar_drif.c:585:31: warning: Access to field 'addr' r=
esults in a dereference of an undefined pointer value [clang-analyzer-core.=
NullDereference]"
:::::: =


CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media(a)vger.kernel.org
CC: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   700170bf6b4d773e328fa54ebb70ba444007c702
commit: ee4a77a32b39064fdab0aa2b36bbd35ebf57e077 media: platform: place Ren=
esas drivers on a separate dir
date:   3 months ago
:::::: branch date: 19 hours ago
:::::: commit date: 3 months ago
config: arm-randconfig-c002-20220531 (https://download.01.org/0day-ci/archi=
ve/20220602/202206020308.16xg6mSC-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c825ab=
d6b0198fb088d9752f556a70705bc99dfd)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Dee4a77a32b39064fdab0aa2b36bbd35ebf57e077
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout ee4a77a32b39064fdab0aa2b36bbd35ebf57e077
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^
   drivers/gpu/drm/meson/meson_crtc.c:335:7: note: Assuming field 'osd1_afb=
cd' is false
                   if (priv->viu.osd1_afbcd) {
                       ^~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/meson/meson_crtc.c:335:3: note: Taking false branch
                   if (priv->viu.osd1_afbcd) {
                   ^
   drivers/gpu/drm/meson/meson_crtc.c:339:8: note: Assuming field 'disable_=
osd1_afbc' is non-null
                           if (meson_crtc->disable_osd1_afbc)
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/meson/meson_crtc.c:339:4: note: Taking true branch
                           if (meson_crtc->disable_osd1_afbc)
                           ^
   drivers/gpu/drm/meson/meson_crtc.c:340:5: note: Value assigned to field =
'ops'
                                   meson_crtc->disable_osd1_afbc(priv);
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/meson/meson_crtc.c:341:8: note: Assuming field 'ops' is =
null
                           if (priv->afbcd.ops) {
                               ^~~~~~~~~~~~~~~
   drivers/gpu/drm/meson/meson_crtc.c:341:4: note: Taking false branch
                           if (priv->afbcd.ops) {
                           ^
   drivers/gpu/drm/meson/meson_crtc.c:369:7: note: Assuming field 'osd1_afb=
cd' is true
                   if (!priv->viu.osd1_afbcd)
                       ^~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/meson/meson_crtc.c:369:3: note: Taking false branch
                   if (!priv->viu.osd1_afbcd)
                   ^
   drivers/gpu/drm/meson/meson_crtc.c:378:7: note: Assuming field 'enable_o=
sd1' is null
                   if (meson_crtc->enable_osd1)
                       ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/meson/meson_crtc.c:378:3: note: Taking false branch
                   if (meson_crtc->enable_osd1)
                   ^
   drivers/gpu/drm/meson/meson_crtc.c:381:17: note: Field 'osd1_afbcd' is t=
rue
                   if (priv->viu.osd1_afbcd) {
                                 ^
   drivers/gpu/drm/meson/meson_crtc.c:381:3: note: Taking true branch
                   if (priv->viu.osd1_afbcd) {
                   ^
   drivers/gpu/drm/meson/meson_crtc.c:382:4: note: Access to field 'reset' =
results in a dereference of a null pointer (loaded from field 'ops')
                           priv->afbcd.ops->reset(priv);
                           ^           ~~~
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   7 warnings generated.
   Suppressed 7 warnings (7 with check filters).
   1 warning generated.
   include/linux/list.h:137:13: warning: Use of memory after it is freed [c=
lang-analyzer-unix.Malloc]
           __list_del(entry->prev, entry->next);
                      ^
   drivers/dma/ti/omap-dma.c:1847:6: note: Assuming field 'may_lose_context=
' is 0
           if (od->cfg->may_lose_context)
               ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/dma/ti/omap-dma.c:1847:2: note: Taking false branch
           if (od->cfg->may_lose_context)
           ^
   drivers/dma/ti/omap-dma.c:1850:6: note: Assuming field 'of_node' is null
           if (pdev->dev.of_node)
               ^~~~~~~~~~~~~~~~~
   drivers/dma/ti/omap-dma.c:1850:2: note: Taking false branch
           if (pdev->dev.of_node)
           ^
   drivers/dma/ti/omap-dma.c:1858:6: note: Assuming field 'legacy' is true
           if (!od->legacy) {
               ^~~~~~~~~~~
   drivers/dma/ti/omap-dma.c:1858:2: note: Taking false branch
           if (!od->legacy) {
           ^
   drivers/dma/ti/omap-dma.c:1863:6: note: Assuming field 'll123_supported'=
 is false
           if (od->ll123_supported)
               ^~~~~~~~~~~~~~~~~~~
   drivers/dma/ti/omap-dma.c:1863:2: note: Taking false branch
           if (od->ll123_supported)
           ^
   drivers/dma/ti/omap-dma.c:1866:2: note: Calling 'omap_dma_free'
           omap_dma_free(od);
           ^~~~~~~~~~~~~~~~~
   drivers/dma/ti/omap-dma.c:1515:2: note: Loop condition is true.  Enterin=
g loop body
           while (!list_empty(&od->ddev.channels)) {
           ^
   drivers/dma/ti/omap-dma.c:1521:3: note: Memory is released
                   kfree(c);
                   ^~~~~~~~
   drivers/dma/ti/omap-dma.c:1515:2: note: Loop condition is true.  Enterin=
g loop body
           while (!list_empty(&od->ddev.channels)) {
           ^
   drivers/dma/ti/omap-dma.c:1519:3: note: Calling 'list_del'
                   list_del(&c->vc.chan.device_node);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:148:2: note: Calling '__list_del_entry'
           __list_del_entry(entry);
           ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:134:2: note: Taking false branch
           if (!__list_del_entry_valid(entry))
           ^
   include/linux/list.h:137:13: note: Use of memory after it is freed
           __list_del(entry->prev, entry->next);
                      ^~~~~~~~~~~
   2 warnings generated.
>> drivers/media/platform/renesas/rcar_drif.c:585:31: warning: Access to fi=
eld 'addr' results in a dereference of an undefined pointer value [clang-an=
alyzer-core.NullDereference]
                          i * sdr->hwbuf_size, buf[i]->addr, sdr->hwbuf_siz=
e);
                                               ^~~~~~~~~~~~
   drivers/media/platform/renesas/rcar_drif.c:535:6: note: Assuming the con=
dition is false
           if (!vb2_is_streaming(&sdr->vb_queue)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/renesas/rcar_drif.c:535:2: note: Taking false bra=
nch
           if (!vb2_is_streaming(&sdr->vb_queue)) {
           ^
   drivers/media/platform/renesas/rcar_drif.c:543:6: note: Assuming field '=
num_cur_ch' is not equal to RCAR_DRIF_MAX_CHANNEL
           if (sdr->num_cur_ch =3D=3D RCAR_DRIF_MAX_CHANNEL) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/renesas/rcar_drif.c:543:2: note: Taking false bra=
nch
           if (sdr->num_cur_ch =3D=3D RCAR_DRIF_MAX_CHANNEL) {
           ^
   drivers/media/platform/renesas/rcar_drif.c:565:7: note: Assuming the con=
dition is false
                   if (buf[0]->status & RCAR_DRIF_BUF_OVERFLOW) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/renesas/rcar_drif.c:565:3: note: Taking false bra=
nch
                   if (buf[0]->status & RCAR_DRIF_BUF_OVERFLOW) {
                   ^
   drivers/media/platform/renesas/rcar_drif.c:576:2: note: Taking false bra=
nch
           rdrif_dbg(sdr, "ch%u: prod %u\n", ch->num, produced);
           ^
   drivers/media/platform/renesas/rcar_drif.c:139:2: note: expanded from ma=
cro 'rdrif_dbg'
           dev_dbg(sdr->v4l2_dev.dev, fmt, ## arg)
           ^
   include/linux/dev_printk.h:162:2: note: expanded from macro 'dev_dbg'
           if (0)                                                          \
           ^
   drivers/media/platform/renesas/rcar_drif.c:579:9: note: Calling 'rcar_dr=
if_get_fbuf'
           fbuf =3D rcar_drif_get_fbuf(sdr);
                  ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/renesas/rcar_drif.c:465:2: note: Loop condition i=
s false.  Exiting loop
           spin_lock_irqsave(&sdr->queued_bufs_lock, flags);
           ^
   include/linux/spinlock.h:379:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:264:3: note: expanded from macro 'raw_spin_lock=
_irqsave'
                   _raw_spin_lock_irqsave(lock, flags);    \
                   ^
   include/linux/spinlock_api_up.h:69:45: note: expanded from macro '_raw_s=
pin_lock_irqsave'
   #define _raw_spin_lock_irqsave(lock, flags)     __LOCK_IRQSAVE(lock, fla=
gs)
                                                   ^
   include/linux/spinlock_api_up.h:40:8: note: expanded from macro '__LOCK_=
IRQSAVE'
     do { local_irq_save(flags); __LOCK(lock); } while (0)
          ^
   include/linux/irqflags.h:244:36: note: expanded from macro 'local_irq_sa=
ve'
   #define local_irq_save(flags)   do { raw_local_irq_save(flags); } while =
(0)
                                        ^
   include/linux/irqflags.h:176:2: note: expanded from macro 'raw_local_irq=
_save'
           do {                                            \
           ^
   drivers/media/platform/renesas/rcar_drif.c:465:2: note: Loop condition i=
s false.  Exiting loop
           spin_lock_irqsave(&sdr->queued_bufs_lock, flags);
           ^
   include/linux/spinlock.h:379:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:264:3: note: expanded from macro 'raw_spin_lock=
_irqsave'
                   _raw_spin_lock_irqsave(lock, flags);    \
                   ^
   include/linux/spinlock_api_up.h:69:45: note: expanded from macro '_raw_s=
pin_lock_irqsave'
   #define _raw_spin_lock_irqsave(lock, flags)     __LOCK_IRQSAVE(lock, fla=
gs)
                                                   ^
   include/linux/spinlock_api_up.h:40:8: note: expanded from macro '__LOCK_=
IRQSAVE'
     do { local_irq_save(flags); __LOCK(lock); } while (0)
          ^
   include/linux/irqflags.h:244:31: note: expanded from macro 'local_irq_sa=
ve'
   #define local_irq_save(flags)   do { raw_local_irq_save(flags); } while =
(0)
                                   ^
   drivers/media/platform/renesas/rcar_drif.c:465:2: note: Loop condition i=
s false.  Exiting loop
           spin_lock_irqsave(&sdr->queued_bufs_lock, flags);
           ^
   include/linux/spinlock.h:379:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:264:3: note: expanded from macro 'raw_spin_lock=
_irqsave'
                   _raw_spin_lock_irqsave(lock, flags);    \
                   ^
   include/linux/spinlock_api_up.h:69:45: note: expanded from macro '_raw_s=
pin_lock_irqsave'
   #define _raw_spin_lock_irqsave(lock, flags)     __LOCK_IRQSAVE(lock, fla=
gs)
                                                   ^
   include/linux/spinlock_api_up.h:40:31: note: expanded from macro '__LOCK=
_IRQSAVE'
     do { local_irq_save(flags); __LOCK(lock); } while (0)
                                 ^
   include/linux/spinlock_api_up.h:31:27: note: expanded from macro '__LOCK'
     do { preempt_disable(); ___LOCK(lock); } while (0)
                             ^
   include/linux/spinlock_api_up.h:28:3: note: expanded from macro '___LOCK'
     do { __acquire(lock); (void)(lock); } while (0)
     ^
   drivers/media/platform/renesas/rcar_drif.c:465:2: note: Loop condition i=
s false.  Exiting loop
           spin_lock_irqsave(&sdr->queued_bufs_lock, flags);
           ^
   include/linux/spinlock.h:379:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:264:3: note: expanded from macro 'raw_spin_lock=
_irqsave'
                   _raw_spin_lock_irqsave(lock, flags);    \

vim +/addr +585 drivers/media/platform/renesas/rcar_drif.c

7625ee981af166 drivers/media/platform/rcar_drif.c Ramesh Shanmugasundaram 2=
017-06-12  520  =

7625ee981af166 drivers/media/platform/rcar_drif.c Ramesh Shanmugasundaram 2=
017-06-12  521  /* DMA callback for each stage */
7625ee981af166 drivers/media/platform/rcar_drif.c Ramesh Shanmugasundaram 2=
017-06-12  522  static void rcar_drif_dma_complete(void *dma_async_param)
7625ee981af166 drivers/media/platform/rcar_drif.c Ramesh Shanmugasundaram 2=
017-06-12  523  {
7625ee981af166 drivers/media/platform/rcar_drif.c Ramesh Shanmugasundaram 2=
017-06-12  524  	struct rcar_drif *ch =3D dma_async_param;
7625ee981af166 drivers/media/platform/rcar_drif.c Ramesh Shanmugasundaram 2=
017-06-12  525  	struct rcar_drif_sdr *sdr =3D ch->sdr;
7625ee981af166 drivers/media/platform/rcar_drif.c Ramesh Shanmugasundaram 2=
017-06-12  526  	struct rcar_drif_hwbuf *buf[RCAR_DRIF_MAX_CHANNEL];
7625ee981af166 drivers/media/platform/rcar_drif.c Ramesh Shanmugasundaram 2=
017-06-12  527  	struct rcar_drif_frame_buf *fbuf;
7625ee981af166 drivers/media/platform/rcar_drif.c Ramesh Shanmugasundaram 2=
017-06-12  528  	bool overflow =3D false;
7625ee981af166 drivers/media/platform/rcar_drif.c Ramesh Shanmugasundaram 2=
017-06-12  529  	u32 idx, produced;
7625ee981af166 drivers/media/platform/rcar_drif.c Ramesh Shanmugasundaram 2=
017-06-12  530  	unsigned int i;
7625ee981af166 drivers/media/platform/rcar_drif.c Ramesh Shanmugasundaram 2=
017-06-12  531  =

7625ee981af166 drivers/media/platform/rcar_drif.c Ramesh Shanmugasundaram 2=
017-06-12  532  	spin_lock(&sdr->dma_lock);
7625ee981af166 drivers/media/platform/rcar_drif.c Ramesh Shanmugasundaram 2=
017-06-12  533  =

7625ee981af166 drivers/media/platform/rcar_drif.c Ramesh Shanmugasundaram 2=
017-06-12  534  	/* DMA can be terminated while the callback was waiting on=
 lock */
7625ee981af166 drivers/media/platform/rcar_drif.c Ramesh Shanmugasundaram 2=
017-06-12  535  	if (!vb2_is_streaming(&sdr->vb_queue)) {
7625ee981af166 drivers/media/platform/rcar_drif.c Ramesh Shanmugasundaram 2=
017-06-12  536  		spin_unlock(&sdr->dma_lock);
7625ee981af166 drivers/media/platform/rcar_drif.c Ramesh Shanmugasundaram 2=
017-06-12  537  		return;
7625ee981af166 drivers/media/platform/rcar_drif.c Ramesh Shanmugasundaram 2=
017-06-12  538  	}
7625ee981af166 drivers/media/platform/rcar_drif.c Ramesh Shanmugasundaram 2=
017-06-12  539  =

7625ee981af166 drivers/media/platform/rcar_drif.c Ramesh Shanmugasundaram 2=
017-06-12  540  	idx =3D sdr->produced % RCAR_DRIF_NUM_HWBUFS;
7625ee981af166 drivers/media/platform/rcar_drif.c Ramesh Shanmugasundaram 2=
017-06-12  541  	rcar_drif_channel_complete(ch, idx);
7625ee981af166 drivers/media/platform/rcar_drif.c Ramesh Shanmugasundaram 2=
017-06-12  542  =

7625ee981af166 drivers/media/platform/rcar_drif.c Ramesh Shanmugasundaram 2=
017-06-12  543  	if (sdr->num_cur_ch =3D=3D RCAR_DRIF_MAX_CHANNEL) {
7625ee981af166 drivers/media/platform/rcar_drif.c Ramesh Shanmugasundaram 2=
017-06-12  544  		buf[0] =3D ch->num ? to_rcar_drif_buf_pair(sdr, ch->num, =
idx) :
7625ee981af166 drivers/media/platform/rcar_drif.c Ramesh Shanmugasundaram 2=
017-06-12  545  				&ch->buf[idx];
7625ee981af166 drivers/media/platform/rcar_drif.c Ramesh Shanmugasundaram 2=
017-06-12  546  		buf[1] =3D ch->num ? &ch->buf[idx] :
7625ee981af166 drivers/media/platform/rcar_drif.c Ramesh Shanmugasundaram 2=
017-06-12  547  				to_rcar_drif_buf_pair(sdr, ch->num, idx);
7625ee981af166 drivers/media/platform/rcar_drif.c Ramesh Shanmugasundaram 2=
017-06-12  548  =

7625ee981af166 drivers/media/platform/rcar_drif.c Ramesh Shanmugasundaram 2=
017-06-12  549  		/* Check if both DMA buffers are done */
7625ee981af166 drivers/media/platform/rcar_drif.c Ramesh Shanmugasundaram 2=
017-06-12  550  		if (!rcar_drif_bufs_done(buf)) {
7625ee981af166 drivers/media/platform/rcar_drif.c Ramesh Shanmugasundaram 2=
017-06-12  551  			spin_unlock(&sdr->dma_lock);
7625ee981af166 drivers/media/platform/rcar_drif.c Ramesh Shanmugasundaram 2=
017-06-12  552  			return;
7625ee981af166 drivers/media/platform/rcar_drif.c Ramesh Shanmugasundaram 2=
017-06-12  553  		}
7625ee981af166 drivers/media/platform/rcar_drif.c Ramesh Shanmugasundaram 2=
017-06-12  554  =

7625ee981af166 drivers/media/platform/rcar_drif.c Ramesh Shanmugasundaram 2=
017-06-12  555  		/* Clear buf done status */
7625ee981af166 drivers/media/platform/rcar_drif.c Ramesh Shanmugasundaram 2=
017-06-12  556  		rcar_drif_bufs_clear(buf, RCAR_DRIF_BUF_DONE);
7625ee981af166 drivers/media/platform/rcar_drif.c Ramesh Shanmugasundaram 2=
017-06-12  557  =

7625ee981af166 drivers/media/platform/rcar_drif.c Ramesh Shanmugasundaram 2=
017-06-12  558  		if (rcar_drif_bufs_overflow(buf)) {
7625ee981af166 drivers/media/platform/rcar_drif.c Ramesh Shanmugasundaram 2=
017-06-12  559  			overflow =3D true;
7625ee981af166 drivers/media/platform/rcar_drif.c Ramesh Shanmugasundaram 2=
017-06-12  560  			/* Clear the flag in status */
7625ee981af166 drivers/media/platform/rcar_drif.c Ramesh Shanmugasundaram 2=
017-06-12  561  			rcar_drif_bufs_clear(buf, RCAR_DRIF_BUF_OVERFLOW);
7625ee981af166 drivers/media/platform/rcar_drif.c Ramesh Shanmugasundaram 2=
017-06-12  562  		}
7625ee981af166 drivers/media/platform/rcar_drif.c Ramesh Shanmugasundaram 2=
017-06-12  563  	} else {
7625ee981af166 drivers/media/platform/rcar_drif.c Ramesh Shanmugasundaram 2=
017-06-12  564  		buf[0] =3D &ch->buf[idx];
7625ee981af166 drivers/media/platform/rcar_drif.c Ramesh Shanmugasundaram 2=
017-06-12  565  		if (buf[0]->status & RCAR_DRIF_BUF_OVERFLOW) {
7625ee981af166 drivers/media/platform/rcar_drif.c Ramesh Shanmugasundaram 2=
017-06-12  566  			overflow =3D true;
7625ee981af166 drivers/media/platform/rcar_drif.c Ramesh Shanmugasundaram 2=
017-06-12  567  			/* Clear the flag in status */
7625ee981af166 drivers/media/platform/rcar_drif.c Ramesh Shanmugasundaram 2=
017-06-12  568  			buf[0]->status &=3D ~RCAR_DRIF_BUF_OVERFLOW;
7625ee981af166 drivers/media/platform/rcar_drif.c Ramesh Shanmugasundaram 2=
017-06-12  569  		}
7625ee981af166 drivers/media/platform/rcar_drif.c Ramesh Shanmugasundaram 2=
017-06-12  570  	}
7625ee981af166 drivers/media/platform/rcar_drif.c Ramesh Shanmugasundaram 2=
017-06-12  571  =

7625ee981af166 drivers/media/platform/rcar_drif.c Ramesh Shanmugasundaram 2=
017-06-12  572  	/* Buffer produced for consumption */
7625ee981af166 drivers/media/platform/rcar_drif.c Ramesh Shanmugasundaram 2=
017-06-12  573  	produced =3D sdr->produced++;
7625ee981af166 drivers/media/platform/rcar_drif.c Ramesh Shanmugasundaram 2=
017-06-12  574  	spin_unlock(&sdr->dma_lock);
7625ee981af166 drivers/media/platform/rcar_drif.c Ramesh Shanmugasundaram 2=
017-06-12  575  =

7625ee981af166 drivers/media/platform/rcar_drif.c Ramesh Shanmugasundaram 2=
017-06-12  576  	rdrif_dbg(sdr, "ch%u: prod %u\n", ch->num, produced);
7625ee981af166 drivers/media/platform/rcar_drif.c Ramesh Shanmugasundaram 2=
017-06-12  577  =

7625ee981af166 drivers/media/platform/rcar_drif.c Ramesh Shanmugasundaram 2=
017-06-12  578  	/* Get fbuf */
7625ee981af166 drivers/media/platform/rcar_drif.c Ramesh Shanmugasundaram 2=
017-06-12  579  	fbuf =3D rcar_drif_get_fbuf(sdr);
7625ee981af166 drivers/media/platform/rcar_drif.c Ramesh Shanmugasundaram 2=
017-06-12  580  	if (!fbuf)
7625ee981af166 drivers/media/platform/rcar_drif.c Ramesh Shanmugasundaram 2=
017-06-12  581  		return;
7625ee981af166 drivers/media/platform/rcar_drif.c Ramesh Shanmugasundaram 2=
017-06-12  582  =

7625ee981af166 drivers/media/platform/rcar_drif.c Ramesh Shanmugasundaram 2=
017-06-12  583  	for (i =3D 0; i < RCAR_DRIF_MAX_CHANNEL; i++)
7625ee981af166 drivers/media/platform/rcar_drif.c Ramesh Shanmugasundaram 2=
017-06-12  584  		memcpy(vb2_plane_vaddr(&fbuf->vb.vb2_buf, 0) +
7625ee981af166 drivers/media/platform/rcar_drif.c Ramesh Shanmugasundaram 2=
017-06-12 @585  		       i * sdr->hwbuf_size, buf[i]->addr, sdr->hwbuf_size=
);
7625ee981af166 drivers/media/platform/rcar_drif.c Ramesh Shanmugasundaram 2=
017-06-12  586  =

7625ee981af166 drivers/media/platform/rcar_drif.c Ramesh Shanmugasundaram 2=
017-06-12  587  	fbuf->vb.field =3D V4L2_FIELD_NONE;
7625ee981af166 drivers/media/platform/rcar_drif.c Ramesh Shanmugasundaram 2=
017-06-12  588  	fbuf->vb.sequence =3D produced;
7625ee981af166 drivers/media/platform/rcar_drif.c Ramesh Shanmugasundaram 2=
017-06-12  589  	fbuf->vb.vb2_buf.timestamp =3D ktime_get_ns();
7625ee981af166 drivers/media/platform/rcar_drif.c Ramesh Shanmugasundaram 2=
017-06-12  590  	vb2_set_plane_payload(&fbuf->vb.vb2_buf, 0, sdr->fmt->buff=
ersize);
7625ee981af166 drivers/media/platform/rcar_drif.c Ramesh Shanmugasundaram 2=
017-06-12  591  =

7625ee981af166 drivers/media/platform/rcar_drif.c Ramesh Shanmugasundaram 2=
017-06-12  592  	/* Set error state on overflow */
7625ee981af166 drivers/media/platform/rcar_drif.c Ramesh Shanmugasundaram 2=
017-06-12  593  	vb2_buffer_done(&fbuf->vb.vb2_buf,
7625ee981af166 drivers/media/platform/rcar_drif.c Ramesh Shanmugasundaram 2=
017-06-12  594  			overflow ? VB2_BUF_STATE_ERROR : VB2_BUF_STATE_DONE);
7625ee981af166 drivers/media/platform/rcar_drif.c Ramesh Shanmugasundaram 2=
017-06-12  595  }
7625ee981af166 drivers/media/platform/rcar_drif.c Ramesh Shanmugasundaram 2=
017-06-12  596  =


:::::: The code at line 585 was first introduced by commit
:::::: 7625ee981af166ddb569e2e6c0006e2af471326f [media] media: platform: rc=
ar_drif: Add DRIF support

:::::: TO: Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.co=
m>
:::::: CC: Mauro Carvalho Chehab <mchehab@s-opensource.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7102468878701760114==--

