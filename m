Content-Type: multipart/mixed; boundary="===============2968378490683898651=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 4111/11713] drivers/mtd/nand/ecc-mxic.c:466:17: warning: Value stored to 'dev' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Thu, 10 Mar 2022 01:21:28 +0800
Message-ID: <202203100148.lgIFmUUz-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2968378490683898651==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Miquel Raynal <miquel.raynal@bootlin.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   4e7a74a6856f8613dab9794da4b5cfb8fd54fb8c
commit: 48e6633a9fa2400b53a964358753769f291a7eb0 [4111/11713] mtd: nand: mx=
ic-ecc: Add Macronix external ECC engine support
:::::: branch date: 5 hours ago
:::::: commit date: 4 weeks ago
config: x86_64-randconfig-c007-20220307 (https://download.01.org/0day-ci/ar=
chive/20220310/202203100148.lgIFmUUz-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc=
04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3D48e6633a9fa2400b53a964358753769f291a7eb0
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 48e6633a9fa2400b53a964358753769f291a7eb0
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                         ^
   fs/exec.c:1245:6: note: Assuming 'retval' is 0
           if (retval)
               ^~~~~~
   fs/exec.c:1245:2: note: Taking false branch
           if (retval)
           ^
   fs/exec.c:1257:6: note: Assuming 'retval' is 0
           if (retval)
               ^~~~~~
   fs/exec.c:1257:2: note: Taking false branch
           if (retval)
           ^
   fs/exec.c:1267:6: note: Assuming 'retval' is 0
           if (retval)
               ^~~~~~
   fs/exec.c:1267:2: note: Taking false branch
           if (retval)
           ^
   fs/exec.c:1276:6: note: Assuming 'retval' is 0
           if (retval)
               ^~~~~~
   fs/exec.c:1276:2: note: Taking false branch
           if (retval)
           ^
   fs/exec.c:1281:6: note: Assuming field 'have_execfd' is 0
           if (bprm->have_execfd)
               ^~~~~~~~~~~~~~~~~
   fs/exec.c:1281:2: note: Taking false branch
           if (bprm->have_execfd)
           ^
   fs/exec.c:1288:11: note: Calling 'exec_mmap'
           retval =3D exec_mmap(bprm->mm);
                    ^~~~~~~~~~~~~~~~~~~
   fs/exec.c:982:6: note: Assuming 'old_mm' is null
           if (old_mm)
               ^~~~~~
   fs/exec.c:982:2: note: Taking false branch
           if (old_mm)
           ^
   fs/exec.c:986:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   fs/exec.c:986:2: note: Taking false branch
           if (ret)
           ^
   fs/exec.c:989:6: note: 'old_mm' is null
           if (old_mm) {
               ^~~~~~
   fs/exec.c:989:2: note: Taking false branch
           if (old_mm) {
           ^
   fs/exec.c:1005:2: note: 'was_disabled' is true
           local_irq_disable();
           ^
   include/linux/irqflags.h:215:8: note: expanded from macro 'local_irq_dis=
able'
                   if (!was_disabled)                      \
                        ^~~~~~~~~~~~
   fs/exec.c:1005:2: note: Taking false branch
           local_irq_disable();
           ^
   include/linux/irqflags.h:215:3: note: expanded from macro 'local_irq_dis=
able'
                   if (!was_disabled)                      \
                   ^
   fs/exec.c:1005:2: note: Loop condition is false.  Exiting loop
           local_irq_disable();
           ^
   include/linux/irqflags.h:212:2: note: expanded from macro 'local_irq_dis=
able'
           do {                                            \
           ^
   fs/exec.c:1016:2: note: Taking true branch
           if (!IS_ENABLED(CONFIG_ARCH_WANT_IRQS_OFF_ACTIVATE_MM))
           ^
   fs/exec.c:1017:3: note: Calling 'arch_local_irq_enable'
                   local_irq_enable();
                   ^
   include/linux/irqflags.h:208:3: note: expanded from macro 'local_irq_ena=
ble'
                   raw_local_irq_enable();                 \
                   ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/irqflags.h:174:33: note: expanded from macro 'raw_local_ir=
q_enable'
   #define raw_local_irq_enable()          arch_local_irq_enable()
                                           ^~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/paravirt.h:703:2: note: Assigned value is garbage o=
r undefined
           PVOP_ALT_VCALLEE0(irq.irq_enable, "sti;", ALT_NOT(X86_FEATURE_XE=
NPV));
           ^
   arch/x86/include/asm/paravirt_types.h:525:2: note: expanded from macro '=
PVOP_ALT_VCALLEE0'
           __PVOP_ALT_VCALLEESAVE(op, alt, cond)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/paravirt_types.h:505:8: note: expanded from macro '=
__PVOP_ALT_VCALLEESAVE'
           (void)____PVOP_ALT_CALL(, op.func, alt, cond, CLBR_RET_REG,     \
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/paravirt_types.h:461:3: note: expanded from macro '=
____PVOP_ALT_CALL'
                   PVOP_CALL_ARGS;                                         \
                   ^~~~~~~~~~~~~~
   arch/x86/include/asm/paravirt_types.h:405:16: note: expanded from macro =
'PVOP_CALL_ARGS'
           unsigned long __edi =3D __edi, __esi =3D __esi,             \
                         ^       ~~~~~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
>> drivers/mtd/nand/ecc-mxic.c:466:17: warning: Value stored to 'dev' durin=
g its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D mxic->dev;
                          ^~~   ~~~~~~~~~
   drivers/mtd/nand/ecc-mxic.c:466:17: note: Value stored to 'dev' during i=
ts initialization is never read
           struct device *dev =3D mxic->dev;
                          ^~~   ~~~~~~~~~
>> drivers/mtd/nand/ecc-mxic.c:538:6: warning: Branch condition evaluates t=
o a garbage value [clang-analyzer-core.uninitialized.Branch]
           if (ret)
               ^~~
   drivers/mtd/nand/ecc-mxic.c:500:27: note: 'ret' declared without an init=
ial value
           int offset, nents, step, ret;
                                    ^~~
   drivers/mtd/nand/ecc-mxic.c:502:6: note: Assuming field 'mode' is not eq=
ual to MTD_OPS_RAW
           if (req->mode =3D=3D MTD_OPS_RAW)
               ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/ecc-mxic.c:502:2: note: Taking false branch
           if (req->mode =3D=3D MTD_OPS_RAW)
           ^
   drivers/mtd/nand/ecc-mxic.c:508:6: note: Assuming field 'type' is not eq=
ual to NAND_PAGE_READ
           if (req->type =3D=3D NAND_PAGE_READ)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/ecc-mxic.c:508:2: note: Taking false branch
           if (req->type =3D=3D NAND_PAGE_READ)
           ^
   drivers/mtd/nand/ecc-mxic.c:519:6: note: Assuming 'nents' is not equal t=
o 0
           if (!nents)
               ^~~~~~
   drivers/mtd/nand/ecc-mxic.c:519:2: note: Taking false branch
           if (!nents)
           ^
   drivers/mtd/nand/ecc-mxic.c:524:17: note: Assuming 'step' is >=3D field =
'steps'
           for (step =3D 0; step < ctx->steps; step++) {
                          ^~~~~~~~~~~~~~~~~
   drivers/mtd/nand/ecc-mxic.c:524:2: note: Loop condition is false. Execut=
ion continues on line 534
           for (step =3D 0; step < ctx->steps; step++) {
           ^
   drivers/mtd/nand/ecc-mxic.c:538:6: note: Branch condition evaluates to a=
 garbage value
           if (ret)
               ^~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   drivers/mtd/ubi/build.c:651:30: warning: Division by zero [clang-analyze=
r-core.DivideZero]
           ubi_assert(ubi->min_io_size % ubi->hdrs_min_io_size =3D=3D 0);
                                       ^
   drivers/mtd/ubi/debug.h:18:17: note: expanded from macro 'ubi_assert'
           if (unlikely(!(expr))) {                                        =
     \
                          ^~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   drivers/mtd/ubi/build.c:598:2: note: Taking false branch
           dbg_gen("sizeof(struct ubi_ainf_peb) %zu", sizeof(struct ubi_ain=
f_peb));
           ^
   drivers/mtd/ubi/debug.h:33:27: note: expanded from macro 'dbg_gen'
   #define dbg_gen(fmt, ...) ubi_dbg_msg("gen", fmt, ##__VA_ARGS__)
                             ^
   drivers/mtd/ubi/debug.h:29:2: note: expanded from macro 'ubi_dbg_msg'
           pr_debug("UBI DBG " type " (pid %d): " fmt "\n", current->pid,  =
     \
           ^
   include/linux/printk.h:576:2: note: expanded from macro 'pr_debug'
           no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:131:2: note: expanded from macro 'no_printk'
           if (0)                                          \
           ^
   drivers/mtd/ubi/build.c:599:2: note: Taking false branch
           dbg_gen("sizeof(struct ubi_wl_entry) %zu", sizeof(struct ubi_wl_=
entry));
           ^
   drivers/mtd/ubi/debug.h:33:27: note: expanded from macro 'dbg_gen'
   #define dbg_gen(fmt, ...) ubi_dbg_msg("gen", fmt, ##__VA_ARGS__)
                             ^
   drivers/mtd/ubi/debug.h:29:2: note: expanded from macro 'ubi_dbg_msg'
           pr_debug("UBI DBG " type " (pid %d): " fmt "\n", current->pid,  =
     \
           ^
   include/linux/printk.h:576:2: note: expanded from macro 'pr_debug'
           no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:131:2: note: expanded from macro 'no_printk'
           if (0)                                          \
           ^
   drivers/mtd/ubi/build.c:601:6: note: Assuming field 'numeraseregions' is=
 equal to 0
           if (ubi->mtd->numeraseregions !=3D 0) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/ubi/build.c:601:2: note: Taking false branch
           if (ubi->mtd->numeraseregions !=3D 0) {
           ^
   drivers/mtd/ubi/build.c:615:6: note: Assuming field 'vid_hdr_offset' is =
>=3D 0
           if (ubi->vid_hdr_offset < 0)
               ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/ubi/build.c:615:2: note: Taking false branch
           if (ubi->vid_hdr_offset < 0)
           ^
   drivers/mtd/ubi/build.c:627:2: note: Taking false branch
           if (mtd_can_have_bb(ubi->mtd)) {
           ^
   drivers/mtd/ubi/build.c:632:6: note: Assuming field 'type' is not equal =
to MTD_NORFLASH
           if (ubi->mtd->type =3D=3D MTD_NORFLASH)

vim +/dev +466 drivers/mtd/nand/ecc-mxic.c

48e6633a9fa240 Miquel Raynal 2021-12-16  460  =

48e6633a9fa240 Miquel Raynal 2021-12-16  461  static int mxic_ecc_count_bit=
errs(struct mxic_ecc_engine *mxic,
48e6633a9fa240 Miquel Raynal 2021-12-16  462  				  struct nand_device *nan=
d)
48e6633a9fa240 Miquel Raynal 2021-12-16  463  {
48e6633a9fa240 Miquel Raynal 2021-12-16  464  	struct mxic_ecc_ctx *ctx =3D=
 nand_to_ecc_ctx(nand);
48e6633a9fa240 Miquel Raynal 2021-12-16  465  	struct mtd_info *mtd =3D nan=
ddev_to_mtd(nand);
48e6633a9fa240 Miquel Raynal 2021-12-16 @466  	struct device *dev =3D mxic-=
>dev;
48e6633a9fa240 Miquel Raynal 2021-12-16  467  	unsigned int max_bf =3D 0;
48e6633a9fa240 Miquel Raynal 2021-12-16  468  	bool failure =3D false;
48e6633a9fa240 Miquel Raynal 2021-12-16  469  	int step;
48e6633a9fa240 Miquel Raynal 2021-12-16  470  =

48e6633a9fa240 Miquel Raynal 2021-12-16  471  	for (step =3D 0; step < ctx-=
>steps; step++) {
48e6633a9fa240 Miquel Raynal 2021-12-16  472  		u8 stat =3D ctx->status[ste=
p];
48e6633a9fa240 Miquel Raynal 2021-12-16  473  =

48e6633a9fa240 Miquel Raynal 2021-12-16  474  		if (stat =3D=3D NO_ERR) {
48e6633a9fa240 Miquel Raynal 2021-12-16  475  			dev_dbg(dev, "ECC step %d:=
 no error\n", step);
48e6633a9fa240 Miquel Raynal 2021-12-16  476  		} else if (stat =3D=3D ERAS=
ED_CHUNK) {
48e6633a9fa240 Miquel Raynal 2021-12-16  477  			dev_dbg(dev, "ECC step %d:=
 erased\n", step);
48e6633a9fa240 Miquel Raynal 2021-12-16  478  		} else if (stat =3D=3D UNCO=
RR_ERR || stat > MAX_CORR_ERR) {
48e6633a9fa240 Miquel Raynal 2021-12-16  479  			dev_dbg(dev, "ECC step %d:=
 uncorrectable\n", step);
48e6633a9fa240 Miquel Raynal 2021-12-16  480  			mtd->ecc_stats.failed++;
48e6633a9fa240 Miquel Raynal 2021-12-16  481  			failure =3D true;
48e6633a9fa240 Miquel Raynal 2021-12-16  482  		} else {
48e6633a9fa240 Miquel Raynal 2021-12-16  483  			dev_dbg(dev, "ECC step %d:=
 %d bits corrected\n",
48e6633a9fa240 Miquel Raynal 2021-12-16  484  				step, stat);
48e6633a9fa240 Miquel Raynal 2021-12-16  485  			max_bf =3D max_t(unsigned =
int, max_bf, stat);
48e6633a9fa240 Miquel Raynal 2021-12-16  486  			mtd->ecc_stats.corrected +=
=3D stat;
48e6633a9fa240 Miquel Raynal 2021-12-16  487  		}
48e6633a9fa240 Miquel Raynal 2021-12-16  488  	}
48e6633a9fa240 Miquel Raynal 2021-12-16  489  =

48e6633a9fa240 Miquel Raynal 2021-12-16  490  	return failure ? -EBADMSG : =
max_bf;
48e6633a9fa240 Miquel Raynal 2021-12-16  491  }
48e6633a9fa240 Miquel Raynal 2021-12-16  492  =

48e6633a9fa240 Miquel Raynal 2021-12-16  493  /* External ECC engine helper=
s */
48e6633a9fa240 Miquel Raynal 2021-12-16  494  static int mxic_ecc_prepare_i=
o_req_external(struct nand_device *nand,
48e6633a9fa240 Miquel Raynal 2021-12-16  495  					    struct nand_page_io_=
req *req)
48e6633a9fa240 Miquel Raynal 2021-12-16  496  {
48e6633a9fa240 Miquel Raynal 2021-12-16  497  	struct mxic_ecc_engine *mxic=
 =3D nand_to_mxic(nand);
48e6633a9fa240 Miquel Raynal 2021-12-16  498  	struct mxic_ecc_ctx *ctx =3D=
 nand_to_ecc_ctx(nand);
48e6633a9fa240 Miquel Raynal 2021-12-16  499  	struct mtd_info *mtd =3D nan=
ddev_to_mtd(nand);
48e6633a9fa240 Miquel Raynal 2021-12-16  500  	int offset, nents, step, ret;
48e6633a9fa240 Miquel Raynal 2021-12-16  501  =

48e6633a9fa240 Miquel Raynal 2021-12-16  502  	if (req->mode =3D=3D MTD_OPS=
_RAW)
48e6633a9fa240 Miquel Raynal 2021-12-16  503  		return 0;
48e6633a9fa240 Miquel Raynal 2021-12-16  504  =

48e6633a9fa240 Miquel Raynal 2021-12-16  505  	nand_ecc_tweak_req(&ctx->req=
_ctx, req);
48e6633a9fa240 Miquel Raynal 2021-12-16  506  	ctx->req =3D req;
48e6633a9fa240 Miquel Raynal 2021-12-16  507  =

48e6633a9fa240 Miquel Raynal 2021-12-16  508  	if (req->type =3D=3D NAND_PA=
GE_READ)
48e6633a9fa240 Miquel Raynal 2021-12-16  509  		return 0;
48e6633a9fa240 Miquel Raynal 2021-12-16  510  =

48e6633a9fa240 Miquel Raynal 2021-12-16  511  	mxic_ecc_add_room_in_oobbuf(=
ctx, ctx->oobwithstat,
48e6633a9fa240 Miquel Raynal 2021-12-16  512  				    ctx->req->oobbuf.out);
48e6633a9fa240 Miquel Raynal 2021-12-16  513  =

48e6633a9fa240 Miquel Raynal 2021-12-16  514  	sg_set_buf(&ctx->sg[0], req-=
>databuf.out, req->datalen);
48e6633a9fa240 Miquel Raynal 2021-12-16  515  	sg_set_buf(&ctx->sg[1], ctx-=
>oobwithstat,
48e6633a9fa240 Miquel Raynal 2021-12-16  516  		   req->ooblen + (ctx->step=
s * STAT_BYTES));
48e6633a9fa240 Miquel Raynal 2021-12-16  517  =

48e6633a9fa240 Miquel Raynal 2021-12-16  518  	nents =3D dma_map_sg(mxic->d=
ev, ctx->sg, 2, DMA_BIDIRECTIONAL);
48e6633a9fa240 Miquel Raynal 2021-12-16  519  	if (!nents)
48e6633a9fa240 Miquel Raynal 2021-12-16  520  		return -EINVAL;
48e6633a9fa240 Miquel Raynal 2021-12-16  521  =

48e6633a9fa240 Miquel Raynal 2021-12-16  522  	mutex_lock(&mxic->lock);
48e6633a9fa240 Miquel Raynal 2021-12-16  523  =

48e6633a9fa240 Miquel Raynal 2021-12-16  524  	for (step =3D 0; step < ctx-=
>steps; step++) {
48e6633a9fa240 Miquel Raynal 2021-12-16  525  		writel(sg_dma_address(&ctx-=
>sg[0]) + (step * ctx->data_step_sz),
48e6633a9fa240 Miquel Raynal 2021-12-16  526  		       mxic->regs + SDMA_MA=
IN_ADDR);
48e6633a9fa240 Miquel Raynal 2021-12-16  527  		writel(sg_dma_address(&ctx-=
>sg[1]) + (step * (ctx->oob_step_sz + STAT_BYTES)),
48e6633a9fa240 Miquel Raynal 2021-12-16  528  		       mxic->regs + SDMA_SP=
ARE_ADDR);
48e6633a9fa240 Miquel Raynal 2021-12-16  529  		ret =3D mxic_ecc_process_da=
ta(mxic, ctx->req->type);
48e6633a9fa240 Miquel Raynal 2021-12-16  530  		if (ret)
48e6633a9fa240 Miquel Raynal 2021-12-16  531  			break;
48e6633a9fa240 Miquel Raynal 2021-12-16  532  	}
48e6633a9fa240 Miquel Raynal 2021-12-16  533  =

48e6633a9fa240 Miquel Raynal 2021-12-16  534  	mutex_unlock(&mxic->lock);
48e6633a9fa240 Miquel Raynal 2021-12-16  535  =

48e6633a9fa240 Miquel Raynal 2021-12-16  536  	dma_unmap_sg(mxic->dev, ctx-=
>sg, 2, DMA_BIDIRECTIONAL);
48e6633a9fa240 Miquel Raynal 2021-12-16  537  =

48e6633a9fa240 Miquel Raynal 2021-12-16 @538  	if (ret)
48e6633a9fa240 Miquel Raynal 2021-12-16  539  		return ret;
48e6633a9fa240 Miquel Raynal 2021-12-16  540  =

48e6633a9fa240 Miquel Raynal 2021-12-16  541  	/* Retrieve the calculated E=
CC bytes */
48e6633a9fa240 Miquel Raynal 2021-12-16  542  	for (step =3D 0; step < ctx-=
>steps; step++) {
48e6633a9fa240 Miquel Raynal 2021-12-16  543  		offset =3D ctx->meta_sz + (=
step * ctx->oob_step_sz);
48e6633a9fa240 Miquel Raynal 2021-12-16  544  		mtd_ooblayout_get_eccbytes(=
mtd,
48e6633a9fa240 Miquel Raynal 2021-12-16  545  					   (u8 *)ctx->req->oobbu=
f.out + offset,
48e6633a9fa240 Miquel Raynal 2021-12-16  546  					   ctx->oobwithstat + (s=
tep * STAT_BYTES),
48e6633a9fa240 Miquel Raynal 2021-12-16  547  					   step * ctx->parity_sz,
48e6633a9fa240 Miquel Raynal 2021-12-16  548  					   ctx->parity_sz);
48e6633a9fa240 Miquel Raynal 2021-12-16  549  	}
48e6633a9fa240 Miquel Raynal 2021-12-16  550  =

48e6633a9fa240 Miquel Raynal 2021-12-16  551  	return 0;
48e6633a9fa240 Miquel Raynal 2021-12-16  552  }
48e6633a9fa240 Miquel Raynal 2021-12-16  553  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2968378490683898651==--

