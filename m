Content-Type: multipart/mixed; boundary="===============4773597077119225323=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [RFC] bus: mhi: core: Load firmware asynchronous
Date: Sun, 12 Dec 2021 05:54:57 +0800
Message-ID: <202112120530.tKg4x9UT-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4773597077119225323==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20211210161645.10925-1-linux@weissschuh.net>
References: <20211210161645.10925-1-linux@weissschuh.net>
TO: "Thomas Wei=C3=9Fschuh" <linux@weissschuh.net>

Hi "Thomas,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on 622e96fb58d63985b028abc2cb9a873124bdac1e]

url:    https://github.com/0day-ci/linux/commits/Thomas-Wei-schuh/bus-mhi-c=
ore-Load-firmware-asynchronous/20211211-001725
base:   622e96fb58d63985b028abc2cb9a873124bdac1e
:::::: branch date: 30 hours ago
:::::: commit date: 30 hours ago
config: riscv-randconfig-c006-20211210 (https://download.01.org/0day-ci/arc=
hive/20211212/202112120530.tKg4x9UT-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 097a1c=
b1d5ebb3a0ec4bcaed8ba3ff6a8e33c00a)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/0day-ci/linux/commit/bc1fbdf39b0c8e31c64a70330=
7a4e88a56efc8ca
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Thomas-Wei-schuh/bus-mhi-core-Load=
-firmware-asynchronous/20211211-001725
        git checkout bc1fbdf39b0c8e31c64a703307a4e88a56efc8ca
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                                               ^
   include/linux/list.h:284:9: note: Left side of '||' is false
           return READ_ONCE(head->next) =3D=3D head;
                  ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:302:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   include/linux/list.h:284:9: note: Left side of '||' is false
           return READ_ONCE(head->next) =3D=3D head;
                  ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:302:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   include/linux/list.h:284:9: note: Left side of '||' is false
           return READ_ONCE(head->next) =3D=3D head;
                  ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:302:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   include/linux/list.h:284:9: note: Left side of '||' is true
           return READ_ONCE(head->next) =3D=3D head;
                  ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:38: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                                               ^
   include/linux/list.h:284:9: note: Taking false branch
           return READ_ONCE(head->next) =3D=3D head;
                  ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:2: note: expanded from macro 'compiletim=
e_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
           ^
   include/linux/compiler_types.h:335:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:323:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:315:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   include/linux/list.h:284:9: note: Loop condition is false.  Exiting loop
           return READ_ONCE(head->next) =3D=3D head;
                  ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:2: note: expanded from macro 'compiletim=
e_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
           ^
   include/linux/compiler_types.h:335:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:323:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:307:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   include/linux/list.h:284:9: note: Use of memory after it is freed
           return READ_ONCE(head->next) =3D=3D head;
                  ^
   include/asm-generic/rwonce.h:50:2: note: expanded from macro 'READ_ONCE'
           __READ_ONCE(x);                                                 \
           ^~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:44:24: note: expanded from macro '__READ_ON=
CE'
   #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(=
x))
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   drivers/bus/mhi/core/boot.c:154:2: warning: Value stored to 'ret' is nev=
er read [clang-analyzer-deadcode.DeadStores]
           ret =3D mhi_read_reg(mhi_cntrl, base, BHIE_RXVECSTATUS_OFFS, &rx=
_status);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   drivers/bus/mhi/core/boot.c:154:2: note: Value stored to 'ret' is never =
read
           ret =3D mhi_read_reg(mhi_cntrl, base, BHIE_RXVECSTATUS_OFFS, &rx=
_status);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
>> drivers/bus/mhi/core/boot.c:462:2: warning: Null pointer passed as 1st a=
rgument to memory copy function [clang-analyzer-unix.cstring.NullArg]
           memcpy(buf, firmware->data, size);
           ^      ~~~
   drivers/bus/mhi/core/boot.c:448:9: note: Assuming field 'fbc_download' i=
s false
           size =3D (mhi_cntrl->fbc_download) ? mhi_cntrl->sbl_size : firmw=
are->size;
                  ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/bus/mhi/core/boot.c:448:9: note: '?' condition is false
   drivers/bus/mhi/core/boot.c:451:6: note: 'size' is <=3D field 'size'
           if (size > firmware->size)
               ^~~~
   drivers/bus/mhi/core/boot.c:451:2: note: Taking false branch
           if (size > firmware->size)
           ^
   drivers/bus/mhi/core/boot.c:454:8: note: Calling 'dma_alloc_coherent'
           buf =3D dma_alloc_coherent(mhi_cntrl->cntrl_dev, size, &dma_addr,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:419:4: note: '?' condition is false
                           (gfp & __GFP_NOWARN) ? DMA_ATTR_NO_WARN : 0);
                           ^
   include/linux/dma-mapping.h:418:2: note: Returning pointer
           return dma_alloc_attrs(dev, size, dma_handle, gfp,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/bus/mhi/core/boot.c:454:8: note: Returning from 'dma_alloc_coher=
ent'
           buf =3D dma_alloc_coherent(mhi_cntrl->cntrl_dev, size, &dma_addr,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/bus/mhi/core/boot.c:454:2: note: Value assigned to 'buf'
           buf =3D dma_alloc_coherent(mhi_cntrl->cntrl_dev, size, &dma_addr,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/bus/mhi/core/boot.c:456:6: note: Assuming 'buf' is null
           if (!buf) {
               ^~~~
   drivers/bus/mhi/core/boot.c:456:2: note: Taking true branch
           if (!buf) {
           ^
   drivers/bus/mhi/core/boot.c:462:2: note: Null pointer passed as 1st argu=
ment to memory copy function
           memcpy(buf, firmware->data, size);
           ^      ~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   drivers/phy/phy-core.c:307:2: warning: Value stored to 'ret' is never re=
ad [clang-analyzer-deadcode.DeadStores]
           ret =3D 0; /* Override possible ret =3D=3D -ENOTSUPP */
           ^     ~
   drivers/phy/phy-core.c:307:2: note: Value stored to 'ret' is never read
           ret =3D 0; /* Override possible ret =3D=3D -ENOTSUPP */
           ^     ~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c:815:20: warning: The le=
ft operand of '=3D=3D' is a garbage value [clang-analyzer-core.UndefinedBin=
aryOperatorResult]
           if (pu =3D=3D 0 && pd =3D=3D 0) {
                             ^
   drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c:927:6: note: Assuming f=
ield 'pull_type' is null
           if (hw->soc->pull_type)
               ^~~~~~~~~~~~~~~~~~
   drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c:927:2: note: Taking fal=
se branch
           if (hw->soc->pull_type)
           ^
   drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c:932:2: note: Taking tru=
e branch
           if (try_all_type & MTK_PULL_RSEL_TYPE) {
           ^
   drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c:933:9: note: Calling 'm=
tk_pinconf_bias_get_rsel'
                   err =3D mtk_pinconf_bias_get_rsel(hw, desc, pullup, enab=
le);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c:803:10: note: 'pd' decl=
ared without an initial value
           int pu, pd, rsel, err;
                   ^~
   drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c:805:8: note: Calling 'm=
tk_hw_get_value'
           err =3D mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_RSEL, &rsel);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c:221:8: note: Calling 'm=
tk_hw_pin_field_get'
           err =3D mtk_hw_pin_field_get(hw, desc, field, &pf);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c:149:6: note: 'field' is=
 >=3D 0
           if (field < 0 || field >=3D PINCTRL_PIN_REG_MAX) {
               ^~~~~
   drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c:149:6: note: Left side =
of '||' is false

vim +462 drivers/bus/mhi/core/boot.c

cd457afb166705 Manivannan Sadhasivam 2020-02-20  434  =

bc1fbdf39b0c8e Thomas Wei=C3=9Fschuh      2021-12-10  435  static void mhi_=
fw_load_callback(const struct firmware *firmware, void *context)
bc1fbdf39b0c8e Thomas Wei=C3=9Fschuh      2021-12-10  436  {
bc1fbdf39b0c8e Thomas Wei=C3=9Fschuh      2021-12-10  437  	struct mhi_fw_l=
oad_callback_ctx *ctx =3D context;
bc1fbdf39b0c8e Thomas Wei=C3=9Fschuh      2021-12-10  438  	const char *fw_=
name =3D ctx->fw_name;
bc1fbdf39b0c8e Thomas Wei=C3=9Fschuh      2021-12-10  439  	struct mhi_cont=
roller *mhi_cntrl =3D ctx->mhi_cntrl;
bc1fbdf39b0c8e Thomas Wei=C3=9Fschuh      2021-12-10  440  	struct device *=
dev =3D &mhi_cntrl->mhi_dev->dev;
bc1fbdf39b0c8e Thomas Wei=C3=9Fschuh      2021-12-10  441  	dma_addr_t dma_=
addr;
bc1fbdf39b0c8e Thomas Wei=C3=9Fschuh      2021-12-10  442  	size_t size;
bc1fbdf39b0c8e Thomas Wei=C3=9Fschuh      2021-12-10  443  	void *buf;
bc1fbdf39b0c8e Thomas Wei=C3=9Fschuh      2021-12-10  444  	int ret;
bc1fbdf39b0c8e Thomas Wei=C3=9Fschuh      2021-12-10  445  =

bc1fbdf39b0c8e Thomas Wei=C3=9Fschuh      2021-12-10  446  	kfree(context);
bc1fbdf39b0c8e Thomas Wei=C3=9Fschuh      2021-12-10  447  =

cd457afb166705 Manivannan Sadhasivam 2020-02-20  448  	size =3D (mhi_cntrl-=
>fbc_download) ? mhi_cntrl->sbl_size : firmware->size;
cd457afb166705 Manivannan Sadhasivam 2020-02-20  449  =

cd457afb166705 Manivannan Sadhasivam 2020-02-20  450  	/* SBL size provided=
 is maximum size, not necessarily the image size */
cd457afb166705 Manivannan Sadhasivam 2020-02-20  451  	if (size > firmware-=
>size)
cd457afb166705 Manivannan Sadhasivam 2020-02-20  452  		size =3D firmware->=
size;
cd457afb166705 Manivannan Sadhasivam 2020-02-20  453  =

2e36190de69cb4 Bhaumik Bhatt         2021-08-02  454  	buf =3D dma_alloc_co=
herent(mhi_cntrl->cntrl_dev, size, &dma_addr,
2e36190de69cb4 Bhaumik Bhatt         2021-08-02  455  				 GFP_KERNEL);
cd457afb166705 Manivannan Sadhasivam 2020-02-20  456  	if (!buf) {
cd457afb166705 Manivannan Sadhasivam 2020-02-20  457  		release_firmware(fi=
rmware);
bc1fbdf39b0c8e Thomas Wei=C3=9Fschuh      2021-12-10  458  		mhi_fw_load_fi=
nish(mhi_cntrl, MHI_FW_ERROR_FW_LOAD);
cd457afb166705 Manivannan Sadhasivam 2020-02-20  459  	}
cd457afb166705 Manivannan Sadhasivam 2020-02-20  460  =

1b55c16a5e4718 Bhaumik Bhatt         2020-11-09  461  	/* Download image us=
ing BHI */
cd457afb166705 Manivannan Sadhasivam 2020-02-20 @462  	memcpy(buf, firmware=
->data, size);
1b55c16a5e4718 Bhaumik Bhatt         2020-11-09  463  	ret =3D mhi_fw_load_=
bhi(mhi_cntrl, dma_addr, size);
2e36190de69cb4 Bhaumik Bhatt         2021-08-02  464  	dma_free_coherent(mh=
i_cntrl->cntrl_dev, size, buf, dma_addr);
cd457afb166705 Manivannan Sadhasivam 2020-02-20  465  =

cd457afb166705 Manivannan Sadhasivam 2020-02-20  466  	/* Error or in EDL m=
ode, we're done */
0a895f091ebd94 Bhaumik Bhatt         2020-05-21  467  	if (ret) {
1b55c16a5e4718 Bhaumik Bhatt         2020-11-09  468  		dev_err(dev, "MHI d=
id not load image over BHI, ret: %d\n", ret);
12e050c77be036 Bhaumik Bhatt         2020-11-09  469  		release_firmware(fi=
rmware);
bc1fbdf39b0c8e Thomas Wei=C3=9Fschuh      2021-12-10  470  		mhi_fw_load_fi=
nish(mhi_cntrl, MHI_FW_ERROR_FW_LOAD);
0a895f091ebd94 Bhaumik Bhatt         2020-05-21  471  	}
0a895f091ebd94 Bhaumik Bhatt         2020-05-21  472  =

4f214496ac7421 Bhaumik Bhatt         2021-03-29  473  	/* Wait for ready si=
nce EDL image was loaded */
418bec695696ab Bhaumik Bhatt         2021-03-29  474  	if (fw_name =3D=3D m=
hi_cntrl->edl_image) {
12e050c77be036 Bhaumik Bhatt         2020-11-09  475  		release_firmware(fi=
rmware);
bc1fbdf39b0c8e Thomas Wei=C3=9Fschuh      2021-12-10  476  		mhi_fw_load_fi=
nish(mhi_cntrl, MHI_FW_LOAD_READY_STATE);
12e050c77be036 Bhaumik Bhatt         2020-11-09  477  	}
cd457afb166705 Manivannan Sadhasivam 2020-02-20  478  =

cd457afb166705 Manivannan Sadhasivam 2020-02-20  479  	write_lock_irq(&mhi_=
cntrl->pm_lock);
cd457afb166705 Manivannan Sadhasivam 2020-02-20  480  	mhi_cntrl->dev_state=
 =3D MHI_STATE_RESET;
cd457afb166705 Manivannan Sadhasivam 2020-02-20  481  	write_unlock_irq(&mh=
i_cntrl->pm_lock);
cd457afb166705 Manivannan Sadhasivam 2020-02-20  482  =

cd457afb166705 Manivannan Sadhasivam 2020-02-20  483  	/*
cd457afb166705 Manivannan Sadhasivam 2020-02-20  484  	 * If we're doing fb=
c, populate vector tables while
cd457afb166705 Manivannan Sadhasivam 2020-02-20  485  	 * device transition=
ing into MHI READY state
cd457afb166705 Manivannan Sadhasivam 2020-02-20  486  	 */
cd457afb166705 Manivannan Sadhasivam 2020-02-20  487  	if (mhi_cntrl->fbc_d=
ownload) {
cd457afb166705 Manivannan Sadhasivam 2020-02-20  488  		ret =3D mhi_alloc_b=
hie_table(mhi_cntrl, &mhi_cntrl->fbc_image,
cd457afb166705 Manivannan Sadhasivam 2020-02-20  489  					   firmware->siz=
e);
12e050c77be036 Bhaumik Bhatt         2020-11-09  490  		if (ret) {
12e050c77be036 Bhaumik Bhatt         2020-11-09  491  			release_firmware(f=
irmware);
bc1fbdf39b0c8e Thomas Wei=C3=9Fschuh      2021-12-10  492  			mhi_fw_load_f=
inish(mhi_cntrl, MHI_FW_ERROR_FW_LOAD);
12e050c77be036 Bhaumik Bhatt         2020-11-09  493  		}
cd457afb166705 Manivannan Sadhasivam 2020-02-20  494  =

cd457afb166705 Manivannan Sadhasivam 2020-02-20  495  		/* Load the firmwar=
e into BHIE vec table */
cd457afb166705 Manivannan Sadhasivam 2020-02-20  496  		mhi_firmware_copy(m=
hi_cntrl, firmware, mhi_cntrl->fbc_image);
cd457afb166705 Manivannan Sadhasivam 2020-02-20  497  	}
cd457afb166705 Manivannan Sadhasivam 2020-02-20  498  =

12e050c77be036 Bhaumik Bhatt         2020-11-09  499  	release_firmware(fir=
mware);
12e050c77be036 Bhaumik Bhatt         2020-11-09  500  =

bc1fbdf39b0c8e Thomas Wei=C3=9Fschuh      2021-12-10  501  	mhi_fw_load_fin=
ish(mhi_cntrl, MHI_FW_LOAD_READY_STATE);
0a895f091ebd94 Bhaumik Bhatt         2020-05-21  502  }
cd457afb166705 Manivannan Sadhasivam 2020-02-20  503  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4773597077119225323==--

