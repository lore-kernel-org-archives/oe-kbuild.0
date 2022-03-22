Content-Type: multipart/mixed; boundary="===============3382395522399088799=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/scsi/qla2xxx/qla_target.c:2650:34: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
Date: Tue, 22 Mar 2022 19:56:34 +0800
Message-ID: <202203221922.lT4A0xDN-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3382395522399088799==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Quinn Tran <qutran@marvell.com>
CC: "Martin K. Petersen" <martin.petersen@oracle.com>
CC: Hannes Reinecke <hare@suse.de>
CC: Himanshu Madhani <himanshu.madhani@oracle.com>
CC: Larry Wisneski <Larry.Wisneski@marvell.com>
CC: Duane Grigsby <duane.grigsby@marvell.com>
CC: Rick Hicksted Jr <rhicksted@marvell.com>
CC: Nilesh Javali <njavali@marvell.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   b47d5a4f6b8d42f8a8fbe891b36215e4fddc53be
commit: 44d018577f179383ea2c409f3a392e9dbd1a155e scsi: qla2xxx: edif: Add e=
ncryption to I/O path
date:   8 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 8 months ago
config: arm-randconfig-c002-20220312 (https://download.01.org/0day-ci/archi=
ve/20220322/202203221922.lT4A0xDN-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 276ca8=
7382b8f16a65bddac700202924228982f6)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D44d018577f179383ea2c409f3a392e9dbd1a155e
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 44d018577f179383ea2c409f3a392e9dbd1a155e
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:328:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:316:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:306:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/scsi/sg.c:2222:3: note: Calling 'sg_finish_rem_req'
                   sg_finish_rem_req(srp);
                   ^~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/sg.c:1856:2: note: 'sfp' initialized to a null pointer value
           Sg_fd *sfp =3D srp->parentfp;
           ^~~~~~~~~~
   drivers/scsi/sg.c:1859:2: note: Assuming the condition is false
           SCSI_LOG_TIMEOUT(4, sg_printk(KERN_INFO, sfp->parentdp,
           ^
   drivers/scsi/scsi_logging.h:67:9: note: expanded from macro 'SCSI_LOG_TI=
MEOUT'
           SCSI_CHECK_LOGGING(SCSI_LOG_TIMEOUT_SHIFT, SCSI_LOG_TIMEOUT_BITS=
, LEVEL,CMD);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~
   drivers/scsi/scsi_logging.h:49:22: note: expanded from macro 'SCSI_CHECK=
_LOGGING'
           if (unlikely((SCSI_LOG_LEVEL(SHIFT, BITS)) > (LEVEL)))  \
               ~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   drivers/scsi/sg.c:1859:2: note: Taking false branch
           SCSI_LOG_TIMEOUT(4, sg_printk(KERN_INFO, sfp->parentdp,
           ^
   drivers/scsi/scsi_logging.h:67:9: note: expanded from macro 'SCSI_LOG_TI=
MEOUT'
           SCSI_CHECK_LOGGING(SCSI_LOG_TIMEOUT_SHIFT, SCSI_LOG_TIMEOUT_BITS=
, LEVEL,CMD);
           ^
   drivers/scsi/scsi_logging.h:49:9: note: expanded from macro 'SCSI_CHECK_=
LOGGING'
           if (unlikely((SCSI_LOG_LEVEL(SHIFT, BITS)) > (LEVEL)))  \
           ^
   drivers/scsi/sg.c:1859:2: note: Loop condition is false.  Exiting loop
           SCSI_LOG_TIMEOUT(4, sg_printk(KERN_INFO, sfp->parentdp,
           ^
   drivers/scsi/scsi_logging.h:67:9: note: expanded from macro 'SCSI_LOG_TI=
MEOUT'
           SCSI_CHECK_LOGGING(SCSI_LOG_TIMEOUT_SHIFT, SCSI_LOG_TIMEOUT_BITS=
, LEVEL,CMD);
           ^
   drivers/scsi/scsi_logging.h:47:54: note: expanded from macro 'SCSI_CHECK=
_LOGGING'
   #define SCSI_CHECK_LOGGING(SHIFT, BITS, LEVEL, CMD)             \
                                                                   ^
   drivers/scsi/sg.c:1862:6: note: Assuming field 'bio' is null
           if (srp->bio)
               ^~~~~~~~
   drivers/scsi/sg.c:1862:2: note: Taking false branch
           if (srp->bio)
           ^
   drivers/scsi/sg.c:1865:6: note: Assuming field 'rq' is null
           if (srp->rq) {
               ^~~~~~~
   drivers/scsi/sg.c:1865:2: note: Taking false branch
           if (srp->rq) {
           ^
   drivers/scsi/sg.c:1870:6: note: Assuming field 'res_used' is not equal t=
o 0
           if (srp->res_used)
               ^~~~~~~~~~~~~
   drivers/scsi/sg.c:1870:2: note: Taking true branch
           if (srp->res_used)
           ^
   drivers/scsi/sg.c:1871:21: note: Passing null pointer value via 1st para=
meter 'sfp'
                   sg_unlink_reserve(sfp, srp);
                                     ^~~
   drivers/scsi/sg.c:1871:3: note: Calling 'sg_unlink_reserve'
                   sg_unlink_reserve(sfp, srp);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/sg.c:2079:2: note: Taking false branch
           SCSI_LOG_TIMEOUT(4, sg_printk(KERN_INFO, srp->parentfp->parentdp,
           ^
   drivers/scsi/scsi_logging.h:67:9: note: expanded from macro 'SCSI_LOG_TI=
MEOUT'
           SCSI_CHECK_LOGGING(SCSI_LOG_TIMEOUT_SHIFT, SCSI_LOG_TIMEOUT_BITS=
, LEVEL,CMD);
           ^
   drivers/scsi/scsi_logging.h:49:9: note: expanded from macro 'SCSI_CHECK_=
LOGGING'
           if (unlikely((SCSI_LOG_LEVEL(SHIFT, BITS)) > (LEVEL)))  \
           ^
   drivers/scsi/sg.c:2079:2: note: Loop condition is false.  Exiting loop
           SCSI_LOG_TIMEOUT(4, sg_printk(KERN_INFO, srp->parentfp->parentdp,
           ^
   drivers/scsi/scsi_logging.h:67:9: note: expanded from macro 'SCSI_LOG_TI=
MEOUT'
           SCSI_CHECK_LOGGING(SCSI_LOG_TIMEOUT_SHIFT, SCSI_LOG_TIMEOUT_BITS=
, LEVEL,CMD);
           ^
   drivers/scsi/scsi_logging.h:47:54: note: expanded from macro 'SCSI_CHECK=
_LOGGING'
   #define SCSI_CHECK_LOGGING(SHIFT, BITS, LEVEL, CMD)             \
                                                                   ^
   drivers/scsi/sg.c:2089:18: note: Access to field 'res_in_use' results in=
 a dereference of a null pointer (loaded from variable 'sfp')
           sfp->res_in_use =3D 0;
           ~~~             ^
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
>> drivers/scsi/qla2xxx/qla_target.c:2650:34: warning: Dereference of null =
pointer [clang-analyzer-core.NullDereference]
                           prm->cmd->sess->edif.rx_bytes +=3D cmd->bufflen;
                                                         ^
   drivers/scsi/qla2xxx/qla_target.c:3442:2: note: Taking false branch
           if (qlt_pci_map_calc_cnt(&prm) !=3D 0)
           ^
   drivers/scsi/qla2xxx/qla_target.c:3445:6: note: Assuming field 'fw_start=
ed' is not equal to 0
           if (!qpair->fw_started || (cmd->reset_count !=3D qpair->chip_res=
et) ||
               ^~~~~~~~~~~~~~~~~~
   drivers/scsi/qla2xxx/qla_target.c:3445:6: note: Left side of '||' is fal=
se
   drivers/scsi/qla2xxx/qla_target.c:3445:29: note: Assuming field 'reset_c=
ount' is equal to field 'chip_reset'
           if (!qpair->fw_started || (cmd->reset_count !=3D qpair->chip_res=
et) ||
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/qla2xxx/qla_target.c:3445:6: note: Left side of '||' is fal=
se
           if (!qpair->fw_started || (cmd->reset_count !=3D qpair->chip_res=
et) ||
               ^
   drivers/scsi/qla2xxx/qla_target.c:3446:7: note: Assuming field 'sess' is=
 null
               (cmd->sess && cmd->sess->deleted)) {
                ^~~~~~~~~
   drivers/scsi/qla2xxx/qla_target.c:3446:17: note: Left side of '&&' is fa=
lse
               (cmd->sess && cmd->sess->deleted)) {
                          ^
   drivers/scsi/qla2xxx/qla_target.c:3462:2: note: Loop condition is false.=
  Exiting loop
           spin_lock_irqsave(qpair->qp_lock_ptr, flags);
           ^
   include/linux/spinlock.h:384:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:274:3: note: expanded from macro 'raw_spin_lock=
_irqsave'
                   _raw_spin_lock_irqsave(lock, flags);    \
                   ^
   include/linux/spinlock_api_up.h:68:45: note: expanded from macro '_raw_s=
pin_lock_irqsave'
   #define _raw_spin_lock_irqsave(lock, flags)     __LOCK_IRQSAVE(lock, fla=
gs)
                                                   ^
   include/linux/spinlock_api_up.h:40:8: note: expanded from macro '__LOCK_=
IRQSAVE'
     do { local_irq_save(flags); __LOCK(lock); } while (0)
          ^
   include/linux/irqflags.h:214:3: note: expanded from macro 'local_irq_sav=
e'
                   raw_local_irq_save(flags);              \
                   ^
   include/linux/irqflags.h:169:2: note: expanded from macro 'raw_local_irq=
_save'
           do {                                            \
           ^
   drivers/scsi/qla2xxx/qla_target.c:3462:2: note: Assuming the condition i=
s false
           spin_lock_irqsave(qpair->qp_lock_ptr, flags);
           ^
   include/linux/spinlock.h:384:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock.h:274:3: note: expanded from macro 'raw_spin_lock=
_irqsave'
                   _raw_spin_lock_irqsave(lock, flags);    \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock_api_up.h:68:45: note: expanded from macro '_raw_s=
pin_lock_irqsave'
   #define _raw_spin_lock_irqsave(lock, flags)     __LOCK_IRQSAVE(lock, fla=
gs)
                                                   ^~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   include/linux/spinlock_api_up.h:40:8: note: expanded from macro '__LOCK_=
IRQSAVE'
     do { local_irq_save(flags); __LOCK(lock); } while (0)
          ^~~~~~~~~~~~~~~~~~~~~
   include/linux/irqflags.h:215:7: note: expanded from macro 'local_irq_sav=
e'
                   if (!raw_irqs_disabled_flags(flags))    \
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/qla2xxx/qla_target.c:3462:2: note: Taking false branch
           spin_lock_irqsave(qpair->qp_lock_ptr, flags);
           ^
   include/linux/spinlock.h:384:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:274:3: note: expanded from macro 'raw_spin_lock=
_irqsave'
                   _raw_spin_lock_irqsave(lock, flags);    \
                   ^
   include/linux/spinlock_api_up.h:68:45: note: expanded from macro '_raw_s=
pin_lock_irqsave'
   #define _raw_spin_lock_irqsave(lock, flags)     __LOCK_IRQSAVE(lock, fla=
gs)
                                                   ^
   include/linux/spinlock_api_up.h:40:8: note: expanded from macro '__LOCK_=
IRQSAVE'
     do { local_irq_save(flags); __LOCK(lock); } while (0)
          ^
   include/linux/irqflags.h:215:3: note: expanded from macro 'local_irq_sav=
e'
                   if (!raw_irqs_disabled_flags(flags))    \
                   ^
   drivers/scsi/qla2xxx/qla_target.c:3462:2: note: Loop condition is false.=
  Exiting loop
           spin_lock_irqsave(qpair->qp_lock_ptr, flags);
           ^
   include/linux/spinlock.h:384:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:274:3: note: expanded from macro 'raw_spin_lock=
_irqsave'
                   _raw_spin_lock_irqsave(lock, flags);    \
                   ^
   include/linux/spinlock_api_up.h:68:45: note: expanded from macro '_raw_s=
pin_lock_irqsave'
   #define _raw_spin_lock_irqsave(lock, flags)     __LOCK_IRQSAVE(lock, fla=
gs)
                                                   ^
   include/linux/spinlock_api_up.h:40:8: note: expanded from macro '__LOCK_=
IRQSAVE'
     do { local_irq_save(flags); __LOCK(lock); } while (0)
          ^
   include/linux/irqflags.h:213:2: note: expanded from macro 'local_irq_sav=
e'
           do {                                            \
           ^
   drivers/scsi/qla2xxx/qla_target.c:3462:2: note: Loop condition is false.=
  Exiting loop
           spin_lock_irqsave(qpair->qp_lock_ptr, flags);
           ^
   include/linux/spinlock.h:384:2: note: expanded from macro 'spin_lock_irq=
save'

vim +2650 drivers/scsi/qla2xxx/qla_target.c

2d70c103fd2a06 Nicholas Bellinger 2012-05-15  2606  =

2d70c103fd2a06 Nicholas Bellinger 2012-05-15  2607  /* ha->hardware_lock su=
pposed to be held on entry */
82de802ad46e23 Quinn Tran         2017-06-13  2608  static int qlt_24xx_bui=
ld_ctio_pkt(struct qla_qpair *qpair,
82de802ad46e23 Quinn Tran         2017-06-13  2609  	struct qla_tgt_prm *pr=
m)
2d70c103fd2a06 Nicholas Bellinger 2012-05-15  2610  {
2d70c103fd2a06 Nicholas Bellinger 2012-05-15  2611  	uint32_t h;
2d70c103fd2a06 Nicholas Bellinger 2012-05-15  2612  	struct ctio7_to_24xx *=
pkt;
2d70c103fd2a06 Nicholas Bellinger 2012-05-15  2613  	struct atio_from_isp *=
atio =3D &prm->cmd->atio;
33a5fcee7f5d49 Quinn Tran         2014-06-24  2614  	uint16_t temp;
44d018577f1793 Quinn Tran         2021-06-23  2615  	struct qla_tgt_cmd    =
  *cmd =3D prm->cmd;
2d70c103fd2a06 Nicholas Bellinger 2012-05-15  2616  =

82de802ad46e23 Quinn Tran         2017-06-13  2617  	pkt =3D (struct ctio7_=
to_24xx *)qpair->req->ring_ptr;
2d70c103fd2a06 Nicholas Bellinger 2012-05-15  2618  	prm->pkt =3D pkt;
2d70c103fd2a06 Nicholas Bellinger 2012-05-15  2619  	memset(pkt, 0, sizeof(=
*pkt));
2d70c103fd2a06 Nicholas Bellinger 2012-05-15  2620  =

2d70c103fd2a06 Nicholas Bellinger 2012-05-15  2621  	pkt->entry_type =3D CT=
IO_TYPE7;
2d70c103fd2a06 Nicholas Bellinger 2012-05-15  2622  	pkt->entry_count =3D (=
uint8_t)prm->req_cnt;
22d84726e3b824 Quinn Tran         2017-06-13  2623  	pkt->vp_index =3D prm-=
>cmd->vp_idx;
2d70c103fd2a06 Nicholas Bellinger 2012-05-15  2624  =

82de802ad46e23 Quinn Tran         2017-06-13  2625  	h =3D qlt_make_handle(=
qpair);
2d70c103fd2a06 Nicholas Bellinger 2012-05-15  2626  	if (unlikely(h =3D=3D =
QLA_TGT_NULL_HANDLE)) {
2d70c103fd2a06 Nicholas Bellinger 2012-05-15  2627  		/*
2d70c103fd2a06 Nicholas Bellinger 2012-05-15  2628  		 * CTIO type 7 from t=
he firmware doesn't provide a way to
2d70c103fd2a06 Nicholas Bellinger 2012-05-15  2629  		 * know the initiator=
's LOOP ID, hence we can't find
2d70c103fd2a06 Nicholas Bellinger 2012-05-15  2630  		 * the session and, s=
o, the command.
2d70c103fd2a06 Nicholas Bellinger 2012-05-15  2631  		 */
2d70c103fd2a06 Nicholas Bellinger 2012-05-15  2632  		return -EAGAIN;
e326d22af9653d Quinn Tran         2017-06-13  2633  	} else
e326d22af9653d Quinn Tran         2017-06-13  2634  		qpair->req->outstandi=
ng_cmds[h] =3D (srb_t *)prm->cmd;
2d70c103fd2a06 Nicholas Bellinger 2012-05-15  2635  =

c25eb70a10243c Bart Van Assche    2020-02-19  2636  	pkt->handle =3D make_h=
andle(qpair->req->id, h);
82de802ad46e23 Quinn Tran         2017-06-13  2637  	pkt->handle |=3D CTIO_=
COMPLETION_HANDLE_MARK;
82de802ad46e23 Quinn Tran         2017-06-13  2638  	pkt->nport_handle =3D =
cpu_to_le16(prm->cmd->loop_id);
ad950360eebb5f Bart Van Assche    2015-07-09  2639  	pkt->timeout =3D cpu_t=
o_le16(QLA_TGT_TIMEOUT);
df95f39ae76474 Bart Van Assche    2019-08-08  2640  	pkt->initiator_id =3D =
be_id_to_le(atio->u.isp24.fcp_hdr.s_id);
2d70c103fd2a06 Nicholas Bellinger 2012-05-15  2641  	pkt->exchange_addr =3D=
 atio->u.isp24.exchange_addr;
f7e761f56c7119 Quinn Tran         2017-06-02  2642  	temp =3D atio->u.isp24=
.attr << 9;
f7e761f56c7119 Quinn Tran         2017-06-02  2643  	pkt->u.status0.flags |=
=3D cpu_to_le16(temp);
33a5fcee7f5d49 Quinn Tran         2014-06-24  2644  	temp =3D be16_to_cpu(a=
tio->u.isp24.fcp_hdr.ox_id);
33a5fcee7f5d49 Quinn Tran         2014-06-24  2645  	pkt->u.status0.ox_id =
=3D cpu_to_le16(temp);
2d70c103fd2a06 Nicholas Bellinger 2012-05-15  2646  	pkt->u.status0.relativ=
e_offset =3D cpu_to_le32(prm->cmd->offset);
2d70c103fd2a06 Nicholas Bellinger 2012-05-15  2647  =

44d018577f1793 Quinn Tran         2021-06-23  2648  	if (cmd->edif) {
44d018577f1793 Quinn Tran         2021-06-23  2649  		if (cmd->dma_data_dir=
ection =3D=3D DMA_TO_DEVICE)
44d018577f1793 Quinn Tran         2021-06-23 @2650  			prm->cmd->sess->edif=
.rx_bytes +=3D cmd->bufflen;
44d018577f1793 Quinn Tran         2021-06-23  2651  		if (cmd->dma_data_dir=
ection =3D=3D DMA_FROM_DEVICE)
44d018577f1793 Quinn Tran         2021-06-23  2652  			prm->cmd->sess->edif=
.tx_bytes +=3D cmd->bufflen;
44d018577f1793 Quinn Tran         2021-06-23  2653  =

44d018577f1793 Quinn Tran         2021-06-23  2654  		pkt->u.status0.edif_f=
lags |=3D EF_EN_EDIF;
44d018577f1793 Quinn Tran         2021-06-23  2655  	}
44d018577f1793 Quinn Tran         2021-06-23  2656  =

2d70c103fd2a06 Nicholas Bellinger 2012-05-15  2657  	return 0;
2d70c103fd2a06 Nicholas Bellinger 2012-05-15  2658  }
2d70c103fd2a06 Nicholas Bellinger 2012-05-15  2659  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3382395522399088799==--

