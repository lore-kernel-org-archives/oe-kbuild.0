Content-Type: multipart/mixed; boundary="===============5981612002715443310=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [mtd:spi-mem-ecc 14/29] drivers/mtd/nand/ecc-mxic.c:538:6: warning: Branch condition evaluates to a garbage value [clang-analyzer-core.uninitialized.Branch]
Date: Fri, 11 Feb 2022 05:07:34 +0800
Message-ID: <202202110553.F5tgWlxh-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5981612002715443310==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Miquel Raynal <miquel.raynal@bootlin.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git spi-m=
em-ecc
head:   00360ebae483e603d55ec9a7231b787cb80ffe13
commit: 48e6633a9fa2400b53a964358753769f291a7eb0 [14/29] mtd: nand: mxic-ec=
c: Add Macronix external ECC engine support
:::::: branch date: 12 hours ago
:::::: commit date: 2 days ago
config: riscv-randconfig-c006-20220210 (https://download.01.org/0day-ci/arc=
hive/20220211/202202110553.F5tgWlxh-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project aa845d=
7a245d85c441d0bd44fc7b6c3be8f3de8d)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git/com=
mit/?id=3D48e6633a9fa2400b53a964358753769f291a7eb0
        git remote add mtd https://git.kernel.org/pub/scm/linux/kernel/git/=
mtd/linux.git
        git fetch --no-tags mtd spi-mem-ecc
        git checkout 48e6633a9fa2400b53a964358753769f291a7eb0
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   drivers/gpu/drm/etnaviv/etnaviv_dump.c:213:14: warning: Dereference of n=
ull pointer [clang-analyzer-core.NullDereference]
                                   *bomap++ =3D cpu_to_le64(page_to_phys(*p=
ages++));
                                   ~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   drivers/gpu/drm/etnaviv/etnaviv_dump.c:124:6: note: Assuming 'etnaviv_du=
mp_core' is true
           if (!etnaviv_dump_core)
               ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/etnaviv/etnaviv_dump.c:124:2: note: Taking false branch
           if (!etnaviv_dump_core)
           ^
   drivers/gpu/drm/etnaviv/etnaviv_dump.c:140:14: note: Assuming 'i' is >=
=3D field 'nr_bos'
           for (i =3D 0; i < submit->nr_bos; i++) {
                       ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/etnaviv/etnaviv_dump.c:140:2: note: Loop condition is fa=
lse. Execution continues on line 148
           for (i =3D 0; i < submit->nr_bos; i++) {
           ^
   drivers/gpu/drm/etnaviv/etnaviv_dump.c:148:6: note: 'n_bomap_pages' is 0
           if (n_bomap_pages) {
               ^~~~~~~~~~~~~
   drivers/gpu/drm/etnaviv/etnaviv_dump.c:148:2: note: Taking false branch
           if (n_bomap_pages) {
           ^
   drivers/gpu/drm/etnaviv/etnaviv_dump.c:159:6: note: Assuming field 'star=
t' is non-null
           if (!iter.start) {
               ^~~~~~~~~~~
   drivers/gpu/drm/etnaviv/etnaviv_dump.c:159:2: note: Taking false branch
           if (!iter.start) {
           ^
   drivers/gpu/drm/etnaviv/etnaviv_dump.c:186:6: note: 'n_bomap_pages' is 0
           if (n_bomap_pages) {
               ^~~~~~~~~~~~~
   drivers/gpu/drm/etnaviv/etnaviv_dump.c:186:2: note: Taking false branch
           if (n_bomap_pages) {
           ^
   drivers/gpu/drm/etnaviv/etnaviv_dump.c:196:14: note: Assuming 'i' is < f=
ield 'nr_bos'
           for (i =3D 0; i < submit->nr_bos; i++) {
                       ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/etnaviv/etnaviv_dump.c:196:2: note: Loop condition is tr=
ue.  Entering loop body
           for (i =3D 0; i < submit->nr_bos; i++) {
           ^
   drivers/gpu/drm/etnaviv/etnaviv_dump.c:207:8: note: Calling 'IS_ERR'
                   if (!IS_ERR(pages)) {
                        ^~~~~~~~~~~~~
   include/linux/err.h:36:9: note: Assuming the condition is false
           return IS_ERR_VALUE((unsigned long)ptr);
                  ^
   include/linux/err.h:22:34: note: expanded from macro 'IS_ERR_VALUE'
   #define IS_ERR_VALUE(x) unlikely((unsigned long)(void *)(x) >=3D (unsign=
ed long)-MAX_ERRNO)
                           ~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/err.h:36:2: note: Returning zero, which participates in a =
condition later
           return IS_ERR_VALUE((unsigned long)ptr);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/etnaviv/etnaviv_dump.c:207:8: note: Returning from 'IS_E=
RR'
                   if (!IS_ERR(pages)) {
                        ^~~~~~~~~~~~~
   drivers/gpu/drm/etnaviv/etnaviv_dump.c:207:3: note: Taking true branch
                   if (!IS_ERR(pages)) {
                   ^
   drivers/gpu/drm/etnaviv/etnaviv_dump.c:212:16: note: Assuming the condit=
ion is true
                           for (j =3D 0; j < obj->base.size >> PAGE_SHIFT; =
j++)
                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/etnaviv/etnaviv_dump.c:212:4: note: Loop condition is tr=
ue.  Entering loop body
                           for (j =3D 0; j < obj->base.size >> PAGE_SHIFT; =
j++)
                           ^
   drivers/gpu/drm/etnaviv/etnaviv_dump.c:213:6: note: Null pointer value s=
tored to 'bomap'
                                   *bomap++ =3D cpu_to_le64(page_to_phys(*p=
ages++));
                                    ^~~~~~~
   drivers/gpu/drm/etnaviv/etnaviv_dump.c:213:14: note: Dereference of null=
 pointer
                                   *bomap++ =3D cpu_to_le64(page_to_phys(*p=
ages++));
                                   ~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
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
   8 warnings generated.
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
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   39 warnings generated.
   drivers/mtd/nand/onenand/onenand_base.c:3751:23: warning: The result of =
the left shift is undefined due to shifting by '4294967264', which is great=
er or equal to the width of type 'int' [clang-analyzer-core.UndefinedBinary=
OperatorResult]
           this->page_mask =3D (1 << (this->erase_shift - this->page_shift)=
) - 1;
                                ^
   drivers/mtd/nand/onenand/onenand_base.c:3818:6: note: Assuming field 're=
ad_word' is non-null
           if (!this->read_word)
               ^~~~~~~~~~~~~~~~
   drivers/mtd/nand/onenand/onenand_base.c:3818:2: note: Taking false branch
           if (!this->read_word)
           ^
   drivers/mtd/nand/onenand/onenand_base.c:3820:6: note: Assuming field 'wr=
ite_word' is non-null
           if (!this->write_word)
               ^~~~~~~~~~~~~~~~~
   drivers/mtd/nand/onenand/onenand_base.c:3820:2: note: Taking false branch
           if (!this->write_word)
           ^
   drivers/mtd/nand/onenand/onenand_base.c:3823:6: note: Assuming field 'co=
mmand' is non-null
           if (!this->command)
               ^~~~~~~~~~~~~~
   drivers/mtd/nand/onenand/onenand_base.c:3823:2: note: Taking false branch
           if (!this->command)
           ^
   drivers/mtd/nand/onenand/onenand_base.c:3825:6: note: Assuming field 'wa=
it' is non-null
           if (!this->wait)
               ^~~~~~~~~~~
   drivers/mtd/nand/onenand/onenand_base.c:3825:2: note: Taking false branch
           if (!this->wait)
           ^
   drivers/mtd/nand/onenand/onenand_base.c:3827:6: note: Assuming field 'bb=
t_wait' is non-null
           if (!this->bbt_wait)
               ^~~~~~~~~~~~~~~
   drivers/mtd/nand/onenand/onenand_base.c:3827:2: note: Taking false branch
           if (!this->bbt_wait)
           ^
   drivers/mtd/nand/onenand/onenand_base.c:3829:6: note: Assuming field 'un=
lock_all' is non-null
           if (!this->unlock_all)
               ^~~~~~~~~~~~~~~~~
   drivers/mtd/nand/onenand/onenand_base.c:3829:2: note: Taking false branch
           if (!this->unlock_all)
           ^
   drivers/mtd/nand/onenand/onenand_base.c:3832:6: note: Assuming field 'ch=
ip_probe' is non-null
           if (!this->chip_probe)
               ^~~~~~~~~~~~~~~~~
   drivers/mtd/nand/onenand/onenand_base.c:3832:2: note: Taking false branch
           if (!this->chip_probe)
           ^
   drivers/mtd/nand/onenand/onenand_base.c:3835:6: note: Assuming field 're=
ad_bufferram' is non-null
           if (!this->read_bufferram)
               ^~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/onenand/onenand_base.c:3835:2: note: Taking false branch
           if (!this->read_bufferram)
           ^
   drivers/mtd/nand/onenand/onenand_base.c:3837:6: note: Assuming field 'wr=
ite_bufferram' is non-null
           if (!this->write_bufferram)
               ^~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/onenand/onenand_base.c:3837:2: note: Taking false branch
           if (!this->write_bufferram)
           ^
   drivers/mtd/nand/onenand/onenand_base.c:3840:6: note: Assuming field 'bl=
ock_markbad' is non-null
           if (!this->block_markbad)
               ^~~~~~~~~~~~~~~~~~~~
   drivers/mtd/nand/onenand/onenand_base.c:3840:2: note: Taking false branch
           if (!this->block_markbad)
           ^
   drivers/mtd/nand/onenand/onenand_base.c:3842:6: note: Assuming field 'sc=
an_bbt' is non-null
           if (!this->scan_bbt)

vim +538 drivers/mtd/nand/ecc-mxic.c

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
--===============5981612002715443310==--

